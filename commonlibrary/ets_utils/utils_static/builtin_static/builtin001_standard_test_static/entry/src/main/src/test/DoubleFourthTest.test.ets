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
export default function builtinsDoubleFourthPrototypebTest() {
  describe('builtinsDoubleFourthPrototypebTest', ():void => {
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
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_0100
     * @tc.name builtinsDoubleFourthPrototypebTest0100
     * @tc.desc test isNaN(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest0100';
        console.info(`${caseName}, test start`);
        expect(Double.isNaN(NaN)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_0200
     * @tc.name builtinsDoubleFourthPrototypebTest0200
     * @tc.desc test isNaN(): normal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest0200';
        console.info(`${caseName}, test start`);
        expect(Double.isNaN(123.456)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_0300
     * @tc.name builtinsDoubleFourthPrototypebTest0300
     * @tc.desc test isNaN(): normal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest0300';
        console.info(`${caseName}, test start`);
        expect(Double.isNaN(-789.123)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_0400
     * @tc.name builtinsDoubleFourthPrototypebTest0400
     * @tc.desc test isNaN(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest0400';
        console.info(`${caseName}, test start`);
        expect(Double.isNaN(0.0)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_0500
     * @tc.name builtinsDoubleFourthPrototypebTest0500
     * @tc.desc test isNaN(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest0500';
        console.info(`${caseName}, test start`);
        expect(Double.isNaN(-0.0)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_0600
     * @tc.name builtinsDoubleFourthPrototypebTest0600
     * @tc.desc test isNaN(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest0600';
        console.info(`${caseName}, test start`);
        expect(Double.isNaN(Number.POSITIVE_INFINITY)).assertEqual(false);
        expect(Double.isNaN(Number.NEGATIVE_INFINITY)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_0700
     * @tc.name builtinsDoubleFourthPrototypebTest0700
     * @tc.desc test isNaN(): max and min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest0700';
        console.info(`${caseName}, test start`);
        expect(Double.isNaN(Number.MAX_VALUE)).assertEqual(false);
        expect(Double.isNaN(Number.MIN_VALUE)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_0800
     * @tc.name builtinsDoubleFourthPrototypebTest0800
     * @tc.desc test isNaN(): special type (object)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest0800';
        console.info(`${caseName}, test start`);
        expect(Double.isNaN({} as number)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_0900
     * @tc.name builtinsDoubleFourthPrototypebTest0900
     * @tc.desc test isSafeInteger(): safe positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest0900';
        console.info(`${caseName}, test start`);
        expect(Double.isSafeInteger(9007199254740991)).assertEqual(true);
        expect(Double.isSafeInteger(1)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_1000
     * @tc.name builtinsDoubleFourthPrototypebTest1000
     * @tc.desc test isSafeInteger(): beyond safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest1000';
        console.info(`${caseName}, test start`);
        expect(Double.isSafeInteger(9007199254740992)).assertEqual(false); // MAX_SAFE_INTEGER+1
        expect(Double.isSafeInteger(-9007199254740992)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_1100
     * @tc.name builtinsDoubleFourthPrototypebTest1100
     * @tc.desc test isSafeInteger(): negative safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest1100';
        console.info(`${caseName}, test start`);
        expect(Double.isSafeInteger(-9007199254740991)).assertEqual(true);
        expect(Double.isSafeInteger(-1)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_1200
     * @tc.name builtinsDoubleFourthPrototypebTest1200
     * @tc.desc test isSafeInteger(): point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest1200';
        console.info(`${caseName}, test start`);
        expect(Double.isSafeInteger(1.1)).assertEqual(false);
        expect(Double.isSafeInteger(-1.1)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_1300
     * @tc.name builtinsDoubleFourthPrototypebTest1300
     * @tc.desc test isSafeInteger(): 0 and -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest1300';
        console.info(`${caseName}, test start`);
        expect(Double.isSafeInteger(0)).assertEqual(true);
        expect(Double.isSafeInteger(-0.0)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_1400
     * @tc.name builtinsDoubleFourthPrototypebTest1400
     * @tc.desc test isSafeInteger(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest1400';
        console.info(`${caseName}, test start`);
        expect(Double.isSafeInteger(NaN)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_1500
     * @tc.name builtinsDoubleFourthPrototypebTest1500
     * @tc.desc test isSafeInteger(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest1500';
        console.info(`${caseName}, test start`);
        expect(Double.isSafeInteger(Number.POSITIVE_INFINITY)).assertEqual(false);
        expect(Double.isSafeInteger(Number.NEGATIVE_INFINITY)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_1600
     * @tc.name builtinsDoubleFourthPrototypebTest1600
     * @tc.desc test isSafeInteger():
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest1600';
        console.info(`${caseName}, test start`);
        expect(Double.isSafeInteger(9.99)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_1700
     * @tc.name builtinsDoubleFourthPrototypebTest1700
     * @tc.desc test toString(d, r): decimal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest1700';
        console.info(`${caseName}, test start`);
        expect(Double.toString(123.456, 10)).assertEqual('123.456');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_1800
     * @tc.name builtinsDoubleFourthPrototypebTest1800
     * @tc.desc test toString(d, r): decimal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest1800';
        console.info(`${caseName}, test start`);
        expect(Double.toString(-789.123, 10)).assertEqual('-789.123');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_1900
     * @tc.name builtinsDoubleFourthPrototypebTest1900
     * @tc.desc test toString(d, r): binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest1900';
        console.info(`${caseName}, test start`);
        expect(Double.toString(10, 2)).assertEqual('1010');
        expect(Double.toString(-10, 2)).assertEqual('-1010');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_2000
     * @tc.name builtinsDoubleFourthPrototypebTest2000
     * @tc.desc test toString(d, r): octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest2000';
        console.info(`${caseName}, test start`);
        expect(Double.toString(64, 8)).assertEqual('100');
        expect(Double.toString(-64, 8)).assertEqual('-100');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_2100
     * @tc.name builtinsDoubleFourthPrototypebTest2100
     * @tc.desc test toString(d, r): hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest2100';
        console.info(`${caseName}, test start`);
        expect(Double.toString(255, 16)).assertEqual('ff');
        expect(Double.toString(-255, 16)).assertEqual('-ff');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_2200
     * @tc.name builtinsDoubleFourthPrototypebTest2200
     * @tc.desc test toString(d, r): 0 and -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest2200';
        console.info(`${caseName}, test start`);
        expect(Double.toString(0, 10)).assertEqual('0');
        expect(Double.toString(-0.0, 10)).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_2300
     * @tc.name builtinsDoubleFourthPrototypebTest2300
    * @tc.desc test toString(d, r): NaN and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest2300';
        console.info(`${caseName}, test start`);
        expect(Double.toString(NaN, 10)).assertEqual('NaN');
        expect(Double.toString(Number.POSITIVE_INFINITY, 10)).assertEqual('Infinity');
        expect(Double.toString(Number.NEGATIVE_INFINITY, 10)).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_2400
     * @tc.name builtinsDoubleFourthPrototypebTest2400
     * @tc.desc test toString(d, r): maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest2400';
        console.info(`${caseName}, test start`);
        expect(Double.toString(Number.MAX_VALUE, 10)).assertEqual(Number.MAX_VALUE.toString());
        expect(Double.toString(Number.MIN_VALUE, 10)).assertEqual(Number.MIN_VALUE.toString());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_2500
     * @tc.name builtinsDoubleFourthPrototypebTest2500
     * @tc.desc test bitCastFromLong(bits): 0L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest2500';
        console.info(`${caseName}, test start`);
        expect(Double.bitCastFromLong(0)).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_2700
     * @tc.name builtinsDoubleFourthPrototypebTest2700
     * @tc.desc test bitCastFromLong(bits): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest2700';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.bitCastFromLong(0x7ff8000000000000))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_2800
     * @tc.name builtinsDoubleFourthPrototypebTest2800
     * @tc.desc test bitCastFromLong(bits): maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest2800';
        console.info(`${caseName}, test start`);
        expect(Double.bitCastFromLong(0x7ff0000000000000)).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_2900
     * @tc.name builtinsDoubleFourthPrototypebTest2900
     * @tc.desc test bitCastFromLong(bits): negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest2900';
        console.info(`${caseName}, test start`);
        expect(Double.bitCastFromLong(-0x10000000000000)).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_3000
     * @tc.name builtinsDoubleFourthPrototypebTest3000
     * @tc.desc test bitCastFromLong(bits): 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest3000';
        console.info(`${caseName}, test start`);
        expect(Double.bitCastFromLong(0x3ff0000000000000)).assertEqual(1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_3100
     * @tc.name builtinsDoubleFourthPrototypebTest3100
     * @tc.desc test bitCastFromLong(bits): -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest3100';
        console.info(`${caseName}, test start`);
        expect(Double.bitCastFromLong(-0x4010000000000000)).assertEqual(-1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_3200
     * @tc.name builtinsDoubleFourthPrototypebTest3200
     * @tc.desc test bitCastFromLong(bits): maximum and minimum long values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest3200';
        console.info(`${caseName}, test start`);
        expect(typeof Double.bitCastFromLong(Number.MAX_SAFE_INTEGER as long)).assertEqual('number');
        expect(typeof Double.bitCastFromLong(Number.MIN_SAFE_INTEGER as long)).assertEqual('number');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_3300
     * @tc.name builtinsDoubleFourthPrototypebTest3300
     * @tc.desc test parseFloat(s): normal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest3300';
        console.info(`${caseName}, test start`);
        expect(Double.parseFloat('123.456')).assertEqual(123.456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_3400
     * @tc.name builtinsDoubleFourthPrototypebTest3400
     * @tc.desc test parseFloat(s): normal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest3400';
        console.info(`${caseName}, test start`);
        expect(Double.parseFloat('-789.123')).assertEqual(-789.123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_3500
     * @tc.name builtinsDoubleFourthPrototypebTest3500
     * @tc.desc test parseFloat(s): scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest3500';
        console.info(`${caseName}, test start`);
        expect(Double.parseFloat('1.23e3')).assertEqual(1230);
        expect(Double.parseFloat('-4.56E2')).assertEqual(-456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_3600
     * @tc.name builtinsDoubleFourthPrototypebTest3600
     * @tc.desc test parseFloat(s): 0 and -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest3600';
        console.info(`${caseName}, test start`);
        expect(Double.parseFloat('0')).assertEqual(0);
        expect(Double.parseFloat('-0.0')).assertEqual(-0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_3700
     * @tc.name builtinsDoubleFourthPrototypebTest3700
     * @tc.desc test parseFloat(s): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest3700';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseFloat('abc'))).assertEqual(true);
        expect(Number.isNaN(Double.parseFloat('NaN'))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_3800
     * @tc.name builtinsDoubleFourthPrototypebTest3800
     * @tc.desc test parseFloat(s): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest3800';
        console.info(`${caseName}, test start`);
        expect(Double.parseFloat('Infinity')).assertEqual(Number.POSITIVE_INFINITY);
        expect(Double.parseFloat('-Infinity')).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_3900
     * @tc.name builtinsDoubleFourthPrototypebTest3900
     * @tc.desc test parseFloat(s): maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest3900';
        console.info(`${caseName}, test start`);
        expect(Double.parseFloat(Number.MAX_VALUE.toString())).assertEqual(Number.MAX_VALUE);
        expect(Double.parseFloat(Number.MIN_VALUE.toString())).assertEqual(Number.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_4000
     * @tc.name builtinsDoubleFourthPrototypebTest4000
     * @tc.desc test parseFloat(s): special strings (empty, spaces, etc.)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest4000';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseFloat(''))).assertEqual(true);
        expect(Number.isNaN(Double.parseFloat('   '))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_4100
     * @tc.name builtinsDoubleFourthPrototypebTest4100
     * @tc.desc test parseIntCore(s, r): decimal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest4100';
        console.info(`${caseName}, test start`);
        expect(Double.parseIntCore('123', 10)).assertEqual(123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_4200
     * @tc.name builtinsDoubleFourthPrototypebTest4200
     * @tc.desc test parseIntCore(s, r): decimal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest4200';
        console.info(`${caseName}, test start`);
        expect(Double.parseIntCore('-456', 10)).assertEqual(-456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_4300
     * @tc.name builtinsDoubleFourthPrototypebTest4300
     * @tc.desc test parseIntCore(s, r): binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest4300';
        console.info(`${caseName}, test start`);
        expect(Double.parseIntCore('1010', 2)).assertEqual(10);
        expect(Double.parseIntCore('-1010', 2)).assertEqual(-10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_4400
     * @tc.name builtinsDoubleFourthPrototypebTest4400
     * @tc.desc test parseIntCore(s, r): octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest4400';
        console.info(`${caseName}, test start`);
        expect(Double.parseIntCore('100', 8)).assertEqual(64);
        expect(Double.parseIntCore('-100', 8)).assertEqual(-64);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_4500
     * @tc.name builtinsDoubleFourthPrototypebTest4500
     * @tc.desc test parseIntCore(s, r): hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest4500';
        console.info(`${caseName}, test start`);
        expect(Double.parseIntCore('ff', 16)).assertEqual(255);
        expect(Double.parseIntCore('-ff', 16)).assertEqual(-255);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_4600
     * @tc.name builtinsDoubleFourthPrototypebTest4600
     * @tc.desc test parseIntCore(s, r): 0 and -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest4600';
        console.info(`${caseName}, test start`);
        expect(Double.parseIntCore('0', 10)).assertEqual(0);
        expect(Double.parseIntCore('-0', 10)).assertEqual(-0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_4700
     * @tc.name builtinsDoubleFourthPrototypebTest4700
     * @tc.desc test parseIntCore(s, r): invalid string and NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest4700';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseIntCore('abc', 10))).assertEqual(true);
        expect(Number.isNaN(Double.parseIntCore('NaN', 10))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_4800
     * @tc.name builtinsDoubleFourthPrototypebTest4800
     * @tc.desc test parseIntCore(s, r): special strings (empty, spaces)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest4800';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseIntCore('', 10))).assertEqual(true);
        expect(Number.isNaN(Double.parseIntCore('   ', 10))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_4900
     * @tc.name builtinsDoubleFourthPrototypebTest4900
     * @tc.desc test bitCastToLong(val): normal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const val = 123.456;
        const longVal = Double.bitCastToLong(val);
        expect(typeof longVal).assertEqual('long');
        expect(Double.bitCastFromLong(longVal)).assertEqual(val);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_5000
     * @tc.name builtinsDoubleFourthPrototypebTest5000
     * @tc.desc test bitCastToLong(val): normal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const val = -789.123;
        const longVal = Double.bitCastToLong(val);
        expect(typeof longVal).assertEqual('long');
        expect(Double.bitCastFromLong(longVal)).assertEqual(val);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_5100
     * @tc.name builtinsDoubleFourthPrototypebTest5100
     * @tc.desc test bitCastToLong(val): extreme value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const val = Number.MAX_VALUE;
        const longVal = Double.bitCastToLong(val);
        expect(typeof longVal).assertEqual('long');
        expect(Double.bitCastFromLong(longVal)).assertEqual(val);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_5200
     * @tc.name builtinsDoubleFourthPrototypebTest5200
     * @tc.desc test bitCastToLong(val): minimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const val = Number.MIN_VALUE;
        const longVal = Double.bitCastToLong(val);
        expect(typeof longVal).assertEqual('long');
        expect(Double.bitCastFromLong(longVal)).assertEqual(val);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_5300
     * @tc.name builtinsDoubleFourthPrototypebTest5300
     * @tc.desc test bitCastToLong(val): 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const val = 0.1;
        const longVal = Double.bitCastToLong(val);
        expect(typeof longVal).assertEqual('long');
        expect(Double.bitCastFromLong(longVal)).assertEqual(val);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_5400
     * @tc.name builtinsDoubleFourthPrototypebTest5400
     * @tc.desc test bitCastToLong(val): -0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const val = -0.1;
        const longVal = Double.bitCastToLong(val);
        expect(typeof longVal).assertEqual('long');
        expect(Double.bitCastFromLong(longVal)).assertEqual(val);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_5500
     * @tc.name builtinsDoubleFourthPrototypebTest5500
     * @tc.desc test bitCastToLong(val): 1234567890123456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const val = 1234567890123456;
        const longVal = Double.bitCastToLong(val);
        expect(typeof longVal).assertEqual('long');
        expect(Double.bitCastFromLong(longVal)).assertEqual(val);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_5600
     * @tc.name builtinsDoubleFourthPrototypebTest5600
     * @tc.desc test bitCastToLong(val): -1234567890123456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const val = -1234567890123456;
        const longVal = Double.bitCastToLong(val);
        expect(typeof longVal).assertEqual('long');
        expect(Double.bitCastFromLong(longVal)).assertEqual(val);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_5700
     * @tc.name builtinsDoubleFourthPrototypebTest5700
     * @tc.desc test parseInt(s): normal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest5700';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('123')).assertEqual(123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_5800
     * @tc.name builtinsDoubleFourthPrototypebTest5800
     * @tc.desc test parseInt(s): normal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest5800';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('-456')).assertEqual(-456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_5900
     * @tc.name builtinsDoubleFourthPrototypebTest5900
     * @tc.desc test parseInt(s): scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest5900';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseInt('1.23e3'))).assertEqual(false);
        expect(Number.isNaN(Double.parseInt('-4.56E2'))).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_6000
     * @tc.name builtinsDoubleFourthPrototypebTest6000
     * @tc.desc test parseInt(s): 0 and -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest6000';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('0')).assertEqual(0);
        expect(Double.parseInt('-0')).assertEqual(-0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_6100
     * @tc.name builtinsDoubleFourthPrototypebTest6100
     * @tc.desc test parseInt(s): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest6100';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseInt('abc'))).assertEqual(true);
        expect(Number.isNaN(Double.parseInt('NaN'))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_6200
     * @tc.name builtinsDoubleFourthPrototypebTest6200
     * @tc.desc test parseInt(s): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest6200';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseInt('Infinity'))).assertEqual(true);
        expect(Number.isNaN(Double.parseInt('-Infinity'))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_6300
     * @tc.name builtinsDoubleFourthPrototypebTest6300
     * @tc.desc test parseInt(s): extreme values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest6300';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseInt(Number.MAX_VALUE.toString()))).assertEqual(false);
        expect(Number.isNaN(Double.parseInt(Number.MIN_VALUE.toString()))).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_6400
     * @tc.name builtinsDoubleFourthPrototypebTest6400
     * @tc.desc test parseInt(s): special strings (empty, spaces)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest6400';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseInt(''))).assertEqual(true);
        expect(Number.isNaN(Double.parseInt('   '))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_6500
     * @tc.name builtinsDoubleFourthPrototypebTest6500
     * @tc.desc test parseInt(s, r:double): decimal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest6500';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('123', 10)).assertEqual(123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_6600
     * @tc.name builtinsDoubleFourthPrototypebTest6600
     * @tc.desc test parseInt(s, r:double): decimal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest6600';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('-456', 10)).assertEqual(-456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_6700
     * @tc.name builtinsDoubleFourthPrototypebTest6700
     * @tc.desc test parseInt(s, r:double): binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest6700';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('1010', 2)).assertEqual(10);
        expect(Double.parseInt('-1010', 2)).assertEqual(-10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_6800
     * @tc.name builtinsDoubleFourthPrototypebTest6800
     * @tc.desc test parseInt(s, r:double): octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest6800';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('100', 8)).assertEqual(64);
        expect(Double.parseInt('-100', 8)).assertEqual(-64);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_6900
     * @tc.name builtinsDoubleFourthPrototypebTest6900
     * @tc.desc test parseInt(s, r:double): hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest6900';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('ff', 16)).assertEqual(255);
        expect(Double.parseInt('-ff', 16)).assertEqual(-255);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_7000
     * @tc.name builtinsDoubleFourthPrototypebTest7000
     * @tc.desc test parseInt(s, r:double): invalid radix (less than 2, greater than 36, NaN, Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest7000';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseInt('123', 1))).assertEqual(true);
        expect(Number.isNaN(Double.parseInt('123', 37))).assertEqual(true);
        expect(Double.parseInt('123', NaN)).assertEqual(123);
        expect(Double.parseInt('123', Infinity)).assertEqual(123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_7100
     * @tc.name builtinsDoubleFourthPrototypebTest7100
    * @tc.desc test parseInt(s, r:double): 0 and -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest7100';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('0', 10)).assertEqual(0);
        expect(Double.parseInt('-0', 10)).assertEqual(-0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_7200
     * @tc.name builtinsDoubleFourthPrototypebTest7200
    * @tc.desc test parseInt(s, r:double): special strings (empty, spaces)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest7200';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseInt('', 10))).assertEqual(true);
        expect(Number.isNaN(Double.parseInt('   ', 10))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_7300
     * @tc.name builtinsDoubleFourthPrototypebTest7300
     * @tc.desc test parseInt(s, r: int): decimal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest7300';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('123', 10)).assertEqual(123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_7400
     * @tc.name builtinsDoubleFourthPrototypebTest7400
     * @tc.desc test parseInt(s, r: int): decimal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest7400';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('-456', 10)).assertEqual(-456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_7500
     * @tc.name builtinsDoubleFourthPrototypebTest7500
     * @tc.desc test parseInt(s, r: int): binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest7500';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('1010', 2)).assertEqual(10);
        expect(Double.parseInt('-1010', 2)).assertEqual(-10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_7600
     * @tc.name builtinsDoubleFourthPrototypebTest7600
     * @tc.desc test parseInt(s, r: int): octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest7600';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('100', 8)).assertEqual(64);
        expect(Double.parseInt('-100', 8)).assertEqual(-64);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_7700
     * @tc.name builtinsDoubleFourthPrototypebTest7700
     * @tc.desc test parseInt(s, r: int): hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest7700';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('ff', 16)).assertEqual(255);
        expect(Double.parseInt('-ff', 16)).assertEqual(-255);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_7800
     * @tc.name builtinsDoubleFourthPrototypebTest7800
     * @tc.desc test parseInt(s, r: int): invalid radix (less than 2, greater than 36)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest7800';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseInt('123', 1))).assertEqual(true);
        expect(Number.isNaN(Double.parseInt('123', 37))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_7900
     * @tc.name builtinsDoubleFourthPrototypebTest7900
     * @tc.desc test parseInt(s, r: int): 0 and -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest7900';
        console.info(`${caseName}, test start`);
        expect(Double.parseInt('0', 10)).assertEqual(0);
        expect(Double.parseInt('-0', 10)).assertEqual(-0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_FOURTH_PROTOTYPEB_TEST_8000
     * @tc.name builtinsDoubleFourthPrototypebTest8000
     * @tc.desc test parseInt(s, r: int): special strings (empty, spaces)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest8000';
        console.info(`${caseName}, test start`);
        expect(Number.isNaN(Double.parseInt('', 10))).assertEqual(true);
        expect(Number.isNaN(Double.parseInt('   ', 10))).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest8100
     * @tc.name builtinsDoubleFourthPrototypebTest8100
     * @tc.desc test Double.toString(d: double): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest8100';
        console.info(`${caseName}, test start`);
        const result = Double.toString(123.456);
        expect(result).assertEqual('123.456');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest8200
     * @tc.name builtinsDoubleFourthPrototypebTest8200
     * @tc.desc test Double.toString(d: double): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest8200';
        console.info(`${caseName}, test start`);
        const result = Double.toString(-123.456);
        expect(result).assertEqual('-123.456');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest8300
     * @tc.name builtinsDoubleFourthPrototypebTest8300
     * @tc.desc test Double.toString(d: double): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest8300';
        console.info(`${caseName}, test start`);
        const result = Double.toString(0.0);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest8400
     * @tc.name builtinsDoubleFourthPrototypebTest8400
     * @tc.desc test Double.toString(d: double): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest8400';
        console.info(`${caseName}, test start`);
        const result = Double.toString(Double.MAX_VALUE);
        expect(result).assertEqual('1.7976931348623157e+308');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest8500
     * @tc.name builtinsDoubleFourthPrototypebTest8500
     * @tc.desc test Double.toString(d: double): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest8500';
        console.info(`${caseName}, test start`);
        const result = Double.toString(Double.MIN_VALUE);
        expect(result).assertEqual('5e-324');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest8600
     * @tc.name builtinsDoubleFourthPrototypebTest8600
     * @tc.desc test Double.toString(d: double): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest8600';
        console.info(`${caseName}, test start`);
        const result = Double.toString(Number.POSITIVE_INFINITY);
        expect(result).assertEqual('Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest8700
     * @tc.name builtinsDoubleFourthPrototypebTest8700
     * @tc.desc test Double.toString(d: double): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest8700';
        console.info(`${caseName}, test start`);
        const result = Double.toString(Number.NEGATIVE_INFINITY);
        expect(result).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest8800
     * @tc.name builtinsDoubleFourthPrototypebTest8800
     * @tc.desc test Double.toString(d: double): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest8800';
        console.info(`${caseName}, test start`);
        const result = Double.toString(NaN);
        expect(result).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest8900
     * @tc.name builtinsDoubleFourthPrototypebTest8900
     * @tc.desc test Double.valueOf(value: double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest8900';
        console.info(`${caseName}, test start`);
        const result = Double.valueOf(123.456);
        expect(result.valueOf()).assertEqual(123.456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest9000
     * @tc.name builtinsDoubleFourthPrototypebTest9000
     * @tc.desc test Double.valueOf(value: double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest9000';
        console.info(`${caseName}, test start`);
        const result = Double.valueOf(-123.456);
        expect(result.valueOf()).assertEqual(-123.456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest9100
     * @tc.name builtinsDoubleFourthPrototypebTest9100
     * @tc.desc test Double.valueOf(value: double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest9100';
        console.info(`${caseName}, test start`);
        const result = Double.valueOf(0.0);
        expect(result.valueOf()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest9200
     * @tc.name builtinsDoubleFourthPrototypebTest9200
     * @tc.desc test Double.valueOf(value: double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest9200';
        console.info(`${caseName}, test start`);
        const result = Double.valueOf(Double.MAX_VALUE);
        expect(result.valueOf()).assertEqual(Double.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest9300
     * @tc.name builtinsDoubleFourthPrototypebTest9300
     * @tc.desc test Double.valueOf(value: double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest9300';
        console.info(`${caseName}, test start`);
        const result = Double.valueOf(Double.MIN_VALUE);
        expect(result.valueOf()).assertEqual(Double.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest9400
     * @tc.name builtinsDoubleFourthPrototypebTest9400
     * @tc.desc test Double.valueOf(value: double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest9400';
        console.info(`${caseName}, test start`);
        const result = Double.valueOf(Number.POSITIVE_INFINITY);
        expect(result.valueOf()).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest9500
     * @tc.name builtinsDoubleFourthPrototypebTest9500
     * @tc.desc test Double.valueOf(value: double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest9500';
        console.info(`${caseName}, test start`);
        const result = Double.valueOf(Number.NEGATIVE_INFINITY);
        expect(result.valueOf()).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFourthPrototypebTest9600
     * @tc.name builtinsDoubleFourthPrototypebTest9600
     * @tc.desc test Double.valueOf(value: double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFourthPrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFourthPrototypebTest9600';
        console.info(`${caseName}, test start`);
        const result = Double.valueOf(NaN);
        expect(Number.isNaN(result.valueOf())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}