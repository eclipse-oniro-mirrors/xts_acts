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

let TAG = "DecimalComprehensiveTest";

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function Decimal4Test() {
  describe('Decimal4Test', () => {
    afterEach(async (done: Function) => {
      await sleep(20);
      done();
    })

    /**
     * @tc.name   testToBinaryDefault
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_7000
     * @tc.desc   Testing toBinary without parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToBinaryDefault', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        maxE: 9e15,
        minE: -9e15,
        modulo: 1,
        crypto: false,
        defaults: true
      });
      TAG = "testToBinaryDefault";
      let data: Decimal = new Decimal(256);
      let result: string = data.toBinary();
      expect(result).assertEqual("0b100000000");
    })

    /**
     * @tc.name   testToBinaryWithDigits
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_7100
     * @tc.desc   Testing toBinary with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToBinaryWithDigits', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToBinaryWithDigits";
      let data: Decimal = new Decimal(256);
      let result: string = data.toBinary(1);
      expect(result).assertEqual("0b1p+8");
    })

    /**
     * @tc.name   testToBinaryWithDigitsAndRounding
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_7200
     * @tc.desc   Testing toBinary with significantDigits and rounding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToBinaryWithDigitsAndRounding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToBinaryWithDigitsAndRounding";
      let data: Decimal = new Decimal(256);
      let result: string = data.toBinary(1, Decimal.ROUND_HALF_UP);
      expect(result).assertEqual("0b1p+8");
    })

    /**
     * @tc.name   testToOctalDefault
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_7300
     * @tc.desc   Testing toOctal without parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToOctalDefault', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToOctalDefault";
      let data: Decimal = new Decimal(256);
      let result: string = data.toOctal();
      expect(result).assertEqual("0o400");
    })

    /**
     * @tc.name   testToOctalWithDigits
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_7400
     * @tc.desc   Testing toOctal with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToOctalWithDigits', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToOctalWithDigits";
      let data: Decimal = new Decimal(256);
      let result: string = data.toOctal(1);
      expect(result).assertEqual("0o1p+8");
    })

    /**
     * @tc.name   testToOctalWithDigitsAndRounding
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_7500
     * @tc.desc   Testing toOctal with significantDigits and rounding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToOctalWithDigitsAndRounding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToOctalWithDigitsAndRounding";
      let data: Decimal = new Decimal(256);
      let result: string = data.toOctal(1, Decimal.ROUND_HALF_UP);
      expect(result).assertEqual("0o1p+8");
    })

    /**
     * @tc.name   testToHexadecimalDefault
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_7600
     * @tc.desc   Testing toHexadecimal without parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToHexadecimalDefault', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToHexadecimalDefault";
      let data: Decimal = new Decimal(256);
      let result: string = data.toHexadecimal();
      expect(result).assertEqual("0x100");
    })

    /**
     * @tc.name   testToHexadecimalWithDigits
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_7700
     * @tc.desc   Testing toHexadecimal with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToHexadecimalWithDigits', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToHexadecimalWithDigits";
      let data: Decimal = new Decimal(256);
      let result: string = data.toHexadecimal(1);
      expect(result).assertEqual("0x1p+8");
    })

    /**
     * @tc.name   testToHexadecimalWithDigitsAndRounding
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_7800
     * @tc.desc   Testing toHexadecimal with significantDigits and rounding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToHexadecimalWithDigitsAndRounding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToHexadecimalWithDigitsAndRounding";
      let data: Decimal = new Decimal(256);
      let result: string = data.toHexadecimal(1, Decimal.ROUND_HALF_UP);
      expect(result).assertEqual("0x1p+8");
    })

    /**
     * @tc.name   testToExponentialDefault
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_7900
     * @tc.desc   Testing toExponential without parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToExponentialDefault', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToExponentialDefault";
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toExponential();
      expect(result).assertEqual("4.56e+1");
    })

    /**
     * @tc.name   testToExponentialWithDecimalPlaces
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_8000
     * @tc.desc   Testing toExponential with decimalPlaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToExponentialWithDecimalPlaces', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToExponentialWithDecimalPlaces";
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toExponential(1);
      expect(result).assertEqual("4.6e+1");
    })

    /**
     * @tc.name   testToExponentialWithDecimalPlacesAndRounding
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_8100
     * @tc.desc   Testing toExponential with decimalPlaces and rounding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToExponentialWithDecimalPlacesAndRounding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToExponentialWithDecimalPlacesAndRounding";
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toExponential(1, Decimal.ROUND_DOWN);
      expect(result).assertEqual("4.5e+1");
    })

    /**
     * @tc.name   testToDecimalPlacesDefault
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_8200
     * @tc.desc   Testing toDecimalPlaces without parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesDefault', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesDefault";
      let data: Decimal = new Decimal(12.34567);
      let result: Decimal = data.toDecimalPlaces();
      expect(result.toString()).assertEqual("12.34567");
    })

    /**
     * @tc.name   testToDecimalPlacesWithDecimalPlaces
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_8300
     * @tc.desc   Testing toDecimalPlaces with decimalPlaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesWithDecimalPlaces', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesWithDecimalPlaces";
      let data: Decimal = new Decimal(9876.54321);
      let result: Decimal = data.toDecimalPlaces(3);
      expect(result.toString()).assertEqual("9876.543");
    })

    /**
     * @tc.name   testToDecimalPlacesWithDecimalPlacesAndRounding
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_8400
     * @tc.desc   Testing toDecimalPlaces with decimalPlaces and rounding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlacesWithDecimalPlacesAndRounding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToDecimalPlacesWithDecimalPlacesAndRounding";
      let data: Decimal = new Decimal(9876.54321);
      let result: Decimal = data.toDecimalPlaces(1, Decimal.ROUND_DOWN);
      expect(result.toString()).assertEqual("9876.5");
    })

    /**
     * @tc.name   testToPrecisionDefault
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_8500
     * @tc.desc   Testing toPrecision without parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToPrecisionDefault', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToPrecisionDefault";
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toPrecision();
      expect(result).assertEqual("45.6");
    })

    /**
     * @tc.name   testToPrecisionWithSignificantDigits
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_8600
     * @tc.desc   Testing toPrecision with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToPrecisionWithSignificantDigits', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToPrecisionWithSignificantDigits";
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toPrecision(1);
      expect(result).assertEqual("5e+1");
    })

    /**
     * @tc.name   testToPrecisionWithSignificantDigitsAndRounding
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_8700
     * @tc.desc   Testing toPrecision with significantDigits and rounding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToPrecisionWithSignificantDigitsAndRounding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToPrecisionWithSignificantDigitsAndRounding";
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toPrecision(2, Decimal.ROUND_UP);
      expect(result).assertEqual("46");
    })

    /**
     * @tc.name   testToSignificantDigitsDefault
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_8800
     * @tc.desc   Testing toSignificantDigits without parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToSignificantDigitsDefault', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToSignificantDigitsDefault";
      let data: Decimal = new Decimal(987.654321);
      let result: Decimal = data.toSignificantDigits();
      expect(result.toString()).assertEqual("987.654321");
    })

    /**
     * @tc.name   testToSignificantDigitsWithSignificantDigits
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_8900
     * @tc.desc   Testing toSignificantDigits with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToSignificantDigitsWithSignificantDigits', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToSignificantDigitsWithSignificantDigits";
      let data: Decimal = new Decimal(987.654321);
      let result: Decimal = data.toSignificantDigits(6);
      expect(result.toString()).assertEqual("987.654");
    })

    /**
     * @tc.name   testToSignificantDigitsWithSignificantDigitsAndRounding
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_9000
     * @tc.desc   Testing toSignificantDigits with significantDigits and rounding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToSignificantDigitsWithSignificantDigitsAndRounding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        TAG = "testToSignificantDigitsWithSignificantDigitsAndRounding";
        let data: Decimal = new Decimal(987.654321);
        let result: Decimal = data.toSignificantDigits(6, Decimal.ROUND_UP);
        expect(result.toString()).assertEqual("987.655");
      })

    /**
     * @tc.name   testToNumber
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_9100
     * @tc.desc   Testing toNumber
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToNumber";
      let data: Decimal = new Decimal(456.789);
      let result: number = data.toNumber();
      expect(result).assertEqual(456.789);
    })

    /**
     * @tc.name   testToString
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_9200
     * @tc.desc   Testing toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tctc.level  LEVEL1
     */
    it('testToString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToString";
      let data: Decimal = new Decimal(750000);
      let result: string = data.toString();
      expect(result).assertEqual("750000");
    })

    /**
     * @tc.name   testValueOf
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_9300
     * @tc.desc   Testing valueOf
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testValueOf', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testValueOf";
      let data: Decimal = new Decimal(-0);
      let result: string = data.valueOf();
      expect(result).assertEqual("-0");
    })

    /**
     * @tc.name   testDecimalPlaces
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_9400
     * @tc.desc   Testing decimalPlaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testDecimalPlaces', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testDecimalPlaces";
      let data: Decimal = new Decimal(1.234);
      let result: number = data.decimalPlaces();
      expect(result).assertEqual(3);
    })

    /**
     * @tc.name   testPrecisionDefault
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_9500
     * @tc.desc   Testing precision without parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testPrecisionDefault', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testPrecisionDefault";
      let data: Decimal = new Decimal(1.234);
      let result: number = data.precision();
      expect(result).assertEqual(4);
    })

    /**
     * @tc.name   testPrecisionWithIncludeZeros
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_9600
     * @tc.desc   Testing precision with includeZeros
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testPrecisionWithIncludeZeros', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testPrecisionWithIncludeZeros";
      let data: Decimal = new Decimal(987000);
      let result: number = data.precision(true);
      expect(result).assertEqual(6);
    })

    /**
     * @tc.name   testLessThan
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_9700
     * @tc.desc   Testing lessThan
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLessThan', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLessThan";
      let data: Decimal = new Decimal(10);
      let result: boolean = data.lessThan(5);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testLessThanOrEqualTo
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_9800
     * @tc.desc   Testing lessThanOrEqualTo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLessThanOrEqualTo', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLessThanOrEqualTo";
      let data: Decimal = new Decimal(10);
      let result: boolean = data.lessThanOrEqualTo(10);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testNegate
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_9900
     * @tc.desc   Testing negate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testNegate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testNegate";
      let data: Decimal = new Decimal(1.8);
      let result: Decimal = data.negate();
      expect(result.toString()).assertEqual("-1.8");
    })

    /**
     * @tc.name   testStaticAbs
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_10000
     * @tc.desc   Testing static abs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAbs', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticAbs";
      let result: Decimal = Decimal.abs(-0.5);
      expect(result.toString()).assertEqual("0.5");
    })

    /**
     * @tc.name   testStaticFloor
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_10100
     * @tc.desc   Testing static floor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticFloor', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticFloor";
      let result: Decimal = Decimal.floor(1.8);
      expect(result.toString()).assertEqual("1");
    })

    /**
     * @tc.name   testStaticCeil
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_10200
     * @tc.desc   Testing static ceil
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticCeil', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticCeil";
      let result: Decimal = Decimal.ceil(1.8);
      expect(result.toString()).assertEqual("2");
    })

    /**
     * @tc.name   testStaticTrunc
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_10300
     * @tc.desc   Testing static trunc
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticTrunc', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticTrunc";
      let result: Decimal = Decimal.trunc(2.5);
      expect(result.toString()).assertEqual("2");
    })

    /**
     * @tc.name   testStaticClamp
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_10400
     * @tc.desc   Testing static clamp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticClamp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticClamp";
      let result: Decimal = Decimal.clamp(10.1, 0, 10);
      expect(result.toString()).assertEqual("10");
    })

    /**
     * @tc.name   testStaticAdd
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_10500
     * @tc.desc   Testing static add
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAdd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticAdd";
      let result: Decimal = Decimal.add(0.5, 0.5);
      expect(result.toString()).assertEqual("1");
    })

    /**
     * @tc.name   testStaticSub
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_10600
     * @tc.desc   Testing static sub
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSub', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticSub";
      let result: Decimal = Decimal.sub(1, 0.5);
      expect(result.toString()).assertEqual("0.5");
    })

    /**
     * @tc.name   testStaticMul
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_10700
     * @tc.desc   Testing static mul
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticMul', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticMul";
      let result: Decimal = Decimal.mul(1, 0.5);
      expect(result.toString()).assertEqual("0.5");
    })

    /**
     * @tc.name   testStaticDiv
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_10800
     * @tc.desc   Testing static div
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticDiv', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticDiv";
      let result: Decimal = Decimal.div(1, 0.5);
      expect(result.toString()).assertEqual("2");
    })

    /**
     * @tc.name   testStaticMod
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_10900
     * @tc.desc   Testing static mod
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticMod', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticMod";
      let result: Decimal = Decimal.mod(2, 1);
      expect(result.toString()).assertEqual("0");
    })

    /**
     * @tc.name   testStaticSqrt
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_11000
     * @tc.desc   Testing static sqrt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSqrt', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticSqrt";
      let result: Decimal = Decimal.sqrt(3);
      expect(result.toString()).assertEqual("1.7320508075688772935");
    })

    /**
     * @tc.name   testStaticCbrt
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_11100
     * @tc.desc   Testing static cbrt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticCbrt', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticCbrt";
      let result: Decimal = Decimal.cbrt(3);
      expect(result.toString()).assertEqual("1.4422495703074083823");
    })

    /**
     * @tc.name   testStaticPow
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_11200
     * @tc.desc   Testing static pow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticPow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticPow";
      let result: Decimal = Decimal.pow(3, -2);
      expect(result.toString()).assertEqual("0.11111111111111111111");
    })

    /**
     * @tc.name   testStaticExp
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_11300
     * @tc.desc   Testing static exp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticExp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticExp";
      let result: Decimal = Decimal.exp(2);
      expect(result.toString()).assertEqual("7.3890560989306502272");
    })

    /**
     * @tc.name   testStaticLog
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_11400
     * @tc.desc   Testing static log
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticLog', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticLog";
      let result: Decimal = Decimal.log(2, 256);
      expect(result.toString()).assertEqual("0.125");
    })

    /**
     * @tc.name   testStaticLn
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_11500
     * @tc.desc   Testing static ln
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticLn', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticLn";
      let result: Decimal = Decimal.ln(1.23e+30);
      expect(result.toString()).assertEqual("69.284566959205696648");
    })

    /**
     * @tc.name   testStaticCos
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_11600
     * @tc.desc   Testing static cos
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticCos', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticCos";
      let result: Decimal = Decimal.cos(-0.25);
      expect(result.toString()).assertEqual("0.96891242171064478414");
    })

    /**
     * @tc.name   testStaticSin
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_11700
     * @tc.desc   Testing static sin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSin', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticSin";
      let result: Decimal = Decimal.sin(0.75);
      expect(result.toString()).assertEqual("0.68163876002333416673");
    })

    /**
     * @tc.name   testStaticTan
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_11800
     * @tc.desc   Testing static tan
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticTan', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticTan";
      let result: Decimal = Decimal.tan(0.75);
      expect(result.toString()).assertEqual("0.93159645994407246117");
    })

    /**
     * @tc.name   testStaticCosh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_11900
     * @tc.desc   Testing static cosh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticCosh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticCosh";
      let result: Decimal = Decimal.cosh(0.5);
      expect(result.toString()).assertEqual("1.1276259652063807852");
    })

    /**
     * @tc.name   testStaticSinh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_12000
     * @tc.desc   Testing static sinh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSinh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticSinh";
      let result: Decimal = Decimal.sinh(0.5);
      expect(result.toString()).assertEqual("0.52109530549374736162");
    })

    /**
     * @tc.name   testStaticTanh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_12100
     * @tc.desc   Testing static tanh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticTanh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticTanh";
      let result: Decimal = Decimal.tanh(0.5);
      expect(result.toString()).assertEqual("0.4621171572600097585");
    })

    /**
     * @tc.name   testStaticAcos
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_12200
     * @tc.desc   Testing static acos
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAcos', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticAcos";
      let result: Decimal = Decimal.acos(0.5);
      expect(result.toString()).assertEqual("1.0471975511965977462");
    })

    /**
     * @tc.name   testStaticAsin
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_12300
     * @tc.desc   Testing static asin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAsin', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticAsin";
      let result: Decimal = Decimal.asin(0.75);
      expect(result.toString()).assertEqual("0.84806207898148100805");
    })

    /**
     * @tc.name   testStaticAtan
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_12400
     * @tc.desc   Testing static atan
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAtan', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticAtan";
      let result: Decimal = Decimal.atan(0.75);
      expect(result.toString()).assertEqual("0.6435011087932843868");
    })

    /**
     * @tc.name   testStaticAcosh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_12500
     * @tc.desc   Testing static acosh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAcosh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticAcosh";
      let result: Decimal = Decimal.acosh(50);
      expect(result.toString()).assertEqual("4.6050701709847571595");
    })

    /**
     * @tc.name   testStaticAsinh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_12600
     * @tc.desc   Testing static asinh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAsinh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticAsinh";
      let result: Decimal = Decimal.asinh(50);
      expect(result.toString()).assertEqual("4.6052701709914238266");
    })

    /**
     * @tc.name   testStaticAtanh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_12700
     * @tc.desc   Testing static atanh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAtanh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticAtanh";
      let result: Decimal = Decimal.atanh(0.75);
      expect(result.toString()).assertEqual("0.97295507452765665255");
    })

    /**
     * @tc.name   testStaticSign
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_12800
     * @tc.desc   Testing static sign
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSign', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticSign";
      let result1: number = Decimal.sign(2);
      expect(result1).assertEqual(1);
      let result2: number = Decimal.sign(-3);
      expect(result2).assertEqual(-1);
      let result3: number = Decimal.sign(0);
      expect(result3).assertEqual(0);
    })

    /**
     * @tc.name   testStaticRound
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_12900
     * @tc.desc   Testing static round
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStaticRound', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testStaticRound";
      let result: Decimal = Decimal.round(3.3333333333333);
      expect(result.toString()).assertEqual("3");
    })

    /**
     * @tc.name   testSetConfig
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_13000
     * @tc.desc   Testing set config
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetConfig', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSetConfig";
      let data: Decimal = new Decimal(1.2345678901234567);
      Decimal.set({
        precision: 5,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 7,
        maxE: 9e15,
        minE: -9e15,
        modulo: 1,
        crypto: false
      });
      let data1: Decimal = data.add(0.5);
      expect(data1.toString()).assertEqual("1.7346");
    })

    /**
     * @tc.name   testSetDefaults
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_13100
     * @tc.desc   Testing set defaults
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetDefaults', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSetDefaults";
      Decimal.set({ defaults: true });
      let data: Decimal = new Decimal(1.2345678901234567);
      let data1: Decimal = data.add(0.5);
      expect(data1.toString()).assertEqual("1.7345678901234567");
    })

    /**
     * @tc.name   testConstructorWithNumber
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_13200
     * @tc.desc   Testing constructor with number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConstructorWithNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConstructorWithNumber";
      let data: Decimal = new Decimal(5);
      expect(data.toString()).assertEqual("5");
    })

    /**
     * @tc.name   testConstructorWithString
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_13300
     * @tc.desc   Testing constructor with string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConstructorWithString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConstructorWithString";
      let data: Decimal = new Decimal("5.5");
      expect(data.toString()).assertEqual("5.5");
    })

    /**
     * @tc.name   testConstructorWithDecimal
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_13400
     * @tc.desc   Testing constructor with Decimal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConstructorWithDecimal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConstructorWithDecimal";
      let data1: Decimal = new Decimal(5);
      let data: Decimal = new Decimal(data1);
      expect(data.toString()).assertEqual("5");
    })

    /**
     * @tc.name   testPropertiesDE
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_13500
     * @tc.desc   Testing properties d, e, s
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testPropertiesDE', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testPropertiesDE";
      let data: Decimal = new Decimal(123.456);
      expect(data.d.toString()).assertEqual("123,4560000");
      expect(data.e).assertEqual(2);
      expect(data.s).assertEqual(1);
    })

    /**
     * @tc.name   testConstants
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_13600
     * @tc.desc   Testing constants
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConstants', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConstants";
      expect(Decimal.ROUND_UP).assertEqual(0);
      expect(Decimal.ROUND_DOWN).assertEqual(1);
      expect(Decimal.ROUND_CEILING).assertEqual(2);
      expect(Decimal.ROUND_FLOOR).assertEqual(3);
      expect(Decimal.ROUND_HALF_UP).assertEqual(4);
      expect(Decimal.ROUND_HALF_DOWN).assertEqual(5);
      expect(Decimal.ROUND_HALF_EVEN).assertEqual(6);
      expect(Decimal.ROUND_HALF_CEILING).assertEqual(7);
      expect(Decimal.ROUND_HALF_FLOOR).assertEqual(8);
      expect(Decimal.EUCLIDEAN).assertEqual(9);
    })

    /**
     * @tc.name   testAbs
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_13700
     * @tc.desc   Testing abs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAbs', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAbs";
      let data: Decimal = new Decimal(-0.5);
      let result: Decimal = data.abs();
      expect(result.toString()).assertEqual("0.5");
    })

    /**
     * @tc.name   testFloor
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_13800
     * @tc.desc   Testing floor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFloor', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFloor";
      let data: Decimal = new Decimal(1.8);
      let result: Decimal = data.floor();
      expect(result.toString()).assertEqual("1");
    })

    /**
     * @tc.name   testCeil
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_13900
     * @tc.desc   Testing ceil
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCeil', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCeil";
      let data: Decimal = new Decimal(1.8);
      let result: Decimal = data.ceil();
      expect(result.toString()).assertEqual("2");
    })

    /**
     * @tc.name   testTrunc
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_14000
     * @tc.desc   Testing trunc
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTrunc', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTrunc";
      let data: Decimal = new Decimal(2.5);
      let result: Decimal = data.trunc();
      expect(result.toString()).assertEqual("2");
    })

    /**
     * @tc.name   testSqrt
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_14100
     * @tc.desc   Testing sqrt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSqrt', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSqrt";
      let data: Decimal = new Decimal(3);
      let result: Decimal = data.sqrt();
      expect(result.toString()).assertEqual("1.7320508075688772935");
    })

    /**
     * @tc.name   testCbrt
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_14200
     * @tc.desc   Testing cbrt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCbrt', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCbrt";
      let data: Decimal = new Decimal(3);
      let result: Decimal = data.cbrt();
      expect(result.toString()).assertEqual("1.4422495703074083823");
    })

    /**
     * @tc.name   testExp
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_14300
     * @tc.desc   Testing exp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testExp";
      let data: Decimal = new Decimal(2);
      let result: Decimal = data.exp();
      expect(result.toString()).assertEqual("7.3890560989306502272");
    })

    /**
     * @tc.name   testLn
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_14400
     * @tc.desc   Testing ln
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLn', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLn";
      let data: Decimal = new Decimal(1.23e+30);
      let result: Decimal = data.ln();
      expect(result.toString()).assertEqual("69.284566959205696648");
    })

    /**
     * @tc.name   testCos
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_14500
     * @tc.desc   Testing cos
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCos', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCos";
      let data: Decimal = new Decimal(-0.25);
      let result: Decimal = data.cos();
      expect(result.toString()).assertEqual("0.96891242171064478414");
    })

    /**
     * @tc.name   testSin
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_14600
     * @tc.desc   Testing sin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSin', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSin";
      let data: Decimal = new Decimal(0.75);
      let result: Decimal = data.sin();
      expect(result.toString()).assertEqual("0.68163876002333416673");
    })

    /**
     * @tc.name   testTan
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_14700
     * @tc.desc   Testing tan
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTan', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTan";
      let data: Decimal = new Decimal(0.75);
      let result: Decimal = data.tan();
      expect(result.toString()).assertEqual("0.93159645994407246117");
    })

    /**
     * @tc.name   testCosh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_14800
     * @tc.desc   Testing cosh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCosh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCosh";
      let data: Decimal = new Decimal(0.5);
      let result: Decimal = data.cosh();
      expect(result.toString()).assertEqual("1.1276259652063807852");
    })

    /**
     * @tc.name   testSinh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_14900
     * @tc.desc   Testing sinh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSinh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSinh";
      let data: Decimal = new Decimal(0.5);
      let result: Decimal = data.sinh();
      expect(result.toString()).assertEqual("0.52109530549374736162");
    })

    /**
     * @tc.name   testTanh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_15000
     * @tc.desc   Testing tanh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTanh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTanh";
      let data: Decimal = new Decimal(0.5);
      let result: Decimal = data.tanh();
      expect(result.toString()).assertEqual("0.4621171572600097585");
    })

    /**
     * @tc.name   testAcos
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_15100
     * @tc.desc   Testing acos
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAcos', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAcos";
      let data: Decimal = new Decimal(0.5);
      let result: Decimal = data.acos();
      expect(result.toString()).assertEqual("1.0471975511965977462");
    })

    /**
     * @tc.name   testAsin
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_15200
     * @tc.desc   Testing asin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAsin', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAsin";
      let data: Decimal = new Decimal(0.75);
      let result: Decimal = data.asin();
      expect(result.toString()).assertEqual("0.84806207898148100805");
    })

    /**
     * @tc.name   testAtan
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_15300
     * @tc.desc   Testing atan
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAtan', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAtan";
      let data: Decimal = new Decimal(0.75);
      let result: Decimal = data.atan();
      expect(result.toString()).assertEqual("0.6435011087932843868");
    })

    /**
     * @tc.name   testAcosh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_15400
     * @tc.desc   Testing acosh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAcosh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAcosh";
      let data: Decimal = new Decimal(50);
      let result: Decimal = data.acosh();
      expect(result.toString()).assertEqual("4.6050701709847571595");
    })

    /**
     * @tc.name   testAsinh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_15500
     * @tc.desc   Testing asinh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAsinh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAsinh";
      let data: Decimal = new Decimal(50);
      let result: Decimal = data.asinh();
      expect(result.toString()).assertEqual("4.6052701709914238266");
    })

    /**
     * @tc.name   testAtanh
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_15600
     * @tc.desc   Testing atanh
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAtanh', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAtanh";
      let data: Decimal = new Decimal(0.75);
      let result: Decimal = data.atanh();
      expect(result.toString()).assertEqual("0.97295507452765665255");
    })

  })
}
