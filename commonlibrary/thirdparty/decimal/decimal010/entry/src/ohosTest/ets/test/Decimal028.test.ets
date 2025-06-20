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
function test_toNumber_001 (n: string, expected: number) {
    if (Number.isNaN(expected)) {
        expect(Number.isNaN(new Decimal(n).toNumber())).assertTrue();
    } else {
        expect(expected).assertEqual(new Decimal(n).toNumber());
    }
}
function test_toNumber_002 (n: number, expected: number) {
    if (Number.isNaN(expected)) {
        expect(Number.isNaN(new Decimal(n).toNumber())).assertTrue();
    } else {
        expect(expected).assertEqual(new Decimal(n).toNumber());
    }
}
function test_toNumber_003 (n: string, expected: number) {
    expect(expected).assertEqual(new Decimal(n).toNumber());
    console.info("decimal_test_toNumber_003 really == " + new Decimal(n).toNumber());
}
function test_toNumber_004 (n: string) {
    expect(1 / new Decimal(n).toNumber() === Infinity).assertTrue();
}
function test_toNumber_005 (n: string) {
    expect(1 / new Decimal(n).toNumber() === -Infinity).assertTrue();
}
export default function DecimalTest028() {
  describe("DecimalTest028", () => {
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
     * @tc.number    : DECIMAL_TEST_001
     * @tc.name      : Decimal_toNumber_Func_001
     * @tc.desc      : Test toNumber
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_toNumber_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        Decimal.set ({
            precision: 20,
            rounding: 4,
            toExpNeg: -7,
            toExpPos: 21,
            minE: -9e15,
            maxE: 9e15
        });
        test_toNumber_004('0');
        test_toNumber_004('0.0');
        test_toNumber_004('0.000000000000');
        test_toNumber_004('0e+0');
        test_toNumber_004('0e-0');
        test_toNumber_004('1e-9000000000000000')
        test_toNumber_005('-0');
        test_toNumber_005('-0.0');
        test_toNumber_005('-0.000000000000');
        test_toNumber_005('-0e+0');
        test_toNumber_005('-0e-0');
        test_toNumber_005('-1e-9000000000000000');
    });
    /**
     * @tc.number    : DECIMAL_TEST_002
     * @tc.name      : Decimal_toNumber_Func_002
     * @tc.desc      : Test toNumber
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_toNumber_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        Decimal.set ({
            precision: 20,
            rounding: 4,
            toExpNeg: -7,
            toExpPos: 21,
            minE: -9e15,
            maxE: 9e15
        });
        test_toNumber_002(Infinity, 1 / 0);
        test_toNumber_001('Infinity', 1 / 0);
        test_toNumber_002(-Infinity, -1 / 0);
        test_toNumber_001('-Infinity', -1 / 0);
        test_toNumber_002(1, 1);
        test_toNumber_001('1', 1);
        test_toNumber_001('1.0', 1);
        test_toNumber_001('1e+0', 1);
        test_toNumber_001('1e-0', 1);
        test_toNumber_002(-1, -1);
        test_toNumber_001('-1', -1);
        test_toNumber_001('-1.0', -1);
        test_toNumber_001('-1e+0', -1);
        test_toNumber_001('-1e-0', -1);
        test_toNumber_001('123.456789876543', 123.456789876543);
        test_toNumber_001('-123.456789876543', -123.456789876543);
        test_toNumber_001('9007199254740991', 9007199254740991);
        test_toNumber_001('-9007199254740991', -9007199254740991);
        test_toNumber_001('1.7976931348623157e+308', 1.7976931348623157e+308);
        test_toNumber_001('9.999999e+9000000000000000', 1 / 0);
        test_toNumber_001('-9.999999e+9000000000000000', -1 / 0);
        test_toNumber_001('1e-9000000000000000', 0);
        test_toNumber_001('-1e-9000000000000000', -0);
        test_toNumber_001('NaN', NaN);
        test_toNumber_002(NaN, NaN);
    });
  });
}