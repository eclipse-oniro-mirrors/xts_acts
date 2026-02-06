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
export default function DecimalTest005() {
  describe("DecimalTest005", () => {
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
     * @tc.name      : Decimal_random_Func_001
     * @tc.desc      : Test random
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_random_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let maxDigits = 100;
        let sd = 0;
        let r : Decimal = new Decimal(0);
        for (let i = 0; i < 800; i++) {
            sd = Math.random() * maxDigits + 1 | 0;
            if (Math.random() > 0.5) {
                Decimal.set ({ precision: sd});
                r = Decimal.random();
            } else {
                r = Decimal.random(sd);
            }
            expect(r.precision() <= sd && r.greaterThanOrEqualTo(0) && r.lessThan(1) && r.equals(r) && r.equals(r.valueOf())).assertTrue();
        }
    });
    /**
     * @tc.number    : DECIMAL_TEST_002
     * @tc.name      : Decimal_random_Func_002
     * @tc.desc      : Test random
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_random_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let maxDigits = 100;
        let sd = 0;
        let r : Decimal = new Decimal(0);
        for (let i = 800; i < 996; i++) {
            sd = Math.random() * maxDigits + 1 | 0;
            if (Math.random() > 0.5) {
                Decimal.set ({ precision: sd});
                r = Decimal.random();
            } else {
                r = Decimal.random(sd);
            }
            expect(r.precision() <= sd && r.greaterThanOrEqualTo(0) && r.lessThan(1) && r.equals(r) && r.equals(r.valueOf())).assertTrue();
        }
    });
  });
}