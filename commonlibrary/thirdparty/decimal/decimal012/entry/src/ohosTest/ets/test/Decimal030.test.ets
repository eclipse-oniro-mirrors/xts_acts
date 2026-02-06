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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "@ohos/hypium";
import { Decimal } from '@kit.ArkTS';
function test_div_001 (dividend: number, divisor: number, expected: string) {
    expect(expected).assertEqual(Decimal.div(dividend, divisor).valueOf());
    expect(expected).assertEqual(new Decimal(dividend).div(divisor).valueOf());
}
function test_div_002 (dividend: number, divisor: string, expected: string) {
    expect(expected).assertEqual(Decimal.div(dividend, divisor).valueOf());
    expect(expected).assertEqual(new Decimal(dividend).div(divisor).valueOf());
}
function test_div_003 (dividend: number, divisor: number, expected: string) {
    expect(expected).assertEqual(Decimal.div(dividend, divisor).valueOf());
    expect(expected).assertEqual(new Decimal(dividend).div(divisor).valueOf());
}
function test_div_004 (dividend: string, divisor: number, expected: string) {
    expect(expected).assertEqual(Decimal.div(dividend, divisor).valueOf());
    expect(expected).assertEqual(new Decimal(dividend).div(divisor).valueOf());
}
function test_div_005 (dividend: string, divisor: string, expected: string) {
    expect(expected).assertEqual(Decimal.div(dividend, divisor).valueOf());
    expect(expected).assertEqual(new Decimal(dividend).div(divisor).valueOf());
}
export default function DecimalTest030() {
    describe("DecimalTest030", () => {
    beforeAll(() => {
        console.info("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.");
    });
    beforeEach(() => {
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
     * @tc.name   Decimal_div_Func_001
     * @tc.number DECIMAL_TEST_001
     * @tc.desc   Test div
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_div_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -7,
            toExpPos: 21,
            minE: -9e15,
            maxE: 9e15
        });
        test_div_001(1, 0, 'Infinity');
        test_div_001(1, -0, '-Infinity');
        test_div_001(-1, 0, '-Infinity');
        test_div_001(-1, -0, 'Infinity');
        test_div_001(1, NaN, 'NaN');
        test_div_001(-1, NaN, 'NaN');
        test_div_001(0, 0, 'NaN');
        test_div_001(0, -0, 'NaN');
        test_div_001(-0, 0, 'NaN');
        test_div_001(-0, -0, 'NaN');
        test_div_001(0, NaN, 'NaN');
        test_div_001(-0, NaN, 'NaN');
        test_div_001(NaN, 1, 'NaN');
        test_div_001(NaN, -1, 'NaN');
        test_div_001(NaN, 0, 'NaN');
        test_div_001(NaN, -0, 'NaN');
        test_div_001(NaN, NaN, 'NaN');
        test_div_001(NaN, Infinity, 'NaN');
        test_div_001(NaN, -Infinity, 'NaN');
        test_div_001(Infinity, 1, 'Infinity');
        test_div_001(Infinity, -1, '-Infinity');
        test_div_001(-Infinity, 1, '-Infinity');
        test_div_001(-Infinity, -1, 'Infinity');
        test_div_001(Infinity, 0, 'Infinity');
        test_div_001(Infinity, -0, '-Infinity');
        test_div_001(-Infinity, 0, '-Infinity');
        test_div_001(-Infinity, -0, 'Infinity');
        test_div_001(Infinity, NaN, 'NaN');
        test_div_001(-Infinity, NaN, 'NaN');
        test_div_001(Infinity, Infinity, 'NaN');
        test_div_001(Infinity, -Infinity, 'NaN');
        test_div_001(-Infinity, Infinity, 'NaN');
        test_div_001(-Infinity, -Infinity, 'NaN');
        test_div_002(1, '1', '1');
        test_div_002(1, '-45', '-0.02222222222222222222222222222222222222222');
        test_div_002(1, '22', '0.04545454545454545454545454545454545454545');
        test_div_003(1, 0o144, '0.01');
        test_div_002(1, '0144', '0.006944444444444444444444444444444444444444');
        test_div_002(1, '6.1915', '0.1615117499798110312525236210934345473633');
        test_div_002(1, '-1.02', '-0.9803921568627450980392156862745098039216');
        test_div_002(1, '-0.0001', '-10000');
        test_div_002(1, '8e5', '0.00000125');
        test_div_002(1, '1e-14', '100000000000000');
        test_div_002(1, '-94.12E+0', '-0.01062473438164045898852528686782830429239');
        test_div_002(1, 'Infinity', '0');
        test_div_002(1, '-Infinity', '-0');
        test_div_003(1, Number.POSITIVE_INFINITY, '0');
        test_div_003(1, Number.NEGATIVE_INFINITY, '-0');
        test_div_004('0', 0, 'NaN');
        test_div_005('0', '0', 'NaN');
        test_div_003(3, -0, '-Infinity');
        test_div_003(9.654, 0, 'Infinity');
        test_div_002(0, '0.001', '0');
        test_div_002(0, '111.1111111110000', '0');
        test_div_004('NaN', 0, 'NaN');
        test_div_002(0, 'NaN', 'NaN');
        test_div_005('NaN', '0', 'NaN');
        test_div_003(-1, 1, '-1');
        test_div_003(-0.01, 0.01, '-1');
        test_div_003(54, -54, '-1');
        test_div_002(9.99, '-9.99', '-1');
        test_div_005('0.0000023432495704937', '-0.0000023432495704937', '-1');
        test_div_002(NaN, 'NaN', 'NaN');
        test_div_004('NaN', NaN, 'NaN');
        test_div_005('NaN', 'NaN', 'NaN');
        test_div_004('NaN', 4, 'NaN');
        test_div_005('NaN', '4534534.45435435', 'NaN');
        test_div_004('NaN', 99999.999, 'NaN');
        test_div_002(Infinity, '354.345341', 'Infinity');
        test_div_002(3, '-Infinity', '-0');
        test_div_002(-Infinity, '-Infinity', 'NaN');
        test_div_004('-Infinity', -Infinity, 'NaN');
        test_div_005('Infinity', '-999e999', '-Infinity');
        test_div_002(1.21123e43, '-Infinity', '-0');
        test_div_005('-999.0', 'Infinity', '-0');
        test_div_005('657.342e-45', '-Infinity', '-0');
        test_div_004('Infinity', 123, 'Infinity');
        test_div_002(-0, 'Infinity', '-0');
        test_div_003(100, 100, '1');
        test_div_002(-999.99, '0.01', '-99999');
        test_div_004('10', 4, '2.5');
        test_div_004('03.333', -4, '-0.83325');
        test_div_003(-1, -0.1, '10');
        test_div_005('99999', '1', '99999');
        expect(true).assertEqual(true);
    });
  });
}
