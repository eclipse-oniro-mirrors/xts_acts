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
export default function builtinsFloatSecondPrototypebTest() {
  describe('builtinsFloatSecondPrototypebTest', ():void => {
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
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_0000
     * @tc.name builtinsFloatSecondPrototypebTest0000
     * @tc.desc test isLessEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest0000';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        const b = new Float(0.0);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_0100
     * @tc.name builtinsFloatSecondPrototypebTest0100
     * @tc.desc test isLessEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(1.0);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_0200
     * @tc.name builtinsFloatSecondPrototypebTest0200
     * @tc.desc test isLessEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const b = new Float(1.0);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_0300
     * @tc.name builtinsFloatSecondPrototypebTest0300
     * @tc.desc test isLessEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const b = new Float(1.0);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_0400
     * @tc.name builtinsFloatSecondPrototypebTest0400
     * @tc.desc test isLessThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const a = new Float(3.0);
        const b = new Float(5.0);
        const result = a.isLessThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_0500
     * @tc.name builtinsFloatSecondPrototypebTest0500
     * @tc.desc test isLessThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const b = new Float(3.0);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_0600
     * @tc.name builtinsFloatSecondPrototypebTest0600
     * @tc.desc test isLessThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const b = new Float(5.0);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_0700
     * @tc.name builtinsFloatSecondPrototypebTest0700
     * @tc.desc test isLessThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        const b = new Float(1.0);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_0800
     * @tc.name builtinsFloatSecondPrototypebTest0800
     * @tc.desc test isLessThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        const b = new Float(0.0);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_0900
     * @tc.name builtinsFloatSecondPrototypebTest0900
     * @tc.desc test isLessThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(1.0);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_1000
     * @tc.name builtinsFloatSecondPrototypebTest1000
     * @tc.desc test isLessThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const b = new Float(1.0);
        const result = a.isLessThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_1100
     * @tc.name builtinsFloatSecondPrototypebTest1100
     * @tc.desc test isLessThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const b = new Float(1.0);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_1200
     * @tc.name builtinsFloatSecondPrototypebTest1200
     * @tc.desc test isNaN(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const result = a.isNaN();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_1300
     * @tc.name builtinsFloatSecondPrototypebTest1300
     * @tc.desc test isNaN(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const result = a.isNaN();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_1400
     * @tc.name builtinsFloatSecondPrototypebTest1400
     * @tc.desc test isNaN(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const result = a.isNaN();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_1500
     * @tc.name builtinsFloatSecondPrototypebTest1500
     * @tc.desc test isNaN(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const a = new Float(-1.23);
        const result = a.isNaN();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_1600
     * @tc.name builtinsFloatSecondPrototypebTest1600
     * @tc.desc test isNaN(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const result = a.isNaN();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_1700
     * @tc.name builtinsFloatSecondPrototypebTest1700
     * @tc.desc test isNaN(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const result = a.isNaN();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_1800
     * @tc.name builtinsFloatSecondPrototypebTest1800
     * @tc.desc test isNaN(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        const result = a.isNaN();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_1900
     * @tc.name builtinsFloatSecondPrototypebTest1900
     * @tc.desc test isNaN(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        const result = a.isNaN();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_2000
     * @tc.name builtinsFloatSecondPrototypebTest2000
     * @tc.desc test isSafeInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const a = new Float(1);
        const result = a.isSafeInteger();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_2100
     * @tc.name builtinsFloatSecondPrototypebTest2100
     * @tc.desc test isSafeInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_SAFE_INTEGER);
        const result = a.isSafeInteger();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })
    

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_2200
     * @tc.name builtinsFloatSecondPrototypebTest2200
     * @tc.desc test isSafeInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.MIN_SAFE_INTEGER);
        const result = a.isSafeInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_2300
     * @tc.name builtinsFloatSecondPrototypebTest2300
     * @tc.desc test isSafeInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const a = new Float(1.1);
        const result = a.isSafeInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_2400
     * @tc.name builtinsFloatSecondPrototypebTest2400
     * @tc.desc test isSafeInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_SAFE_INTEGER + 1);
        const result = a.isSafeInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_2500
     * @tc.name builtinsFloatSecondPrototypebTest2500
     * @tc.desc test isSafeInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.MIN_SAFE_INTEGER - 1);
        const result = a.isSafeInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_2600
     * @tc.name builtinsFloatSecondPrototypebTest2600
     * @tc.desc test isSafeInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const result = a.isSafeInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_2700
     * @tc.name builtinsFloatSecondPrototypebTest2700
     * @tc.desc test isSafeInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const result = a.isSafeInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_2800
     * @tc.name builtinsFloatSecondPrototypebTest2800
     * @tc.desc test mul(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const a = new Float(2.0);
        const b = new Float(3.0);
        const result = a.mul(b);
        expect(result).assertEqual(6.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_2900
     * @tc.name builtinsFloatSecondPrototypebTest2900
     * @tc.desc test mul(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const a = new Float(-2.0);
        const b = new Float(3.0);
        const result = a.mul(b);
        expect(result).assertEqual(-6.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_3000
     * @tc.name builtinsFloatSecondPrototypebTest3000
     * @tc.desc test mul(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const a = new Float(2.0);
        const b = new Float(-3.0);
        const result = a.mul(b);
        expect(result).assertEqual(-6.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_3100
     * @tc.name builtinsFloatSecondPrototypebTest3100
     * @tc.desc test mul(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const b = new Float(3.0);
        const result = a.mul(b);
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_3200
     * @tc.name builtinsFloatSecondPrototypebTest3200
     * @tc.desc test mul(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        const b = new Float(1.0);
        const result = a.mul(b);
        expect(result).assertEqual(Float.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_3300
     * @tc.name builtinsFloatSecondPrototypebTest3300
     * @tc.desc test mul(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        const b = new Float(1.0);
        const result = a.mul(b);
        expect(result).assertEqual(Float.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_3400
     * @tc.name builtinsFloatSecondPrototypebTest3400
     * @tc.desc test mul(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(2.0);
        const result = a.mul(b);
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_3500
     * @tc.name builtinsFloatSecondPrototypebTest3500
     * @tc.desc test mul(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const b = new Float(2.0);
        const result = a.mul(b);
        expect(result).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_3600
     * @tc.name builtinsFloatSecondPrototypebTest3600
     * @tc.desc test getHashCodeByValue(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_3700
     * @tc.name builtinsFloatSecondPrototypebTest3700
     * @tc.desc test getHashCodeByValue(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const a = new Float(42.0);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_3800
     * @tc.name builtinsFloatSecondPrototypebTest3800
     * @tc.desc test getHashCodeByValue(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const a = new Float(-42.0);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_3900
     * @tc.name builtinsFloatSecondPrototypebTest3900
     * @tc.desc test getHashCodeByValue(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(2147483647);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_4000
     * @tc.name builtinsFloatSecondPrototypebTest4000
     * @tc.desc test getHashCodeByValue(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_4100
     * @tc.name builtinsFloatSecondPrototypebTest4100
     * @tc.desc test getHashCodeByValue(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const a = new Float(12345.0);
        const b = new Float(12345.0);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(Runtime.getHashCodeByValue(b));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_4200
     * @tc.name builtinsFloatSecondPrototypebTest4200
     * @tc.desc test getHashCodeByValue(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_4300
     * @tc.name builtinsFloatSecondPrototypebTest4300
     * @tc.desc test getHashCodeByValue(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(2147483647);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_4400
     * @tc.name builtinsFloatSecondPrototypebTest4400
     * @tc.desc test toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(a.toByte()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_4500
     * @tc.name builtinsFloatSecondPrototypebTest4500
     * @tc.desc test toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const a = new Float(42.0);
        expect(a.toByte()).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_4600
     * @tc.name builtinsFloatSecondPrototypebTest4600
     * @tc.desc test toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const a = new Float(-42.0);
        expect(a.toByte()).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_4700
     * @tc.name builtinsFloatSecondPrototypebTest4700
     * @tc.desc test toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const a = new Float(127.0);
        expect(a.toByte()).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_4800
     * @tc.name builtinsFloatSecondPrototypebTest4800
     * @tc.desc test toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const a = new Float(-128.0);
        expect(a.toByte()).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_4900
     * @tc.name builtinsFloatSecondPrototypebTest4900
     * @tc.desc test toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const a = new Float(0x123);
        expect(a.toByte()).assertEqual(0x23);
        const b = new Float(-0x123);
        expect(b.toByte()).assertEqual(-0x23);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_5000
     * @tc.name builtinsFloatSecondPrototypebTest5000
     * @tc.desc test toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const a = new Float(0x12345678);
        expect(a.toByte()).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_5100
     * @tc.name builtinsFloatSecondPrototypebTest5100
     * @tc.desc test toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const a = new Float(256.0);
        expect(a.toByte()).assertEqual(0);
        const b = new Float(-129.0);
        expect(b.toByte()).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_5200
     * @tc.name builtinsFloatSecondPrototypebTest5200
     * @tc.desc test compareTo(other: Float): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const b = new Float(5.0);
        expect(a.compareTo(b)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_5300
     * @tc.name builtinsFloatSecondPrototypebTest5300
     * @tc.desc test compareTo(other: Float): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const a = new Float(3.0);
        const b = new Float(5.0);
        expect(a.compareTo(b)).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_5400
     * @tc.name builtinsFloatSecondPrototypebTest5400
     * @tc.desc test compareTo(other: Float): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const b = new Float(3.0);
        expect(a.compareTo(b)).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_5500
     * @tc.name builtinsFloatSecondPrototypebTest5500
     * @tc.desc test compareTo(other: Float): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        const b = new Float(1.0);
        const result = a.compareTo(b) > 0;
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_5600
     * @tc.name builtinsFloatSecondPrototypebTest5600
     * @tc.desc test compareTo(other: Float): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        const b = new Float(0.0);
        const result = a.compareTo(b) < 0;
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_5700
     * @tc.name builtinsFloatSecondPrototypebTest5700
     * @tc.desc test compareTo(other: Float): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(1.0);
        expect(a.compareTo(b)).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_5800
     * @tc.name builtinsFloatSecondPrototypebTest5800
     * @tc.desc test compareTo(other: Float): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const b = new Float(1.0);
        expect(a.compareTo(b)).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_5900
     * @tc.name builtinsFloatSecondPrototypebTest5900
     * @tc.desc test compareTo(other: Float): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const b = new Float(1.0);
        expect(Number.isNaN(a.compareTo(b))).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_6000
     * @tc.name builtinsFloatSecondPrototypebTest6000
     * @tc.desc test toDouble(): double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(a.toDouble()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_6100
     * @tc.name builtinsFloatSecondPrototypebTest6100
     * @tc.desc test toDouble(): double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const a = new Float(42.0);
        expect(a.toDouble()).assertEqual(42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_6200
     * @tc.name builtinsFloatSecondPrototypebTest6200
     * @tc.desc test toDouble(): double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const a = new Float(-42.0);
        expect(a.toDouble()).assertEqual(-42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_6300
     * @tc.name builtinsFloatSecondPrototypebTest6300
     * @tc.desc test toDouble(): double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        expect(a.toDouble()).assertEqual(Float.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_6400
     * @tc.name builtinsFloatSecondPrototypebTest6400
     * @tc.desc test toDouble(): double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        expect(a.toDouble()).assertEqual(Float.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_6500
     * @tc.name builtinsFloatSecondPrototypebTest6500
     * @tc.desc test toDouble(): double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest6500';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        expect(a.toDouble()).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_6600
     * @tc.name builtinsFloatSecondPrototypebTest6600
     * @tc.desc test toDouble(): double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest6600';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        expect(a.toDouble()).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_6700
     * @tc.name builtinsFloatSecondPrototypebTest6700
     * @tc.desc test toDouble(): double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest6700';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        expect(Number.isNaN(a.toDouble())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_6800
     * @tc.name builtinsFloatSecondPrototypebTest6800
     * @tc.desc test toFloat(): float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest6800';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(a.toFloat()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_6900
     * @tc.name builtinsFloatSecondPrototypebTest6900
     * @tc.desc test toFloat(): float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest6900';
        console.info(`${caseName}, test start`);
        const a = new Float(42.0);
        expect(a.toFloat()).assertEqual(42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_7000
     * @tc.name builtinsFloatSecondPrototypebTest7000
     * @tc.desc test toFloat(): float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest7000';
        console.info(`${caseName}, test start`);
        const a = new Float(-42.0);
        expect(a.toFloat()).assertEqual(-42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_7100
     * @tc.name builtinsFloatSecondPrototypebTest7100
     * @tc.desc test toFloat(): float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest7100';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        expect(a.toFloat()).assertEqual(Float.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_7200
     * @tc.name builtinsFloatSecondPrototypebTest7200
     * @tc.desc test toFloat(): float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest7200';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        expect(a.toFloat()).assertEqual(Float.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_7300
     * @tc.name builtinsFloatSecondPrototypebTest7300
     * @tc.desc test toFloat(): float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest7300';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        expect(a.toFloat()).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_7400
     * @tc.name builtinsFloatSecondPrototypebTest7400
     * @tc.desc test toFloat(): float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest7400';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        expect(a.toFloat()).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_7500
     * @tc.name builtinsFloatSecondPrototypebTest7500
     * @tc.desc test toFloat(): float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest7500';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        expect(Number.isNaN(a.toFloat())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_7600
     * @tc.name builtinsFloatSecondPrototypebTest7600
     * @tc.desc test toInt(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest7600';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(a.toInt()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_7700
     * @tc.name builtinsFloatSecondPrototypebTest7700
     * @tc.desc test toInt(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest7700';
        console.info(`${caseName}, test start`);
        const a = new Float(42.8);
        expect(a.toInt()).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_7800
     * @tc.name builtinsFloatSecondPrototypebTest7800
     * @tc.desc test toInt(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest7800';
        console.info(`${caseName}, test start`);
        const a = new Float(-42.3);
        expect(a.toInt()).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_7900
     * @tc.name builtinsFloatSecondPrototypebTest7900
     * @tc.desc test toInt(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest7900';
        console.info(`${caseName}, test start`);
        const a = new Float(6.69);
        expect(a.toInt()).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_8000
     * @tc.name builtinsFloatSecondPrototypebTest8000
     * @tc.desc test toInt(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest8000';
        console.info(`${caseName}, test start`);
        const a = new Float(-9.99);
        expect(a.toInt()).assertEqual(-9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_8100
     * @tc.name builtinsFloatSecondPrototypebTest8100
     * @tc.desc test toInt(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest8100';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        expect(a.toInt()).assertEqual(2147483647);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_8200
     * @tc.name builtinsFloatSecondPrototypebTest8200
     * @tc.desc test toInt(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest8200';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        expect(a.toInt()).assertEqual(-2147483648);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_8300
     * @tc.name builtinsFloatSecondPrototypebTest8300
     * @tc.desc test toInt(): int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest8300';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        expect(Number.isNaN(a.toInt())).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_8400
     * @tc.name builtinsFloatSecondPrototypebTest8400
     * @tc.desc test toLong(): long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest8400';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(a.toLong()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_8500
     * @tc.name builtinsFloatSecondPrototypebTest8500
     * @tc.desc test toLong(): long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest8500';
        console.info(`${caseName}, test start`);
        const a = new Float(42.8);
        expect(a.toLong()).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_8600
     * @tc.name builtinsFloatSecondPrototypebTest8600
     * @tc.desc test toLong(): long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest8600';
        console.info(`${caseName}, test start`);
        const a = new Float(-42.3);
        expect(a.toLong()).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_8700
     * @tc.name builtinsFloatSecondPrototypebTest8700
     * @tc.desc test toLong(): long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest8700';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        expect(a.toLong()).assertEqual(9223372036854775807);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_8800
     * @tc.name builtinsFloatSecondPrototypebTest8800
     * @tc.desc test toLong(): long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest8800';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.MIN_VALUE);
        expect(a.toLong()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_8900
     * @tc.name builtinsFloatSecondPrototypebTest8900
     * @tc.desc test toLong(): long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest8900';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        expect(a.toLong()).assertEqual(9223372036854775807);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_9000
     * @tc.name builtinsFloatSecondPrototypebTest9000
     * @tc.desc test toLong(): long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest9000';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        expect(a.toLong()).assertEqual(-9223372036854775808);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_9100
     * @tc.name builtinsFloatSecondPrototypebTest9100
     * @tc.desc test toLong(): long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest9100';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        expect(Number.isNaN(a.toLong())).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_9200
     * @tc.name builtinsFloatSecondPrototypebTest9200
     * @tc.desc test toShort(): short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest9200';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(a.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_9300
     * @tc.name builtinsFloatSecondPrototypebTest9300
     * @tc.desc test toShort(): short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest9300';
        console.info(`${caseName}, test start`);
        const a = new Float(42.8);
        expect(a.toShort()).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_9400
     * @tc.name builtinsFloatSecondPrototypebTest9400
     * @tc.desc test toShort(): short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest9400';
        console.info(`${caseName}, test start`);
        const a = new Float(-42.3);
        expect(a.toShort()).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_9500
     * @tc.name builtinsFloatSecondPrototypebTest9500
     * @tc.desc test toShort(): short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest9500';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        expect(a.toShort()).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_9600
     * @tc.name builtinsFloatSecondPrototypebTest9600
     * @tc.desc test toShort(): short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest9600';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.MIN_VALUE);
        expect(a.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_9700
     * @tc.name builtinsFloatSecondPrototypebTest9700
     * @tc.desc test toShort(): short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest9700';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        expect(a.toShort()).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_9800
     * @tc.name builtinsFloatSecondPrototypebTest9800
     * @tc.desc test toShort(): short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest9800';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        expect(a.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_SECOND_PROTOTYPEB_TEST_9900
     * @tc.name builtinsFloatSecondPrototypebTest9900
     * @tc.desc test toShort(): short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatSecondPrototypebTest9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatSecondPrototypebTest9900';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        expect(a.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

  })
}