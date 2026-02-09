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
export default function builtinsDoublePrototypebTest() {
  describe('builtinsDoublePrototypebTest', ():void => {
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
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_0100
     * @tc.name builtinsDoublePrototypebTest0100
     * @tc.desc test add(other: Double): Double (adding positive numbers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest0100';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        const b = new Double(654.321);
        const result = a.add(b);
        expect(result instanceof Double).assertEqual(true);
        expect(result.valueOf()).assertEqual(123.456 + 654.321);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_0200
     * @tc.name builtinsDoublePrototypebTest0200
     * @tc.desc test add(other: Double): Double (adding negative numbers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest0200';
        console.info(`${caseName}, test start`);
        const a = new Double(-123.456);
        const b = new Double(-654.321);
        const result = a.add(b);
        expect(result instanceof Double).assertEqual(true);
        expect(result.valueOf()).assertEqual(-123.456 + -654.321);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_0300
     * @tc.name builtinsDoublePrototypebTest0300
     * @tc.desc test add(other: Double): Double (adding positive and negative numbers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest0300';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        const b = new Double(-654.321);
        const result = a.add(b);
        expect(result instanceof Double).assertEqual(true);
        expect(result.valueOf()).assertEqual(123.456 + -654.321);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_0400
     * @tc.name builtinsDoublePrototypebTest0400
     * @tc.desc test add(other: Double): Double (adding zeros)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest0400';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(0.0);
        const result = a.add(b);
        expect(result instanceof Double).assertEqual(true);
        expect(result.valueOf()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_0500
     * @tc.name builtinsDoublePrototypebTest0500
     * @tc.desc test add(other: Double): Double (adding NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest0500';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const b = new Double(123.456);
        const result = a.add(b);
        expect(result instanceof Double).assertEqual(true);
        expect(Number.isNaN(result.valueOf())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_0600
     * @tc.name builtinsDoublePrototypebTest0600
     * @tc.desc test add(other: Double): Double (adding Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest0600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(1.0);
        const result = a.add(b);
        expect(result instanceof Double).assertEqual(true);
        expect(result.valueOf()).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_0700
     * @tc.name builtinsDoublePrototypebTest0700
     * @tc.desc test add(other: Double): Double (adding negative infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest0700';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        const b = new Double(-1.0);
        const result = a.add(b);
        expect(result instanceof Double).assertEqual(true);
        expect(result.valueOf()).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_0800
     * @tc.name builtinsDoublePrototypebTest0800
     * @tc.desc test add(other: Double): Double (adding MAX_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest0800';
        console.info(`${caseName}, test start`);
        const a = new Double(Double.MAX_VALUE);
        const b = new Double(1.0);
        const result = a.add(b);
        expect(result instanceof Double).assertEqual(true);
        expect(result.valueOf()).assertEqual(Double.MAX_VALUE + 1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_0900
     * @tc.name builtinsDoublePrototypebTest0900
     * @tc.desc test constructor(): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest0900';
        console.info(`${caseName}, test start`);
        const a = new Double();
        expect(a.valueOf()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_1000
     * @tc.name builtinsDoublePrototypebTest1000
     * @tc.desc test constructor(): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest1000';
        console.info(`${caseName}, test start`);
        const a = new Double();
        expect(a.valueOf()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_1100
     * @tc.name builtinsDoublePrototypebTest1100
     * @tc.desc test constructor(): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest1100';
        console.info(`${caseName}, test start`);
        const a = new Double();
        const b = new Double();
        expect(a.valueOf()).assertEqual(b.valueOf());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_1200
     * @tc.name builtinsDoublePrototypebTest1200
     * @tc.desc test constructor(): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest1200';
        console.info(`${caseName}, test start`);
        const a = new Double();
        expect(typeof a.valueOf()).assertEqual('number');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_1300
     * @tc.name builtinsDoublePrototypebTest1300
     * @tc.desc test constructor(): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest1300';
        console.info(`${caseName}, test start`);
        const a = new Double();
        expect(a.toString()).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_1400
     * @tc.name builtinsDoublePrototypebTest1400
     * @tc.desc test constructor(): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest1400';
        console.info(`${caseName}, test start`);
        const a = new Double();
        let b = a.valueOf();
        b++;
        expect(b).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_1500
     * @tc.name builtinsDoublePrototypebTest1500
     * @tc.desc test constructor(): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest1500';
        console.info(`${caseName}, test start`);
        const a = new Double();
        let b = a.valueOf();
        b--;
        expect(b).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_1600
     * @tc.name builtinsDoublePrototypebTest1600
     * @tc.desc test constructor(): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest1600';
        console.info(`${caseName}, test start`);
        const a = new Double();
        expect(isFinite(a.valueOf())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_1700
     * @tc.name builtinsDoublePrototypebTest1700
     * @tc.desc test new Double(value: BigInt)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest1700';
        console.info(`${caseName}, test start`);
        const a = new Double(BigInt(10));
        expect(a.valueOf()).assertEqual(10.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_1800
     * @tc.name builtinsDoublePrototypebTest1800
     * @tc.desc test new Double(value: BigInt)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest1800';
        console.info(`${caseName}, test start`);
        const a = new Double(BigInt(-10));
        expect(a.valueOf()).assertEqual(-10.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_1900
     * @tc.name builtinsDoublePrototypebTest1900
     * @tc.desc test new Double(value: BigInt)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest1900';
        console.info(`${caseName}, test start`);
        const a = new Double(BigInt(0));
        expect(a.valueOf()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_2000
     * @tc.name builtinsDoublePrototypebTest2000
     * @tc.desc test new Double(value: BigInt)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest2000';
        console.info(`${caseName}, test start`);
        const a = new Double(BigInt('9007199254740991'));
        expect(a.valueOf()).assertEqual(9007199254740991.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_2100
     * @tc.name builtinsDoublePrototypebTest2100
     * @tc.desc test new Double(value: BigInt)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest2100';
        console.info(`${caseName}, test start`);
        const a = new Double(BigInt('-9007199254740991'));
        expect(a.valueOf()).assertEqual(-9007199254740991.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_2200
     * @tc.name builtinsDoublePrototypebTest2200
     * @tc.desc test new Double(value: BigInt)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest2200';
        console.info(`${caseName}, test start`);
        const a = new Double(BigInt('9007199254740993'));
        expect(a.valueOf()).assertEqual(9007199254740992.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_2300
     * @tc.name builtinsDoublePrototypebTest2300
     * @tc.desc test new Double(value: BigInt)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest2300';
        console.info(`${caseName}, test start`);
        const a = new Double(new Double(BigInt(10)));
        expect(a.valueOf()).assertEqual(10.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_2400
     * @tc.name builtinsDoublePrototypebTest2400
     * @tc.desc test new Double(value: BigInt)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest2400';
        console.info(`${caseName}, test start`);
        const a = new Double(new Double(BigInt(0)));
        expect(a.valueOf()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_2500
     * @tc.name builtinsDoublePrototypebTest2500
     * @tc.desc test new Double(value: double)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest2500';
        console.info(`${caseName}, test start`);
        const a = new Double(10.5);
        expect(a.valueOf()).assertEqual(10.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_2600
     * @tc.name builtinsDoublePrototypebTest2600
     * @tc.desc test new Double(value: double)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest2600';
        console.info(`${caseName}, test start`);
        const a = new Double(-10.5);
        expect(a.valueOf()).assertEqual(-10.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_2700
     * @tc.name builtinsDoublePrototypebTest2700
     * @tc.desc test new Double(value: double)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest2700';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.valueOf()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_2800
     * @tc.name builtinsDoublePrototypebTest2800
     * @tc.desc test new Double(value: double)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest2800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        expect(a.valueOf()).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_2900
     * @tc.name builtinsDoublePrototypebTest2900
     * @tc.desc test new Double(value: double)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest2900';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        expect(a.valueOf()).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_3000
     * @tc.name builtinsDoublePrototypebTest3000
     * @tc.desc test new Double(value: double)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest3000';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(Number.isNaN(a.valueOf())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_3100
     * @tc.name builtinsDoublePrototypebTest3100
     * @tc.desc test new Double(value: double)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest3100';
        console.info(`${caseName}, test start`);
        const a = new Double(new Double(10.5));
        expect(a.valueOf()).assertEqual(10.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_3200
     * @tc.name builtinsDoublePrototypebTest3200
     * @tc.desc test new Double(value: double)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest3200';
        console.info(`${caseName}, test start`);
        const a = new Double(new Double(0));
        expect(a.valueOf()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_3300
     * @tc.name builtinsDoublePrototypebTest3300
     * @tc.desc test new Double(value: String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest3300';
        console.info(`${caseName}, test start`);
        const a = new Double('10.5');
        expect(a.valueOf()).assertEqual(10.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_3400
     * @tc.name builtinsDoublePrototypebTest3400
     * @tc.desc test new Double(value: String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest3400';
        console.info(`${caseName}, test start`);
        const a = new Double('-10.5');
        expect(a.valueOf()).assertEqual(-10.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_3500
     * @tc.name builtinsDoublePrototypebTest3500
     * @tc.desc test new Double(value: String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest3500';
        console.info(`${caseName}, test start`);
        const a = new Double('0.0');
        expect(a.valueOf()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_3600
     * @tc.name builtinsDoublePrototypebTest3600
     * @tc.desc test new Double(value: String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest3600';
        console.info(`${caseName}, test start`);
        const a = new Double('Infinity');
        expect(a.valueOf()).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_3700
     * @tc.name builtinsDoublePrototypebTest3700
     * @tc.desc test new Double(value: String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest3700';
        console.info(`${caseName}, test start`);
        const a = new Double('-Infinity');
        expect(a.valueOf()).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_3800
     * @tc.name builtinsDoublePrototypebTest3800
     * @tc.desc test new Double(value: String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest3800';
        console.info(`${caseName}, test start`);
        const a = new Double('NaN');
        expect(Number.isNaN(a.valueOf())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_3900
     * @tc.name builtinsDoublePrototypebTest3900
     * @tc.desc test new Double(value: String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest3900';
        console.info(`${caseName}, test start`);
        const a = new Double('1.23e2');
        expect(a.valueOf()).assertEqual(123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_4000
     * @tc.name builtinsDoublePrototypebTest4000
     * @tc.desc test new Double(value: String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest4000';
        console.info(`${caseName}, test start`);
        const a = new Double('abc');
        expect(Number.isNaN(a.valueOf())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_4100
     * @tc.name builtinsDoublePrototypebTest4100
     * @tc.desc test createFromJSONValue(json: JSONValue): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest4100';
        console.info(`${caseName}, test start`);
        const doubleInstance = new Double(0);
        const json: JSONNumber = {
          value: 123
        };
        const a = doubleInstance.createFromJSONValue(json);
        expect(a).assertEqual(123.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_4200
     * @tc.name builtinsDoublePrototypebTest4200
     * @tc.desc test createFromJSONValue(json: JSONValue): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest4200';
        console.info(`${caseName}, test start`);
        const doubleInstance = new Double(0);
        const json: JSONNumber = {
          value: -123.45
        };
        const a = doubleInstance.createFromJSONValue(json);
        const diff = Math.abs(a.toDouble() + 123.45);
        expect(diff < 1e-6).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_4300
     * @tc.name builtinsDoublePrototypebTest4300
     * @tc.desc test createFromJSONValue(json: JSONValue): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest4300';
        console.info(`${caseName}, test start`);
        const doubleInstance = new Double(0);
        const json: JSONNumber = {
          value: 0
        };
        const a = doubleInstance.createFromJSONValue(json);
        expect(a.valueOf()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_4400
     * @tc.name builtinsDoublePrototypebTest4400
     * @tc.desc test createFromJSONValue(json: JSONValue): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest4400';
        console.info(`${caseName}, test start`);
        const doubleInstance = new Double(0);
        const json: JSONNumber = {
          value: 123.45
        };
        const a = doubleInstance.createFromJSONValue(json);
        const diff = Math.abs(a.toDouble() -123.45);
        expect(diff < 1e-6).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_4500
     * @tc.name builtinsDoublePrototypebTest4500
     * @tc.desc test createFromJSONValue(json: JSONValue): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest4500';
        console.info(`${caseName}, test start`);
        const doubleInstance = new Double(0);
        const json: JSONNumber = {
          value: 1.23e4
        };
        const a = doubleInstance.createFromJSONValue(json);
        expect(a.valueOf()).assertEqual(12300);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_4600
     * @tc.name builtinsDoublePrototypebTest4600
     * @tc.desc test createFromJSONValue(json: JSONValue): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest4600';
        console.info(`${caseName}, test start`);
        const doubleInstance = new Double(0);
        const jsonNumber: JSONNumber = { value: Double.MAX_VALUE };
        const result = doubleInstance.createFromJSONValue(jsonNumber);
        expect(result).assertEqual(Double.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_4700
     * @tc.name builtinsDoublePrototypebTest4700
     * @tc.desc test createFromJSONValue(json: JSONValue): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest4700';
        console.info(`${caseName}, test start`);
        const doubleInstance = new Double(0);
        const jsonNumber: JSONNumber = { value: Double.MIN_VALUE };
        const result = doubleInstance.createFromJSONValue(jsonNumber);
        expect(result).assertEqual(Double.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_4800
     * @tc.name builtinsDoublePrototypebTest4800
     * @tc.desc test createFromJSONValue(json: JSONValue): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest4800';
        console.info(`${caseName}, test start`);
        const doubleInstance = new Double(0);
        const jsonNumber: JSONNumber = { value: 11.0 };
        const result = doubleInstance.createFromJSONValue(jsonNumber);
        expect(result).assertEqual(11);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_4900
     * @tc.name builtinsDoublePrototypebTest4900
     * @tc.desc test div(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest4900';
        console.info(`${caseName}, test start`);
        const a = new Double(10.0);
        const b = new Double(2.0);
        const result = a.div(b);
        expect(result.valueOf()).assertEqual(5.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_5000
     * @tc.name builtinsDoublePrototypebTest5000
     * @tc.desc test div(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest5000';
        console.info(`${caseName}, test start`);
        const a = new Double(-10.0);
        const b = new Double(2.0);
        const result = a.div(b);
        expect(result.valueOf()).assertEqual(-5.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_5100
     * @tc.name builtinsDoublePrototypebTest5100
     * @tc.desc test div(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest5100';
        console.info(`${caseName}, test start`);
        const a = new Double(10.0);
        const b = new Double(0.0);
        const result = a.div(b);
        expect(result.valueOf()).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_5200
     * @tc.name builtinsDoublePrototypebTest5200
     * @tc.desc test div(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest5200';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(10.0);
        const result = a.div(b);
        expect(result.valueOf()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_5300
     * @tc.name builtinsDoublePrototypebTest5300
     * @tc.desc test div(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest5300';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(10.0);
        const result = a.div(b);
        expect(result.valueOf()).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_5400
     * @tc.name builtinsDoublePrototypebTest5400
     * @tc.desc test div(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest5400';
        console.info(`${caseName}, test start`);
        const a = new Double(10.0);
        const b = new Double(Number.POSITIVE_INFINITY);
        const result = a.div(b);
        expect(result.valueOf()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_5500
     * @tc.name builtinsDoublePrototypebTest5500
     * @tc.desc test div(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest5500';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.POSITIVE_INFINITY);
        const result = a.div(b);
        expect(Number.isNaN(result.valueOf())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_5600
     * @tc.name builtinsDoublePrototypebTest5600
     * @tc.desc test div(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest5600';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const b = new Double(10.0);
        const result = a.div(b);
        expect(Number.isNaN(result.valueOf())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_5700
     * @tc.name builtinsDoublePrototypebTest5700
     * @tc.desc test equals: self compare
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest5700';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.equals(a)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_5800
     * @tc.name builtinsDoublePrototypebTest5800
     * @tc.desc test equals: two Double with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest5800';
        console.info(`${caseName}, test start`);
        const a = new Double(789.01);
        const b = new Double(789.01);
        expect(a.equals(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_5900
     * @tc.name builtinsDoublePrototypebTest5900
     * @tc.desc test equals: two Double with different value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest5900';
        console.info(`${caseName}, test start`);
        const a = new Double(1.1);
        const b = new Double(2.2);
        expect(a.equals(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_6000
     * @tc.name builtinsDoublePrototypebTest6000
     * @tc.desc test equals: compare with non-Double type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest6000';
        console.info(`${caseName}, test start`);
        const a = new Double(5.5);
        const b = 5.5;
        expect(a.equals(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_6100
     * @tc.name builtinsDoublePrototypebTest6100
     * @tc.desc test equals: compare with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest6100';
        console.info(`${caseName}, test start`);
        const a = new Double(0);
        expect(a.equals(null)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_6200
     * @tc.name builtinsDoublePrototypebTest6200
     * @tc.desc test equals: compare with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest6200';
        console.info(`${caseName}, test start`);
        const a = new Double(0);
        expect(a.equals(undefined)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_6300
     * @tc.name builtinsDoublePrototypebTest6300
     * @tc.desc test equals: NaN compare with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest6300';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.equals(a)).assertEqual(false);
        const b = new Double(NaN);
        expect(a.equals(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_6400
     * @tc.name builtinsDoublePrototypebTest6400
     * @tc.desc test equals: Infinity compare with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest6400';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.POSITIVE_INFINITY);
        expect(a.equals(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_6500
     * @tc.name builtinsDoublePrototypebTest6500
     * @tc.desc test isFinite(): boolean (positive number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest6500';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.isFinite()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_6600
     * @tc.name builtinsDoublePrototypebTest6600
     * @tc.desc test isFinite(): boolean (negative number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest6600';
        console.info(`${caseName}, test start`);
        const a = new Double(-789.123);
        expect(a.isFinite()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_6700
     * @tc.name builtinsDoublePrototypebTest6700
     * @tc.desc test isFinite(): boolean (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest6700';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.isFinite()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_6800
     * @tc.name builtinsDoublePrototypebTest6800
     * @tc.desc test isFinite(): boolean (negative zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest6800';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.isFinite()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_6900
     * @tc.name builtinsDoublePrototypebTest6900
     * @tc.desc test isFinite(): boolean (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest6900';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.isFinite()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_7000
     * @tc.name builtinsDoublePrototypebTest7000
     * @tc.desc test isFinite(): boolean (positive infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest7000';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        expect(a.isFinite()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_7100
     * @tc.name builtinsDoublePrototypebTest7100
     * @tc.desc test isFinite(): boolean (negative infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest7100';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        expect(a.isFinite()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_7200
     * @tc.name builtinsDoublePrototypebTest7200
     * @tc.desc test isFinite(): boolean (max/min value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest7200';
        console.info(`${caseName}, test start`);
        const a = new Double(Double.MAX_VALUE);
        const b = new Double(Double.MIN_VALUE);
        expect(a.isFinite()).assertEqual(true);
        expect(b.isFinite()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_7300
     * @tc.name builtinsDoublePrototypebTest7300
     * @tc.desc test isGreaterEqualThan(): a > b (positive greater than negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest7300';
        console.info(`${caseName}, test start`);
        const a = new Double(10.5);
        const b = new Double(-5.2);
        expect(a.isGreaterEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_7400
     * @tc.name builtinsDoublePrototypebTest7400
     * @tc.desc test isGreaterEqualThan(): a == b (equal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest7400';
        console.info(`${caseName}, test start`);
        const a = new Double(3.14);
        const b = new Double(3.14);
        expect(a.isGreaterEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_7500
     * @tc.name builtinsDoublePrototypebTest7500
     * @tc.desc test isGreaterEqualThan(): a < b (negative less than positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest7500';
        console.info(`${caseName}, test start`);
        const a = new Double(-2.7);
        const b = new Double(0.0);
        expect(a.isGreaterEqualThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_7600
     * @tc.name builtinsDoublePrototypebTest7600
     * @tc.desc test isGreaterEqualThan(): 0 >= -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest7600';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(-0.0);
        expect(a.isGreaterEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_7700
     * @tc.name builtinsDoublePrototypebTest7700
     * @tc.desc test isGreaterEqualThan(): NaN comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest7700';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const b = new Double(1.0);
        expect(a.isGreaterEqualThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_7800
     * @tc.name builtinsDoublePrototypebTest7800
     * @tc.desc test isGreaterEqualThan(): Infinity comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest7800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(999999);
        expect(a.isGreaterEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_7900
     * @tc.name builtinsDoublePrototypebTest7900
     * @tc.desc test isGreaterEqualThan(): negative Infinity comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest7900';
        console.info(`${caseName}, test start`);
        const a = new Double(-999999);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.isGreaterEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_8000
     * @tc.name builtinsDoublePrototypebTest8000
     * @tc.desc test isGreaterEqualThan(): max/min values comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest8000';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        const b = new Double(Number.MIN_VALUE);
        expect(a.isGreaterEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_8100
     * @tc.name builtinsDoublePrototypebTest8100
     * @tc.desc test isGreaterThan(): a > b (positive greater than negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest8100';
        console.info(`${caseName}, test start`);
        const a = new Double(10.5);
        const b = new Double(-5.2);
        expect(a.isGreaterThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_8200
     * @tc.name builtinsDoublePrototypebTest8200
     * @tc.desc test isGreaterThan(): a == b (equal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest8200';
        console.info(`${caseName}, test start`);
        const a = new Double(3.14);
        const b = new Double(3.14);
        expect(a.isGreaterThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_8300
     * @tc.name builtinsDoublePrototypebTest8300
     * @tc.desc test isGreaterThan(): a < b (negative less than positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest8300';
        console.info(`${caseName}, test start`);
        const a = new Double(-2.7);
        const b = new Double(0.0);
        expect(a.isGreaterThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_8400
     * @tc.name builtinsDoublePrototypebTest8400
     * @tc.desc test isGreaterThan(): 0 > -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest8400';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(-0.0);
        expect(a.isGreaterThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_8500
     * @tc.name builtinsDoublePrototypebTest8500
     * @tc.desc test isGreaterThan(): NaN comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest8500';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const b = new Double(1.0);
        expect(a.isGreaterThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_8600
     * @tc.name builtinsDoublePrototypebTest8600
     * @tc.desc test isGreaterThan(): Infinity comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest8600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(999999);
        expect(a.isGreaterThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_8700
     * @tc.name builtinsDoublePrototypebTest8700
     * @tc.desc test isGreaterThan(): negative Infinity comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest8700';
        console.info(`${caseName}, test start`);
        const a = new Double(-999999);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.isGreaterThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_8800
     * @tc.name builtinsDoublePrototypebTest8800
     * @tc.desc test isGreaterThan(): max/min values comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest8800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        const b = new Double(Number.MIN_VALUE);
        expect(a.isGreaterThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_8900
     * @tc.name builtinsDoublePrototypebTest8900
     * @tc.desc test isInteger(): positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest8900';
        console.info(`${caseName}, test start`);
        const a = new Double(123.0);
        expect(a.isInteger()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_9000
     * @tc.name builtinsDoublePrototypebTest9000
     * @tc.desc test isInteger(): negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest9000';
        console.info(`${caseName}, test start`);
        const a = new Double(-456.0);
        expect(a.isInteger()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_9100
     * @tc.name builtinsDoublePrototypebTest9100
     * @tc.desc test isInteger(): positive decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest9100';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.isInteger()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_9200
     * @tc.name builtinsDoublePrototypebTest9200
     * @tc.desc test isInteger(): negative decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest9200';
        console.info(`${caseName}, test start`);
        const a = new Double(-789.123);
        expect(a.isInteger()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_9300
     * @tc.name builtinsDoublePrototypebTest9300
     * @tc.desc test isInteger(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest9300';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.isInteger()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_9400
     * @tc.name builtinsDoublePrototypebTest9400
     * @tc.desc test isInteger(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest9400';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.isInteger()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_9500
     * @tc.name builtinsDoublePrototypebTest9500
     * @tc.desc test isInteger(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest9500';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.isInteger()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_PROTOTYPEB_TEST_9600
     * @tc.name builtinsDoublePrototypebTest9600
     * @tc.desc test isInteger(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoublePrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoublePrototypebTest9600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.isInteger()).assertEqual(false);
        expect(b.isInteger()).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}