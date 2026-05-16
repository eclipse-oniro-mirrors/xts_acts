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
export default function builtinsFloatThirdPrototypebTest() {
  describe('builtinsFloatThirdPrototypebTest', ():void => {
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
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_0100
     * @tc.name builtinsFloatThirdPrototypebTest0100
     * @tc.desc test toString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(a.toString()).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_0200
     * @tc.name builtinsFloatThirdPrototypebTest0200
     * @tc.desc test toString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const a = new Float(42.8);
        expect(a.toString()).assertEqual('42.8');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_0300
     * @tc.name builtinsFloatThirdPrototypebTest0300
     * @tc.desc test toString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const a = new Float(-42.3);
        expect(a.toString()).assertEqual('-42.3');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_0400
     * @tc.name builtinsFloatThirdPrototypebTest0400
     * @tc.desc test toString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        expect(a.toString()).assertEqual(Float.MAX_VALUE.toString());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_0500
     * @tc.name builtinsFloatThirdPrototypebTest0500
     * @tc.desc test toString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.MIN_VALUE);
        expect(a.toString()).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_0600
     * @tc.name builtinsFloatThirdPrototypebTest0600
     * @tc.desc test toString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        expect(a.toString()).assertEqual('Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_0700
     * @tc.name builtinsFloatThirdPrototypebTest0700
     * @tc.desc test toString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        expect(a.toString()).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_0800
     * @tc.name builtinsFloatThirdPrototypebTest0800
     * @tc.desc test toString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        expect(a.toString()).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_0900
     * @tc.name builtinsFloatThirdPrototypebTest0900
     * @tc.desc test static compare(lhs: float, rhs: float): boolean (exact equal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest0900';
        console.info(`${caseName}, test start`);
        expect(Float.compare(1.23 as float, 1.23 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_1000
     * @tc.name builtinsFloatThirdPrototypebTest1000
     * @tc.desc test static compare(lhs: float, rhs: float): boolean (diff = DELTA)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest1000';
        console.info(`${caseName}, test start`);
        expect(Float.compare(1.0 as float, (1.0 + Float.DELTA) as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_1100
     * @tc.name builtinsFloatThirdPrototypebTest1100
     * @tc.desc test static compare(lhs: float, rhs: float): boolean (diff < DELTA)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest1100';
        console.info(`${caseName}, test start`);
        expect(Float.compare(2.0 as float, (2.0 + Float.DELTA / 2) as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_1200
     * @tc.name builtinsFloatThirdPrototypebTest1200
     * @tc.desc test static compare(lhs: float, rhs: float): boolean (diff > DELTA)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest1200';
        console.info(`${caseName}, test start`);
        expect(Float.compare(3.0 as float, (3.0 + Float.DELTA * 2) as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_1300
     * @tc.name builtinsFloatThirdPrototypebTest1300
     * @tc.desc test static compare(lhs: float, rhs: float): boolean (positive zero vs negative zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest1300';
        console.info(`${caseName}, test start`);
        expect(Float.compare(0.0 as float, -0.0 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_1400
     * @tc.name builtinsFloatThirdPrototypebTest1400
     * @tc.desc test static compare(lhs: float, rhs: float): boolean (Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest1400';
        console.info(`${caseName}, test start`);
        expect(Float.compare(Number.POSITIVE_INFINITY as float, Number.POSITIVE_INFINITY as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_1500
     * @tc.name builtinsFloatThirdPrototypebTest1500
     * @tc.desc test static compare(lhs: float, rhs: float): boolean (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest1500';
        console.info(`${caseName}, test start`);
        expect(Float.compare(NaN as float, NaN as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_1600
     * @tc.name builtinsFloatThirdPrototypebTest1600
     * @tc.desc test static compare(lhs: float, rhs: float): boolean (Infinity vs -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest1600';
        console.info(`${caseName}, test start`);
        expect(Float.compare(Number.POSITIVE_INFINITY as float, Number.NEGATIVE_INFINITY as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_1700
     * @tc.name builtinsFloatThirdPrototypebTest1700
     * @tc.desc test static isFinite(v: float): boolean (normal number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest1700';
        console.info(`${caseName}, test start`);
        expect(Float.isFinite(1.23 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_1800
     * @tc.name builtinsFloatThirdPrototypebTest1800
     * @tc.desc test static isFinite(v: float): boolean (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest1800';
        console.info(`${caseName}, test start`);
        expect(Float.isFinite(0.0 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_1900
     * @tc.name builtinsFloatThirdPrototypebTest1900
     * @tc.desc test static isFinite(v: float): boolean (negative zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest1900';
        console.info(`${caseName}, test start`);
        expect(Float.isFinite(-0.0 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_2000
     * @tc.name builtinsFloatThirdPrototypebTest2000
     * @tc.desc test static isFinite(v: float): boolean (positive infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest2000';
        console.info(`${caseName}, test start`);
        expect(Float.isFinite(Number.POSITIVE_INFINITY as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_2100
     * @tc.name builtinsFloatThirdPrototypebTest2100
     * @tc.desc test static isFinite(v: float): boolean (negative infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest2100';
        console.info(`${caseName}, test start`);
        expect(Float.isFinite(Number.NEGATIVE_INFINITY as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_2200
     * @tc.name builtinsFloatThirdPrototypebTest2200
     * @tc.desc test static isFinite(v: float): boolean (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest2200';
        console.info(`${caseName}, test start`);
        expect(Float.isFinite(NaN as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_2300
     * @tc.name builtinsFloatThirdPrototypebTest2300
     * @tc.desc test static isFinite(v: float): boolean (max value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest2300';
        console.info(`${caseName}, test start`);
        expect(Float.isFinite(Float.MAX_VALUE as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_2400
     * @tc.name builtinsFloatThirdPrototypebTest2400
     * @tc.desc test static isFinite(v: float): boolean (min value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest2400';
        console.info(`${caseName}, test start`);
        expect(Float.isFinite(Number.MIN_VALUE as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_2500
     * @tc.name builtinsFloatThirdPrototypebTest2500
     * @tc.desc test static isInteger(v: float): boolean (positive integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest2500';
        console.info(`${caseName}, test start`);
        expect(Float.isInteger(123.0 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_2600
     * @tc.name builtinsFloatThirdPrototypebTest2600
     * @tc.desc test static isInteger(v: float): boolean (negative integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest2600';
        console.info(`${caseName}, test start`);
        expect(Float.isInteger(-456.0 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_2700
     * @tc.name builtinsFloatThirdPrototypebTest2700
     * @tc.desc test static isInteger(v: float): boolean (positive non-integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest2700';
        console.info(`${caseName}, test start`);
        expect(Float.isInteger(123.456 as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_2800
     * @tc.name builtinsFloatThirdPrototypebTest2800
     * @tc.desc test static isInteger(v: float): boolean (negative non-integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest2800';
        console.info(`${caseName}, test start`);
        expect(Float.isInteger(-456.789 as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_2900
     * @tc.name builtinsFloatThirdPrototypebTest2900
     * @tc.desc test static isInteger(v: float): boolean (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest2900';
        console.info(`${caseName}, test start`);
        expect(Float.isInteger(0.0 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_3000
     * @tc.name builtinsFloatThirdPrototypebTest3000
     * @tc.desc test static isInteger(v: float): boolean (negative zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest3000';
        console.info(`${caseName}, test start`);
        expect(Float.isInteger(-0.0 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_3100
     * @tc.name builtinsFloatThirdPrototypebTest3100
     * @tc.desc test static isInteger(v: float): boolean (Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest3100';
        console.info(`${caseName}, test start`);
        expect(Float.isInteger(Number.POSITIVE_INFINITY as float)).assertEqual(false);
        expect(Float.isInteger(Number.NEGATIVE_INFINITY as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_3200
     * @tc.name builtinsFloatThirdPrototypebTest3200
     * @tc.desc test static isInteger(v: float): boolean (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest3200';
        console.info(`${caseName}, test start`);
        expect(Float.isInteger(NaN as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_3300
     * @tc.name builtinsFloatThirdPrototypebTest3300
     * @tc.desc test static isNaN(v: float): boolean (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest3300';
        console.info(`${caseName}, test start`);
        expect(Float.isNaN(NaN as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_3400
     * @tc.name builtinsFloatThirdPrototypebTest3400
     * @tc.desc test static isNaN(v: float): boolean (normal number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest3400';
        console.info(`${caseName}, test start`);
        expect(Float.isNaN(1.23 as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_3500
     * @tc.name builtinsFloatThirdPrototypebTest3500
     * @tc.desc test static isNaN(v: float): boolean (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest3500';
        console.info(`${caseName}, test start`);
        expect(Float.isNaN(0.0 as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_3600
     * @tc.name builtinsFloatThirdPrototypebTest3600
     * @tc.desc test static isNaN(v: float): boolean (negative zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest3600';
        console.info(`${caseName}, test start`);
        expect(Float.isNaN(-0.0 as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_3700
     * @tc.name builtinsFloatThirdPrototypebTest3700
     * @tc.desc test static isNaN(v: float): boolean (positive infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest3700';
        console.info(`${caseName}, test start`);
        expect(Float.isNaN(Number.POSITIVE_INFINITY as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_3800
     * @tc.name builtinsFloatThirdPrototypebTest3800
     * @tc.desc test static isNaN(v: float): boolean (negative infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest3800';
        console.info(`${caseName}, test start`);
        expect(Float.isNaN(Number.NEGATIVE_INFINITY as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_3900
     * @tc.name builtinsFloatThirdPrototypebTest3900
     * @tc.desc test static isNaN(v: float): boolean (max value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest3900';
        console.info(`${caseName}, test start`);
        expect(Float.isNaN(Float.MAX_VALUE as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_4000
     * @tc.name builtinsFloatThirdPrototypebTest4000
     * @tc.desc test static isNaN(v: float): boolean (expression NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest4000';
        console.info(`${caseName}, test start`);
        expect(Float.isNaN((0.0 / 0.0)as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_4100
     * @tc.name builtinsFloatThirdPrototypebTest4100
     * @tc.desc test static isSafeInteger(v: float): boolean (safe positive integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest4100';
        console.info(`${caseName}, test start`);
        expect(Float.isSafeInteger(Float.MAX_SAFE_INTEGER as float)).assertEqual(true); // Float.MAX_SAFE_INTEGER
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_4200
     * @tc.name builtinsFloatThirdPrototypebTest4200
     * @tc.desc test static isSafeInteger(v: float): boolean (safe negative integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest4200';
        console.info(`${caseName}, test start`);
        expect(Float.isSafeInteger(-Float.MAX_SAFE_INTEGER as float)).assertEqual(true); // -Float.MAX_SAFE_INTEGER
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_4300
     * @tc.name builtinsFloatThirdPrototypebTest4300
     * @tc.desc test static isSafeInteger(v: float): boolean (exceed positive safe integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest4300';
        console.info(`${caseName}, test start`);
        expect(Float.isSafeInteger(9007199254740992 as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_4400
     * @tc.name builtinsFloatThirdPrototypebTest4400
     * @tc.desc test static isSafeInteger(v: float): boolean (exceed negative safe integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest4400';
        console.info(`${caseName}, test start`);
        expect(Float.isSafeInteger(-9007199254740992 as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_4500
     * @tc.name builtinsFloatThirdPrototypebTest4500
     * @tc.desc test static isSafeInteger(v: float): boolean (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest4500';
        console.info(`${caseName}, test start`);
        expect(Float.isSafeInteger(0.0 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_4600
     * @tc.name builtinsFloatThirdPrototypebTest4600
     * @tc.desc test static isSafeInteger(v: float): boolean (negative zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest4600';
        console.info(`${caseName}, test start`);
        expect(Float.isSafeInteger(-0.0 as float)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_4700
     * @tc.name builtinsFloatThirdPrototypebTest4700
     * @tc.desc test static isSafeInteger(v: float): boolean (non-integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest4700';
        console.info(`${caseName}, test start`);
        expect(Float.isSafeInteger(1.23 as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_4800
     * @tc.name builtinsFloatThirdPrototypebTest4800
     * @tc.desc test static isSafeInteger(v: float): boolean (NaN/Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest4800';
        console.info(`${caseName}, test start`);
        expect(Float.isSafeInteger(NaN as float)).assertEqual(false);
        expect(Float.isSafeInteger(Number.POSITIVE_INFINITY as float)).assertEqual(false);
        expect(Float.isSafeInteger(Number.NEGATIVE_INFINITY as float)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_4900
     * @tc.name builtinsFloatThirdPrototypebTest4900
     * @tc.desc test static toString(f: float, r: int): String (decimal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest4900';
        console.info(`${caseName}, test start`);
        expect(Float.toString(10.5 as float, 10 as int)).assertEqual('10.5');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_5000
     * @tc.name builtinsFloatThirdPrototypebTest5000
     * @tc.desc test static toString(f: float, r: int): String (binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest5000';
        console.info(`${caseName}, test start`);
        expect(Float.toString(10.5 as float, 2 as int)).assertEqual('1010.1');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_5100
     * @tc.name builtinsFloatThirdPrototypebTest5100
     * @tc.desc test static toString(f: float, r: int): String (octal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest5100';
        console.info(`${caseName}, test start`);
        expect(Float.toString(10.5 as float, 8 as int)).assertEqual('12.4');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_5200
     * @tc.name builtinsFloatThirdPrototypebTest5200
     * @tc.desc test static toString(f: float, r: int): String (hexadecimal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest5200';
        console.info(`${caseName}, test start`);
        expect(Float.toString(10.5 as float, 16 as int)).assertEqual('a.8');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_5300
     * @tc.name builtinsFloatThirdPrototypebTest5300
     * @tc.desc test static toString(f: float, r: int): String (negative number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest5300';
        console.info(`${caseName}, test start`);
        expect(Float.toString(-10.5 as float, 10 as int)).assertEqual('-10.5');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_5400
     * @tc.name builtinsFloatThirdPrototypebTest5400
     * @tc.desc test static toString(f: float, r: int): String (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest5400';
        console.info(`${caseName}, test start`);
        expect(Float.toString(0.0 as float, 10 as int)).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_5500
     * @tc.name builtinsFloatThirdPrototypebTest5500
     * @tc.desc test static toString(f: float, r: int): String (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest5500';
        console.info(`${caseName}, test start`);
        expect(Float.toString(NaN as float, 10 as int)).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_5600
     * @tc.name builtinsFloatThirdPrototypebTest5600
     * @tc.desc test static toString(f: float, r: int): String (Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest5600';
        console.info(`${caseName}, test start`);
        expect(Float.toString(Number.POSITIVE_INFINITY as float, 10 as int)).assertEqual('Infinity');
        expect(Float.toString(Number.NEGATIVE_INFINITY as float, 10 as int)).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_5700
     * @tc.name builtinsFloatThirdPrototypebTest5700
     * @tc.desc test static bitCastFromInt(bits: int): float (0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest5700';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastFromInt(0 as int)).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_5800
     * @tc.name builtinsFloatThirdPrototypebTest5800
     * @tc.desc test static bitCastFromInt(bits: int): float (1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest5800';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastFromInt(1 as int)).assertEqual(1.401298464324817e-45);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_5900
     * @tc.name builtinsFloatThirdPrototypebTest5900
     * @tc.desc test static bitCastFromInt(bits: int): float (0x7F800000, +Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest5900';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastFromInt(0x7F800000 as int)).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_6000
     * @tc.name builtinsFloatThirdPrototypebTest6000
     * @tc.desc test static bitCastFromInt(bits: int): float (0xFF800000, -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest6000';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastFromInt((0xFF800000).toInt())).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_6100
     * @tc.name builtinsFloatThirdPrototypebTest6100
     * @tc.desc test static bitCastFromInt(bits: int): float (0x7FC00000, NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest6100';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Float.bitCastFromInt(0x7FC00000 as int))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_6200
     * @tc.name builtinsFloatThirdPrototypebTest6200
     * @tc.desc test static bitCastFromInt(bits: int): float (0xFFFFFFFF, -NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest6200';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Float.bitCastFromInt((0xFFFFFFFF).toInt()))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_6300
     * @tc.name builtinsFloatThirdPrototypebTest6300
     * @tc.desc test static bitCastFromInt(bits: int): float (0x80000000, -0.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const res = Float.bitCastFromInt((0x80000000).toInt());
        const t = res === 0 && (1 / res) === -Infinity;
        expect(t).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_6400
     * @tc.name builtinsFloatThirdPrototypebTest6400
     * @tc.desc test static bitCastFromInt(bits: int): float (0x3F800000, 1.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest6400';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastFromInt(0x3F800000 as int)).assertEqual(1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_6500
     * @tc.name builtinsFloatThirdPrototypebTest6500
     * @tc.desc test static bitCastToInt(val: float): int (0.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest6500';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastToInt(0.0 as float)).assertEqual(0x00000000);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_6600
     * @tc.name builtinsFloatThirdPrototypebTest6600
     * @tc.desc test static bitCastToInt(val: float): int (1.401298464324817e-45)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest6600';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastToInt(1.401298464324817e-45 as float)).assertEqual(0x00000001);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_6700
     * @tc.name builtinsFloatThirdPrototypebTest6700
     * @tc.desc test static bitCastToInt(val: float): int (1.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest6700';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastToInt(1.0 as float)).assertEqual(0x3F800000);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_6800
     * @tc.name builtinsFloatThirdPrototypebTest6800
     * @tc.desc test static bitCastToInt(val: float): int (-0.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest6800';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastToInt(-0.0.toFloat())).assertEqual(0x80000000.toInt());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_6900
     * @tc.name builtinsFloatThirdPrototypebTest6900
     * @tc.desc test static bitCastToInt(val: float): int (+Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest6900';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastToInt(Number.POSITIVE_INFINITY as float)).assertEqual(0x7F800000);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_7000
     * @tc.name builtinsFloatThirdPrototypebTest7000
     * @tc.desc test static bitCastToInt(val: float): int (-Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest7000';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastToInt(Number.NEGATIVE_INFINITY.toFloat())).assertEqual(0xFF800000.toInt());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_7100
     * @tc.name builtinsFloatThirdPrototypebTest7100
     * @tc.desc test static bitCastToInt(val: float): int (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest7100';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastToInt(NaN as float)).assertEqual(0x7FC00000);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_7200
     * @tc.name builtinsFloatThirdPrototypebTest7200
     * @tc.desc test static bitCastToInt(val: float): int (-1.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest7200';
        console.info(`${caseName}, test start`);
        expect(Float.bitCastToInt(-1.0.toFloat())).assertEqual(0xBF800000.toInt());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_7300
     * @tc.name builtinsFloatThirdPrototypebTest7300
     * @tc.desc test static toString(f: float): String (positive number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest7300';
        console.info(`${caseName}, test start`);
        expect(Float.toString(123.456 as float)).assertEqual('123.456');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_7400
     * @tc.name builtinsFloatThirdPrototypebTest7400
     * @tc.desc test static toString(f: float): String (negative number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest7400';
        console.info(`${caseName}, test start`);
        expect(Float.toString(-123.456 as float)).assertEqual('-123.456');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_7500
     * @tc.name builtinsFloatThirdPrototypebTest7500
     * @tc.desc test static toString(f: float): String (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest7500';
        console.info(`${caseName}, test start`);
        expect(Float.toString(0.0 as float)).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_7600
     * @tc.name builtinsFloatThirdPrototypebTest7600
     * @tc.desc test static toString(f: float): String (negative zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest7600';
        console.info(`${caseName}, test start`);
        expect(Float.toString(-0.0 as float)).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_7700
     * @tc.name builtinsFloatThirdPrototypebTest7700
     * @tc.desc test static toString(f: float): String (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest7700';
        console.info(`${caseName}, test start`);
        expect(Float.toString(NaN as float)).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_7800
     * @tc.name builtinsFloatThirdPrototypebTest7800
     * @tc.desc test static toString(f: float): String (positive infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest7800';
        console.info(`${caseName}, test start`);
        expect(Float.toString(Number.POSITIVE_INFINITY as float)).assertEqual('Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_7900
     * @tc.name builtinsFloatThirdPrototypebTest7900
     * @tc.desc test static toString(f: float): String (negative infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest7900';
        console.info(`${caseName}, test start`);
        expect(Float.toString(Number.NEGATIVE_INFINITY as float)).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_8000
     * @tc.name builtinsFloatThirdPrototypebTest8000
     * @tc.desc test static toString(f: float): String (max/min value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest8000';
        console.info(`${caseName}, test start`);
        expect(Float.toString(Float.MAX_VALUE as float)).assertEqual(Float.MAX_VALUE.toString());
        expect(Float.toString(Float.MIN_VALUE as float)).assertEqual(Float.MIN_VALUE.toString());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_8100
     * @tc.name builtinsFloatThirdPrototypebTest8100
     * @tc.desc test static readonly PRECISION: byte = 24 (basic value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest8100';
        console.info(`${caseName}, test start`);
        expect(Float.PRECISION).assertEqual(24);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_8200
     * @tc.name builtinsFloatThirdPrototypebTest8200
     * @tc.desc test static readonly PRECISION: byte = 24 (type is number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest8200';
        console.info(`${caseName}, test start`);
        expect(typeof Float.PRECISION).assertEqual('byte');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_8300
     * @tc.name builtinsFloatThirdPrototypebTest8300
     * @tc.desc test static readonly PRECISION: byte = 24 (compare with 24)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest8300';
        console.info(`${caseName}, test start`);
        expect(Float.PRECISION === 24).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_8400
     * @tc.name builtinsFloatThirdPrototypebTest8400
     * @tc.desc test static readonly PRECISION: byte = 24 (greater/less than check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest8400';
        console.info(`${caseName}, test start`);
        expect(Float.PRECISION > 16).assertEqual(true);
        expect(Float.PRECISION < 32).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_8500
     * @tc.name builtinsFloatThirdPrototypebTest8500
     * @tc.desc test static readonly PRECISION: byte = 24 (not equal to other common values)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest8500';
        console.info(`${caseName}, test start`);
        expect(Float.PRECISION === 32).assertEqual(false);
        expect(Float.PRECISION === 8).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_8600
     * @tc.name builtinsFloatThirdPrototypebTest8600
     * @tc.desc test static readonly PRECISION: byte = 24 (read only)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest8600';
        console.info(`${caseName}, test start`);
        const res = Float.PRECISION === 100;
        expect(res).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_8700
     * @tc.name builtinsFloatThirdPrototypebTest8700
     * @tc.desc test static readonly PRECISION: byte = 24 (use in expression)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest8700';
        console.info(`${caseName}, test start`);
        expect(Float.PRECISION * 2).assertEqual(48);
        expect(Float.PRECISION / 2).assertEqual(12);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_8800
     * @tc.name builtinsFloatThirdPrototypebTest8800
     * @tc.desc test static readonly PRECISION: byte = 24 (as function param)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest8800';
        console.info(`${caseName}, test start`);
        const res = Float.PRECISION;
        const t = res === 24;
        expect(t).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_8900
     * @tc.name builtinsFloatThirdPrototypebTest8900
     * @tc.desc test static valueOf(value: float): Float (positive number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest8900';
        console.info(`${caseName}, test start`);
        const f = Float.valueOf(123.456 as float);
        expect(f instanceof Float).assertEqual(true);
        expect(f).assertEqual(123.456 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_9000
     * @tc.name builtinsFloatThirdPrototypebTest9000
     * @tc.desc test static valueOf(value: float): Float (negative number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest9000';
        console.info(`${caseName}, test start`);
        const f = Float.valueOf(-123.456 as float);
        expect(f instanceof Float).assertEqual(true);
        expect(f).assertEqual(-123.456 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_9100
     * @tc.name builtinsFloatThirdPrototypebTest9100
     * @tc.desc test static valueOf(value: float): Float (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest9100';
        console.info(`${caseName}, test start`);
        const f = Float.valueOf(0.0 as float);
        expect(f instanceof Float).assertEqual(true);
        expect(f).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_9200
     * @tc.name builtinsFloatThirdPrototypebTest9200
     * @tc.desc test static valueOf(value: float): Float (negative zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest9200';
        console.info(`${caseName}, test start`);
        const f = Float.valueOf(-0.0 as float);
        expect(f instanceof Float).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_9300
     * @tc.name builtinsFloatThirdPrototypebTest9300
     * @tc.desc test static valueOf(value: float): Float (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest9300';
        console.info(`${caseName}, test start`);
        const f = Float.valueOf(NaN as float);
        expect(f instanceof Float).assertEqual(true);
        expect(Number.isNaN(f)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_9400
     * @tc.name builtinsFloatThirdPrototypebTest9400
     * @tc.desc test static valueOf(value: float): Float (positive infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest9400';
        console.info(`${caseName}, test start`);
        const f = Float.valueOf(Number.POSITIVE_INFINITY as float);
        expect(f instanceof Float).assertEqual(true);
        expect(f).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_9500
     * @tc.name builtinsFloatThirdPrototypebTest9500
     * @tc.desc test static valueOf(value: float): Float (negative infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest9500';
        console.info(`${caseName}, test start`);
        const f = Float.valueOf(Number.NEGATIVE_INFINITY as float);
        expect(f instanceof Float).assertEqual(true);
        expect(f).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_THIRD_PROTOTYPEB_TEST_9600
     * @tc.name builtinsFloatThirdPrototypebTest9600
     * @tc.desc test static valueOf(value: float): Float (max/min value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatThirdPrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatThirdPrototypebTest9600';
        console.info(`${caseName}, test start`);
        const f1 = Float.valueOf(Float.MAX_VALUE as float);
        const f2 = Float.valueOf(Number.MIN_VALUE as float);
        expect(f1 instanceof Float).assertEqual(true);
        expect(f2 instanceof Float).assertEqual(true);
        expect(f1).assertEqual(Float.MAX_VALUE);
        expect(f2).assertEqual(0 as float);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}