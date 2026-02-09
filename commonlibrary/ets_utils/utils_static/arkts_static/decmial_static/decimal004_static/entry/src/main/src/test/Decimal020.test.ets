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
function test_sign_001 (n: string, expected: number) {
  if (Number.isNaN(expected)) {
    expect("NaN").assertEqual(Decimal.sign(n).toString());
  } else {
    expect(expected).assertEqual(Decimal.sign(n));
  }
}
function test_sign_002 (n: number, expected: number) {
  if (Number.isNaN(expected)) {
    expect("NaN").assertEqual(Decimal.sign(n).toString());
  } else {
    expect(expected).assertEqual(Decimal.sign(n));
  }
}

export default function DecimalTest020() {
  describe("DecimalTest020", () => {
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
     * @tc.name   Decimal_sign_Func_001
     * @tc.number DECIMAL_TEST20_001
     * @tc.desc   Test sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_sign_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      test_sign_002(NaN, NaN);
      test_sign_001('NaN', NaN);
      test_sign_002(Infinity, 1);
      test_sign_002(-Infinity, -1);
      test_sign_001('Infinity', 1);
      test_sign_001('-Infinity', -1);
      test_sign_001('0', 0);
      test_sign_001('-0', -0);
      test_sign_001('1', 1);
      test_sign_001('-1', -1);
      test_sign_001('9.99', 1);
      test_sign_001('-9.99', -1);
    });
    /**
     * @tc.name   Decimal_sign_Func_002
     * @tc.number DECIMAL_TEST20_002
     * @tc.desc   Test sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_sign_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        test_sign_001('ee', 0);
        expect(true).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        expect(err.name).assertEqual(`BusinessError`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: ee`);
      }
    });
  });
}