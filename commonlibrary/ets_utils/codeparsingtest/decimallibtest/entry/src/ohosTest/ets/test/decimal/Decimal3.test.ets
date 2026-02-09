/*
* Copyright (c) 2026 Huawei Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Decimal } from '@kit.ArkTS';

let TAG = "DecimalArithmeticTest";

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function Decimal3Test() {
  describe('Decimal3Test', () => {
    afterEach(async (done: Function) => {
      await sleep(20);
      done();
    })

    /**
     * @tc.name   testAddWithNumber
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_0100
     * @tc.desc   Testing add with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAddWithNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAddWithNumber";
      try {
        let a: Decimal = new Decimal(10);
        let result = a.add(5);
        expect(result.toString()).assertEqual("15");
        expect(result.d.toString()).assertEqual("15");
        expect(result.e).assertEqual(1);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAddWithString
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_0200
     * @tc.desc   Testing add with string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAddWithString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let a: Decimal = new Decimal(10);
      let result = a.add("5.5");
      expect(result.toString()).assertEqual("16");
      expect(result.d.toString()).assertEqual("16");
      expect(result.e).assertEqual(1);
      expect(result.s).assertEqual(1);
    })

    /**
     * @tc.name   testAddWithDecimal
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_0300
     * @tc.desc   Testing add with Decimal parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAddWithDecimal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAddWithDecimal";
      try {
        let a: Decimal = new Decimal(10);
        let b: Decimal = new Decimal(5);
        let result = a.add(b);
        expect(result.toString()).assertEqual("15");
        expect(result.d.toString()).assertEqual("15");
        expect(result.e).assertEqual(1);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSubWithNumber
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_0400
     * @tc.desc   Testing sub with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSubWithNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSubWithNumber";
      try {
        let a: Decimal = new Decimal(10);
        let result = a.sub(5);
        expect(result.toString()).assertEqual("5");
        expect(result.d.toString()).assertEqual("5");
        expect(result.e).assertEqual(0);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSubWithString
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_0500
     * @tc.desc   Testing sub with string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSubWithString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSubWithString";
      try {
        let a: Decimal = new Decimal(10);
        let result = a.sub("3.5");
        expect(result.toString()).assertEqual("6.5");
        expect(result.d.toString()).assertEqual("6,5000000");
        expect(result.e).assertEqual(0);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMulWithNumber
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_0600
     * @tc.desc   Testing mul with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMulWithNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMulWithNumber";
      try {
        let a: Decimal = new Decimal(10);
        let result = a.mul(5);
        expect(result.toString()).assertEqual("50");
        expect(result.d.toString()).assertEqual("50");
        expect(result.e).assertEqual(1);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMulWithString
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_0700
     * @tc.desc   Testing mul with string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMulWithString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMulWithString";
      try {
        let a: Decimal = new Decimal(10);
        let result = a.mul("2.5");
        expect(result.toString()).assertEqual("25");
        expect(result.d.toString()).assertEqual("25");
        expect(result.e).assertEqual(1);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDivWithNumber
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_0800
     * @tc.desc   Testing div with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDivWithNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testDivWithNumber";
      let a: Decimal = new Decimal(10);
      let result = a.div(2);
      expect(result.toString()).assertEqual("5");
      expect(result.d.toString()).assertEqual("5");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);
    })

    /**
     * @tc.name   testDivByZero
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_0900
     * @tc.desc   Testing div by zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDivByZero', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testDivByZero";
      let a: Decimal = new Decimal(10);
      let result = a.div(0);
      expect(result.d).assertNull();
      expect(result.s).assertEqual(1);
      expect(result.e).assertNaN();
    })

    /**
     * @tc.name   testModWithNumber
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_1000
     * @tc.desc   Testing mod with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testModWithNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testModWithNumber";
      try {
        let a: Decimal = new Decimal(10);
        let result = a.mod(3);
        expect(result.toString()).assertEqual("1");
        expect(result.d.toString()).assertEqual("1");
        expect(result.e).assertEqual(0);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testModNegative
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_1100
     * @tc.desc   Testing mod with negative number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testModNegative', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testModNegative";
      let a: Decimal = new Decimal(-10);
      let result = a.mod(3);
      expect(result.toString()).assertEqual("-1");
      expect(result.d.toString()).assertEqual("1");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(-1);
    })

    /**
     * @tc.name   testPowWithInteger
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_1200
     * @tc.desc   Testing pow with integer exponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testPowWithInteger', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testPowWithInteger";
      try {
        let a: Decimal = new Decimal(2);
        let result = a.pow(3);
        expect(result.toString()).assertEqual("8");
        expect(result.d.toString()).assertEqual("8");
        expect(result.e).assertEqual(0);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testPowWithFraction
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_1300
     * @tc.desc   Testing pow with fractional exponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testPowWithFraction', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testPowWithFraction";
      try {
        let a: Decimal = new Decimal(4);
        let result = a.pow(0.5);
        expect(result.toString()).assertEqual("2");
        expect(result.d.toString()).assertEqual("2");
        expect(result.e).assertEqual(0);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDividedToIntegerBy
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_1400
     * @tc.desc   Testing dividedToIntegerBy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDividedToIntegerBy', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testDividedToIntegerBy";
      try {
        let a: Decimal = new Decimal(10);
        let result = a.dividedToIntegerBy(3);
        expect(result.toString()).assertEqual("3");
        expect(result.d.toString()).assertEqual("3");
        expect(result.e).assertEqual(0);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testClampWithinRange
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_1500
     * @tc.desc   Testing clamp with value within range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testClampWithinRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testClampWithinRange";
      try {
        let a: Decimal = new Decimal(5);
        let result = a.clamp(0, 10);
        expect(result.toString()).assertEqual("5");
        expect(result.d.toString()).assertEqual("5");
        expect(result.e).assertEqual(0);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testClampBelowMin
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_1600
     * @tc.desc   Testing clamp with value below minimum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testClampBelowMin', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testClampBelowMin";
      try {
        let a: Decimal = new Decimal(-5);
        let result = a.clamp(0, 10);
        expect(result.toString()).assertEqual("0");
        expect(result.d.toString()).assertEqual("0");
        expect(result.e).assertEqual(0);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testClampAboveMax
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_1700
     * @tc.desc   Testing clamp with value above maximum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testClampAboveMax', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testClampAboveMax";
      try {
        let a: Decimal = new Decimal(15);
        let result = a.clamp(0, 10);
        expect(result.toString()).assertEqual("10");
        expect(result.d.toString()).assertEqual("10");
        expect(result.e).assertEqual(1);
        expect(result.s).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSumWithNumbers
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_1800
     * @tc.desc   Testing static sum with number parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSumWithNumbers', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSumWithNumbers";

      let result = Decimal.sum(1, 2, 3, 4);
      expect(result.toString()).assertEqual("10");
      expect(result.d.toString()).assertEqual("10");
      expect(result.e).assertEqual(1);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testSumWithStrings
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_1900
     * @tc.desc   Testing static sum with string parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSumWithStrings', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSumWithStrings";
      let result = Decimal.sum("1.5", "2.5", "3");
      expect(result.toString()).assertEqual("7");
      expect(result.d.toString()).assertEqual("7");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);
    })

    /**
     * @tc.name   testSumWithDecimals
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_2000
     * @tc.desc   Testing static sum with Decimal parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSumWithDecimals', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSumWithDecimals";

      let a: Decimal = new Decimal(1);
      let b: Decimal = new Decimal(2);
      let c: Decimal = new Decimal(3);
      let result = Decimal.sum(a, b, c);
      expect(result.toString()).assertEqual("6");
      expect(result.d.toString()).assertEqual("6");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testSumSingleParameter
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_2100
     * @tc.desc   Testing static sum with single parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSumSingleParameter', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSumSingleParameter";

      let result = Decimal.sum(5);
      expect(result.toString()).assertEqual("5");
      expect(result.d.toString()).assertEqual("5");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testSumMixedTypes
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_2200
     * @tc.desc   Testing static sum with mixed type parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSumMixedTypes', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSumMixedTypes";

      let a: Decimal = new Decimal(1);
      let result = Decimal.sum(a, "2", 3);
      expect(result.toString()).assertEqual("6");
      expect(result.d.toString()).assertEqual("6");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testMaxWithNumbers
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_2300
     * @tc.desc   Testing static max with number parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMaxWithNumbers', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMaxWithNumbers";

      let result = Decimal.max(1, 5, 3, 2);
      expect(result.toString()).assertEqual("5");
      expect(result.d.toString()).assertEqual("5");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testMaxWithStrings
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_2400
     * @tc.desc   Testing static max with string parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMaxWithStrings', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMaxWithStrings";
      let result = Decimal.max("1.5", "5.5", "3");
      expect(result.toString()).assertEqual("5.5");
      expect(result.d.toString()).assertEqual("5,5000000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);
    })

    /**
     * @tc.name   testMaxWithDecimals
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_2500
     * @tc.desc   Testing static max with Decimal parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMaxWithDecimals', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMaxWithDecimals";

      let a: Decimal = new Decimal(10);
      let b: Decimal = new Decimal(5);
      let c: Decimal = new Decimal(15);
      let result = Decimal.max(a, b, c);
      expect(result.toString()).assertEqual("15");
      expect(result.d.toString()).assertEqual("15");
      expect(result.e).assertEqual(1);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testMaxSingleParameter
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_2600
     * @tc.desc   Testing static max with single parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMaxSingleParameter', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMaxSingleParameter";

      let result = Decimal.max(5);
      expect(result.toString()).assertEqual("5");
      expect(result.d.toString()).assertEqual("5");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);
    })

    /**
     * @tc.name   testMaxNegativeNumbers
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_2700
     * @tc.desc   Testing static max with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMaxNegativeNumbers', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMaxNegativeNumbers";

      let result = Decimal.max(-5, -1, -10);
      expect(result.toString()).assertEqual("-1");
      expect(result.d.toString()).assertEqual("1");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(-1);

    })

    /**
     * @tc.name   testMaxMixedTypes
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_2800
     * @tc.desc   Testing static max with mixed type parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMaxMixedTypes', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMaxMixedTypes";

      let a: Decimal = new Decimal(5);
      let result = Decimal.max(a, "10", 3);
      expect(result.toString()).assertEqual("10");
      expect(result.d.toString()).assertEqual("10");
      expect(result.e).assertEqual(1);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testMinWithNumbers
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_2900
     * @tc.desc   Testing static min with number parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMinWithNumbers', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMinWithNumbers";

      let result = Decimal.min(5, 1, 3, 2);
      expect(result.toString()).assertEqual("1");
      expect(result.d.toString()).assertEqual("1");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testMinWithStrings
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_3000
     * @tc.desc   Testing static min with string parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMinWithStrings', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMinWithStrings";

      let result = Decimal.min("5.5", "1.5", "3");
      expect(result.toString()).assertEqual("1.5");
      expect(result.d.toString()).assertEqual("1,5000000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testMinWithDecimals
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_3100
     * @tc.desc   Testing static min with Decimal parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMinWithDecimals', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMinWithDecimals";

      let a: Decimal = new Decimal(10);
      let b: Decimal = new Decimal(5);
      let c: Decimal = new Decimal(15);
      let result = Decimal.min(a, b, c);
      expect(result.toString()).assertEqual("5");
      expect(result.d.toString()).assertEqual("5");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testMinSingleParameter
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_3200
     * @tc.desc   Testing static min with single parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMinSingleParameter', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMinSingleParameter";
      let result = Decimal.min(5);
      expect(result.toString()).assertEqual("5");
      expect(result.d.toString()).assertEqual("5");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);
    })

    /**
     * @tc.name   testMinNegativeNumbers
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_3300
     * @tc.desc   Testing static min with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMinNegativeNumbers', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMinNegativeNumbers";
      let result = Decimal.min(-5, -1, -10);
      expect(result.toString()).assertEqual("-10");
      expect(result.d.toString()).assertEqual("10");
      expect(result.e).assertEqual(1);
      expect(result.s).assertEqual(-1);
    })

    /**
     * @tc.name   testMinMixedTypes
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_3400
     * @tc.desc   Testing static min with mixed type parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMinMixedTypes', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testMinMixedTypes";
      let a: Decimal = new Decimal(10);
      let result = Decimal.min(a, "5", 3);
      expect(result.toString()).assertEqual("3");
      expect(result.d.toString()).assertEqual("3");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);
    })

    /**
     * @tc.name   testLogWithNumber
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_3500
     * @tc.desc   Testing log with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLogWithNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLogWithNumber";

      let a: Decimal = new Decimal(100);
      let result = a.log(10);
      expect(result.toString()).assertEqual("2");
      expect(result.d.toString()).assertEqual("2");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testLogWithString
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_3600
     * @tc.desc   Testing log with string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLogWithString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLogWithString";

      let a: Decimal = new Decimal(100);
      let result = a.log("10");
      expect(result.toString()).assertEqual("2");
      expect(result.d.toString()).assertEqual("2");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testLogOfOne
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_3700
     * @tc.desc   Testing log of 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLogOfOne', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLogOfOne";

      let a: Decimal = new Decimal(1);
      let result = a.log(10);
      expect(result.toString()).assertEqual("0");
      expect(result.d.toString()).assertEqual("0");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testLog2WithNumber
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_3800
     * @tc.desc   Testing static log2 with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLog2WithNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLog2WithNumber";

      let result = Decimal.log2(8);
      expect(result.toString()).assertEqual("3");
      expect(result.d.toString()).assertEqual("3");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testLog2WithString
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_3900
     * @tc.desc   Testing static log2 with string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLog2WithString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLog2WithString";

      let result = Decimal.log2("8");
      expect(result.toString()).assertEqual("3");
      expect(result.d.toString()).assertEqual("3");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testLog10WithNumber
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_4000
     * @tc.desc   Testing static log10 with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLog10WithNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLog10WithNumber";

      let result = Decimal.log10(100);
      expect(result.toString()).assertEqual("2");
      expect(result.d.toString()).assertEqual("2");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testLog10WithString
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_4100
     * @tc.desc   Testing static log10 with string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLog10WithString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLog10WithString";

      let result = Decimal.log10("100");
      expect(result.toString()).assertEqual("2");
      expect(result.d.toString()).assertEqual("2");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testAtan2WithNumbers
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_4200
     * @tc.desc   Testing static atan2 with number parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAtan2WithNumbers', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAtan2WithNumbers";

      let result = Decimal.atan2(1, 1);
      expect(result.isPositive()).assertTrue();

    })

    /**
     * @tc.name   testAtan2WithStrings
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_4300
     * @tc.desc   Testing static atan2 with string parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAtan2WithStrings', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAtan2WithStrings";

      let result = Decimal.atan2("1", "1");
      expect(result.isPositive()).assertTrue();

    })

    /**
     * @tc.name   testHypotWithNumbers
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_4400
     * @tc.desc   Testing static hypot with number parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testHypotWithNumbers', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testHypotWithNumbers";

      let result = Decimal.hypot(3, 4);
      expect(result.toString()).assertEqual("5");
      expect(result.d.toString()).assertEqual("5");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testHypotWithStrings
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_4500
     * @tc.desc   Testing static hypot with string parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testHypotWithStrings', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testHypotWithStrings";

      let result = Decimal.hypot("3", "4");
      expect(result.toString()).assertEqual("5");
      expect(result.d.toString()).assertEqual("5");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testHypotWithDecimals
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_4600
     * @tc.desc   Testing static hypot with Decimal parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testHypotWithDecimals', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testHypotWithDecimals";

      let a: Decimal = new Decimal(3);
      let b: Decimal = new Decimal(4);
      let result = Decimal.hypot(a, b);
      expect(result.toString()).assertEqual("5");
      expect(result.d.toString()).assertEqual("5");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testHypotSingleParameter
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_4700
     * @tc.desc   Testing static hypot with single parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testHypotSingleParameter', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testHypotSingleParameter";

      let result = Decimal.hypot(5);
      expect(result.toString()).assertEqual("5");
      expect(result.d.toString()).assertEqual("5");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testHypotMultipleParameters
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_4800
     * @tc.desc   Testing static hypot with multiple parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testHypotMultipleParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testHypotMultipleParameters";
      let result = Decimal.hypot(3, 4, 5, 6);
      let expected = Math.sqrt(3 * 3 + 4 * 4 + 5 * 5 + 6 * 6);
      let decimalResult = new Decimal(result);
      expect(decimalResult.comparedTo(expected)).assertEqual(1);
    })

    /**
     * @tc.name   testToDecimalPlacesRoundUp
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_4900
     * @tc.desc   Testing toDecimalPlaces with ROUND_UP mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundUp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundUp";

      let a: Decimal = new Decimal(1.234);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_UP);
      expect(result.toString()).assertEqual("1.24");
      expect(result.d.toString()).assertEqual("1,2400000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToDecimalPlacesRoundDown
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_5000
     * @tc.desc   Testing toDecimalPlaces with ROUND_DOWN mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundDown', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundDown";
      let a: Decimal = new Decimal(1.234);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_DOWN);
      expect(result.toString()).assertEqual("1.23");
      expect(result.d.toString()).assertEqual("1,2300000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToDecimalPlacesRoundCeiling
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_5100
     * @tc.desc   Testing toDecimalPlaces with ROUND_CEILING mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundCeiling', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundCeiling";

      let a: Decimal = new Decimal(1.234);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_CEILING);
      expect(result.toString()).assertEqual("1.24");
      expect(result.d.toString()).assertEqual("1,2400000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToDecimalPlacesRoundCeilingNegative
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_5200
     * @tc.desc   Testing toDecimalPlaces with ROUND_CEILING mode on negative number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundCeilingNegative', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundCeilingNegative";

      let a: Decimal = new Decimal(-1.234);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_CEILING);
      expect(result.toString()).assertEqual("-1.23");
      expect(result.d.toString()).assertEqual("1,2300000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(-1);

    })

    /**
     * @tc.name   testToDecimalPlacesRoundFloor
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_5300
     * @tc.desc   Testing toDecimalPlaces with ROUND_FLOOR mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundFloor', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundFloor";

      let a: Decimal = new Decimal(1.234);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_FLOOR);
      expect(result.toString()).assertEqual("1.23");
      expect(result.d.toString()).assertEqual("1,2300000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToDecimalPlacesRoundFloorNegative
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_5400
     * @tc.desc   Testing toDecimalPlaces with ROUND_FLOOR mode on negative number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundFloorNegative', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundFloorNegative";

      let a: Decimal = new Decimal(-1.234);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_FLOOR);
      expect(result.toString()).assertEqual("-1.24");
      expect(result.d.toString()).assertEqual("1,2400000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(-1);

    })

    /**
     * @tc.name   testToDecimalPlacesRoundHalfUp
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_5500
     * @tc.desc   Testing toDecimalPlaces with ROUND_HALF_UP mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundHalfUp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundHalfUp";

      let a: Decimal = new Decimal(1.235);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_HALF_UP);
      expect(result.toString()).assertEqual("1.24");
      expect(result.d.toString()).assertEqual("1,2400000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToDecimalPlacesRoundHalfDown
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_5600
     * @tc.desc   Testing toDecimalPlaces with ROUND_HALF_DOWN mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundHalfDown', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundHalfDown";

      let a: Decimal = new Decimal(1.235);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_HALF_DOWN);
      expect(result.toString()).assertEqual("1.23");
      expect(result.d.toString()).assertEqual("1,2300000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToDecimalPlacesRoundHalfEven
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_5700
     * @tc.desc   Testing toDecimalPlaces with ROUND_HALF_EVEN mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundHalfEven', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundHalfEven";

      let a: Decimal = new Decimal(1.225);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_HALF_EVEN);
      expect(result.toString()).assertEqual("1.22");
      expect(result.d.toString()).assertEqual("1,2200000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToDecimalPlacesRoundHalfCeiling
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_5800
     * @tc.desc   Testing toDecimalPlaces with ROUND_HALF_CEILING mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundHalfCeiling', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundHalfCeiling";

      let a: Decimal = new Decimal(1.235);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_HALF_CEILING);
      expect(result.toString()).assertEqual("1.24");
      expect(result.d.toString()).assertEqual("1,2400000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToDecimalPlacesRoundHalfFloor
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_5900
     * @tc.desc   Testing toDecimalPlaces with ROUND_HALF_FLOOR mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesRoundHalfFloor', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesRoundHalfFloor";

      let a: Decimal = new Decimal(1.235);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_HALF_FLOOR);
      expect(result.toString()).assertEqual("1.23");
      expect(result.d.toString()).assertEqual("1,2300000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToDecimalPlacesEuclidean
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_6000
     * @tc.desc   Testing toDecimalPlaces with EUCLIDEAN mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesEuclidean', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesEuclidean";

      let a: Decimal = new Decimal(1.234);
      let result = a.toDecimalPlaces(2, Decimal.ROUND_HALF_FLOOR);
      expect(result.toString()).assertEqual("1.23");
      expect(result.d.toString()).assertEqual("1,2300000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToSignificantDigitsRoundUp
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_6100
     * @tc.desc   Testing toSignificantDigits with ROUND_UP mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToSignificantDigitsRoundUp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToSignificantDigitsRoundUp";

      let a: Decimal = new Decimal(123.456);
      let result = a.toSignificantDigits(4, Decimal.ROUND_UP);
      expect(result.toString()).assertEqual("123.5");
      expect(result.d.toString()).assertEqual("123,5000000");
      expect(result.e).assertEqual(2);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToSignificantDigitsRoundDown
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_6200
     * @tc.desc   Testing toSignificantDigits with ROUND_DOWN mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToSignificantDigitsRoundDown', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToSignificantDigitsRoundDown";

      let a: Decimal = new Decimal(123.456);
      let result = a.toSignificantDigits(4, Decimal.ROUND_DOWN);
      expect(result.toString()).assertEqual("123.4");
      expect(result.d.toString()).assertEqual("123,4000000");
      expect(result.e).assertEqual(2);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToSignificantDigitsRoundHalfUp
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_6300
     * @tc.desc   Testing toSignificantDigits with ROUND_HALF_UP mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToSignificantDigitsRoundHalfUp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToSignificantDigitsRoundHalfUp";

      let a: Decimal = new Decimal(123.456);
      let result = a.toSignificantDigits(4, Decimal.ROUND_HALF_UP);
      expect(result.toString()).assertEqual("123.5");
      expect(result.d.toString()).assertEqual("123,5000000");
      expect(result.e).assertEqual(2);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToNearestRoundUp
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_6400
     * @tc.desc   Testing toNearest with ROUND_UP mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToNearestRoundUp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToNearestRoundUp";

      let a: Decimal = new Decimal(1.23);
      let result = a.toNearest(0.1, Decimal.ROUND_UP);
      expect(result.toString()).assertEqual("1.3");
      expect(result.d.toString()).assertEqual("1,3000000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToNearestRoundDown
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_6500
     * @tc.desc   Testing toNearest with ROUND_DOWN mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToNearestRoundDown', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToNearestRoundDown";

      let a: Decimal = new Decimal(1.23);
      let result = a.toNearest(0.1, Decimal.ROUND_DOWN);
      expect(result.toString()).assertEqual("1.2");
      expect(result.d.toString()).assertEqual("1,2000000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToNearestRoundHalfUp
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_6600
     * @tc.desc   Testing toNearest with ROUND_HALF_UP mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToNearestRoundHalfUp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToNearestRoundHalfUp";

      let a: Decimal = new Decimal(1.25);
      let result = a.toNearest(0.1, Decimal.ROUND_HALF_UP);
      expect(result.toString()).assertEqual("1.3");
      expect(result.d.toString()).assertEqual("1,3000000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);

    })

    /**
     * @tc.name   testToNearestRoundHalfDown
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_6700
     * @tc.desc   Testing toNearest with ROUND_HALF_DOWN mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToNearestRoundHalfDown', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToNearestRoundHalfDown";
      let a: Decimal = new Decimal(1.25);
      let result = a.toNearest(0.1, Decimal.ROUND_HALF_DOWN);
      expect(result.toString()).assertEqual("1.2");
      expect(result.d.toString()).assertEqual("1,2000000");
      expect(result.e).assertEqual(0);
      expect(result.s).assertEqual(1);
    })

    /**
     * @tc.name   testToFractionValid
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_6800
     * @tc.desc   Testing toFraction with valid parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToFractionValid', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToFractionValid";

      let a: Decimal = new Decimal(0.5);
      let result = a.toFraction(10);
      expect(result.length).assertEqual(2);
      expect(result[0].toString()).assertEqual("1");
      expect(result[0].d.toString()).assertEqual("1");
      expect(result[0].e).assertEqual(0);
      expect(result[0].s).assertEqual(1);
      expect(result[1].toString()).assertEqual("2");
      expect(result[1].d.toString()).assertEqual("2");
      expect(result[1].e).assertEqual(0);
      expect(result[1].s).assertEqual(1);

    })

    /**
     * @tc.name   testToFractionEmptyString
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_6900
     * @tc.desc   Testing toFraction with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToFractionEmptyString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToFractionEmptyString";
      try {
        let a: Decimal = new Decimal(0.5);
        let result = a.toFraction("");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401)
      }
    })

  })
}
