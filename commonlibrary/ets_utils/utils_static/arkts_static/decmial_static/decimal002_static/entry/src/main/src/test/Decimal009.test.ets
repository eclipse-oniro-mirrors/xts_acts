/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import { Decimal } from '@kit.ArkTS';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

function test_isFinite_001 (actual: boolean) {
  expect(actual).assertTrue();
}

let n : Decimal = new Decimal(1);
export default function DecimalTest009() {
  describe("DecimalTest009", () => {
    beforeAll(() => {
      console.info("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.");
    });
    beforeEach(async () => {
      await Utils.msSleep(200)
      console.info("beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.");
    });
    afterEach(() => {
      console.info("afterEach: Test case-level clearance conditions, which are executed after each test case is executed.");
    });
    afterAll(() => {
      console.info("afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed");
    });
    console.info("start################################start");
    /**
     * @tc.name   Decimal_isFinite_Func_001
     * @tc.number DECIMAL_TEST9_001
     * @tc.desc   Test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_001",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n  = new Decimal(1);
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(!n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(n.isInteger());
      test_isFinite_001(n.equals(n));
      test_isFinite_001(n.equals(1));
      test_isFinite_001(n.equals('1.0'));
      test_isFinite_001(n.equals('1.00'));
      test_isFinite_001(n.equals('1.000'));
      test_isFinite_001(n.equals('1.0000'));
      test_isFinite_001(n.equals('1.00000'));
      test_isFinite_001(n.equals('1.000000'));
    });
    /**
     * @tc.name   Decimal_isFinite_Func_002
     * @tc.number DECIMAL_TEST9_002
     * @tc.desc   Test sinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_002",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n  = new Decimal(1);
      test_isFinite_001(n.equals(new Decimal(1)));
      test_isFinite_001(n.equals('0x1'));
      test_isFinite_001(n.equals('0o1'));
      test_isFinite_001(n.equals('0b1'));
      test_isFinite_001(n.greaterThan(0.99999));
      test_isFinite_001(!n.greaterThanOrEqualTo(1.1));
      test_isFinite_001(n.lessThan(1.001));
      test_isFinite_001(n.lessThanOrEqualTo(2));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('-0.1');
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(!n.equals(0.1));
      test_isFinite_001(!n.greaterThan(-0.1));
      test_isFinite_001(n.greaterThanOrEqualTo(-1));
    });/**
     * @tc.number    : DECIMAL_TEST9_003
     * @tc.name      : Decimal_isFinite_Func_003
     * @tc.desc      : Test cosh
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    /**
     * @tc.name   Decimal_isFinite_Func_003
     * @tc.number Decimal_isFinite_Func_003
     * @tc.desc   Decimal_isFinite_Func_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_003",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal('-0.1');
      test_isFinite_001(n.lessThan(-0.01));
      test_isFinite_001(!n.lessThanOrEqualTo(-1));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal(Infinity);
      test_isFinite_001(!n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(!n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(n.equals('Infinity'));
      test_isFinite_001(n.equals(1/0.0));
      test_isFinite_001(n.greaterThan('9e999'));
      test_isFinite_001(n.greaterThanOrEqualTo(Infinity));
      test_isFinite_001(!n.lessThan(Infinity));
      test_isFinite_001(n.lessThanOrEqualTo(Infinity));
    });

    /**
     * @tc.name   Decimal_isFinite_Func_004
     * @tc.number DECIMAL_TEST9_004
     * @tc.desc   Test tanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_004",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal(Infinity);
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('-Infinity');
      test_isFinite_001(!n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(!n.equals(Infinity));
      test_isFinite_001(n.equals(-1/0.0));
      test_isFinite_001(!n.greaterThan(-Infinity));
      test_isFinite_001(n.lessThan(0));
      test_isFinite_001(n.lessThanOrEqualTo(Infinity));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('0.0000000');
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(!n.isNegative());
      test_isFinite_001(n.isZero());
      test_isFinite_001(n.isInteger());
      test_isFinite_001(n.equals(-0));
    });

    /**
     * @tc.name   Decimal_isFinite_Func_005
     * @tc.number DECIMAL_TEST9_005
     * @tc.desc   Test asinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_005",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal('0.0000000');
      test_isFinite_001(n.greaterThan(-0.000001));
      test_isFinite_001(!n.greaterThanOrEqualTo(0.1));
      test_isFinite_001(n.lessThan(0.0001));
      test_isFinite_001(n.lessThanOrEqualTo(-0));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal(-0.0);
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(n.isNegative());
      test_isFinite_001(n.isZero());
      test_isFinite_001(n.isInteger());
      test_isFinite_001(n.equals('0.000'));
      test_isFinite_001(n.greaterThan(-1));
      test_isFinite_001(!n.greaterThanOrEqualTo(0.1));
      test_isFinite_001(!n.lessThan(0));
    });

    /**
     * @tc.name   Decimal_isFinite_Func_006
     * @tc.number DECIMAL_TEST9_006
     * @tc.desc   Test acosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_006",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal(-0.0);
      test_isFinite_001(n.lessThan(0.1));
      test_isFinite_001(n.lessThanOrEqualTo(0));
      test_isFinite_001(n.valueOf() === '-0' && n.toString() === '0');
      n = new Decimal('NaN');
      test_isFinite_001(!n.isFinite());
      test_isFinite_001(n.isNaN());
      test_isFinite_001(!n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(!n.equals(NaN));
      test_isFinite_001(!n.equals(Infinity));
      test_isFinite_001(!n.greaterThan(0));
      test_isFinite_001(!n.greaterThanOrEqualTo(0));
      test_isFinite_001(!n.lessThan(1));
      test_isFinite_001(!n.lessThanOrEqualTo(-0));
      test_isFinite_001(!n.lessThanOrEqualTo(-1));
    });

    /**
     * @tc.name   Decimal_isFinite_Func_007
     * @tc.number DECIMAL_TEST9_007
     * @tc.desc   Test atanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_007",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal('NaN');
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('-1.234e+2');
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(n.equals(-123.4));
      test_isFinite_001(n.greaterThan('-0xff'));
      test_isFinite_001(n.greaterThanOrEqualTo('-1.234e+3'));
      test_isFinite_001(n.lessThan(-123.39999));
      test_isFinite_001(n.lessThanOrEqualTo('-123.4e+0'));
    });

    /**
     * @tc.name   Decimal_isFinite_Func_008
     * @tc.number DECIMAL_TEST9_008
     * @tc.desc   Test exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_008",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal('-1.234e+2')
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('5e-200');
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(!n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(n.equals(5e-200));
      test_isFinite_001(n.greaterThan(5e-201));
      test_isFinite_001(!n.greaterThanOrEqualTo(1));
      test_isFinite_001(n.lessThan(6e-200));
      test_isFinite_001(n.lessThanOrEqualTo(5.1e-200));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('1');
      test_isFinite_001(n.equals(n));
    });

    /**
     * @tc.name   Decimal_isFinite_Func_009
     * @tc.number DECIMAL_TEST9_009
     * @tc.desc   Test expm1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_009",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal('1');
      test_isFinite_001(n.equals(n.toString()));
      test_isFinite_001(n.equals(n.toString()));
      test_isFinite_001(n.equals(n.valueOf()));
      test_isFinite_001(n.equals(n.toFixed()));
      test_isFinite_001(n.equals(1));
      test_isFinite_001(n.equals('1e+0'));
      test_isFinite_001(!n.equals(-1));
      test_isFinite_001(!n.equals(0.1));
      test_isFinite_001(!new Decimal(NaN).equals(0));
      test_isFinite_001(!new Decimal(Infinity).equals(0));
      test_isFinite_001(!new Decimal(0.1).equals(0));
      test_isFinite_001(!new Decimal(1e9 + 1).equals(1e9));
      test_isFinite_001(!new Decimal(1e9 - 1).equals(1e9));
      test_isFinite_001(new Decimal(1e9 + 1).equals(1e9 + 1));
      test_isFinite_001(new Decimal(1).equals(1));
    });

    /**
     * @tc.name   Decimal_isFinite_Func_010
     * @tc.number DECIMAL_TEST9_010
     * @tc.desc   Test log
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_010",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal('1');
      test_isFinite_001(!new Decimal(1).equals(-1));
      test_isFinite_001(!new Decimal(NaN).equals(NaN));
      test_isFinite_001(!new Decimal('NaN').equals('NaN'));
      test_isFinite_001(!new Decimal(NaN).greaterThan(NaN));
      test_isFinite_001(!new Decimal(NaN).lessThan(NaN));
      test_isFinite_001(new Decimal('0xa').lessThanOrEqualTo('0xff'));
      test_isFinite_001(new Decimal('0xb').greaterThanOrEqualTo('0x9'));
      test_isFinite_001(!new Decimal(10).greaterThan(10));
      test_isFinite_001(!new Decimal(10).lessThan(10));
      test_isFinite_001(!new Decimal(NaN).lessThan(NaN));
      test_isFinite_001(!new Decimal(Infinity).lessThan(-Infinity));
      test_isFinite_001(!new Decimal(Infinity).lessThan(Infinity));
      test_isFinite_001(new Decimal(Infinity).lessThanOrEqualTo(Infinity));
      test_isFinite_001(!new Decimal(NaN).greaterThanOrEqualTo(NaN));
      test_isFinite_001(new Decimal(Infinity).greaterThanOrEqualTo(Infinity));
      test_isFinite_001(new Decimal(Infinity).greaterThanOrEqualTo(-Infinity));
    });

    /**
     * @tc.name   Decimal_isFinite_Func_011
     * @tc.number DECIMAL_TEST9_011
     * @tc.desc   Test log1p
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_011",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal('1');
      test_isFinite_001(!new Decimal(NaN).greaterThanOrEqualTo(-Infinity));
      test_isFinite_001(new Decimal(-Infinity).greaterThanOrEqualTo(-Infinity));
      test_isFinite_001(!new Decimal(2).greaterThan(10));
      test_isFinite_001(!new Decimal(10).lessThan(2));
      test_isFinite_001(new Decimal(255).lessThanOrEqualTo('0xff'));
      test_isFinite_001(new Decimal('0xa').greaterThanOrEqualTo('0x9'));
      test_isFinite_001(!new Decimal(0).lessThanOrEqualTo('NaN'));
      test_isFinite_001(!new Decimal(0).greaterThanOrEqualTo(NaN));
      test_isFinite_001(!new Decimal(NaN).lessThanOrEqualTo('NaN'));
      test_isFinite_001(!new Decimal(NaN).greaterThanOrEqualTo(NaN));
      test_isFinite_001(!new Decimal(0).lessThanOrEqualTo(-Infinity));
      test_isFinite_001(new Decimal(0).greaterThanOrEqualTo(-Infinity));
      test_isFinite_001(new Decimal(0).lessThanOrEqualTo('Infinity'));
      test_isFinite_001(!new Decimal(0).greaterThanOrEqualTo('Infinity'));
      test_isFinite_001(new Decimal(10).lessThanOrEqualTo(20));
      test_isFinite_001(!new Decimal(10).greaterThanOrEqualTo(20));
      test_isFinite_001(!new Decimal(1.23001e-2).lessThan(1.23e-2));
    });

    /**
     * @tc.name   Decimal_isFinite_Func_012
     * @tc.number DECIMAL_TEST9_012
     * @tc.desc   Test log10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_012",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal('1');
      test_isFinite_001(new Decimal(1.23e-2).lessThan(1.23001e-2));
      test_isFinite_001(!new Decimal(1e-2).lessThan(9.999999e-3));
      test_isFinite_001(new Decimal(9.999999e-3).lessThan(1e-2));
      test_isFinite_001(!new Decimal(1.23001e+2).lessThan(1.23e+2));
      test_isFinite_001(new Decimal(1.23e+2).lessThan(1.23001e+2));
      test_isFinite_001(new Decimal(9.999999e+2).lessThan(1e+3));
      test_isFinite_001(!new Decimal(1e+3).lessThan(9.9999999e+2));
      test_isFinite_001(!new Decimal(1.23001e-2).lessThanOrEqualTo(1.23e-2));
      test_isFinite_001(new Decimal(1.23e-2).lessThanOrEqualTo(1.23001e-2));
      test_isFinite_001(!new Decimal(1e-2).lessThanOrEqualTo(9.999999e-3));
      test_isFinite_001(new Decimal(9.999999e-3).lessThanOrEqualTo(1e-2));
      test_isFinite_001(!new Decimal(1.23001e+2).lessThanOrEqualTo(1.23e+2));
      test_isFinite_001(new Decimal(1.23e+2).lessThanOrEqualTo(1.23001e+2));
      test_isFinite_001(new Decimal(9.999999e+2).lessThanOrEqualTo(1e+3));
      test_isFinite_001(!new Decimal(1e+3).lessThanOrEqualTo(9.9999999e+2));
      test_isFinite_001(new Decimal(1.23001e-2).greaterThan(1.23e-2));
      test_isFinite_001(!new Decimal(1.23e-2).greaterThan(1.23001e-2));
    });

    /**
     * @tc.name   Decimal_isFinite_Func_013
     * @tc.number DECIMAL_TEST9_013
     * @tc.desc   Test log2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_isFinite_Func_013",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal('1');
      test_isFinite_001(new Decimal(1e-2).greaterThan(9.999999e-3));
      test_isFinite_001(!new Decimal(9.999999e-3).greaterThan(1e-2));
      test_isFinite_001(new Decimal(1.23001e+2).greaterThan(1.23e+2));
      test_isFinite_001(!new Decimal(1.23e+2).greaterThan(1.23001e+2));
      test_isFinite_001(!new Decimal(9.999999e+2).greaterThan(1e+3));
      test_isFinite_001(new Decimal(1e+3).greaterThan(9.9999999e+2));
      test_isFinite_001(new Decimal(1.23001e-2).greaterThanOrEqualTo(1.23e-2));
      test_isFinite_001(!new Decimal(1.23e-2).greaterThanOrEqualTo(1.23001e-2));
      test_isFinite_001(new Decimal(1e-2).greaterThanOrEqualTo(9.999999e-3));
      test_isFinite_001(!new Decimal(9.999999e-3).greaterThanOrEqualTo(1e-2));
      test_isFinite_001(new Decimal(1.23001e+2).greaterThanOrEqualTo(1.23e+2));
      test_isFinite_001(!new Decimal(1.23e+2).greaterThanOrEqualTo(1.23001e+2));
      test_isFinite_001(!new Decimal(9.999999e+2).greaterThanOrEqualTo(1e+3));
      test_isFinite_001(new Decimal(1e+3).greaterThanOrEqualTo(9.9999999e+2));
      test_isFinite_001(!new Decimal('1.0000000000000000000001').isInteger());
      test_isFinite_001(!new Decimal('0.999999999999999999999').isInteger());
      test_isFinite_001(new Decimal('4e4').isInteger());
      test_isFinite_001(new Decimal('-4e4').isInteger());
    });

  });
}