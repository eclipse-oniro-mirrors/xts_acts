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
export default function builtinsDoubleFifthPrototypebTest() {
  describe('builtinsDoubleFifthPrototypebTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest0100
     * @tc.name builtinsDoubleFifthPrototypebTest0100
     * @tc.desc test sub(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const a = new Double(5.5);
        const b = new Double(2.2);
        const result = a.sub(b);
        expect(result.valueOf()).assertClose(3.3, 1e-9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest0200
     * @tc.name builtinsDoubleFifthPrototypebTest0200
     * @tc.desc test sub(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const a = new Double(-5.5);
        const b = new Double(-2.2);
        const result = a.sub(b);
        expect(result.valueOf()).assertClose(-3.3, 1e-9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest0300
     * @tc.name builtinsDoubleFifthPrototypebTest0300
     * @tc.desc test sub(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const a = new Double(5.5);
        const b = new Double(-2.2);
        const result = a.sub(b);
        expect(result.valueOf()).assertClose(7.7, 1e-9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest0400
     * @tc.name builtinsDoubleFifthPrototypebTest0400
     * @tc.desc test sub(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(2.2);
        const result = a.sub(b);
        expect(result.valueOf()).assertClose(-2.2, 1e-9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest0500
     * @tc.name builtinsDoubleFifthPrototypebTest0500
     * @tc.desc test sub(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const b = new Double(0.0);
        const result = a.sub(b);
        expect(result.valueOf()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest0600
     * @tc.name builtinsDoubleFifthPrototypebTest0600
     * @tc.desc test sub(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(1.0);
        const result = a.sub(b);
        expect(result.valueOf()).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest0700
     * @tc.name builtinsDoubleFifthPrototypebTest0700
     * @tc.desc test sub(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        const b = new Double(1.0);
        const result = a.sub(b);
        expect(result.valueOf()).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest0800
     * @tc.name builtinsDoubleFifthPrototypebTest0800
     * @tc.desc test sub(other: Double): Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const b = new Double(1.0);
        const result = a.sub(b);
        expect(Number.isNaN(result.valueOf())).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest0900
     * @tc.name builtinsDoubleFifthPrototypebTest0900
     * @tc.desc test toExponential(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        const result = a.toExponential();
        expect(result).assertEqual('1.23456e+2');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest1000
     * @tc.name builtinsDoubleFifthPrototypebTest1000
     * @tc.desc test toExponential(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const a = new Double(-123.456);
        const result = a.toExponential();
        expect(result).assertEqual('-1.23456e+2');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest1100
     * @tc.name builtinsDoubleFifthPrototypebTest1100
     * @tc.desc test toExponential(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const result = a.toExponential();
        expect(result).assertEqual('0e+0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest1200
     * @tc.name builtinsDoubleFifthPrototypebTest1200
     * @tc.desc test toExponential(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const a = new Double(Double.MAX_VALUE);
        const result = a.toExponential();
        expect(result).assertEqual('1.7976931348623157e+308');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest1300
     * @tc.name builtinsDoubleFifthPrototypebTest1300
     * @tc.desc test toExponential(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const a = new Double(Double.MIN_VALUE);
        const result = a.toExponential();
        expect(result).assertEqual('5e-324');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest1400
     * @tc.name builtinsDoubleFifthPrototypebTest1400
     * @tc.desc test toExponential(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const result = a.toExponential();
        expect(result).assertEqual('Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest1500
     * @tc.name builtinsDoubleFifthPrototypebTest1500
     * @tc.desc test toExponential(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        const result = a.toExponential();
        expect(result).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest1600
     * @tc.name builtinsDoubleFifthPrototypebTest1600
     * @tc.desc test toExponential(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const result = a.toExponential();
        expect(result).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest1700
     * @tc.name builtinsDoubleFifthPrototypebTest1700
     * @tc.desc test toFixed(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        const result = a.toFixed();
        expect(result).assertEqual('123');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest1800
     * @tc.name builtinsDoubleFifthPrototypebTest1800
     * @tc.desc test toFixed(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const a = new Double(123.5);
        const result = a.toFixed();
        expect(result).assertEqual('124');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest1900
     * @tc.name builtinsDoubleFifthPrototypebTest1900
     * @tc.desc test toFixed(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const a = new Double(-123.456);
        const result = a.toFixed();
        expect(result).assertEqual('-123');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest2000
     * @tc.name builtinsDoubleFifthPrototypebTest2000
     * @tc.desc test toFixed(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const a = new Double(-123.5);
        const result = a.toFixed();
        expect(result).assertEqual('-124');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest2100
     * @tc.name builtinsDoubleFifthPrototypebTest2100
     * @tc.desc test toFixed(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const result = a.toFixed();
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest2200
     * @tc.name builtinsDoubleFifthPrototypebTest2200
     * @tc.desc test toFixed(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const a = new Double(Double.MIN_VALUE);
        const result = a.toFixed();
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest2300
     * @tc.name builtinsDoubleFifthPrototypebTest2300
     * @tc.desc test toFixed(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const result = a.toFixed();
        expect(result).assertEqual('Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest2400
     * @tc.name builtinsDoubleFifthPrototypebTest2400
     * @tc.desc test toFixed(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const result = a.toFixed();
        expect(result).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest2500
     * @tc.name builtinsDoubleFifthPrototypebTest2500
     * @tc.desc test toLocaleString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const a = new Double(12345.678);
        const result = a.toLocaleString();
        expect(result).assertEqual('12,345.678');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest2600
     * @tc.name builtinsDoubleFifthPrototypebTest2600
     * @tc.desc test toLocaleString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const a = new Double(-12345.678);
        const result = a.toLocaleString();
        expect(result).assertEqual('-12,345.678');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest2700
     * @tc.name builtinsDoubleFifthPrototypebTest2700
     * @tc.desc test toLocaleString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const result = a.toLocaleString();
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest2800
     * @tc.name builtinsDoubleFifthPrototypebTest2800
     * @tc.desc test toLocaleString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const a = new Double(1000);
        const result = a.toLocaleString();
        expect(result).assertEqual('1,000');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest2900
     * @tc.name builtinsDoubleFifthPrototypebTest2900
     * @tc.desc test toLocaleString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const a = new Double(Double.MIN_VALUE);
        const result = a.toLocaleString();
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest3000
     * @tc.name builtinsDoubleFifthPrototypebTest3000
     * @tc.desc test toLocaleString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const result = a.toLocaleString();
        expect(result).assertEqual('∞');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest3100
     * @tc.name builtinsDoubleFifthPrototypebTest3100
     * @tc.desc test toLocaleString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        const result = a.toLocaleString();
        expect(result).assertEqual('-∞');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest3200
     * @tc.name builtinsDoubleFifthPrototypebTest3200
     * @tc.desc test toLocaleString(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const result = a.toLocaleString();
        expect(result).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsDoubleFifthPrototypebTest3300
     * @tc.name builtinsDoubleFifthPrototypebTest3300
     * @tc.desc test toPrecision(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        const result = a.toPrecision();
        expect(result).assertEqual('123.456');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest3400
     * @tc.name builtinsDoubleFifthPrototypebTest3400
     * @tc.desc test toPrecision(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const a = new Double(-123.456);
        const result = a.toPrecision();
        expect(result).assertEqual('-123.456');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest3500
     * @tc.name builtinsDoubleFifthPrototypebTest3500
     * @tc.desc test toPrecision(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const result = a.toPrecision();
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest3600
     * @tc.name builtinsDoubleFifthPrototypebTest3600
     * @tc.desc test toPrecision(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const a = new Double(Double.MAX_VALUE);
        const result = a.toPrecision();
        expect(result).assertEqual('1.7976931348623157e+308');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest3700
     * @tc.name builtinsDoubleFifthPrototypebTest3700
     * @tc.desc test toPrecision(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const a = new Double(Double.MIN_VALUE);
        const result = a.toPrecision();
        expect(result).assertEqual('5e-324');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest3800
     * @tc.name builtinsDoubleFifthPrototypebTest3800
     * @tc.desc test toPrecision(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const result = a.toPrecision();
        expect(result).assertEqual('Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest3900
     * @tc.name builtinsDoubleFifthPrototypebTest3900
     * @tc.desc test toPrecision(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        const result = a.toPrecision();
        expect(result).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest4000
     * @tc.name builtinsDoubleFifthPrototypebTest4000
     * @tc.desc test toPrecision(): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const result = a.toPrecision();
        expect(result).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest4100
     * @tc.name builtinsDoubleFifthPrototypebTest4100
     * @tc.desc test toString(d: Number): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const a = new Double(255);
        const result = a.toString(16);
        expect(result).assertEqual('ff');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest4200
     * @tc.name builtinsDoubleFifthPrototypebTest4200
     * @tc.desc test toString(d: Number): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const a = new Double(-255);
        const result = a.toString(16);
        expect(result).assertEqual('-ff');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest4300
     * @tc.name builtinsDoubleFifthPrototypebTest4300
     * @tc.desc test toString(d: Number): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const a = new Double(0);
        const result = a.toString(2);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest4400
     * @tc.name builtinsDoubleFifthPrototypebTest4400
     * @tc.desc test toString(d: Number): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const a = new Double(100);
        const result = a.toString(2);
        expect(result).assertEqual('1100100');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest4500
     * @tc.name builtinsDoubleFifthPrototypebTest4500
     * @tc.desc test toString(d: Number): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const a = new Double(100);
        const result = a.toString(8);
        expect(result).assertEqual('144');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest4600
     * @tc.name builtinsDoubleFifthPrototypebTest4600
     * @tc.desc test toString(d: Number): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const a = new Double(123456789);
        const result = a.toString(36);
        expect(result).assertEqual('21i3v9');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest4700
     * @tc.name builtinsDoubleFifthPrototypebTest4700
     * @tc.desc test toString(d: Number): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const result = a.toString(16);
        expect(result).assertEqual('Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest4800
     * @tc.name builtinsDoubleFifthPrototypebTest4800
     * @tc.desc test toString(d: Number): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const result = a.toString(16);
        expect(result).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest4900
     * @tc.name builtinsDoubleFifthPrototypebTest4900
     * @tc.desc test toString(r: int): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const a = new Double(255);
        const result = a.toString(16);
        expect(result).assertEqual('ff');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest5000
     * @tc.name builtinsDoubleFifthPrototypebTest5000
     * @tc.desc test toString(r: int): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const a = new Double(-255);
        const result = a.toString(16);
        expect(result).assertEqual('-ff');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest5100
     * @tc.name builtinsDoubleFifthPrototypebTest5100
     * @tc.desc test toString(r: int): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const a = new Double(0);
        const result = a.toString(2);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest5200
     * @tc.name builtinsDoubleFifthPrototypebTest5200
     * @tc.desc test toString(r: int): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const a = new Double(100);
        const result = a.toString(2);
        expect(result).assertEqual('1100100');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest5300
     * @tc.name builtinsDoubleFifthPrototypebTest5300
     * @tc.desc test toString(r: int): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const a = new Double(100);
        const result = a.toString(8);
        expect(result).assertEqual('144');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest5400
     * @tc.name builtinsDoubleFifthPrototypebTest5400
     * @tc.desc test toString(r: int): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const a = new Double(123456789);
        const result = a.toString(36);
        expect(result).assertEqual('21i3v9');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest5500
     * @tc.name builtinsDoubleFifthPrototypebTest5500
     * @tc.desc test toString(r: int): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const result = a.toString(16);
        expect(result).assertEqual('Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest5600
     * @tc.name builtinsDoubleFifthPrototypebTest5600
     * @tc.desc test toString(r: int): String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const result = a.toString(16);
        expect(result).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest6500
     * @tc.name builtinsDoubleFifthPrototypebTest6500
     * @tc.desc test valueOf(): number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest6500';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        const result = a.valueOf();
        expect(result).assertEqual(123.456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest6600
     * @tc.name builtinsDoubleFifthPrototypebTest6600
     * @tc.desc test valueOf(): number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest6600';
        console.info(`${caseName}, test start`);
        const a = new Double(-123.456);
        const result = a.valueOf();
        expect(result).assertEqual(-123.456);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest6700
     * @tc.name builtinsDoubleFifthPrototypebTest6700
     * @tc.desc test valueOf(): number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest6700';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        const result = a.valueOf();
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest6800
     * @tc.name builtinsDoubleFifthPrototypebTest6800
     * @tc.desc test valueOf(): number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest6800';
        console.info(`${caseName}, test start`);
        const a = new Double(Double.MAX_VALUE);
        const result = a.valueOf();
        expect(result).assertEqual(Double.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest6900
     * @tc.name builtinsDoubleFifthPrototypebTest6900
     * @tc.desc test valueOf(): number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest6900';
        console.info(`${caseName}, test start`);
        const a = new Double(Double.MIN_VALUE);
        const result = a.valueOf();
        expect(result).assertEqual(Double.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest7000
     * @tc.name builtinsDoubleFifthPrototypebTest7000
     * @tc.desc test valueOf(): number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest7000';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const result = a.valueOf();
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest7100
     * @tc.name builtinsDoubleFifthPrototypebTest7100
     * @tc.desc test valueOf(): number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest7100';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.NEGATIVE_INFINITY);
        const result = a.valueOf();
        expect(result).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsDoubleFifthPrototypebTest7200
     * @tc.name builtinsDoubleFifthPrototypebTest7200
     * @tc.desc test valueOf(): number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleFifthPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleFifthPrototypebTest7200';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        const result = a.valueOf();
        expect(Number.isNaN(result)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}