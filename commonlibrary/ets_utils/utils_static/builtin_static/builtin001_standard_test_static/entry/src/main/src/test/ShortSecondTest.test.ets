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
export default function builtinsShortSecondPrototypebTest() {
  describe('builtinsShortSecondPrototypebTest', (): void => {
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
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_0100
     * @tc.name builtinsShortSecondPrototypebTest0100
     * @tc.desc test toByte(): byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest0100'
        console.info(`${caseName}, test start`);
        const num = new Short(0);
        expect(num.toByte()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_0200
     * @tc.name builtinsShortSecondPrototypebTest0200
     * @tc.desc test toByte(): byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest0200'
        console.info(`${caseName}, test start`);
        const num = new Short(42);
        expect(num.toByte()).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_0300
     * @tc.name builtinsShortSecondPrototypebTest0300
     * @tc.desc test toByte(): byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest0300'
        console.info(`${caseName}, test start`);
        const num = new Short(-42);
        expect(num.toByte()).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_0400
     * @tc.name builtinsShortSecondPrototypebTest0400
     * @tc.desc test toByte(): byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest0400'
        console.info(`${caseName}, test start`);
        const num = new Short(127);
        expect(num.toByte()).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_0500
     * @tc.name builtinsShortSecondPrototypebTest0500
     * @tc.desc test toByte(): byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest0500'
        console.info(`${caseName}, test start`);
        const num = new Short(-128);
        expect(num.toByte()).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_0600
     * @tc.name builtinsShortSecondPrototypebTest0600
     * @tc.desc test toByte(): byte return value (overflow > 127)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest0600'
        console.info(`${caseName}, test start`);
        const num = new Short(128);
        expect(num.toByte()).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_0700
     * @tc.name builtinsShortSecondPrototypebTest0700
     * @tc.desc test toByte(): byte return value (overflow < -128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest0700'
        console.info(`${caseName}, test start`);
        const num = new Short(-129);
        expect(num.toByte()).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_0800
     * @tc.name builtinsShortSecondPrototypebTest0800
     * @tc.desc test toByte(): byte return value (large positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest0800'
        console.info(`${caseName}, test start`);
        const num = new Short(255);
        expect(num.toByte()).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_0900
     * @tc.name builtinsShortSecondPrototypebTest0900
     * @tc.desc test compareTo(other: Short): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest0900'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(100);
        expect(a.compareTo(b)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_1000
     * @tc.name builtinsShortSecondPrototypebTest1000
     * @tc.desc test compareTo(other: Short): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest1000'
        console.info(`${caseName}, test start`);
        const a = new Short(50);
        const b = new Short(100);
        expect(a.compareTo(b)).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_1100
     * @tc.name builtinsShortSecondPrototypebTest1100
     * @tc.desc test compareTo(other: Short): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest1100'
        console.info(`${caseName}, test start`);
        const a = new Short(200);
        const b = new Short(100);
        expect(a.compareTo(b)).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_1200
     * @tc.name builtinsShortSecondPrototypebTest1200
     * @tc.desc test compareTo(other: Short): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest1200'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MIN_VALUE);
        const b = new Short(100);
        expect(a.compareTo(b)).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_1300
     * @tc.name builtinsShortSecondPrototypebTest1300
     * @tc.desc test compareTo(other: Short): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest1300'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MAX_VALUE);
        const b = new Short(-100);
        expect(a.compareTo(b)).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_1400
     * @tc.name builtinsShortSecondPrototypebTest1400
     * @tc.desc test compareTo(other: Short): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest1400'
        console.info(`${caseName}, test start`);
        const a = new Short(0);
        const b = new Short(0);
        expect(a.compareTo(b)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_1500
     * @tc.name builtinsShortSecondPrototypebTest1500
     * @tc.desc test compareTo(other: Short): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest1500'
        console.info(`${caseName}, test start`);
        const a = new Short(-100);
        const b = new Short(50);
        expect(a.compareTo(b)).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_1600
     * @tc.name builtinsShortSecondPrototypebTest1600
     * @tc.desc test compareTo(other: Short): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest1600'
        console.info(`${caseName}, test start`);
        const a = new Short(50);
        const b = new Short(-100);
        expect(a.compareTo(b)).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_1700
     * @tc.name builtinsShortSecondPrototypebTest1700
     * @tc.desc test toDouble(): double return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest1700'
        console.info(`${caseName}, test start`);
        const num = new Short(0);
        expect(num.toDouble()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_1800
     * @tc.name builtinsShortSecondPrototypebTest1800
     * @tc.desc test toDouble(): double return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest1800'
        console.info(`${caseName}, test start`);
        const num = new Short(42);
        expect(num.toDouble()).assertEqual(42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_1900
     * @tc.name builtinsShortSecondPrototypebTest1900
     * @tc.desc test toDouble(): double return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest1900'
        console.info(`${caseName}, test start`);
        const num = new Short(-42);
        expect(num.toDouble()).assertEqual(-42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_2000
     * @tc.name builtinsShortSecondPrototypebTest2000
     * @tc.desc test toDouble(): double return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest2000'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MAX_VALUE);
        expect(num.toDouble()).assertEqual(Short.MAX_VALUE * 1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_2100
     * @tc.name builtinsShortSecondPrototypebTest2100
     * @tc.desc test toDouble(): double return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest2100'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MIN_VALUE);
        expect(num.toDouble()).assertEqual(Short.MIN_VALUE * 1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_2200
     * @tc.name builtinsShortSecondPrototypebTest2200
     * @tc.desc test toDouble(): double return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest2200'
        console.info(`${caseName}, test start`);
        const num = new Short(1);
        expect(num.toDouble()).assertEqual(1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_2300
     * @tc.name builtinsShortSecondPrototypebTest2300
     * @tc.desc test toDouble(): double return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest2300'
        console.info(`${caseName}, test start`);
        const num = new Short(-1);
        expect(num.toDouble()).assertEqual(-1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_2400
     * @tc.name builtinsShortSecondPrototypebTest2400
     * @tc.desc test toDouble(): double return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest2400'
        console.info(`${caseName}, test start`);
        const num = new Short(12345);
        expect(num.toDouble()).assertEqual(12345.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_2500
     * @tc.name builtinsShortSecondPrototypebTest2500
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest2500'
        console.info(`${caseName}, test start`);
        const num = new Short(0);
        expect(num.toFloat()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_2600
     * @tc.name builtinsShortSecondPrototypebTest2600
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest2600'
        console.info(`${caseName}, test start`);
        const num = new Short(42);
        expect(num.toFloat()).assertEqual(42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_2700
     * @tc.name builtinsShortSecondPrototypebTest2700
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest2700'
        console.info(`${caseName}, test start`);
        const num = new Short(-42);
        expect(num.toFloat()).assertEqual(-42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_2800
     * @tc.name builtinsShortSecondPrototypebTest2800
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest2800'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MAX_VALUE);
        expect(num.toFloat()).assertEqual(Short.MAX_VALUE * 1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_2900
     * @tc.name builtinsShortSecondPrototypebTest2900
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest2900'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MIN_VALUE);
        expect(num.toFloat()).assertEqual(Short.MIN_VALUE * 1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_3000
     * @tc.name builtinsShortSecondPrototypebTest3000
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest3000'
        console.info(`${caseName}, test start`);
        const num = new Short(1);
        expect(num.toFloat()).assertEqual(1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_3100
     * @tc.name builtinsShortSecondPrototypebTest3100
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest3100'
        console.info(`${caseName}, test start`);
        const num = new Short(-1);
        expect(num.toFloat()).assertEqual(-1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_3200
     * @tc.name builtinsShortSecondPrototypebTest3200
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest3200'
        console.info(`${caseName}, test start`);
        const num = new Short(12345);
        expect(num.toFloat()).assertEqual(12345.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_3300
     * @tc.name builtinsShortSecondPrototypebTest3300
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest3300'
        console.info(`${caseName}, test start`);
        const num = new Short(0);
        expect(num.toInt()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_3400
     * @tc.name builtinsShortSecondPrototypebTest3400
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest3400'
        console.info(`${caseName}, test start`);
        const num = new Short(42);
        expect(num.toInt()).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_3500
     * @tc.name builtinsShortSecondPrototypebTest3500
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest3500'
        console.info(`${caseName}, test start`);
        const num = new Short(-42);
        expect(num.toInt()).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_3600
     * @tc.name builtinsShortSecondPrototypebTest3600
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest3600'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MAX_VALUE);
        expect(num.toInt()).assertEqual(Short.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_3700
     * @tc.name builtinsShortSecondPrototypebTest3700
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest3700'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MIN_VALUE);
        expect(num.toInt()).assertEqual(Short.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_3800
     * @tc.name builtinsShortSecondPrototypebTest3800
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest3800'
        console.info(`${caseName}, test start`);
        const num = new Short(1);
        expect(num.toInt()).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_3900
     * @tc.name builtinsShortSecondPrototypebTest3900
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest3900'
        console.info(`${caseName}, test start`);
        const num = new Short(-1);
        expect(num.toInt()).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_4000
     * @tc.name builtinsShortSecondPrototypebTest4000
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest4000'
        console.info(`${caseName}, test start`);
        const num = new Short(12345);
        expect(num.toInt()).assertEqual(12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_4100
     * @tc.name builtinsShortSecondPrototypebTest4100
     * @tc.desc test toLong(): long return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest4100'
        console.info(`${caseName}, test start`);
        const num = new Short(0);
        expect(num.toLong()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_4200
     * @tc.name builtinsShortSecondPrototypebTest4200
     * @tc.desc test toLong(): long return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest4200'
        console.info(`${caseName}, test start`);
        const num = new Short(42);
        expect(num.toLong()).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_4300
     * @tc.name builtinsShortSecondPrototypebTest4300
     * @tc.desc test toLong(): long return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest4300'
        console.info(`${caseName}, test start`);
        const num = new Short(-42);
        expect(num.toLong()).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_4400
     * @tc.name builtinsShortSecondPrototypebTest4400
     * @tc.desc test toLong(): long return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest4400'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MAX_VALUE);
        expect(num.toLong()).assertEqual(Short.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_4500
     * @tc.name builtinsShortSecondPrototypebTest4500
     * @tc.desc test toLong(): long return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest4500'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MIN_VALUE);
        expect(num.toLong()).assertEqual(Short.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_4600
     * @tc.name builtinsShortSecondPrototypebTest4600
     * @tc.desc test toLong(): long return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest4600'
        console.info(`${caseName}, test start`);
        const num = new Short(1);
        expect(num.toLong()).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_4700
     * @tc.name builtinsShortSecondPrototypebTest4700
     * @tc.desc test toLong(): long return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest4700'
        console.info(`${caseName}, test start`);
        const num = new Short(-1);
        expect(num.toLong()).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_4800
     * @tc.name builtinsShortSecondPrototypebTest4800
     * @tc.desc test toLong(): long return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest4800'
        console.info(`${caseName}, test start`);
        const num = new Short(12345);
        expect(num.toLong()).assertEqual(12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_4900
     * @tc.name builtinsShortSecondPrototypebTest4900
     * @tc.desc test toShort(): short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest4900'
        console.info(`${caseName}, test start`);
        const num = new Short(0);
        expect(num.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_5000
     * @tc.name builtinsShortSecondPrototypebTest5000
     * @tc.desc test toShort(): short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest5000'
        console.info(`${caseName}, test start`);
        const num = new Short(42);
        expect(num.toShort()).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_5100
     * @tc.name builtinsShortSecondPrototypebTest5100
     * @tc.desc test toShort(): short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest5100'
        console.info(`${caseName}, test start`);
        const num = new Short(-42);
        expect(num.toShort()).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_5200
     * @tc.name builtinsShortSecondPrototypebTest5200
     * @tc.desc test toShort(): short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest5200'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MAX_VALUE);
        expect(num.toShort()).assertEqual(Short.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_5300
     * @tc.name builtinsShortSecondPrototypebTest5300
     * @tc.desc test toShort(): short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest5300'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MIN_VALUE);
        expect(num.toShort()).assertEqual(Short.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_5400
     * @tc.name builtinsShortSecondPrototypebTest5400
     * @tc.desc test toShort(): short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest5400'
        console.info(`${caseName}, test start`);
        const num = new Short(1);
        expect(num.toShort()).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_5500
     * @tc.name builtinsShortSecondPrototypebTest5500
     * @tc.desc test toShort(): short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest5500'
        console.info(`${caseName}, test start`);
        const num = new Short(-1);
        expect(num.toShort()).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_5600
     * @tc.name builtinsShortSecondPrototypebTest5600
     * @tc.desc test toShort(): short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest5600'
        console.info(`${caseName}, test start`);
        const num = new Short(12345);
        expect(num.toShort()).assertEqual(12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_5700
     * @tc.name builtinsShortSecondPrototypebTest5700
     * @tc.desc test toString(): String return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest5700'
        console.info(`${caseName}, test start`);
        const num = new Short(0);
        expect(num.toString()).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_5800
     * @tc.name builtinsShortSecondPrototypebTest5800
     * @tc.desc test toString(): String return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest5800'
        console.info(`${caseName}, test start`);
        const num = new Short(42);
        expect(num.toString()).assertEqual('42');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_5900
     * @tc.name builtinsShortSecondPrototypebTest5900
     * @tc.desc test toString(): String return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest5900'
        console.info(`${caseName}, test start`);
        const num = new Short(-42);
        expect(num.toString()).assertEqual('-42');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_6000
     * @tc.name builtinsShortSecondPrototypebTest6000
     * @tc.desc test toString(): String return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest6000'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MAX_VALUE);
        expect(num.toString()).assertEqual(Short.MAX_VALUE.toString());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_6100
     * @tc.name builtinsShortSecondPrototypebTest6100
     * @tc.desc test toString(): String return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest6100'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MIN_VALUE);
        expect(num.toString()).assertEqual(Short.MIN_VALUE.toString());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_6200
     * @tc.name builtinsShortSecondPrototypebTest6200
     * @tc.desc test toString(): String return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest6200'
        console.info(`${caseName}, test start`);
        const num = new Short(1);
        expect(num.toString()).assertEqual('1');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_6300
     * @tc.name builtinsShortSecondPrototypebTest6300
     * @tc.desc test toString(): String return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest6300'
        console.info(`${caseName}, test start`);
        const num = new Short(-1);
        expect(num.toString()).assertEqual('-1');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_6400
     * @tc.name builtinsShortSecondPrototypebTest6400
     * @tc.desc test toString(): String return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest6400'
        console.info(`${caseName}, test start`);
        const num = new Short(12345);
        expect(num.toString()).assertEqual('12345');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_6500
     * @tc.name builtinsShortSecondPrototypebTest6500
     * @tc.desc test static valueOf(value: short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest6500'
        console.info(`${caseName}, test start`);
        const result = Short.valueOf(0);
        expect(result.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_6600
     * @tc.name builtinsShortSecondPrototypebTest6600
     * @tc.desc test static valueOf(value: short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest6600'
        console.info(`${caseName}, test start`);
        const result = Short.valueOf(42);
        expect(result.toShort()).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_6700
     * @tc.name builtinsShortSecondPrototypebTest6700
     * @tc.desc test static valueOf(value: short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest6700'
        console.info(`${caseName}, test start`);
        const result = Short.valueOf(-42);
        expect(result.toShort()).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_6800
     * @tc.name builtinsShortSecondPrototypebTest6800
     * @tc.desc test static valueOf(value: short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest6800'
        console.info(`${caseName}, test start`);
        const result = Short.valueOf(Short.MAX_VALUE);
        expect(result.toShort()).assertEqual(Short.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_6900
     * @tc.name builtinsShortSecondPrototypebTest6900
     * @tc.desc test static valueOf(value: short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest6900'
        console.info(`${caseName}, test start`);
        const result = Short.valueOf(Short.MIN_VALUE);
        expect(result.toShort()).assertEqual(Short.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_7000
     * @tc.name builtinsShortSecondPrototypebTest7000
     * @tc.desc test static valueOf(value: short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest7000'
        console.info(`${caseName}, test start`);
        const result = Short.valueOf(1);
        expect(result.toShort()).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_7100
     * @tc.name builtinsShortSecondPrototypebTest7100
     * @tc.desc test static valueOf(value: short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest7100'
        console.info(`${caseName}, test start`);
        const result = Short.valueOf(-1);
        expect(result.toShort()).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_7200
     * @tc.name builtinsShortSecondPrototypebTest7200
     * @tc.desc test static valueOf(value: short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest7200'
        console.info(`${caseName}, test start`);
        const result = Short.valueOf(12345);
        expect(result.toShort()).assertEqual(12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_7300
     * @tc.name builtinsShortSecondPrototypebTest7300
     * @tc.desc test sub(other: Short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest7300'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(50);
        const result = a.sub(b);
        expect(result.toShort()).assertEqual(50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_7400
     * @tc.name builtinsShortSecondPrototypebTest7400
     * @tc.desc test sub(other: Short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest7400'
        console.info(`${caseName}, test start`);
        const a = new Short(50);
        const b = new Short(100);
        const result = a.sub(b);
        expect(result.toShort()).assertEqual(-50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_7500
     * @tc.name builtinsShortSecondPrototypebTest7500
     * @tc.desc test sub(other: Short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest7500'
        console.info(`${caseName}, test start`);
        const a = new Short(-50);
        const b = new Short(-100);
        const result = a.sub(b);
        expect(result.toShort()).assertEqual(50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_7600
     * @tc.name builtinsShortSecondPrototypebTest7600
     * @tc.desc test sub(other: Short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest7600'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MAX_VALUE);
        const b = new Short(1);
        const result = a.sub(b);
        expect(result.toShort()).assertEqual(Short.MAX_VALUE - 1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_7700
     * @tc.name builtinsShortSecondPrototypebTest7700
     * @tc.desc test sub(other: Short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest7700'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MIN_VALUE);
        const b = new Short(-1);
        const result = a.sub(b);
        expect(result.toShort()).assertEqual(Short.MIN_VALUE + 1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_7800
     * @tc.name builtinsShortSecondPrototypebTest7800
     * @tc.desc test sub(other: Short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest7800'
        console.info(`${caseName}, test start`);
        const a = new Short(0);
        const b = new Short(0);
        const result = a.sub(b);
        expect(result.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_7900
     * @tc.name builtinsShortSecondPrototypebTest7900
     * @tc.desc test sub(other: Short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest7900'
        console.info(`${caseName}, test start`);
        const a = new Short(1);
        const b = new Short(-1);
        const result = a.sub(b);
        expect(result.toShort()).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_SECOND_PROTOTYPEB_TEST_8000
     * @tc.name builtinsShortSecondPrototypebTest8000
     * @tc.desc test sub(other: Short): Short return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortSecondPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortSecondPrototypebTest8000'
        console.info(`${caseName}, test start`);
        const a = new Short(-1);
        const b = new Short(1);
        const result = a.sub(b);
        expect(result.toShort()).assertEqual(-2);
        console.info(`${caseName}, test end`);
        Done();
      })

  })
}