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

export default function ArrayToReversedTest() {
  describe('ArrayToReversedTest', ():void => {
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
     * @tc.number ARRAY_TO_REVERSED_TEST_0100
     * @tc.name ArrayToReversedTest0100
     * @tc.desc test toReversed(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = toReversed(arr);
        const expected: FixedArray<boolean> = [true, false, true];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_0200
     * @tc.name ArrayToReversedTest0200
     * @tc.desc test toReversed(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = toReversed(arr);
        const expected: FixedArray<boolean> = [false, true, false, true];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_0300
     * @tc.name ArrayToReversedTest0300
     * @tc.desc test toReversed(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = toReversed(arr);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_0400
     * @tc.name ArrayToReversedTest0400
     * @tc.desc test toReversed(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
        const result = toReversed(arr);
        const expected: FixedArray<boolean> = [true];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_0500
     * @tc.name ArrayToReversedTest0500
     * @tc.desc test toReversed(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const result = toReversed(arr);
        const expected: FixedArray<boolean> = [false];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_0600
     * @tc.name ArrayToReversedTest0600
     * @tc.desc test toReversed(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = toReversed(arr);
        const expected: FixedArray<boolean> = [true, true, true];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_0700
     * @tc.name ArrayToReversedTest0700
     * @tc.desc test toReversed(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = toReversed(arr);
        const expected: FixedArray<boolean> = [false, false, false];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_0800
     * @tc.name ArrayToReversedTest0800
     * @tc.desc test toReversed(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false, true];
        const result = toReversed(arr);
        const expected: FixedArray<boolean> = [true, false, false, true];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_0900
     * @tc.name ArrayToReversedTest0900
     * @tc.desc test toReversed(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128, 127];
        const result = toReversed(arr);
        const expected: FixedArray<byte> = [127, -128];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_1000
     * @tc.name ArrayToReversedTest1000
     * @tc.desc test toReversed(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = toReversed(arr);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_1100
     * @tc.name ArrayToReversedTest1100
     * @tc.desc test toReversed(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0];
        const result = toReversed(arr);
        const expected: FixedArray<byte> = [0];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_1200
     * @tc.name ArrayToReversedTest1200
     * @tc.desc test toReversed(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 40, 50, 60];
        const result = toReversed(arr);
        const expected: FixedArray<byte> = [60, 50, 40, 30, 20, 10];
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
     * @tc.number ARRAY_TO_REVERSED_TEST_1300
     * @tc.name ArrayToReversedTest1300
     * @tc.desc test toReversed(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-10, -20, -30, -40, -50, -60];
        const result = toReversed(arr);
        const expected: FixedArray<byte> = [-60, -50, -40, -30, -20, -10];
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
     * @tc.number ARRAY_TO_REVERSED_TEST_1400
     * @tc.name ArrayToReversedTest1400
     * @tc.desc test toReversed(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, -20, 30, -40, 50, -60];
        const result = toReversed(arr);
        const expected: FixedArray<byte> = [-60, 50, -40, 30, -20, 10];
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
     * @tc.number ARRAY_TO_REVERSED_TEST_1500
     * @tc.name ArrayToReversedTest1500
     * @tc.desc test toReversed(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0x01, 0x02];
        const result = toReversed(arr);
        const expected: FixedArray<byte> = [0x02, 0x01];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_1600
     * @tc.name ArrayToReversedTest1600
     * @tc.desc test toReversed(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [99, 99, 99, 99];
        const result = toReversed(arr);
        const expected: FixedArray<byte> = [99, 99, 99, 99];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_1700
     * @tc.name ArrayToReversedTest1700
     * @tc.desc test toReversed(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x48.toChar(), 0x69.toChar()];
        const result = toReversed(arr);
        const expected: FixedArray<char> = [0x69.toChar(), 0x48.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_1800
     * @tc.name ArrayToReversedTest1800
     * @tc.desc test toReversed(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x48.toChar()];
        const result = toReversed(arr);
        const expected: FixedArray<char> = [0x48.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_1900
     * @tc.name ArrayToReversedTest1900
     * @tc.desc test toReversed(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = toReversed(arr);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_2000
     * @tc.name ArrayToReversedTest2000
     * @tc.desc test toReversed(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x42.toChar(), 0x43.toChar()];
        const result = toReversed(arr);
        const expected: FixedArray<char> = [0x43.toChar(), 0x42.toChar(), 0x41.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_2100
     * @tc.name ArrayToReversedTest2100
     * @tc.desc test toReversed(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x21.toChar(), 0x3F.toChar(), 0x40.toChar()];
        const result = toReversed(arr);
        const expected: FixedArray<char> = [0x40.toChar(), 0x3F.toChar(), 0x21.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_2200
     * @tc.name ArrayToReversedTest2200
     * @tc.desc test toReversed(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x42.toChar(), 0x21.toChar(), 0x3F.toChar(), 0x41.toChar(), 0x43.toChar()];
        const result = toReversed(arr);
        const expected: FixedArray<char> = [0x43.toChar(), 0x41.toChar(), 0x3F.toChar(), 0x21.toChar(), 0x42.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_2300
     * @tc.name ArrayToReversedTest2300
     * @tc.desc test toReversed(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x31.toChar(), 0x31.toChar(), 0x31.toChar()];
        const result = toReversed(arr);
        const expected: FixedArray<char> = [0x31.toChar(), 0x31.toChar(), 0x31.toChar(), 0x31.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_2400
     * @tc.name ArrayToReversedTest2400
     * @tc.desc test toReversed(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x21.toChar(), 0x21.toChar()];
        const result = toReversed(arr);
        const expected: FixedArray<char> = [0x21.toChar(), 0x21.toChar()];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_2500
     * @tc.name ArrayToReversedTest2500
     * @tc.desc test toReversed(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [
          123.12,
          456.45,
          789.78
        ];
        const result = toReversed(arr);
        const expected: FixedArray<double> = [
          789.78,
          456.45,
          123.12
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_2600
     * @tc.name ArrayToReversedTest2600
     * @tc.desc test toReversed(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [
          -123.12,
          -456.45,
          -789.78
        ];
        const result = toReversed(arr);
        const expected: FixedArray<double> = [
          -789.78,
          -456.45,
          -123.12
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_2700
     * @tc.name ArrayToReversedTest2700
     * @tc.desc test toReversed(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [
          123.12,
          -456.45,
          789.78
        ];
        const result = toReversed(arr);
        const expected: FixedArray<double> = [
          789.78,
          -456.45,
          123.12
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_2800
     * @tc.name ArrayToReversedTest2800
     * @tc.desc test toReversed(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [0.0];
        const result = toReversed(arr);
        const expected: FixedArray<double> = [0.0];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_2900
     * @tc.name ArrayToReversedTest2900
     * @tc.desc test toReversed(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = toReversed(arr);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_3000
     * @tc.name ArrayToReversedTest3000
     * @tc.desc test toReversed(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 1.1, 1.1, 1.1];
        const result = toReversed(arr);
        const expected: FixedArray<double> = [1.1, 1.1, 1.1, 1.1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_3100
     * @tc.name ArrayToReversedTest3100
     * @tc.desc test toReversed(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 6.6];
        const result = toReversed(arr);
        const expected: FixedArray<double> = [6.6, 2.2, 1.1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_3200
     * @tc.name ArrayToReversedTest3200
     * @tc.desc test toReversed(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [111.11, -222.22];
        const result = toReversed(arr);
        const expected: FixedArray<double> = [-222.22, 111.11];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_3300
     * @tc.name ArrayToReversedTest3300
     * @tc.desc test toReversed(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          11.2 as float,
          12.3 as float,
          13.4 as float,
          14.5 as float,
          15.6 as float
        ];
        const result = toReversed(arr);
        const expected: FixedArray<float> = [
          15.6 as float,
          14.5 as float,
          13.4 as float,
          12.3 as float,
          11.2 as float,
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_3400
     * @tc.name ArrayToReversedTest3400
     * @tc.desc test toReversed(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          -11.2 as float,
          -12.3 as float,
          -13.4 as float,
          -14.5 as float,
          -15.6 as float
        ];
        const result = toReversed(arr);
        const expected: FixedArray<float> = [
          -15.6 as float,
          -14.5 as float,
          -13.4 as float,
          -12.3 as float,
          -11.2 as float,
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_3500
     * @tc.name ArrayToReversedTest3500
     * @tc.desc test toReversed(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          11.2 as float,
          -12.3 as float,
          13.4 as float,
          -14.5 as float,
          15.6 as float
        ];
        const result = toReversed(arr);
        const expected: FixedArray<float> = [
          15.6 as float,
          -14.5 as float,
          13.4 as float,
          -12.3 as float,
          11.2 as float,
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_3600
     * @tc.name ArrayToReversedTest3600
     * @tc.desc test toReversed(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          1111.11 as float,
          1111.11 as float,
          1111.11 as float,
        ];
        const result = toReversed(arr);
        const expected: FixedArray<float> = [
          1111.11 as float,
          1111.11 as float,
          1111.11 as float,
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_3700
     * @tc.name ArrayToReversedTest3700
     * @tc.desc test toReversed(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = toReversed(arr);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_3800
     * @tc.name ArrayToReversedTest3800
     * @tc.desc test toReversed(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0 as float];
        const result = toReversed(arr);
        const expected: FixedArray<float> = [0.0 as float];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_3900
     * @tc.name ArrayToReversedTest3900
     * @tc.desc test toReversed(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          1000000.0 as float,
          2000000.0 as float,
          3000000.0 as float
        ];
        const result = toReversed(arr);
        const expected: FixedArray<float> = [
          3000000.0 as float,
          2000000.0 as float,
          1000000.0 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_4000
     * @tc.name ArrayToReversedTest4000
     * @tc.desc test toReversed(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          3.26e-6 as float,
          8.76e+5 as float
        ];
        const result = toReversed(arr);
        const expected: FixedArray<float> = [
          8.76e+5 as float,
          3.26e-6 as float
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_4100
     * @tc.name ArrayToReversedTest4100
     * @tc.desc test toReversed(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3, 4, 5];
        const result = toReversed(arr);
        const expected: FixedArray<int> = [5, 4, 3, 2, 1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_4200
     * @tc.name ArrayToReversedTest4200
     * @tc.desc test toReversed(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-1, -2, -3, -4, -5];
        const result = toReversed(arr);
        const expected: FixedArray<int> = [-5, -4, -3, -2, -1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_4300
     * @tc.name ArrayToReversedTest4300
     * @tc.desc test toReversed(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-1, 2, -3, 4, -5];
        const result = toReversed(arr);
        const expected: FixedArray<int> = [-5, 4, -3, 2, -1];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        expect(result[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_4400
     * @tc.name ArrayToReversedTest4400
     * @tc.desc test toReversed(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [12, 12, 12];
        const result = toReversed(arr);
        const expected: FixedArray<int> = [12, 12, 12];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_4500
     * @tc.name ArrayToReversedTest4500
     * @tc.desc test toReversed(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = toReversed(arr);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_4600
     * @tc.name ArrayToReversedTest4600
     * @tc.desc test toReversed(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0];
        const result = toReversed(arr);
        const expected: FixedArray<int> = [0];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_4700
     * @tc.name ArrayToReversedTest4700
     * @tc.desc test toReversed(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [
          Int.MIN_VALUE,
          Int.MAX_VALUE
        ];
        const result = toReversed(arr);
        const expected: FixedArray<int> = [
          2147483647,
          -2147483648,
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_4800
     * @tc.name ArrayToReversedTest4800
     * @tc.desc test toReversed(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-9, -9, -9];
        const result = toReversed(arr);
        const expected: FixedArray<int> = [-9, -9, -9];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_4900
     * @tc.name ArrayToReversedTest4900
     * @tc.desc test toReversed(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [100, 200, 300];
        const result = toReversed(arr);
        const expected: FixedArray<long> = [300, 200, 100];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_5000
     * @tc.name ArrayToReversedTest5000
     * @tc.desc test toReversed(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-100, -200, -300];
        const result = toReversed(arr);
        const expected: FixedArray<long> = [-300, -200, -100];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_5100
     * @tc.name ArrayToReversedTest5100
     * @tc.desc test toReversed(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [-100, 200, -300];
        const result = toReversed(arr);
        const expected: FixedArray<long> = [-300, 200, -100];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_5200
     * @tc.name ArrayToReversedTest5200
     * @tc.desc test toReversed(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0 as long];
        const result = toReversed(arr);
        const expected: FixedArray<long> = [0];
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_5300
     * @tc.name ArrayToReversedTest5300
     * @tc.desc test toReversed(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = toReversed(arr);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_5400
     * @tc.name ArrayToReversedTest5400
     * @tc.desc test toReversed(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1000, 1000, 900];
        const result = toReversed(arr);
        const expected: FixedArray<long> = [900, 1000, 1000]
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_5500
     * @tc.name ArrayToReversedTest5500
     * @tc.desc test toReversed(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          -123456789 as long,
          -987654321 as long
        ];
        const result = toReversed(arr);
        const expected: FixedArray<long> = [
          -987654321 as long,
          -123456789 as long
        ]
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_5600
     * @tc.name ArrayToReversedTest5600
     * @tc.desc test toReversed(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          Long.MIN_VALUE as long,
          Long.MAX_VALUE as long
        ];
        const result = toReversed(arr);
        const expected: FixedArray<long> = [
          9223372036854775807,
          -9223372036854775808
        ]
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_5700
     * @tc.name ArrayToReversedTest5700
     * @tc.desc test toReversed(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          1000 as short,
          2000 as short,
          3000 as short,
          4000 as short
        ];
        const result = toReversed(arr);
        const expected: FixedArray<short> = [
          4000 as short,
          3000 as short,
          2000 as short,
          1000 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_5800
     * @tc.name ArrayToReversedTest5800
     * @tc.desc test toReversed(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          -1000 as short,
          -2000 as short,
          -3000 as short,
          -4000 as short
        ];
        const result = toReversed(arr);
        const expected: FixedArray<short> = [
          -4000 as short,
          -3000 as short,
          -2000 as short,
          -1000 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_5900
     * @tc.name ArrayToReversedTest5900
     * @tc.desc test toReversed(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          -1000 as short,
          2000 as short,
          -3000 as short,
          4000 as short
        ];
        const result = toReversed(arr);
        const expected: FixedArray<short> = [
          4000 as short,
          -3000 as short,
          2000 as short,
          -1000 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        expect(result[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_6000
     * @tc.name ArrayToReversedTest6000
     * @tc.desc test toReversed(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          0 as short,
          100 as short
        ];
        const result = toReversed(arr);
        const expected: FixedArray<short> = [
          100 as short,
          0 as short
        ];
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_6100
     * @tc.name ArrayToReversedTest6100
     * @tc.desc test toReversed(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = toReversed(arr);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_6200
     * @tc.name ArrayToReversedTest6200
     * @tc.desc test toReversed(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [Short.MIN_VALUE as short];
        const result = toReversed(arr);
        const expected: FixedArray<short> = [-32768]
        expect(result[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_6300
     * @tc.name ArrayToReversedTest6300
     * @tc.desc test toReversed(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          Short.MIN_VALUE as short,
          Short.MAX_VALUE as short
        ];
        const result = toReversed(arr);
        const expected: FixedArray<short> = [32767, -32768]
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_REVERSED_TEST_6400
     * @tc.name ArrayToReversedTest6400
     * @tc.desc test toReversed(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToReversedTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToReversedTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          10 as short,
          20 as short,
          -10 as short
        ];
        const result = toReversed(arr);
        const expected: FixedArray<short> = [
          -10 as short,
          20 as short,
          10 as short
        ]
        expect(result[0]).assertEqual(expected[0]);
        expect(result[1]).assertEqual(expected[1]);
        expect(result[2]).assertEqual(expected[2]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}