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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import { Decimal } from '@kit.ArkTS';
export default function DecimalTest027() {
  describe("DecimalTest027", () => {
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
     * @tc.name      : Decimal_powSqrt_Func_001
     * @tc.desc      : Test powSqrt
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_powSqrt_Func_001", 0, () => {
        Decimal.set ({
            toExpNeg: -7,
            toExpPos: 21,
            minE: -9e15,
            maxE: 9e15
        });
        let r : Decimal = new Decimal(0);
        let n : string = '0';
        let e : string = '0';
        for (let total = 0; total < 400; total++) {
            e = Decimal.random( Math.random() * 40 + 1 | 0 ).toExponential();
            r = new Decimal(e.slice(0, e.indexOf('e') + 1) + ( Math.random() < 0.5 ? '-' : '' ) +( n = Math.floor( Math.random() * 9e15 ) + '' ).slice( Math.random() * n.length | 0 ));
            if ((Math.random() * 9 | 0) == 0) {
                Decimal.set ({ rounding: 0 });
            } else if ((Math.random() * 9 | 0) == 1) {
                Decimal.set ({ rounding: 1 });
            } else if ((Math.random() * 9 | 0) == 2) {
                Decimal.set ({ rounding: 2 });
            } else if ((Math.random() * 9 | 0) == 3) {
                Decimal.set ({ rounding: 3 });
            } else if ((Math.random() * 9 | 0) == 4) {
                Decimal.set ({ rounding: 4 });
            } else if ((Math.random() * 9 | 0) == 5) {
                Decimal.set ({ rounding: 5 });
            } else if ((Math.random() * 9 | 0) == 6) {
                Decimal.set ({ rounding: 6 });
            } else if ((Math.random() * 9 | 0) == 7) {
                Decimal.set ({ rounding: 7 });
            } else {
                Decimal.set ({ rounding: 8 });
            }
            let pr = Math.random() * 40 + 1 | 0;
            Decimal.set ({ precision: pr});
            let p : Decimal = r.pow(0.5);
            let s : Decimal = r.sqrt();
            expect(p.valueOf()).assertEqual(s.valueOf());
        }
    });
  });
}