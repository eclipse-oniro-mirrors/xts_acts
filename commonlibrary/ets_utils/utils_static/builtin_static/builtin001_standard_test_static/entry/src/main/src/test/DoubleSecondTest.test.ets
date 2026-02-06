/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
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
export default function builtinsDoubleSecondPrototypebTest() {
  describe('builtinsDoubleSecondPrototypebTest', ():void => {
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
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_0100
     * @tc.name builtinsDoubleSecondPrototypebTest0100
    * @tc.desc test isLessEqualThan(): a < b (negative less than positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const a = new Double(-10.5);
        const b = new Double(5.2);
        expect(a.isLessEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_0200
     * @tc.name builtinsDoubleSecondPrototypebTest0200
    * @tc.desc test isLessEqualThan(): a == b (equal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const a = new Double(3.14);
        const b = new Double(3.14);
        expect(a.isLessEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_0300
     * @tc.name builtinsDoubleSecondPrototypebTest0300
    * @tc.desc test isLessEqualThan(): a > b (positive greater than negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const a = new Double(2.7);
        const b = new Double(-0.0);
        expect(a.isLessEqualThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_0400
     * @tc.name builtinsDoubleSecondPrototypebTest0400
     * @tc.desc test isLessEqualThan(): 0 <= -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(-0.0);
        expect(a.isLessEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_0500
     * @tc.name builtinsDoubleSecondPrototypebTest0500
    * @tc.desc test isLessEqualThan(): NaN comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const b = new Double(1.0);
        expect(a.isLessEqualThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_0600
     * @tc.name builtinsDoubleSecondPrototypebTest0600
    * @tc.desc test isLessEqualThan(): Infinity comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const a = new Double(999999);
        const b = new Double(Number.POSITIVE_INFINITY);
        expect(a.isLessEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_0700
     * @tc.name builtinsDoubleSecondPrototypebTest0700
    * @tc.desc test isLessEqualThan(): negative Infinity comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        const b = new Double(-999999);
        expect(a.isLessEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_0800
     * @tc.name builtinsDoubleSecondPrototypebTest0800
    * @tc.desc test isLessEqualThan(): max/min values comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        const b = new Double(Number.MAX_VALUE);
        expect(a.isLessEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_0900
     * @tc.name builtinsDoubleSecondPrototypebTest0900
    * @tc.desc test isLessThan(): a < b (negative less than positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const a = new Double(-10.5);
        const b = new Double(5.2);
        expect(a.isLessThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_1000
     * @tc.name builtinsDoubleSecondPrototypebTest1000
    * @tc.desc test isLessThan(): a == b (equal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const a = new Double(3.14);
        const b = new Double(3.14);
        expect(a.isLessThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_1100
     * @tc.name builtinsDoubleSecondPrototypebTest1100
    * @tc.desc test isLessThan(): a > b (positive greater than negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const a = new Double(2.7);
        const b = new Double(-0.0);
        expect(a.isLessThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_1200
     * @tc.name builtinsDoubleSecondPrototypebTest1200
     * @tc.desc test isLessThan(): 0 < -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(-0.0);
        expect(a.isLessThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_1300
     * @tc.name builtinsDoubleSecondPrototypebTest1300
    * @tc.desc test isLessThan(): NaN comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const b = new Double(1.0);
        expect(a.isLessThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_1400
     * @tc.name builtinsDoubleSecondPrototypebTest1400
    * @tc.desc test isLessThan(): Infinity comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const a = new Double(999999);
        const b = new Double(Number.POSITIVE_INFINITY);
        expect(a.isLessThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_1500
     * @tc.name builtinsDoubleSecondPrototypebTest1500
    * @tc.desc test isLessThan(): negative Infinity comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        const b = new Double(-999999);
        expect(a.isLessThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_1600
     * @tc.name builtinsDoubleSecondPrototypebTest1600
    * @tc.desc test isLessThan(): max/min values comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        const b = new Double(Number.MAX_VALUE);
        expect(a.isLessThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_1700
     * @tc.name builtinsDoubleSecondPrototypebTest1700
    * @tc.desc test isNaN(): NaN itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.isNaN()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_1800
     * @tc.name builtinsDoubleSecondPrototypebTest1800
    * @tc.desc test isNaN(): normal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.isNaN()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_1900
     * @tc.name builtinsDoubleSecondPrototypebTest1900
    * @tc.desc test isNaN(): normal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const a = new Double(-789.123);
        expect(a.isNaN()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_2000
     * @tc.name builtinsDoubleSecondPrototypebTest2000
     * @tc.desc test isNaN(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.isNaN()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_2100
     * @tc.name builtinsDoubleSecondPrototypebTest2100
     * @tc.desc test isNaN(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.isNaN()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_2200
     * @tc.name builtinsDoubleSecondPrototypebTest2200
     * @tc.desc test isNaN(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.isNaN()).assertEqual(false);
        expect(b.isNaN()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_2300
     * @tc.name builtinsDoubleSecondPrototypebTest2300
    * @tc.desc test isNaN(): max/min values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        const b = new Double(Number.MIN_VALUE);
        expect(a.isNaN()).assertEqual(false);
        expect(b.isNaN()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_2400
     * @tc.name builtinsDoubleSecondPrototypebTest2400
    * @tc.desc test isNaN(): expression results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0 / 0.0);
        expect(a.isNaN()).assertEqual(true);
        const b = new Double(Math.sqrt(-1));
        expect(b.isNaN()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_2500
     * @tc.name builtinsDoubleSecondPrototypebTest2500
    * @tc.desc test isSafeInteger(): 0 is a safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.isSafeInteger()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_2600
     * @tc.name builtinsDoubleSecondPrototypebTest2600
    * @tc.desc test isSafeInteger(): MAX_SAFE_INTEGER is a safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_SAFE_INTEGER);
        expect(a.isSafeInteger()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_2700
     * @tc.name builtinsDoubleSecondPrototypebTest2700
    * @tc.desc test isSafeInteger(): -MAX_SAFE_INTEGER is a safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const a = new Double(-Number.MAX_SAFE_INTEGER);
        expect(a.isSafeInteger()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_2800
     * @tc.name builtinsDoubleSecondPrototypebTest2800
    * @tc.desc test isSafeInteger(): beyond MAX_SAFE_INTEGER is unsafe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_SAFE_INTEGER + 1);
        expect(a.isSafeInteger()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_2900
     * @tc.name builtinsDoubleSecondPrototypebTest2900
    * @tc.desc test isSafeInteger(): fractional numbers are not safe integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.isSafeInteger()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_3000
     * @tc.name builtinsDoubleSecondPrototypebTest3000
    * @tc.desc test isSafeInteger(): NaN is not a safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.isSafeInteger()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_3100
     * @tc.name builtinsDoubleSecondPrototypebTest3100
    * @tc.desc test isSafeInteger(): Infinity is not a safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.isSafeInteger()).assertEqual(false);
        expect(b.isSafeInteger()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_3200
     * @tc.name builtinsDoubleSecondPrototypebTest3200
    * @tc.desc test isSafeInteger(): max/min values are not safe integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const a = new Double(6.6);
        const b = new Double(7.0);
        expect(a.isSafeInteger()).assertEqual(false);
        expect(b.isSafeInteger()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_3300
     * @tc.name builtinsDoubleSecondPrototypebTest3300
    * @tc.desc test mul(): multiplying positive numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const a = new Double(2.5);
        const b = new Double(4.0);
        const result = a.mul(b);
        expect(result).assertEqual(10.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_3400
     * @tc.name builtinsDoubleSecondPrototypebTest3400
    * @tc.desc test mul(): multiplying negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const a = new Double(-3.0);
        const b = new Double(-2.0);
        const result = a.mul(b);
        expect(result).assertEqual(6.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_3500
     * @tc.name builtinsDoubleSecondPrototypebTest3500
    * @tc.desc test mul(): multiplying positive and negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const a = new Double(5.0);
        const b = new Double(-2.0);
        const result = a.mul(b);
        expect(result).assertEqual(-10.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_3600
     * @tc.name builtinsDoubleSecondPrototypebTest3600
    * @tc.desc test mul(): multiplying by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(123.456);
        const result = a.mul(b);
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_3700
     * @tc.name builtinsDoubleSecondPrototypebTest3700
    * @tc.desc test mul(): involving NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const b = new Double(2.0);
        const result = a.mul(b);
        expect(Number.isNaN(result)).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_3800
     * @tc.name builtinsDoubleSecondPrototypebTest3800
    * @tc.desc test mul(): involving Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(2.0);
        const result = a.mul(b);
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_3900
     * @tc.name builtinsDoubleSecondPrototypebTest3900
    * @tc.desc test mul(): involving negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        const b = new Double(-1.0);
        const result = a.mul(b);
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_4000
     * @tc.name builtinsDoubleSecondPrototypebTest4000
    * @tc.desc test mul(): max/min values multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        const b = new Double(Number.MIN_VALUE);
        const result = a.mul(b);
        expect(result).assertEqual(Number.MAX_VALUE * Number.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_4100
     * @tc.name builtinsDoubleSecondPrototypebTest4100
    * @tc.desc test getHashCodeByValue(): positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(a.toInt());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_4200
     * @tc.name builtinsDoubleSecondPrototypebTest4200
    * @tc.desc test getHashCodeByValue(): negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const a = new Double(-789.123);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(a.toInt());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_4300
     * @tc.name builtinsDoubleSecondPrototypebTest4300
    * @tc.desc test getHashCodeByValue(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(a.toInt());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_4400
     * @tc.name builtinsDoubleSecondPrototypebTest4400
     * @tc.desc test getHashCodeByValue(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(a.toInt());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_4500
     * @tc.name builtinsDoubleSecondPrototypebTest4500
     * @tc.desc test getHashCodeByValue(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const b = new Double(NaN);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(Runtime.getHashCodeByValue(b));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_4600
     * @tc.name builtinsDoubleSecondPrototypebTest4600
     * @tc.desc test getHashCodeByValue(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(a.toInt());
        expect(Runtime.getHashCodeByValue(b)).assertEqual(b.toInt());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_4700
     * @tc.name builtinsDoubleSecondPrototypebTest4700
     * @tc.desc test getHashCodeByValue(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(a.toInt());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_4800
     * @tc.name builtinsDoubleSecondPrototypebTest4800
     * @tc.desc test getHashCodeByValue(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(a.toInt());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_4900
     * @tc.name builtinsDoubleSecondPrototypebTest4900
    * @tc.desc test toByte(): normal positive number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const a = new Double(123.7);
        expect(a.toByte()).assertEqual(123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_5000
     * @tc.name builtinsDoubleSecondPrototypebTest5000
    * @tc.desc test toByte(): normal negative number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const a = new Double(-50.8);
        expect(a.toByte()).assertEqual(-50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_5100
     * @tc.name builtinsDoubleSecondPrototypebTest5100
    * @tc.desc test toByte(): 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(-0.0);
        expect(a.toByte()).assertEqual(0);
        expect(b.toByte()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_5200
     * @tc.name builtinsDoubleSecondPrototypebTest5200
    * @tc.desc test toByte(): overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const a = new Double(300.5);
        expect(a.toByte()).assertEqual(44); // In Java, (byte)300 is 44
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_5300
     * @tc.name builtinsDoubleSecondPrototypebTest5300
    * @tc.desc test toByte(): underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const a = new Double(-300.5);
        expect(a.toByte()).assertEqual(-44); // In Java, (byte)-300 is -44
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_5400
     * @tc.name builtinsDoubleSecondPrototypebTest5400
    * @tc.desc test toByte(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.toByte()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_5500
     * @tc.name builtinsDoubleSecondPrototypebTest5500
    * @tc.desc test toByte(): positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        expect(a.toByte()).assertEqual(-1); // In Java, (byte)Infinity is -1
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_5600
     * @tc.name builtinsDoubleSecondPrototypebTest5600
    * @tc.desc test toByte(): negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toByte()).assertEqual(0); // In Java, (byte)-Infinity is 0
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_5700
     * @tc.name builtinsDoubleSecondPrototypebTest5700
     * @tc.desc test compareTo(): a > b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const a = new Double(10.5);
        const b = new Double(5.2);
        const result = a.compareTo(b);
        expect(result > 0).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_5800
     * @tc.name builtinsDoubleSecondPrototypebTest5800
     * @tc.desc test compareTo(): a < b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const a = new Double(5.2);
        const b = new Double(10.5);
        const result = a.compareTo(b);
        expect(result < 0).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_5900
     * @tc.name builtinsDoubleSecondPrototypebTest5900
     * @tc.desc test compareTo(): a == b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const a = new Double(3.14);
        const b = new Double(3.14);
        const result = a.compareTo(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_6000
     * @tc.name builtinsDoubleSecondPrototypebTest6000
     * @tc.desc test compareTo(): a > b, difference < 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const a = new Double(5.8);
        const b = new Double(5.2);
        const result = a.compareTo(b);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_6100
     * @tc.name builtinsDoubleSecondPrototypebTest6100
     * @tc.desc test compareTo(): 0.0 vs -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(-0.0);
        const result = a.compareTo(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_6200
     * @tc.name builtinsDoubleSecondPrototypebTest6200
     * @tc.desc test compareTo(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const b = new Double(1.0);
        const result = a.compareTo(b);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_6300
     * @tc.name builtinsDoubleSecondPrototypebTest6300
     * @tc.desc test compareTo(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.MAX_VALUE);
        const result = a.compareTo(b);
        expect(result > 0).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_6400
     * @tc.name builtinsDoubleSecondPrototypebTest6400
     * @tc.desc test compareTo(): -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        const b = new Double(Number.MIN_VALUE);
        const result = a.compareTo(b);
        expect(result < 0).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_6500
     * @tc.name builtinsDoubleSecondPrototypebTest6500
     * @tc.desc test toDouble(): 正常正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest6500';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.toDouble()).assertEqual(123.456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_6600
     * @tc.name builtinsDoubleSecondPrototypebTest6600
     * @tc.desc test toDouble(): 正常负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest6600';
        console.info(`${caseName}, test start`);
        const a = new Double(-789.123);
        expect(a.toDouble()).assertEqual(-789.123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_6700
     * @tc.name builtinsDoubleSecondPrototypebTest6700
     * @tc.desc test toDouble(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest6700';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toDouble()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_6800
     * @tc.name builtinsDoubleSecondPrototypebTest6800
     * @tc.desc test toDouble(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest6800';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.toDouble()).assertEqual(-0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_6900
     * @tc.name builtinsDoubleSecondPrototypebTest6900
     * @tc.desc test toDouble(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest6900';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(Number.isNaN(a.toDouble())).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_7000
     * @tc.name builtinsDoubleSecondPrototypebTest7000
     * @tc.desc test toDouble(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest7000';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toDouble()).assertEqual(Number.POSITIVE_INFINITY);
        expect(b.toDouble()).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_7100
     * @tc.name builtinsDoubleSecondPrototypebTest7100
     * @tc.desc test toDouble(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest7100';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(a.toDouble()).assertEqual(Number.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_7200
     * @tc.name builtinsDoubleSecondPrototypebTest7200
     * @tc.desc test toDouble(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest7200';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(a.toDouble()).assertEqual(Number.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_7300
     * @tc.name builtinsDoubleSecondPrototypebTest7300
     * @tc.desc test toExponential(): 正常正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest7300';
        console.info(`${caseName}, test start`);
        const a = new Double(12345.6789);
        expect(a.toExponential(2)).assertEqual('1.23e+4');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_7400
     * @tc.name builtinsDoubleSecondPrototypebTest7400
     * @tc.desc test toExponential(): 正常负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest7400';
        console.info(`${caseName}, test start`);
        const a = new Double(-9876.54321);
        expect(a.toExponential(3)).assertEqual('-9.877e+3');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_7500
     * @tc.name builtinsDoubleSecondPrototypebTest7500
     * @tc.desc test toExponential(): 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest7500';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toExponential(1)).assertEqual('0.0e+0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_7600
     * @tc.name builtinsDoubleSecondPrototypebTest7600
     * @tc.desc test toExponential(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest7600';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.toExponential(1)).assertEqual('-0.0e+0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_7700
     * @tc.name builtinsDoubleSecondPrototypebTest7700
     * @tc.desc test toExponential(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest7700';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.toExponential(2)).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_7800
     * @tc.name builtinsDoubleSecondPrototypebTest7800
     * @tc.desc test toExponential(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest7800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toExponential(2)).assertEqual('Infinity');
        expect(b.toExponential(2)).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_7900
     * @tc.name builtinsDoubleSecondPrototypebTest7900
     * @tc.desc test toExponential(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest7900';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(a.toExponential(2)).assertEqual(Number.MAX_VALUE.toExponential(2));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_8000
     * @tc.name builtinsDoubleSecondPrototypebTest8000
     * @tc.desc test toExponential(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest8000';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(a.toExponential(2)).assertEqual(Number.MIN_VALUE.toExponential(2));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_8100
     * @tc.name builtinsDoubleSecondPrototypebTest8100
     * @tc.desc test toExponentialWithNoDigit(): 正常正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest8100';
        console.info(`${caseName}, test start`);
        const a = new Double(12345.6789);
        expect(a.toExponentialWithNoDigit()).assertEqual('1.23456789e+4');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_8200
     * @tc.name builtinsDoubleSecondPrototypebTest8200
     * @tc.desc test toExponentialWithNoDigit(): 正常负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest8200';
        console.info(`${caseName}, test start`);
        const a = new Double(-9876.54321);
        expect(a.toExponentialWithNoDigit()).assertEqual('-9.87654321e+3');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_8300
     * @tc.name builtinsDoubleSecondPrototypebTest8300
     * @tc.desc test toExponentialWithNoDigit(): 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest8300';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toExponentialWithNoDigit()).assertEqual('0e+0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_8400
     * @tc.name builtinsDoubleSecondPrototypebTest8400
     * @tc.desc test toExponentialWithNoDigit(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest8400';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.toExponentialWithNoDigit()).assertEqual('0e+0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_8500
     * @tc.name builtinsDoubleSecondPrototypebTest8500
     * @tc.desc test toExponentialWithNoDigit(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest8500';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.toExponentialWithNoDigit()).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_8600
     * @tc.name builtinsDoubleSecondPrototypebTest8600
     * @tc.desc test toExponentialWithNoDigit(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest8600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toExponentialWithNoDigit()).assertEqual('Infinity');
        expect(b.toExponentialWithNoDigit()).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_8700
     * @tc.name builtinsDoubleSecondPrototypebTest8700
     * @tc.desc test toExponentialWithNoDigit(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest8700';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(a.toExponentialWithNoDigit()).assertEqual(Number.MAX_VALUE.toExponential());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_8800
     * @tc.name builtinsDoubleSecondPrototypebTest8800
     * @tc.desc test toExponentialWithNoDigit(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest8800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(a.toExponentialWithNoDigit()).assertEqual(Number.MIN_VALUE.toExponential());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_8900
     * @tc.name builtinsDoubleSecondPrototypebTest8900
     * @tc.desc test toFixed(): 正常正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest8900';
        console.info(`${caseName}, test start`);
        const a = new Double(12345.6789);
        expect(a.toFixed(2)).assertEqual('12345.68');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_9000
     * @tc.name builtinsDoubleSecondPrototypebTest9000
     * @tc.desc test toFixed(): 正常负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest9000';
        console.info(`${caseName}, test start`);
        const a = new Double(-9876.54321);
        expect(a.toFixed(3)).assertEqual('-9876.543');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_9100
     * @tc.name builtinsDoubleSecondPrototypebTest9100
     * @tc.desc test toFixed(): 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest9100';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toFixed(1)).assertEqual('0.0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_9200
     * @tc.name builtinsDoubleSecondPrototypebTest9200
     * @tc.desc test toFixed(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest9200';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.toFixed(1)).assertEqual('-0.0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_9300
     * @tc.name builtinsDoubleSecondPrototypebTest9300
     * @tc.desc test toFixed(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest9300';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.toFixed(2)).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_9400
     * @tc.name builtinsDoubleSecondPrototypebTest9400
     * @tc.desc test toFixed(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest9400';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toFixed(2)).assertEqual('Infinity');
        expect(b.toFixed(2)).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_9500
     * @tc.name builtinsDoubleSecondPrototypebTest9500
     * @tc.desc test toFixed(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest9500';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(a.toFixed(2)).assertEqual(Number.MAX_VALUE.toFixed(2));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_SECOND_PROTOTYPEB_TEST_9600
     * @tc.name builtinsDoubleSecondPrototypebTest9600
     * @tc.desc test toFixed(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleSecondPrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleSecondPrototypebTest9600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(a.toFixed(2)).assertEqual(Number.MIN_VALUE.toFixed(2));
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}