/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../testability/pages/Utils';


export default function BuiltinsNumberPrototypeTest() {
  describe('BuiltinsNumberPrototypeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   builtinsNumberPrototypeTest0100
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_0100
     * @tc.desc   toExponential
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest0100';
        console.log(`${caseName} test start`);
        const num = 77.1234;
        const exponentialStr1 = num.toExponential();
        console.log(`${exponentialStr1}`);
        expect("7.71234e+1").assertEqual(exponentialStr1);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest0200
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_0200
     * @tc.desc   toExponential
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest0200';
        console.log(`${caseName} test start`);
        const num = 77.1234;
        const exponentialStr1 = num.toExponential(4);
        console.log(`${exponentialStr1}`);
        expect("7.7123e+1").assertEqual(exponentialStr1);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest0300
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_0300
     * @tc.desc   toExponential
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest0300';
        console.log(`${caseName} test start`);
        const num = 77.1234;
        const exponentialStr1 = num.toExponential(2);
        console.log(`${exponentialStr1}`);
        expect("7.71e+1").assertEqual(exponentialStr1);
        console.log(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsNumberPrototypeTest0400
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_0400
     * @tc.desc   toExponential
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest0400';
        console.log(`${caseName} test start`);
        const num = 77;
        const exponentialStr1 = num.toExponential();
        console.log(`${exponentialStr1}`);
        expect("7.7e+1").assertEqual(exponentialStr1);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest0500
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_0500
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest0500';
        console.log(`${caseName} test start`);
        const num = 12345.6789;
        const exponentialStr2 = num.toFixed();
        console.log(`${exponentialStr2}`);
        expect("12346").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest0600
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_0600
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest0600';
        console.log(`${caseName} test start`);
        const num = 12345.6789;
        const exponentialStr2 = num.toFixed(1);
        console.log(`${exponentialStr2}`);
        expect("12345.7").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest0700
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_0700
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest0700';
        console.log(`${caseName} test start`);
        const num = 12345.6789;
        const exponentialStr2 = num.toFixed(6);
        console.log(`${exponentialStr2}`);
        expect("12345.678900").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest0800
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_0800
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest0800';
        console.log(`${caseName} test start`);
        const num = 1.23e20;
        const exponentialStr2 = num.toFixed(2);
        console.log(`${exponentialStr2}`);
        expect("123000000000000000000.00").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest0900
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_0900
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest0900';
        console.log(`${caseName} test start`);
        const num = 1.23e-10;
        const exponentialStr2 = num.toFixed(2);
        console.log(`${exponentialStr2}`);
        expect("0.00").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest1000
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_1000
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest1000';
        console.log(`${caseName} test start`);
        const num = 2.34;
        const exponentialStr2 = num.toFixed(1);
        console.log(`${exponentialStr2}`);
        expect("2.3").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest1100
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_1100
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest1100';
        console.log(`${caseName} test start`);
        const num = 2.35;
        const exponentialStr2 = num.toFixed(1);
        console.log(`${exponentialStr2}`);
        expect("2.4").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest1200
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_1200
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest1200';
        console.log(`${caseName} test start`);
        const num = 2.55;
        const exponentialStr2 = num.toFixed(1);
        console.log(`${exponentialStr2}`);
        expect("2.5").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest1300
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_1300
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest1300';
        console.log(`${caseName} test start`);
        const num = 2.449999999999999999;
        const exponentialStr2 = num.toFixed(1);
        console.log(`${exponentialStr2}`);
        expect("2.5").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest1400
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_1400
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest1400';
        console.log(`${caseName} test start`);
        const num = (6.02 * 10**23);
        const exponentialStr2 = num.toFixed(50);
        console.log(`${exponentialStr2}`);
        expect("6.02e+23").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest1500
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_1500
     * @tc.desc   toFixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest1500';
        console.log(`${caseName} test start`);
        const num = -2.34;
        const exponentialStr2 = num.toFixed(1);
        console.log(`${exponentialStr2}`);
        expect("-2.3").assertEqual(exponentialStr2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest1600
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_1600
     * @tc.desc   toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest1600';
        console.log(`${caseName} test start`);
        const num = 123456.789;
        const exponentialStr3 = num.toLocaleString("de-DE");
        console.log(`${exponentialStr3}`);
        expect("123.456,789").assertEqual(exponentialStr3);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest1700
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_1700
     * @tc.desc   toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest1600';
        console.log(`${caseName} test start`);
        const num = 123456.789;
        const exponentialStr3 = num.toLocaleString("ar-EG");
        console.log(`${exponentialStr3}`);
        expect("١٢٣٬٤٥٦٫٧٨٩").assertEqual(exponentialStr3);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest1800
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_1800
     * @tc.desc   toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest1800';
        console.log(`${caseName} test start`);
        const num = 123456.789;
        const exponentialStr3 = num.toLocaleString("en-IN");
        console.log(`${exponentialStr3}`);
        expect("1,23,456.789").assertEqual(exponentialStr3);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest1900
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_1900
     * @tc.desc   toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest1900';
        console.log(`${caseName} test start`);
        const num = 123456.789;
        const exponentialStr3 = num.toLocaleString("zh-Hans-CN-u-nu-hanidec");
        console.log(`${exponentialStr3}`);
        expect("一二三,四五六.七八九").assertEqual(exponentialStr3);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest2000
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_2000
     * @tc.desc   toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest2000';
        console.log(`${caseName} test start`);
        const num = 123456.789;
        const exponentialStr3 = num.toLocaleString(["ban", "id"]);
        console.log(`${exponentialStr3}`);
        expect("123.456,789").assertEqual(exponentialStr3);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest2100
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_2100
     * @tc.desc   toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest2100';
        console.log(`${caseName} test start`);
        const num = 123456.789;
        const exponentialStr3 = num.toLocaleString("de-DE", {
          style: "currency", currency: "EUR"
        });
        console.log(`${exponentialStr3}`);
        expect("123.456,79 €").assertEqual(exponentialStr3);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest2200
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_2200
     * @tc.desc   toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest2200';
        console.log(`${caseName} test start`);
        const num = 123456.789;
        const exponentialStr3 = num.toLocaleString("ja-JP", {
          style: "currency", currency: "JPY"
        });
        console.log(`${exponentialStr3}`);
        expect("￥123,457").assertEqual(exponentialStr3);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest2300
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_2300
     * @tc.desc   toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest2300';
        console.log(`${caseName} test start`);
        const num = 123456.789;
        const exponentialStr3 = num.toLocaleString("en-IN", {
          maximumSignificantDigits: 3
        });
        console.log(`${exponentialStr3}`);
        expect("1,23,000").assertEqual(exponentialStr3);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest2400
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_2400
     * @tc.desc   toPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest2400';
        console.log(`${caseName} test start`);
        const num = 5.123456;
        const exponentialStr4 = num.toPrecision();
        console.log(`${exponentialStr4}`);
        expect("5.123456").assertEqual(exponentialStr4);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest2500
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_2500
     * @tc.desc   toPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest2500';
        console.log(`${caseName} test start`);
        const num = 5.123456;
        const exponentialStr4 = num.toPrecision(5);
        console.log(`${exponentialStr4}`);
        expect("5.1235").assertEqual(exponentialStr4);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest2600
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_2600
     * @tc.desc   toPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest2600';
        console.log(`${caseName} test start`);
        const num = 5.123456;
        const exponentialStr4 = num.toPrecision(2);
        console.log(`${exponentialStr4}`);
        expect("5.1").assertEqual(exponentialStr4);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest2700
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_2700
     * @tc.desc   toPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest2700';
        console.log(`${caseName} test start`);
        const num = 5.123456;
        const exponentialStr4 = num.toPrecision(1);
        console.log(`${exponentialStr4}`);
        expect("5").assertEqual(exponentialStr4);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest2800
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_2800
     * @tc.desc   toPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest2800';
        console.log(`${caseName} test start`);
        const num = 0.000123;
        const exponentialStr4 = num.toPrecision();
        console.log(`${exponentialStr4}`);
        expect("0.000123").assertEqual(exponentialStr4);
        console.log(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsNumberPrototypeTest2900
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_2900
     * @tc.desc   toPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest2900';
        console.log(`${caseName} test start`);
        const num = 0.000123;
        const exponentialStr4 = num.toPrecision(5);
        console.log(`${exponentialStr4}`);
        expect("0.00012300").assertEqual(exponentialStr4);
        console.log(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsNumberPrototypeTest3000
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_3000
     * @tc.desc   toPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest3000';
        console.log(`${caseName} test start`);
        const num = 0.000123;
        const exponentialStr4 = num.toPrecision(2);
        console.log(`${exponentialStr4}`);
        expect("0.00012").assertEqual(exponentialStr4);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest3100
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_3100
     * @tc.desc   toPrecision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest3100';
        console.log(`${caseName} test start`);
        const num = 0.000123;
        const exponentialStr4 = num.toPrecision(1);
        console.log(`${exponentialStr4}`);
        expect("0.0001").assertEqual(exponentialStr4);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest3200
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_3200
     * @tc.desc   toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest3200';
        console.log(`${caseName} test start`);
        const num = 10;
        const exponentialStr5 = num.toString(10);
        console.log(`${exponentialStr5}`);
        expect("10").assertEqual(exponentialStr5);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest3300
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_3300
     * @tc.desc   toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest3300';
        console.log(`${caseName} test start`);
        const num = 10;
        const exponentialStr5 = num.toString();
        console.log(`${exponentialStr5}`);
        expect("10").assertEqual(exponentialStr5);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest3400
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_3400
     * @tc.desc   toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest3400';
        console.log(`${caseName} test start`);
        const num = 10;
        const exponentialStr5 = num.toString(2);
        console.log(`${exponentialStr5}`);
        expect("1010").assertEqual(exponentialStr5);
        console.log(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsNumberPrototypeTest3500
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_3500
     * @tc.desc   toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest3500';
        console.log(`${caseName} test start`);
        const num = 10;
        const exponentialStr5 = num.toString(16);
        console.log(`${exponentialStr5}`);
        expect("a").assertEqual(exponentialStr5);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest3600
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_3600
     * @tc.desc   toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest3600';
        console.log(`${caseName} test start`);
        const num = 10;
        try {
          const exponentialStr5 = num.toString(1);
          console.log(`${exponentialStr5}`);
        } catch (error) {
          console.log(`${caseName} test error:`, error);
          expect("radix must be 2 to 36").assertEqual(error.message);
        }
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest3700
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_3700
     * @tc.desc   toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest3700';
        console.log(`${caseName} test start`);
        const num = 10;
        try {
          const exponentialStr5 = num.toString(37);
          console.log(`${exponentialStr5}`);
        }catch (error) {
          console.log(`${caseName} test error:`, error);
          expect("radix must be 2 to 36").assertEqual(error.message);
        }
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest3800
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_3800
     * @tc.desc   toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest3800';
        console.log(`${caseName} test start`);
        const num = 17.2;
        const exponentialStr5 = num.toString();
        console.log(`${exponentialStr5}`);
        expect("17.2").assertEqual(exponentialStr5);
        console.log(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsNumberPrototypeTest3900
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_3900
     * @tc.desc   toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest3900';
        console.log(`${caseName} test start`);
        const num = 254;
        const exponentialStr5 = num.toString(16);
        console.log(`${exponentialStr5}`);
        expect("fe").assertEqual(exponentialStr5);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   builtinsNumberPrototypeTest4000
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_4000
     * @tc.desc   toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest4000';
        console.log(`${caseName} test start`);
        const num = -10;
        const exponentialStr5 = num.toString(2);
        console.log(`${exponentialStr5}`);
        expect("-1010").assertEqual(exponentialStr5);
        console.log(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsNumberPrototypeTest4100
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_4100
     * @tc.desc   toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest4100';
        console.log(`${caseName} test start`);
        const num = -0xff;
        const exponentialStr5 = num.toString(2);
        console.log(`${exponentialStr5}`);
        expect("-11111111").assertEqual(exponentialStr5);
        console.log(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   builtinsNumberPrototypeTest4200
     * @tc.number SUB_BUILTINS_NUMBER_PROTOTYPE_TEST_4200
     * @tc.desc   valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPrototypeTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNumberPrototypeTest4200';
        console.log(`${caseName} test start`);
        const num = new Number(10);
        const exponentialStr6 = num.valueOf();
        console.log(`${exponentialStr6}`);
        expect(10).assertEqual(exponentialStr6);
        console.log(`${caseName} test end`);
        Done();
      })
  })
}