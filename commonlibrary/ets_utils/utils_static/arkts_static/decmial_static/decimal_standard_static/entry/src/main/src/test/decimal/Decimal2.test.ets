/*
* Copyright (c) 2024-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with License.
* You may obtain a copy of License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import {
  describe, expect, it, Level, Size, TestType
} from '../../../../hypium/index';
import { Decimal } from '@kit.ArkTS';

export default function DecimalTest() {
  describe('DecimalTest', (): void => {

    /**
     * @tc.name   testConstructor001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_CONSTRUCTOR_0100
     * @tc.desc   Test Decimal constructor with number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
      let data: Decimal = new Decimal(5);
      expect(data.toString()).assertEqual('5');
    });

    /**
     * @tc.name   testConstructor002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_CONSTRUCTOR_0200
     * @tc.desc   Test Decimal constructor with string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal('123.456');
      expect(data.toString()).assertEqual('123.456');
    });

    /**
     * @tc.name   testConstructor003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_CONSTRUCTOR_0300
     * @tc.desc   Test Decimal constructor with Decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data1: Decimal = new Decimal(10.5);
      let data2: Decimal = new Decimal(data1);
      expect(data2.toString()).assertEqual('10.5');
    });

    /**
     * @tc.name   testAbs001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_ABS_0100
     * @tc.desc   Test abs method with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(-0.5).abs();
      expect(data.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name   testAbs002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_ABS_0200
     * @tc.desc   Test abs method with positive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.5).abs();
      expect(data.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name   testFloor001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_FLOOR_0100
     * @tc.desc   Test floor method with positive decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1.8).floor();
      expect(data.toString()).assertEqual('1');
    });

    /**
     * @tc.name   testFloor002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_FLOOR_0200
     * @tc.desc   Test floor method with negative decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFloor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(-1.8).floor();
      expect(data.toString()).assertEqual('-2');
    });

    /**
     * @tc.name   testCeil001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_CEIL_0100
     * @tc.desc   Test ceil method with positive decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCeil001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1.8).ceil();
      expect(data.toString()).assertEqual('2');
    });

    /**
     * @tc.name   testCeil002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_CEIL_0200
     * @tc.desc   Test ceil method with negative decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCeil002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(-1.8).ceil();
      expect(data.toString()).assertEqual('-1');
    });

    /**
     * @tc.name   testTrunc001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TRUNC_0100
     * @tc.desc   Test trunc method with positive decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTrunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(2.5).trunc();
      expect(data.toString()).assertEqual('2');
    });

    /**
     * @tc.name   testTrunc002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TRUNC_0200
     * @tc.desc   Test trunc method with negative decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTrunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(-2.5).trunc();
      expect(data.toString()).assertEqual('-2');
    });

    /**
     * @tc.name   testClamp001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_CLAMP_0100
     * @tc.desc   Test clamp method with value in range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClamp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(5).clamp(0, 10);
      expect(data.toString()).assertEqual('5');
    });

    /**
     * @tc.name   testClamp002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_CLAMP_0200
     * @tc.desc   Test clamp method with value above max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClamp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(10.1).clamp(0, 10);
      expect(data.toString()).assertEqual('10');
    });

    /**
     * @tc.name   testClamp003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_CLAMP_0300
     * @tc.desc   Test clamp method with value below min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClamp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(-1).clamp(0, 10);
      expect(data.toString()).assertEqual('0');
    });

    /**
     * @tc.name   testAdd001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_ADD_0100
     * @tc.desc   Test add method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.5).add(0.5);
      expect(data.toString()).assertEqual('1');
    });

    /**
     * @tc.name   testSub001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SUB_0100
     * @tc.desc   Test sub method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSub001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1).sub(0.5);
      expect(data.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name   testMul001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_MUL_0100
     * @tc.desc   Test mul method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1).mul(0.5);
      expect(data.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name   testDiv001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIV_0100
     * @tc.desc   Test div method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1).div(0.5);
      expect(data.toString()).assertEqual('2');
    });

    /**
     * @tc.name   testMod001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_MOD_0100
     * @tc.desc   Test mod method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * * @tc.level  LEVEL1
     */
    it('testMod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(2).mod(1);
      expect(data.toString()).assertEqual('0');
    });

    /**
     * @tc.name   testSqrt001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SQRT_0100
     * @tc.desc   Test sqrt method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSqrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(3).sqrt();
      expect(data.toString()).assertEqual('1.7320508075688772935');
    });

    /**
     * @tc.name   testCbrt001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_CBRT_0100
     * @tc.desc   Test cbrt method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCbrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(3).cbrt();
      expect(data.toString()).assertEqual('1.4422495703074083823');
    });

    /**
     * @tc.name   testPow001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_POW_0100
     * @tc.desc   Test pow method with negative exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(3).pow(-2);
      expect(data.toString()).assertEqual('0.11111111111111111111');
    });

    /**
     * @tc.name   testExp001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_EXP_0100
     * @tc.desc   Test exp method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(2).exp();
      expect(data.toString()).assertEqual('7.3890560989306502272');
    });

    /**
     * @tc.name   testLog001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LOG_0100
     * @tc.desc   Test log method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(2).log(256);
      expect(data.toString()).assertEqual('0.125');
    });

    /**
     * @tc.name   testLn001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LN_0100
     * @tc.desc   Test ln method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1.23e+30).ln();
      expect(data.toString()).assertEqual('69.284566959205696648');
    });

    /**
     * @tc.name   testCos001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COS_0100
     * @tc.desc   Test cos method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(-0.25).cos();
      expect(data.toString()).assertEqual('0.96891242171064478414');
    });

    /**
     * @tc.name   testSin001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SIN_0100
     * @tc.desc   Test sin method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.75).sin();
      expect(data.toString()).assertEqual('0.68163876002333416673');
    });

    /**
     * @tc.name   testTan001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TAN_0100
     * @tc.desc   Test tan method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.75).tan();
      expect(data.toString()).assertEqual('0.93159645994407246117');
    });

    /**
     * @tc.name   testCosh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_COSH_0100
     * @tc.desc   Test cosh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.5).cosh();
      expect(data.toString()).assertEqual('1.1276259652063807852');
    });

    /**
     * @tc.name   testSinh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_SINH_0100
     * @tc.desc   Test sinh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.5).sinh();
      expect(data.toString()).assertEqual('0.52109530549374736162');
    });

    /**
     * @tc.name   testTanh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TANH_0100
     * @tc.desc   Test tanh method

     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.5).tanh();
      expect(data.toString()).assertEqual('0.4621171572600097585');
    });

    /**
     * @tc.name   testAcos001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_ACOS_0100
     * @tc.desc   Test acos method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.5).acos();
      expect(data.toString()).assertEqual('1.0471975511965977462');
    });

    /**
     * @tc.name   testAsin001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_ASIN_0100
     * @tc.desc   Test asin method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.75).asin();
      expect(data.toString()).assertEqual('0.84806207898148100805');
    });

    /**
     * @tc.name   testAtan001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_ATAN_0100
     * @tc.desc   Test atan method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAtan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.75).atan();
      expect(data.toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name   testAcosh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_ACOSH_0100
     * @tc.desc   Test acosh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(50).acosh();
      expect(data.toString()).assertEqual('4.6050701709847571595');
    });

    /**
     * @tc.name   testAsinh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_ASINH_0100
     * @tc.desc   Test asinh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(50).asinh();
      expect(data.toString()).assertEqual('4.6052701709914238266');
    });

    /**
     * @tc.name   testAtanh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_ATANH_0100
     * @tc.desc   Test atanh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAtanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.75).atanh();
      expect(data.toString()).assertEqual('0.97295507452765665255');
    });

    /**
     * @tc.name   testComparedTo001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL2_COMPARED_TO_0100
     * @tc.desc   Test comparedTo method with greater value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(Infinity);
      let data1: Decimal = new Decimal(5);
      let result: double = data.comparedTo(data1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testComparedTo002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL2_COMPARED_TO_0200
     * @tc.desc   Test comparedTo method with less value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(5);
      let result: double = data.comparedTo(10.5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testComparedTo003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL2_COMPARED_TO_0300
     * @tc.desc   Test comparedTo method with equal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComparedTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(5);
      let result: double = data.comparedTo(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testEquals001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL2_EQUALS_0100
     * @tc.desc   Test equals method with equal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(5);
      let result: boolean = data.equals(5);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testEquals002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL1_EQUALS_0200
     * @tc.desc   Test equals method with different value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0);
      let result: boolean = data.equals('1e-324');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGreaterThan001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATER_THAN_0100
     * @tc.desc   Test greaterThan method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGreaterThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.2);
      let result: boolean = data.greaterThan(new Decimal(0.3).sub(0.2));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGreaterThanOrEqualTo001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_GREATER_THAN_OR_EQUAL_0100
     * @tc.desc   Test greaterThanOrEqualTo method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGreaterThanOrEqualTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.3).sub(0.2);
      let result: boolean = data.greaterThanOrEqualTo(0.1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testLessThan001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESS_THAN_0100
     * @tc.desc   Test lessThan method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLessThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.3).sub(0.2);
      let result: boolean = data.lessThan(0.1);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testLessThanOrEqualTo001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_LESS_THAN_OR_EQUAL_0100
     * @tc.desc   Test lessThanOrEqualTo method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc)level  LEVEL1
     */
    it('testLessThanOrEqualTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0.1);
      let result: boolean = data.lessThanOrEqualTo(new Decimal(0.3).sub(0.2));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testIsFinite001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_FINITE_0100
     * @tc.desc   Test isFinite method with finite value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFinite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1);
      let result: boolean = data.isFinite();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testIsFinite002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_FINITE_0200
     * @tc.desc   Test isFinite method with infinite value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFinite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(Infinity);
      let result: boolean = data.isFinite();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testIsInteger001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_INTEGER_0100
     * @tc.desc   Test isInteger method with decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInteger001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(123.456);
      let result: boolean = data.isInteger();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testIsInteger002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_INTEGER_0200
     * @tc.desc   Test isInteger method with integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInteger002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(123);
      let result: boolean = data.isInteger();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testIsNaN001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_NAN_0100
     * @tc.desc   Test isNaN method with NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNaN001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(NaN);
      let result: boolean = data.isNaN();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testIsNaN002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_NAN_0200
     * @tc.desc   Test isNaN method with valid number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNaN002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(5);
      let result: boolean = data.isNaN();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testIsNegative001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_NEGATIVE_0100
     * @tc.desc   Test isNegative method with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNegative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(-5);
      let result: boolean = data.isNegative();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testIsNegative002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_NEGATIVE_0200
     * @tc.desc   Test isNegative method with negative zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNegative002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(-0);
      let result: boolean = data.isNegative();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testIsPositive001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_POSITIVE_0100
     * @tc.desc   Test isPositive method with positive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsPositive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(5);
      let result: boolean = data.isPositive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testIsPositive002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_POSITIVE_0200
     * @tc.desc   Test isPositive method with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsPositive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0);
      let result: boolean = data.isPositive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testIsZero001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_ZERO_0100
     * @tc.desc   Test isZero method with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsZero001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(0);
      let result: boolean = data.isZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testIsZero002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_IS_ZERO_0200
     * @tc.desc   Test isZero method with non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsZero002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(5);
      let result: boolean = data.isZero();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testDividedToIntegerBy001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_DIVIDED_TO_INTEGER_BY_0100
     * @tc.desc   Test dividedToIntegerBy method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDividedToIntegerBy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(5);
      let data1: Decimal = new Decimal(3);
      let result: Decimal = data.dividedToIntegerBy(data1);
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.name   testNegate001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_NEGATE_0100
     * @tc.desc   Test negate method with positive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNegate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1.8).negate();
      expect(data.toString()).assertEqual('-1.8');
    });

    /**
     * @tc.name   testToBinary001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_BINARY_0100
     * @tc.desc   Test toBinary method without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToBinary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(256);
      let result: string = data.toBinary();
      expect(result).assertEqual('0b100000000');
    });

    /**
     * @tc.name   testToBinary002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_BINARY_0200
     * @tc.desc   Test toBinary method with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToBinary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(256);
      let result: string = data.toBinary(1);
      expect(result).assertEqual('0b1p+8');
    });

    /**
     * @tc.name   testToBinary003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_BINARY_0300
     * @tc.desc   Test toBinary method with significantDigits and rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToBinary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(256);
      let result: string = data.toBinary(1, 4);
      expect(result).assertEqual('0b1p+8');
    });

    /**
     * @tc.name   testToOctal001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_OCTAL_0100
     * @tc.desc   Test toOctal method without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToOctal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(256);
      let result: string = data.toOctal();
      expect(result).assertEqual('0o400');
    });

    /**
     * @tc.name   testToOctal002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_OCTAL_0200
     * @tc.desc   Test toOctal method with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToOctal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(256);
      let result: string = data.toOctal(1);
      expect(result).assertEqual('0o1p+8');
    });

    /**
     * @tc.name   testToOctal003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_OCTAL_0300
     * @tc.desc   Test toOctal method with significantDigits and rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToOctal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(256);
      let result: string = data.toOctal(1, 4);
      expect(result).assertEqual('0o1p+8');
    });

    /**
     * @tc.name   testToHexadecimal001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_HEXADECIMAL_0100
     * @tc.desc   Test toHexadecimal method without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToHexadecimal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(256);
      let result: string = data.toHexadecimal();
      expect(result).assertEqual('0x100');
    });

    /**
     * @tc.name   testToHexadecimal002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_HEXADECIMAL_0200
     * @tc.desc   Test toHexadecimal method with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToHexadecimal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(256);
      let result: string = data.toHexadecimal(1);
      expect(result).assertEqual('0x1p+8');
    });

    /**
     * @tc.name   testToHexadecimal003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_HEXADECIMAL_0300
     * @tc.desc   Test toHexadecimal method with significantDigits and rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToHexadecimal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(256);
      let result: string = data.toHexadecimal(1, 4);
      expect(result).assertEqual('0x1p+8');
    });

    /**
     * @tc.name   testToDecimalPlaces001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_0700
     * @tc.desc   Test toDecimalPlaces method without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlaces001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(12.34567);
      let result: Decimal = data.toDecimalPlaces();
      expect(result.toString()).assertEqual('12.34567');
    });

    /**
     * @tc.name   testToDecimalPlaces002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL2_0200
     * @tc.desc   Test toDecimalPlaces method with decimalPlaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlaces002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(9876.54321);
      let result: Decimal = data.toDecimalPlaces(3);
      expect(result.toString()).assertEqual('9876.543');
    });

    /**
     * @tc.name   testToDecimalPlaces003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL2_0300
     * @tc.desc   Test toDecimalPlaces method with decimalPlaces and rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToDecimalPlaces003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(9876.54321);
      let result: Decimal = data.toDecimalPlaces(1, 0);
      expect(result.toString()).assertEqual('9876.6');
    });

    /**
     * @tc.name   testToExponential001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_EXPONENTIAL_0100
     * @tc.desc   Test toExponential method without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToExponential001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toExponential();
      expect(result).assertEqual('4.56e+1');
    });

    /**
     * @tc.name   testToExponential002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_EXPONENTIAL_0200
     * @tc.desc   Test toExponential method with decimalPlaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToExponential002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toExponential(0);
      expect(result).assertEqual('5e+1');
    });

    /**
     * @tc.name   testToExponential003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_EXPONENTIAL_0300
     * @tc.desc   Test toExponential method with decimalPlaces and rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToExponential003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toExponential(1, 1);
      expect(result).assertEqual('4.5e+1');
    });

    /**
     * @tc.name   testToFixed001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_FIXED_0100
     * @tc.desc   Test toFixed method without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToFixed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(3.456);
      let result: string = data.toFixed();
      expect(result).assertEqual('3.456');
    });

    /**
     * @tc.name   testToFixed002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_FIXED_0200
     * @tc.desc   Test toFixed method with decimalPlaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToFixed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(3.456);
      let result: string = data.toFixed(2);
      expect(result).assertEqual('3.46');
    });

    /**
     * @tc.name   testToFixed003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_FIXED_0300
     * @tc.desc   Test toFixed method with decimalPlaces and rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToFixed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(3.456);
      let result: string = data.toFixed(2, 1);
      expect(result).assertEqual('3.45');
    });

    /**
     * @tc.name   testToFraction001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_FRACTION_0100
     * @tc.desc   Test toFraction method without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToFraction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1.75);
      let result: Decimal[] = data.toFraction();
      expect(result[0].toString()).assertEqual('7');
      expect(result[1].toString()).assertEqual('4');
    });

    /**
     * @tc.name   testToFraction002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_FRACTION_0200
     * @tc.desc   Test toFraction method with maxDenominator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToFraction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pi: Decimal = new Decimal('3.14159265358');
      let result: Decimal[] = pi.toFraction(10);
      expect(result[0].toString()).assertEqual('22');
      expect(result[1].toString()).assertEqual('7');
    });

    /**
     * @tc.name   testToNearest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_NEAREST_0100
     * @tc.desc   Test toNearest method without rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToNearest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1.39);
      let result: Decimal = data.toNearest(0.25);
      expect(result.toString()).assertEqual('1.5');
    });

    /**
     * @tc.name   testToNearest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_NEAREST_0200
     * @tc.desc   Test toNearest method with rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToNearest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(9.499);
      let result: Decimal = data.toNearest(0.5, 0);
      expect(result.toString()).assertEqual('9.5');
    });

    /**
     * @tc.name   testToPrecision001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_PRECISION_0100
     * @tc.desc   Test toPrecision method without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToPrecision001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toPrecision();
      expect(result).assertEqual('45.6');
    });

    /**
     * @tc.name   testToPrecision002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_PRECISION_0200
     * @tc.desc   Test toPrecision method with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToPrecision002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toPrecision(1);
      expect(result).assertEqual('5e+1');
    });

    /**
     * @tc.name   testToPrecision003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_PRECISION_0300
     * @tc.desc   Test toPrecision method with significantDigits and rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToPrecision003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(45.6);
      let result: string = data.toPrecision(2, 0);
      expect(result).assertEqual('46');
    });

    /**
     * @tc.name   testToSignificantDigits001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_SIGNIFICANT_DIGITS_0100
     * @tc.desc   Test toSignificantDigits method without parameters
     * * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToSignificantDigits001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(987.654321);
      let result: Decimal = data.toSignificantDigits();
      expect(result.toString()).assertEqual('987.654321');
    });

    /**
     * @tc.name   testToSignificantDigits002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_SIGNIFICANT_DIGITS_0200
     * @tc.desc   Test toSignificantDigits method with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToSignificantDigits002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(987.654321);
      let result: Decimal = data.toSignificantDigits(6);
      expect(result.toString()).assertEqual('987.654');
    });

    /**
     * @tc.name   testToSignificantDigits003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_SIGNIFICANT_DIGITS_0300
     * @tc.desc   Test toSignificantDigits method with significantDigits and rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToSignificantDigits003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(987.654321);
      let result: Decimal = data.toSignificantDigits(6, 0);
      expect(result.toString()).assertEqual('987.655');
    });

    /**
     * @tc.name   testToNumber001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_NUMBER_0100
     * @tc.desc   Test toNumber method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(456.789);
      let result: double = data.toNumber();
      expect(result).assertEqual(456.789);
    });

    /**
     * @tc.name   testToString001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_TO_STRING_0100
     * @tc.desc   Test toString method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(750000);
      let result: string = data.toString();
      expect(result).assertEqual('750000');
    });

    /**
     * @tc.name   testValueOf001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_VALUE_OF_0100
     * @tc.desc   Test valueOf method with negative zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(-0);
      let result: string = data.valueOf();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name   testDecimalPlaces001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL2_0100
     * @tc.desc   Test decimalPlaces method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDecimalPlaces001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1.234);
      let result: double = data.decimalPlaces();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testPrecision001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_PRECISION_0100
     * @tc.desc   Test precision method without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecision001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(1.234);
      let result: double = data.precision();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   testPrecision002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_PRECISION_0200
     * @tc.desc   Test precision method with includeZeros
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPrecision002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = new Decimal(987000);
      let result: double = data.precision(true);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   testStaticAbs001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_ABS_0100
     * @tc.desc   Test static abs method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAbs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.abs(-0.5);
      expect(data.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name   testStaticFloor001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_FLOOR_0100
     * @tc.desc   Test static floor method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticFloor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.floor(1.8);
      expect(data.toString()).assertEqual('1');
    });

    /**
     * @tc.name   testStaticCeil001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_CEIL_0100
     * @tc.desc   Test static ceil method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticCeil001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.ceil(1.8);
      expect(data.toString()).assertEqual('2');
    });

    /**
     * @tc.name   testStaticTrunc001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_TRUNC_0100
     * @tc.desc   Test static trunc method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticTrunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.trunc(2.5);
      expect(data.toString()).assertEqual('2');
    });

    /**
     * @tc.name   testStaticClamp001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_CLAMP_0100
     * @tc.desc   Test static clamp method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticClamp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.clamp(5, 0, 10);
      expect(data.toString()).assertEqual('5');
    });

    /**
     * @tc.name   testStaticAdd001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_ADD_0100
     * @tc.desc   Test static add method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.add(0.5, 0.5);
      expect(data.toString()).assertEqual('1');
    });

    /**
     * @tc.name   testStaticSum001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_SUM_0100
     * @tc.desc   Test static sum method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.sum(1, 2, 3);
      expect(data.toString()).assertEqual('6');
    });

    /**
     * @tc.name   testStaticSub001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_SUB_0100
     * @tc.desc   Test static sub method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSub001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.sub(1, 0.5);
      expect(data.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name   testStaticMul001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_MUL_0100
     * @tc.desc   Test static mul method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticMul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.mul(1, 0.5);
      expect(data.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name   testStaticDiv001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_DIV_0100
     * * @tc.desc   Test static div method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticDiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.div(1, 0.5);
      expect(data.toString()).assertEqual('2');
    });

    /**
     * @tc.name   testStaticMod001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_MOD_0100
     * @tc.desc   Test static mod method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticMod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.mod(2, 1);
      expect(data.toString()).assertEqual('0');
    });

    /**
     * @tc.name   testStaticSqrt001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_SQRT_0100
     * @tc.desc   Test static sqrt method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSqrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.sqrt(3);
      expect(data.toString()).assertEqual('1.7320508075688772935');
    });

    /**
     * @tc.name   testStaticCbrt001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_CBRT_0100
     * @tc.desc   Test static cbrt method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticCbrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.cbrt(3);
      expect(data.toString()).assertEqual('1.4422495703074083823');
    });

    /**
     * @tc.name   testStaticPow001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_POW_0100
     * @tc.desc   Test static pow method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticPow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.pow(3, -2);
      expect(data.toString()).assertEqual('0.11111111111111111111');
    });

    /**
     * @tc.name   testStaticExp001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_EXP_0100
     * @tc.desc   Test static exp method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticExp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.exp(2);
      expect(data.toString()).assertEqual('7.3890560989306502272');
    });

    /**
     * @tc.name   testStaticLog001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_LOG_0100
     * @tc.desc   Test static log method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.log(2, 256);
      expect(data.toString()).assertEqual('0.125');
    });

    /**
     * @tc.name   testStaticLn001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_LN_0100
     * @tc.desc   Test static ln method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticLn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.ln(1.23e+30);
      expect(data.toString()).assertEqual('69.284566959205696648');
    });

    /**
     * @tc.name   testStaticLog2001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_LOG2_0100
     * @tc.desc   Test static log2 method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticLog2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.log2(8);
      expect(data.toString()).assertEqual('3');
    });

    /**
     * @tc.name   testStaticLog10001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_LOG10_0100
     * @tc.desc   Test static log10 method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticLog10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.log10(100);
      expect(data.toString()).assertEqual('2');
    });

    /**
     * @tc.name   testStaticCos001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_COS_0100
     * @tc.desc   Test static cos method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticCos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.cos(-0.25);
      expect(data.toString()).assertEqual('0.96891242171064478414');
    });

    /**
     * @tc.name   testStaticSin001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_SIN_0100
     * @tc.desc   Test static sin method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.sin(0.75);
      expect(data.toString()).assertEqual('0.68163876002333416673');
    });

    /**
     * @tc.name   testStaticTan001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_TAN_0100
     * @tc.desc   Test static tan method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticTan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.tan(0.75);
      expect(data.toString()).assertEqual('0.93159645994407246117');
    });

    /**
     * @tc.name   testStaticCosh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_COSH_0100
     * @tc.desc   Test static cosh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticCosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.cosh(0.5);
      expect(data.toString()).assertEqual('1.1276259652063807852');
    });

    /**
     * @tc.name   testStaticSinh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_SINH_0100
     * @tc.desc   Test static sinh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.sinh(0.5);
      expect(data.toString()).assertEqual('0.52109530549374736162');
    });

    /**
     * @tc.name   testStaticTanh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_TANH_0100
     * @tc.desc   Test static tanh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticTanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.tanh(0.5);
      expect(data.toString()).assertEqual('0.4621171572600097585');
    });

    /**
     * @tc.name   testStaticAcos001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_ACOS_0100
     * @tc.desc   Test static acos method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAcos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.acos(0.5);
      expect(data.toString()).assertEqual('1.0471975511965977462');
    });

    /**
     * @tc.name   testStaticAsin001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_ASIN_0100
     * @tc.desc   Test static asin method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAsin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.asin(0.75);
      expect(data.toString()).assertEqual('0.84806207898148100805');
    });

    /**
     * @tc.name   testStaticAtan001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_ATAN_0100
     * @tc.desc   Test static atan method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAtan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.atan(0.75);
      expect(data.toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name   testStaticAcosh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_ACOSH_0100
     * @tc.desc   Test static acosh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAcosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.acosh(50);
      expect(data.toString()).assertEqual('4.6050701709847571595');
    });

    /**
     * @tc.name   testStaticAsinh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_ASINH_0100
     * @tc.desc   Test static asinh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAsinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.asinh(50);
      expect(data.toString()).assertEqual('4.6052701709914238266');
    });

    /**
     * @tc.name   testStaticAtanh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_ATANH_0100
     * @tc.desc   Test static atanh method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAtanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.atanh(0.75);
      expect(data.toString()).assertEqual('0.97295507452765665255');
    });

    /**
     * @tc.name   testStaticAtan2001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_ATAN2_0100
     * @tc.desc   Test static atan2 method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticAtan2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.atan2(1, 1);
      expect(data.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name   testStaticHypot001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_HYPOT_0100
     * @tc.desc   Test static hypot method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticHypot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.hypot(3, 4);
      expect(data.toString()).assertEqual('5');
    });

    /**
     * @tc.name   testStaticMax001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_MAX_0100
     * @tc.desc   Test static max method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.max(1, 5, 3);
      expect(data.toString()).assertEqual('5');
    });

    /**
     * @tc.name   testStaticMin001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_MIN_0100
     * @tc.desc   Test static min method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticMin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.min(1, 5, 3);
      expect(data.toString()).assertEqual('1');
    });

    /**
     * @tc.name   testStaticRandom001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_RANDOM_0100
     * @tc.desc   Test static random method without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticRandom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.random();
      let result: boolean = data.greaterThanOrEqualTo(0) && data.lessThan(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStaticRandom002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_RANDOM_0200
     * @tc.desc   Test static random method with significantDigits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticRandom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.random(3);
      let result: boolean = data.greaterThanOrEqualTo(0) && data.lessThan(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStaticSign001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_SIGN_0100
     * @tc.desc   Test static sign method with positive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSign001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: double = Decimal.sign(5);
      expect(data).assertEqual(1);
    });

    /**
     * @tc.name   testStaticSign002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_SIGN_0200
     * @tc.desc   Test static sign method with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSign002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: double = Decimal.sign(-5);
      expect(data).assertEqual(-1);
    });

    /**
     * @tc.name   testSign003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_SIGN_0300
     * @tc.desc   Test static sign method with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSign003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: double = Decimal.sign(0);
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testStaticRound001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_ROUND_0100
     * @tc.desc   Test static round method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticRound001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let data: Decimal = Decimal.round(1.5);
      expect(data.toString()).assertEqual('2');
    });

    /**
     * @tc.name   testStaticSet001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_DECIMAL_STATIC_SET_0100
     * @tc.desc   Test static set method with precision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStaticSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      Decimal.set({ precision: 10 });
      let data: Decimal = new Decimal(1).div(3);
      expect(data.toString()).assertEqual('0.3333333333');
    });
  });
}
