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
export default function builtinsDoubleThirdPrototypebTest() {
  describe('builtinsDoubleThirdPrototypebTest', ():void => {
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
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_0100
     * @tc.name builtinsDoubleThirdPrototypebTest0100
     * @tc.desc test toLocaleString(): default locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const a = new Double(1234567.89);
        expect(a.toLocaleString()).assertEqual((1234567.89).toLocaleString());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_0200
     * @tc.name builtinsDoubleThirdPrototypebTest0200
     * @tc.desc test toLocaleString(): en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const a = new Double(1234567.89);
        expect(a.toLocaleString('en-US')).assertEqual((1234567.89).toLocaleString('en-US'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_0300
     * @tc.name builtinsDoubleThirdPrototypebTest0300
     * @tc.desc test toLocaleString(): zh-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const a = new Double(1234567.89);
        expect(a.toLocaleString('zh-CN')).assertEqual((1234567.89).toLocaleString('zh-CN'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_0400
     * @tc.name builtinsDoubleThirdPrototypebTest0400
     * @tc.desc test toLocaleString(): de-DE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const a = new Double(1234567.89);
        expect(a.toLocaleString('de-DE')).assertEqual((1234567.89).toLocaleString('de-DE'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_0500
     * @tc.name builtinsDoubleThirdPrototypebTest0500
     * @tc.desc test toLocaleString(): 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toLocaleString('en-US')).assertEqual((0.0).toLocaleString('en-US'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_0600
     * @tc.name builtinsDoubleThirdPrototypebTest0600
     * @tc.desc test toLocaleString(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.toLocaleString('en-US')).assertEqual((NaN).toLocaleString('en-US'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_0700
     * @tc.name builtinsDoubleThirdPrototypebTest0700
     * @tc.desc test toLocaleString(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        expect(a.toLocaleString('en-US')).assertEqual((Number.POSITIVE_INFINITY).toLocaleString('en-US'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_0800
     * @tc.name builtinsDoubleThirdPrototypebTest0800
     * @tc.desc test toLocaleString(): max/min values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        const b = new Double(Number.MIN_VALUE);
        expect(a.toLocaleString('en-US')).assertEqual((Number.MAX_VALUE).toLocaleString('en-US'));
        expect(b.toLocaleString('en-US')).assertEqual((Number.MIN_VALUE).toLocaleString('en-US'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_0900
     * @tc.name builtinsDoubleThirdPrototypebTest0900
     * @tc.desc test toPrecision(): normal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const a = new Double(12345.6789);
        expect(a.toPrecision(4)).assertEqual('1.235e+4');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_1000
     * @tc.name builtinsDoubleThirdPrototypebTest1000
     * @tc.desc test toPrecision(): normal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const a = new Double(-9876.54321);
        expect(a.toPrecision(5)).assertEqual('-9876.5');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_1100
     * @tc.name builtinsDoubleThirdPrototypebTest1100
    * @tc.desc test toPrecision(): 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toPrecision(2)).assertEqual('0.0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_1200
     * @tc.name builtinsDoubleThirdPrototypebTest1200
    * @tc.desc test toPrecision(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.toPrecision(2)).assertEqual('-0.0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_1300
     * @tc.name builtinsDoubleThirdPrototypebTest1300
     * @tc.desc test toPrecision(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.toPrecision(2)).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_1400
     * @tc.name builtinsDoubleThirdPrototypebTest1400
    * @tc.desc test toPrecision(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toPrecision(2)).assertEqual('Infinity');
        expect(b.toPrecision(2)).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_1500
     * @tc.name builtinsDoubleThirdPrototypebTest1500
     * @tc.desc test toPrecision(): max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(a.toPrecision(2)).assertEqual(Number.MAX_VALUE.toPrecision(2));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_1600
     * @tc.name builtinsDoubleThirdPrototypebTest1600
     * @tc.desc test toPrecision(): min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(a.toPrecision(2)).assertEqual(Number.MIN_VALUE.toPrecision(2));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_1700
     * @tc.name builtinsDoubleThirdPrototypebTest1700
     * @tc.desc test toFloat(): normal positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.toFloat()).assertEqual(123.456 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_1800
     * @tc.name builtinsDoubleThirdPrototypebTest1800
     * @tc.desc test toFloat(): normal negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const a = new Double(-789.123);
        expect(a.toFloat()).assertEqual(-789.123 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_1900
     * @tc.name builtinsDoubleThirdPrototypebTest1900
     * @tc.desc test toFloat(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toFloat()).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_2000
     * @tc.name builtinsDoubleThirdPrototypebTest2000
     * @tc.desc test toFloat(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.toFloat()).assertEqual(-0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_2100
     * @tc.name builtinsDoubleThirdPrototypebTest2100
     * @tc.desc test toFloat(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(Number.isNaN(a.toFloat())).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_2200
     * @tc.name builtinsDoubleThirdPrototypebTest2200
     * @tc.desc test toFloat(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toFloat()).assertEqual(Number.POSITIVE_INFINITY);
        expect(b.toFloat()).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_2300
     * @tc.name builtinsDoubleThirdPrototypebTest2300
     * @tc.desc test toFloat(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(a.toFloat()).assertEqual(Infinity);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_2400
     * @tc.name builtinsDoubleThirdPrototypebTest2400
     * @tc.desc test toFloat(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(a.toFloat()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_2500
     * @tc.name builtinsDoubleThirdPrototypebTest2500
     * @tc.desc test toInt(): 正常正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.toInt()).assertEqual(123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_2600
     * @tc.name builtinsDoubleThirdPrototypebTest2600
     * @tc.desc test toInt(): 正常负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const a = new Double(-789.123);
        expect(a.toInt()).assertEqual(-789);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_2700
     * @tc.name builtinsDoubleThirdPrototypebTest2700
     * @tc.desc test toInt(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toInt()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_2800
     * @tc.name builtinsDoubleThirdPrototypebTest2800
     * @tc.desc test toInt(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.toInt()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_2900
     * @tc.name builtinsDoubleThirdPrototypebTest2900
     * @tc.desc test toInt(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.toInt()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_3000
     * @tc.name builtinsDoubleThirdPrototypebTest3000
     * @tc.desc test toInt(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toInt()).assertEqual(2147483647);
        expect(b.toInt()).assertEqual(-2147483648);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_3100
     * @tc.name builtinsDoubleThirdPrototypebTest3100
     * @tc.desc test toInt(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(a.toInt()).assertEqual(2147483647);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_3200
     * @tc.name builtinsDoubleThirdPrototypebTest3200
     * @tc.desc test toInt(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(a.toInt()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_3300
     * @tc.name builtinsDoubleThirdPrototypebTest3300
     * @tc.desc test toLong(): 正常正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.toLong()).assertEqual(123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_3400
     * @tc.name builtinsDoubleThirdPrototypebTest3400
     * @tc.desc test toLong(): 正常负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const a = new Double(-789.123);
        expect(a.toLong()).assertEqual(-789);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_3500
     * @tc.name builtinsDoubleThirdPrototypebTest3500
     * @tc.desc test toLong(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toLong()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_3600
     * @tc.name builtinsDoubleThirdPrototypebTest3600
     * @tc.desc test toLong(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.toLong()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_3700
     * @tc.name builtinsDoubleThirdPrototypebTest3700
     * @tc.desc test toLong(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.toLong()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_3800
     * @tc.name builtinsDoubleThirdPrototypebTest3800
     * @tc.desc test toLong(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toLong()).assertEqual(9223372036854775807);
        expect(b.toLong()).assertEqual(-9223372036854775808);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_3900
     * @tc.name builtinsDoubleThirdPrototypebTest3900
     * @tc.desc test toLong(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(a.toLong()).assertEqual(9223372036854775807);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_4000
     * @tc.name builtinsDoubleThirdPrototypebTest4000
     * @tc.desc test toLong(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(a.toLong()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_4100
     * @tc.name builtinsDoubleThirdPrototypebTest4100
     * @tc.desc test toShort(): 正常正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.toShort()).assertEqual(123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_4200
     * @tc.name builtinsDoubleThirdPrototypebTest4200
     * @tc.desc test toShort(): 正常负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const a = new Double(-789.123);
        expect(a.toShort()).assertEqual(-789);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_4300
     * @tc.name builtinsDoubleThirdPrototypebTest4300
     * @tc.desc test toShort(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_4400
     * @tc.name builtinsDoubleThirdPrototypebTest4400
     * @tc.desc test toShort(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_4500
     * @tc.name builtinsDoubleThirdPrototypebTest4500
     * @tc.desc test toShort(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_4600
     * @tc.name builtinsDoubleThirdPrototypebTest4600
     * @tc.desc test toShort(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toShort()).assertEqual(-1);
        expect(b.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_4700
     * @tc.name builtinsDoubleThirdPrototypebTest4700
     * @tc.desc test toShort(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(a.toShort()).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_4800
     * @tc.name builtinsDoubleThirdPrototypebTest4800
     * @tc.desc test toShort(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(a.toShort()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_4900
     * @tc.name builtinsDoubleThirdPrototypebTest4900
     * @tc.desc test toString(): 正常正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const a = new Double(123.456);
        expect(a.toString()).assertEqual('123.456');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_5000
     * @tc.name builtinsDoubleThirdPrototypebTest5000
     * @tc.desc test toString(): 正常负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const a = new Double(-789.123);
        expect(a.toString()).assertEqual('-789.123');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_5100
     * @tc.name builtinsDoubleThirdPrototypebTest5100
     * @tc.desc test toString(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const a = new Double(0.0);
        expect(a.toString()).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_5200
     * @tc.name builtinsDoubleThirdPrototypebTest5200
     * @tc.desc test toString(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const a = new Double(-0.0);
        expect(a.toString()).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_5300
     * @tc.name builtinsDoubleThirdPrototypebTest5300
     * @tc.desc test toString(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const a = new Double(NaN);
        expect(a.toString()).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_5400
     * @tc.name builtinsDoubleThirdPrototypebTest5400
     * @tc.desc test toString(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.POSITIVE_INFINITY);
        const b = new Double(Number.NEGATIVE_INFINITY);
        expect(a.toString()).assertEqual('Infinity');
        expect(b.toString()).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_5500
     * @tc.name builtinsDoubleThirdPrototypebTest5500
     * @tc.desc test toString(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MAX_VALUE);
        expect(a.toString()).assertEqual(Number.MAX_VALUE.toString());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_5600
     * @tc.name builtinsDoubleThirdPrototypebTest5600
     * @tc.desc test toString(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const a = new Double(Number.MIN_VALUE);
        expect(a.toString()).assertEqual(Number.MIN_VALUE.toString());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_5700
     * @tc.name builtinsDoubleThirdPrototypebTest5700
     * @tc.desc test $_invoke(): 默认构造
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke();
        expect(result instanceof Double).assertTrue();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_5800
     * @tc.name builtinsDoubleThirdPrototypebTest5800
     * @tc.desc test $_invoke(): 多次调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const a = Double.$_invoke();
        const b = Double.$_invoke();
        expect(a instanceof Double).assertTrue();
        expect(b instanceof Double).assertTrue();
        expect(a).assertEqual(0);
        expect(b).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_5900
     * @tc.name builtinsDoubleThirdPrototypebTest5900
     * @tc.desc test $_invoke(): typeof校验
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke();
        expect(typeof result).assertEqual('number');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_6000
     * @tc.name builtinsDoubleThirdPrototypebTest6000
     * @tc.desc test $_invoke(): 结果可参与运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke();
        expect(result + 1).assertEqual(1);
        expect(result * 2).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_6100
     * @tc.name builtinsDoubleThirdPrototypebTest6100
     * @tc.desc test $_invoke(): 结果可用于比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke();
        expect(result > -1).assertTrue();
        expect(result < 1).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_6200
     * @tc.name builtinsDoubleThirdPrototypebTest6200
     * @tc.desc test $_invoke(): 结果可用于toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke();
        expect(result.toString()).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_6300
     * @tc.name builtinsDoubleThirdPrototypebTest6300
     * @tc.desc test $_invoke(): 结果可用于isFinite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke();
        expect(result.isFinite()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_6400
     * @tc.name builtinsDoubleThirdPrototypebTest6400
     * @tc.desc test $_invoke(): 结果可用于isInteger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke();
        expect(result.isInteger()).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_6500
     * @tc.name builtinsDoubleThirdPrototypebTest6500
     * @tc.desc test $_invoke(value): String参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest6500';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke(new String('123.45'));
        expect(result instanceof Double).assertTrue();
        expect(result).assertEqual(123.45);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_6600
     * @tc.name builtinsDoubleThirdPrototypebTest6600
     * @tc.desc test $_invoke(value): Number参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest6600';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke(new Number(456.78));
        expect(result instanceof Double).assertTrue();
        expect(result).assertEqual(456.78);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_6700
     * @tc.name builtinsDoubleThirdPrototypebTest6700
     * @tc.desc test $_invoke(value): BigInt参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest6700';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke(new BigInt(789));
        expect(result instanceof Double).assertTrue();
        expect(result).assertEqual(789);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_6800
     * @tc.name builtinsDoubleThirdPrototypebTest6800
     * @tc.desc test $_invoke(value): undefined参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest6800';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke(undefined);
        expect(result instanceof Double).assertTrue();
        expect(Number.isNaN(result)).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_6900
     * @tc.name builtinsDoubleThirdPrototypebTest6900
     * @tc.desc test $_invoke(value): 普通字符串参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest6900';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke('999.99');
        expect(result instanceof Double).assertTrue();
        expect(Number.isNaN(result)).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_7000
     * @tc.name builtinsDoubleThirdPrototypebTest7000
     * @tc.desc test $_invoke(value): 普通number参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest7000';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke(1234.56);
        expect(result instanceof Double).assertTrue();
        expect(Number.isNaN(result)).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_7100
     * @tc.name builtinsDoubleThirdPrototypebTest7100
     * @tc.desc test $_invoke(value): 普通bigint参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest7100';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke(BigInt(5678));
        expect(result instanceof Double).assertTrue();
        expect(Number.isNaN(result)).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_7200
     * @tc.name builtinsDoubleThirdPrototypebTest7200
     * @tc.desc test $_invoke(value): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest7200';
        console.info(`${caseName}, test start`);
        const result = Double.$_invoke(0.0);
        expect(result instanceof Double).assertTrue();
        expect(Number.isNaN(result)).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_7300
     * @tc.name builtinsDoubleThirdPrototypebTest7300
     * @tc.desc test compare(): 相等（差值为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest7300';
        console.info(`${caseName}, test start`);
        expect(Double.compare(1.23, 1.23)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_7400
     * @tc.name builtinsDoubleThirdPrototypebTest7400
     * @tc.desc test compare():
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest7400';
        console.info(`${caseName}, test start`);
        expect(Double.compare(1.0000001, 1.0000002)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_7500
     * @tc.name builtinsDoubleThirdPrototypebTest7500
     * @tc.desc test compare(): 差值等于DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest7500';
        console.info(`${caseName}, test start`);
        expect(Double.compare(1.0, 1.0 + Double.DELTA)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_7600
     * @tc.name builtinsDoubleThirdPrototypebTest7600
     * @tc.desc test compare(): 差值大于DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest7600';
        console.info(`${caseName}, test start`);
        expect(Double.compare(1.0, 1.0 + 2 * Double.DELTA)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_7700
     * @tc.name builtinsDoubleThirdPrototypebTest7700
     * @tc.desc test compare(): NaN参与比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest7700';
        console.info(`${caseName}, test start`);
        expect(Double.compare(NaN, 1.0)).assertEqual(false);
        expect(Double.compare(1.0, NaN)).assertEqual(false);
        expect(Double.compare(NaN, NaN)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_7800
     * @tc.name builtinsDoubleThirdPrototypebTest7800
     * @tc.desc test compare(): Infinity参与比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest7800';
        console.info(`${caseName}, test start`);
        expect(Double.compare(Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY)).assertEqual(false);
        expect(Double.compare(Number.NEGATIVE_INFINITY, Number.NEGATIVE_INFINITY)).assertEqual(false);
        expect(Double.compare(Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_7900
     * @tc.name builtinsDoubleThirdPrototypebTest7900
     * @tc.desc test compare(): 0与-0.0比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest7900';
        console.info(`${caseName}, test start`);
        expect(Double.compare(0.0, -0.0)).assertEqual(true);
        expect(Double.compare(-0.0, 0.0)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_8000
     * @tc.name builtinsDoubleThirdPrototypebTest8000
     * @tc.desc test compare(): 极大极小值比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest8000';
        console.info(`${caseName}, test start`);
        expect(Double.compare(Number.MAX_VALUE, Number.MAX_VALUE)).assertEqual(true);
        expect(Double.compare(Number.MIN_VALUE, Number.MIN_VALUE)).assertEqual(true);
        expect(Double.compare(Number.MAX_VALUE, Number.MIN_VALUE)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_8100
     * @tc.name builtinsDoubleThirdPrototypebTest8100
     * @tc.desc test isFinite(): 正常正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest8100';
        console.info(`${caseName}, test start`);
        expect(Double.isFinite(123.456)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_8200
     * @tc.name builtinsDoubleThirdPrototypebTest8200
     * @tc.desc test isFinite(): 正常负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest8200';
        console.info(`${caseName}, test start`);
        expect(Double.isFinite(-789.123)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_8300
     * @tc.name builtinsDoubleThirdPrototypebTest8300
     * @tc.desc test isFinite(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest8300';
        console.info(`${caseName}, test start`);
        expect(Double.isFinite(0.0)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_8400
     * @tc.name builtinsDoubleThirdPrototypebTest8400
     * @tc.desc test isFinite(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest8400';
        console.info(`${caseName}, test start`);
        expect(Double.isFinite(-0.0)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_8500
     * @tc.name builtinsDoubleThirdPrototypebTest8500
     * @tc.desc test isFinite(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest8500';
        console.info(`${caseName}, test start`);
        expect(Double.isFinite(NaN)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_8600
     * @tc.name builtinsDoubleThirdPrototypebTest8600
     * @tc.desc test isFinite(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest8600';
        console.info(`${caseName}, test start`);
        expect(Double.isFinite(Number.POSITIVE_INFINITY)).assertEqual(false);
        expect(Double.isFinite(Number.NEGATIVE_INFINITY)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_8700
     * @tc.name builtinsDoubleThirdPrototypebTest8700
     * @tc.desc test isFinite(): 极大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest8700';
        console.info(`${caseName}, test start`);
        expect(Double.isFinite(Number.MAX_VALUE)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_8800
     * @tc.name builtinsDoubleThirdPrototypebTest8800
     * @tc.desc test isFinite(): 极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest8800';
        console.info(`${caseName}, test start`);
        expect(Double.isFinite(Number.MIN_VALUE)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_8900
     * @tc.name builtinsDoubleThirdPrototypebTest8900
     * @tc.desc test isInteger(): 正常正整数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest8900';
        console.info(`${caseName}, test start`);
        expect(Double.isInteger(123.0)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_9000
     * @tc.name builtinsDoubleThirdPrototypebTest9000
     * @tc.desc test isInteger(): 正常负整数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest9000';
        console.info(`${caseName}, test start`);
        expect(Double.isInteger(-456.0)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_9100
     * @tc.name builtinsDoubleThirdPrototypebTest9100
     * @tc.desc test isInteger(): 正常小数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest9100';
        console.info(`${caseName}, test start`);
        expect(Double.isInteger(123.456)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_9200
     * @tc.name builtinsDoubleThirdPrototypebTest9200
     * @tc.desc test isInteger(): 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest9200';
        console.info(`${caseName}, test start`);
        expect(Double.isInteger(0.0)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_9300
     * @tc.name builtinsDoubleThirdPrototypebTest9300
     * @tc.desc test isInteger(): -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest9300';
        console.info(`${caseName}, test start`);
        expect(Double.isInteger(-0.0)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_9400
     * @tc.name builtinsDoubleThirdPrototypebTest9400
     * @tc.desc test isInteger(): NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest9400';
        console.info(`${caseName}, test start`);
        expect(Double.isInteger(NaN)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_9500
     * @tc.name builtinsDoubleThirdPrototypebTest9500
     * @tc.desc test isInteger(): Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest9500';
        console.info(`${caseName}, test start`);
        expect(Double.isInteger(Number.POSITIVE_INFINITY)).assertEqual(false);
        expect(Double.isInteger(Number.NEGATIVE_INFINITY)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_DOUBLE_THIRD_PROTOTYPEB_TEST_9600
     * @tc.name builtinsDoubleThirdPrototypebTest9600
     * @tc.desc test isInteger(): 极大极小值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsDoubleThirdPrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsDoubleThirdPrototypebTest9600';
        console.info(`${caseName}, test start`);
        expect(Double.isInteger(Number.MAX_VALUE)).assertEqual(true);
        expect(Double.isInteger(Number.MIN_VALUE)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}