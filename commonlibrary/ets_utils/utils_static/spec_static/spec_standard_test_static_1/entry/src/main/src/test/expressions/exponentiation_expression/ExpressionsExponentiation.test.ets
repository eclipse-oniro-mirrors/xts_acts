/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
} from '../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsExponentiationTest() {
  describe("ExpressionsExponentiationTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_0100
     * @tc.name      testExpressionsExponentiation0001
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.POSITIVE_INFINITY, 1)).assertEqual(Double.POSITIVE_INFINITY);
      expect(Double.POSITIVE_INFINITY ** 1).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_0200
     * @tc.name      testExpressionsExponentiation0002
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.POSITIVE_INFINITY, -1)).assertEqual(1 / Double.POSITIVE_INFINITY);
      expect(Double.POSITIVE_INFINITY ** -1).assertEqual(1 / Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_0300
     * @tc.name      testExpressionsExponentiation0003
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.NEGATIVE_INFINITY, -0)).assertEqual(1);
      expect(Double.NEGATIVE_INFINITY ** -0).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_0400
     * @tc.name      testExpressionsExponentiation0004
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.NEGATIVE_INFINITY, 0)).assertEqual(1);
      expect(Double.NEGATIVE_INFINITY ** 0).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_0500
     * @tc.name      testExpressionsExponentiation0005
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.POSITIVE_INFINITY, 1.5)).assertEqual(Double.POSITIVE_INFINITY);
      expect(Double.POSITIVE_INFINITY ** 1.5).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_0600
     * @tc.name      testExpressionsExponentiation0006
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.POSITIVE_INFINITY, -1.5)).assertEqual(0);
      expect(Double.POSITIVE_INFINITY ** -1.5).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_0700
     * @tc.name      testExpressionsExponentiation0007
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.NEGATIVE_INFINITY, -1.5)).assertEqual(0);
      expect(Double.NEGATIVE_INFINITY ** -1.5).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_0800
     * @tc.name      testExpressionsExponentiation0008
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.NEGATIVE_INFINITY, 1.5)).assertEqual(Double.POSITIVE_INFINITY);
      expect(Double.NEGATIVE_INFINITY ** 1.5).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_0900
     * @tc.name      testExpressionsExponentiation0009
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(0, -1)).assertEqual(Double.POSITIVE_INFINITY);
      expect(0 ** -1).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_1000
     * @tc.name      testExpressionsExponentiation0010
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(-0, -1)).assertEqual(Double.NEGATIVE_INFINITY);
      expect(-0 ** -1).assertEqual(Double.NEGATIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_1100
     * @tc.name      testExpressionsExponentiation0011
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(0, Double.POSITIVE_INFINITY)).assertEqual(0);
      expect(0 ** Double.POSITIVE_INFINITY).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_1200
     * @tc.name      testExpressionsExponentiation0012
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(1, Double.POSITIVE_INFINITY)).assertEqual(1);
      expect(1 ** Double.POSITIVE_INFINITY).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_1300
     * @tc.name      testExpressionsExponentiation0013
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.NEGATIVE_INFINITY, -1)).assertEqual(1 / Double.NEGATIVE_INFINITY);
      expect(Double.NEGATIVE_INFINITY ** -1).assertEqual(1 / Double.NEGATIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_1400
     * @tc.name      testExpressionsExponentiation0014
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(2, Double.POSITIVE_INFINITY)).assertEqual(Double.POSITIVE_INFINITY);
      expect(2 ** Double.POSITIVE_INFINITY).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_1500
     * @tc.name      testExpressionsExponentiation0015
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(-2, Double.POSITIVE_INFINITY)).assertEqual(Double.POSITIVE_INFINITY);
      expect(-2 ** Double.POSITIVE_INFINITY).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_1600
     * @tc.name      testExpressionsExponentiation0016
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(0, Double.NEGATIVE_INFINITY)).assertEqual(Double.POSITIVE_INFINITY);
      expect(0 ** Double.NEGATIVE_INFINITY).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_1700
     * @tc.name      testExpressionsExponentiation0017
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(1, Double.NEGATIVE_INFINITY)).assertEqual(1);
      expect(1 ** Double.NEGATIVE_INFINITY).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_1800
     * @tc.name      testExpressionsExponentiation0018
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(2, Double.NEGATIVE_INFINITY)).assertEqual(0);
      expect(2 ** Double.NEGATIVE_INFINITY).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_1900
     * @tc.name      testExpressionsExponentiation0019
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(-2, Double.NEGATIVE_INFINITY)).assertEqual(0);
      expect(-2 ** Double.NEGATIVE_INFINITY).assertEqual(0);
      expect(Math.pow(0, -3)).assertEqual(Double.POSITIVE_INFINITY);
      expect(0 ** -3).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_2000
     * @tc.name      testExpressionsExponentiation0020
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(-0, -3)).assertEqual(Double.NEGATIVE_INFINITY);
      expect(-0 ** -3).assertEqual(Double.NEGATIVE_INFINITY);
      expect(Math.pow(0, 3)).assertEqual(0);
      expect(0 ** 3).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_2100
     * @tc.name      testExpressionsExponentiation0021
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(-0, 3)).assertEqual(-0);
      expect(-0 ** 3).assertEqual(-0);
      expect(Math.pow(Double.NEGATIVE_INFINITY, 1)).assertEqual(Double.NEGATIVE_INFINITY);
      expect(Double.NEGATIVE_INFINITY ** 1).assertEqual(Double.NEGATIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_2200
     * @tc.name      testExpressionsExponentiation0022
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(0, -2)).assertEqual(Double.POSITIVE_INFINITY);
      expect(0 ** -2).assertEqual(Double.POSITIVE_INFINITY);
      expect(Math.pow(0, -1.5)).assertEqual(Double.POSITIVE_INFINITY);
      expect(0 ** -1.5).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_2300
     * @tc.name      testExpressionsExponentiation0023
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(-0, -2)).assertEqual(Double.POSITIVE_INFINITY);
      expect(-0 ** -2).assertEqual(Double.POSITIVE_INFINITY);
      expect(Math.pow(0, 2)).assertEqual(0);
      expect(0 ** 2).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_2400
     * @tc.name      testExpressionsExponentiation0024
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(0, 1.5)).assertEqual(0);
      expect(0 ** 1.5).assertEqual(0);
      expect(Math.pow(-0, 2)).assertEqual(0);
      expect(-0 ** 2).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_2500
     * @tc.name      testExpressionsExponentiation0025
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(-1, Double.POSITIVE_INFINITY)).assertEqual(1);
      expect(-1 ** Double.POSITIVE_INFINITY).assertEqual(1);
      expect(Math.pow(-1, Double.NEGATIVE_INFINITY)).assertEqual(1);
      expect(-1 ** Double.NEGATIVE_INFINITY).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_2600
     * @tc.name      testExpressionsExponentiation0026
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(0.5, Double.POSITIVE_INFINITY)).assertEqual(0);
      expect(0.5 ** Double.POSITIVE_INFINITY).assertEqual(0);
      expect(Math.pow(-0.5, Double.POSITIVE_INFINITY)).assertEqual(0);
      expect(-0.5 ** Double.POSITIVE_INFINITY).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_2700
     * @tc.name      testExpressionsExponentiation0027
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.POSITIVE_INFINITY, 2)).assertEqual(Double.POSITIVE_INFINITY);
      expect(Double.POSITIVE_INFINITY ** 2).assertEqual(Double.POSITIVE_INFINITY);
      expect(Math.pow(0.5, Double.NEGATIVE_INFINITY)).assertEqual(Double.POSITIVE_INFINITY);
      expect(0.5 ** Double.NEGATIVE_INFINITY).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_2800
     * @tc.name      testExpressionsExponentiation0028
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(-0.5, Double.NEGATIVE_INFINITY)).assertEqual(Double.POSITIVE_INFINITY);
      expect(-0.5 ** Double.NEGATIVE_INFINITY).assertEqual(Double.POSITIVE_INFINITY);
      expect(Math.pow(Double.NEGATIVE_INFINITY, -3)).assertEqual(-0);
      expect(Double.NEGATIVE_INFINITY ** -3).assertEqual(-0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_2900
     * @tc.name      testExpressionsExponentiation0029
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.NEGATIVE_INFINITY, -4)).assertEqual(0);
      expect(Double.NEGATIVE_INFINITY ** -4).assertEqual(0);
      expect(Math.pow(Double.NEGATIVE_INFINITY, 3)).assertEqual(Double.NEGATIVE_INFINITY);
      expect(Double.NEGATIVE_INFINITY ** 3).assertEqual(Double.NEGATIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_3000
     * @tc.name      testExpressionsExponentiation0030
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.NEGATIVE_INFINITY, 4)).assertEqual(Double.POSITIVE_INFINITY);
      expect(Double.NEGATIVE_INFINITY ** 4).assertEqual(Double.POSITIVE_INFINITY);
      expect(Math.pow(Double.POSITIVE_INFINITY, -2)).assertEqual(1 / Double.POSITIVE_INFINITY);
      expect(Double.POSITIVE_INFINITY ** -2).assertEqual(1 / Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_3100
     * @tc.name      testExpressionsExponentiation0031
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.NEGATIVE_INFINITY, -2)).assertEqual(1 / Double.NEGATIVE_INFINITY);
      expect(Double.NEGATIVE_INFINITY ** -2).assertEqual(1 / Double.NEGATIVE_INFINITY);
      expect(Math.pow(Double.NEGATIVE_INFINITY, 2)).assertEqual(Double.POSITIVE_INFINITY);
      expect(Double.NEGATIVE_INFINITY ** 2).assertEqual(Double.POSITIVE_INFINITY);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_3200
     * @tc.name      testExpressionsExponentiation0032
     * @tc.desc      Exponentiation with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.pow(Double.POSITIVE_INFINITY, 0)).assertEqual(1);
      expect(Double.POSITIVE_INFINITY ** 0).assertEqual(1);
      expect(Math.pow(Double.POSITIVE_INFINITY, -0)).assertEqual(1);
      expect(Double.POSITIVE_INFINITY ** -0).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_3300
     * @tc.name      testExpressionsExponentiation0033
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 ** 0).assertEqual(1);
      expect(Math.pow(0, 0)).assertEqual(1);
      expect(0 ** 1).assertEqual(0);
      expect(Math.pow(0, 1)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_3400
     * @tc.name      testExpressionsExponentiation0034
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 ** 1).assertEqual(2);
      expect(Math.pow(2, 1)).assertEqual(2);
      expect(1 ** 2).assertEqual(1);
      expect(Math.pow(1, 2)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_3500
     * @tc.name      testExpressionsExponentiation0035
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 ** -1).assertEqual(0.5);
      expect(Math.pow(2, -1)).assertEqual(0.5);
      expect(-2 ** 1).assertEqual(-2);
      expect(Math.pow(-2, 1)).assertEqual(-2);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_3600
     * @tc.name      testExpressionsExponentiation0036
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-2 ** 2).assertEqual(4);
      expect(Math.pow(-2, 2)).assertEqual(4);
      expect(-2 ** 3).assertEqual(-8);
      expect(Math.pow(-2, 3)).assertEqual(-8);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_3700
     * @tc.name      testExpressionsExponentiation0037
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2.5 ** 2).assertEqual(6.25);
      expect(Math.pow(2.5, 2)).assertEqual(6.25);
      expect(2.5 ** 1).assertEqual(2.5);
      expect(Math.pow(2.5, 1)).assertEqual(2.5);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_3800
     * @tc.name      testExpressionsExponentiation0038
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2.5 ** 0).assertEqual(1);
      expect(Math.pow(2.5, 0)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_3900
     * @tc.name      testExpressionsExponentiation0039
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2.5 ** -1).assertEqual(0.4);
      expect(Math.pow(2.5, -1)).assertEqual(0.4);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_4000
     * @tc.name      testExpressionsExponentiation0040
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-0 ** 0).assertEqual(1);
      expect(Math.pow(-0, 0)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_4100
     * @tc.name      testExpressionsExponentiation0041
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2.5 ** -2).assertEqual(0.16);
      expect(Math.pow(2.5, -2)).assertEqual(0.16);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_4200
     * @tc.name      testExpressionsExponentiation0042
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-2.5 ** 2).assertEqual(6.25);
      expect(Math.pow(-2.5, 2)).assertEqual(6.25);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_4300
     * @tc.name      testExpressionsExponentiation0043
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-2.5 ** 1).assertEqual(-2.5);
      expect(Math.pow(-2.5, 1)).assertEqual(-2.5);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_4400
     * @tc.name      testExpressionsExponentiation0044
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-2.5 ** 0).assertEqual(1);
      expect(Math.pow(-2.5, 0)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_4500
     * @tc.name      testExpressionsExponentiation0045
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-2.5 ** -1).assertEqual(-0.4);
      expect(Math.pow(-2.5, -1)).assertEqual(-0.4);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_4600
     * @tc.name      testExpressionsExponentiation0046
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-2.5 ** -2).assertEqual(0.16);
      expect(Math.pow(-2.5, -2)).assertEqual(0.16);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_4700
     * @tc.name      testExpressionsExponentiation0047
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-2.5 ** -3).assertEqual(-0.064);
      expect(Math.pow(-2.5, -3)).assertEqual(-0.064);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_4800
     * @tc.name      testExpressionsExponentiation0048
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-0 ** 1).assertEqual(0);
      expect(Math.pow(-0, 1)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_4900
     * @tc.name      testExpressionsExponentiation0049
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 ** 0).assertEqual(1);
      expect(Math.pow(1, 0)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_5000
     * @tc.name      testExpressionsExponentiation0050
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 ** -0).assertEqual(1);
      expect(Math.pow(0, -0)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_5100
     * @tc.name      testExpressionsExponentiation0051
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 ** -0).assertEqual(1);
      expect(Math.pow(1, -0)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_5200
     * @tc.name      testExpressionsExponentiation0052
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-1 ** 0).assertEqual(1);
      expect(Math.pow(-1, 0)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_5300
     * @tc.name      testExpressionsExponentiation0053
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-1 ** -0).assertEqual(1);
      expect(Math.pow(-1, -0)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_5400
     * @tc.name      testExpressionsExponentiation0054
     * @tc.desc      Exponentiation of integer and floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 ** 2).assertEqual(4);
      expect(Math.pow(2, 2)).assertEqual(4);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_5500
     * @tc.name      testExpressionsExponentiation0055
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = Double.NaN ** Double.NaN
      let res2 = Math.pow(Double.NaN, Double.NaN)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_5600
     * @tc.name      testExpressionsExponentiation0056
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = Double.NaN ** 0
      let res2 = Math.pow(Double.NaN, 0)
      expect(res1 == res2 && res2 == 1).assertTrue();
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_5700
     * @tc.name      testExpressionsExponentiation0057
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = 1 ** Double.NEGATIVE_INFINITY
      let res2 = Math.pow(1, Double.NEGATIVE_INFINITY)
      expect(res1 == res2 && res2 == 1).assertTrue();
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_5800
     * @tc.name      testExpressionsExponentiation0058
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = -1 ** 1.5f
      let res2 = Math.pow(-1, 1.5f)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_5900
     * @tc.name      testExpressionsExponentiation0059
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = -1 ** 1.5
      let res2 = Math.pow(-1, 1.5)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_6000
     * @tc.name      testExpressionsExponentiation0060
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = -1 ** -1.5f
      let res2 = Math.pow(-1, -1.5f)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_6100
     * @tc.name      testExpressionsExponentiation0061
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = -1 ** -1.5
      let res2 = Math.pow(-1, -1.5)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_6200
     * @tc.name      testExpressionsExponentiation0062
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = 0 ** Double.NaN
      let res2 = Math.pow(0, Double.NaN)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_6300
     * @tc.name      testExpressionsExponentiation0063
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = Double.NaN ** 1
      let res2 = Math.pow(Double.NaN, 1)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_6400
     * @tc.name      testExpressionsExponentiation0064
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = 1 ** Double.NaN
      let res2 = Math.pow(1, Double.NaN)
      expect(res1 == res2 && res2 == 1).assertTrue();
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_6500
     * @tc.name      testExpressionsExponentiation0065
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = Double.NaN ** Double.POSITIVE_INFINITY
      let res2 = Math.pow(Double.NaN, Double.POSITIVE_INFINITY)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_6600
     * @tc.name      testExpressionsExponentiation0066
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = Double.POSITIVE_INFINITY ** Double.NaN
      let res2 = Math.pow(Double.POSITIVE_INFINITY, Double.NaN)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_6700
     * @tc.name      testExpressionsExponentiation0067
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = Double.NaN ** Double.NEGATIVE_INFINITY
      let res2 = Math.pow(Double.NaN, Double.NEGATIVE_INFINITY)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_6800
     * @tc.name      testExpressionsExponentiation0068
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = Double.NEGATIVE_INFINITY ** Double.NaN
      let res2 = Math.pow(Double.NEGATIVE_INFINITY, Double.NaN)
      expect(Double.isNaN(res1)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_6900
     * @tc.name      testExpressionsExponentiation0069
     * @tc.desc      Exponentiation with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1 = 1 ** Double.POSITIVE_INFINITY
      let res2 = Math.pow(1, Double.POSITIVE_INFINITY)
      expect(res1 == res2 && res2 == 1).assertTrue();
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_7000
     * @tc.name      testExpressionsExponentiation0070
     * @tc.desc      Test power operator ** with byte and byte - basic functionality and type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 10;
      let b: byte = 2;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(100);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_7100
     * @tc.name      testExpressionsExponentiation0071
     * @tc.desc      Test power operator ** with byte and byte - basic functionality and type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 2;
      let b: byte = 3;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(8);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_7200
     * @tc.name      testExpressionsExponentiation0072
     * @tc.desc      Test power operator ** with byte and int - basic functionality and type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 5;
      let b: int = 3;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(125);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_7300
     * @tc.name      testExpressionsExponentiation0073
     * @tc.desc      Test power operator ** with short and short - basic functionality and type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 10;
      let b: short = 2;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(100);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_7400
     * @tc.name      testExpressionsExponentiation0074
     * @tc.desc      Test power operator ** with short and short - basic functionality and type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 3;
      let b: short = 4;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(81);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_7500
     * @tc.name      testExpressionsExponentiation0075
     * @tc.desc      Test power operator ** with short and int - basic functionality and type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 4;
      let b: int = 3;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(64);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_7600
     * @tc.name      testExpressionsExponentiation0076
     * @tc.desc      Test power operator ** with int and int - basic functionality and type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 10;
      let b: int = 2;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(100);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_7700
     * @tc.name      testExpressionsExponentiation0077
     * @tc.desc      Test power operator ** with int and int - basic functionality and type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 2;
      let b: int = 10;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(1024);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_7800
     * @tc.name      testExpressionsExponentiation0078
     * @tc.desc      Test power operator ** with byte and short - basic functionality and type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 2;
      let b: short = 4;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(16);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_7900
     * @tc.name      testExpressionsExponentiation0079
     * @tc.desc      Test power operator ** with short and byte - basic functionality and type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 3;
      let b: byte = 3;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(27);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_8000
     * @tc.name      testExpressionsExponentiation0080
     * @tc.desc      Test power operator ** with BigInt - Basic BigInt power operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = new bigint(10);
      let b: bigint = new bigint(2);
      let result = a ** b;
      expect(result instanceof bigint).assertTrue();
      expect(result).assertEqual(new bigint(100));
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_8100
     * @tc.name      testExpressionsExponentiation0081
     * @tc.desc      Test power operator ** with BigInt - Large BigInt power operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = new bigint(2);
      let b: bigint = new bigint(50);
      let result = a ** b;
      expect(result instanceof bigint).assertTrue();
      expect(result).assertEqual(new bigint(1125899906842624));
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_8200
     * @tc.name      testExpressionsExponentiation0082
     * @tc.desc      Test power operator ** with BigInt - BigInt with zero exponent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = new bigint(123456789);
      let b: bigint = new bigint(0);
      let result = a ** b;
      expect(result instanceof bigint).assertTrue();
      expect(result).assertEqual(new bigint(1));
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_8300
     * @tc.name      testExpressionsExponentiation0083
     * @tc.desc      Test power operator ** edge cases - Zero exponent for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = 10;
      let exponent: byte = 0;
      let result = base ** exponent;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_8400
     * @tc.name      testExpressionsExponentiation0084
     * @tc.desc      Test power operator ** edge cases - Zero base for short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: short = 0;
      let exponent: short = 5;
      let result = base ** exponent;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_8500
     * @tc.name      testExpressionsExponentiation0085
     * @tc.desc      Test power operator ** edge cases - One exponent for int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 42;
      let exponent: int = 1;
      let result = base ** exponent;
      expect(result).assertEqual(42);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_8600
     * @tc.name      testExpressionsExponentiation0086
     * @tc.desc      Test power operator ** edge cases - Negative base with even exponent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = -2;
      let exponent: int = 4;
      let result = base ** exponent;
      expect(result).assertEqual(16);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_8700
     * @tc.name      testExpressionsExponentiation0087
     * @tc.desc      Test power operator ** edge cases - Negative base with odd exponent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = -3;
      let exponent: int = 3;
      let result = base ** exponent;
      expect(result).assertEqual(-27);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_8800
     * @tc.name      testExpressionsExponentiation0088
     * @tc.desc      Test power operator ** with Long - Basic Long power operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 10;
      let b: long = 2;
      let result = a ** b;
      expect(result instanceof long).assertTrue();
      expect(result).assertEqual(100);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_8900
     * @tc.name      testExpressionsExponentiation0089
     * @tc.desc      Test power operator ** with Long - Large Long power operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 2;
      let b: long = 50;
      let result = a ** b;
      expect(result instanceof long).assertTrue();
      expect(result).assertEqual(1125899906842624);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_9000
     * @tc.name      testExpressionsExponentiation0090
     * @tc.desc      Test power operator ** with Long - Long with zero exponent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 123456789;
      let b: long = 0;
      let result = a ** b;
      expect(result instanceof long).assertTrue();
      expect(result).assertEqual(1);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_9100
     * @tc.name      testExpressionsExponentiation0091
     * @tc.desc      Test power operator ** overflow behavior with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 10;
      let b: byte = 3;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(1000);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_9200
     * @tc.name      testExpressionsExponentiation0092
     * @tc.desc      Test power operator ** overflow behavior with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 16;
      let b: byte = 2;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(256);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_9300
     * @tc.name      testExpressionsExponentiation0093
     * @tc.desc      Test power operator ** overflow behavior with short and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 100;
      let b: short = 2;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(10000);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_9400
     * @tc.name      testExpressionsExponentiation0094
     * @tc.desc      Test power operator ** overflow behavior with short and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 200;
      let b: short = 2;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(40000);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_9500
     * @tc.name      testExpressionsExponentiation0095
     * @tc.desc      Test power operator ** overflow behavior with int and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 65536;
      let b: int = 2;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(2147483647);
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_EXPONENTIATION_TEST_9600
     * @tc.name      testExpressionsExponentiation0096
     * @tc.desc      Test power operator ** overflow behavior with int and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsExponentiation0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 2147483647;
      let b: int = 2;
      let result = a ** b;
      expect(result instanceof int).assertTrue();
      expect(result).assertEqual(2147483647);
    });
  });
}