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
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum Color { White, Black, Red, Blue, Yellow }

export default function ExpressionsMultiplicativeRemainderTest(): void {
  describe("ExpressionsMultiplicativeRemainderTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_0100
     * @tc.name      testExpressionsMultiplicativeRemainder0001
     * @tc.desc      Remainder with Enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Color.White % Color.Black).assertEqual(Color.White)
      expect(Color.Red % Color.Black).assertEqual(Color.White)
      expect(Color.Yellow % Color.Red).assertEqual(Color.White)
      expect(Color.Yellow % Color.Blue).assertEqual(Color.Black)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_0200
     * @tc.name      testExpressionsMultiplicativeRemainder0002
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 1.0
      let rhs = Double.POSITIVE_INFINITY
      let res = lhs % rhs
      expect(res == 1.0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_0300
     * @tc.name      testExpressionsMultiplicativeRemainder0003
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -1.0
      let rhs = Double.POSITIVE_INFINITY
      let res = lhs % rhs
      expect(res == -1.0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_0400
     * @tc.name      testExpressionsMultiplicativeRemainder0004
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 1.0
      let rhs = Double.NEGATIVE_INFINITY
      let res = lhs % rhs
      expect(res == 1.0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_0500
     * @tc.name      testExpressionsMultiplicativeRemainder0005
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -1.0
      let rhs = Double.NEGATIVE_INFINITY
      let res = lhs % rhs
      expect(res == -1.0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_0600
     * @tc.name      testExpressionsMultiplicativeRemainder0006
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 0.0
      let rhs = Double.POSITIVE_INFINITY
      let res = lhs % rhs
      expect(res == 0.0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_0700
     * @tc.name      testExpressionsMultiplicativeRemainder0007
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -0.0
      let rhs = Double.POSITIVE_INFINITY
      let res = lhs % rhs
      expect(res == -0.0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_0800
     * @tc.name      testExpressionsMultiplicativeRemainder0008
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 0.0
      let rhs = Double.NEGATIVE_INFINITY
      let res = lhs % rhs
      expect(res == 0.0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_0900
     * @tc.name      testExpressionsMultiplicativeRemainder0009
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -0.0
      let rhs = Double.NEGATIVE_INFINITY
      let res = lhs % rhs
      expect(res == -0.0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_1000
     * @tc.name      testExpressionsMultiplicativeRemainder0010
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 1.0
      let rhs = 0.0
      let res = lhs % rhs
      expect(Double.isNaN(res)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_1100
     * @tc.name      testExpressionsMultiplicativeRemainder0011
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 1.0
      let rhs = -0.0
      let res = lhs % rhs
      expect(Double.isNaN(res)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_1200
     * @tc.name      testExpressionsMultiplicativeRemainder0012
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -1.0
      let rhs = 0.0
      let res = lhs % rhs
      expect(Double.isNaN(res)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_1300
     * @tc.name      testExpressionsMultiplicativeRemainder0013
     * @tc.desc      Remainder with INF and zeroes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -1.0
      let rhs = -0.0
      let res = lhs % rhs
      expect(Double.isNaN(res)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_1800
     * @tc.name      testExpressionsMultiplicativeRemainder0018
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 0
      let rhs = 1
      let res = lhs % rhs
      expect(res == 0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_1900
     * @tc.name      testExpressionsMultiplicativeRemainder0019
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 1
      let rhs = 1
      let res = lhs % rhs
      expect(res == 0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_2000
     * @tc.name      testExpressionsMultiplicativeRemainder0020
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 2
      let rhs = 1
      let res = lhs % rhs
      expect(res == 0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_2100
     * @tc.name      testExpressionsMultiplicativeRemainder0021
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 10
      let rhs = 3
      let res = lhs % rhs
      expect(res == 1).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_2200
     * @tc.name      testExpressionsMultiplicativeRemainder0022
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 10
      let rhs = -3
      let res = lhs % rhs
      expect(res == 1).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_2300
     * @tc.name      testExpressionsMultiplicativeRemainder0023
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -10
      let rhs = 3
      let res = lhs % rhs
      expect(res == -1).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_2400
     * @tc.name      testExpressionsMultiplicativeRemainder0024
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -10
      let rhs = -3
      let res = lhs % rhs
      expect(res == -1).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_2500
     * @tc.name      testExpressionsMultiplicativeRemainder0025
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 2147483647
      let rhs = 2
      let res = lhs % rhs
      expect(res == 1).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_2600
     * @tc.name      testExpressionsMultiplicativeRemainder0026
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -2147483648
      let rhs = 2
      let res = lhs % rhs
      expect(res == 0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_2700
     * @tc.name      testExpressionsMultiplicativeRemainder0027
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 2147483647
      let rhs = -2
      let res = lhs % rhs
      expect(res == 1).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_2800
     * @tc.name      testExpressionsMultiplicativeRemainder0028
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -2147483648
      let rhs = -2
      let res = lhs % rhs
      expect(res == 0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_2900
     * @tc.name      testExpressionsMultiplicativeRemainder0029
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 2147483647
      let rhs = 2147483647
      let res = lhs % rhs
      expect(res == 0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_3000
     * @tc.name      testExpressionsMultiplicativeRemainder0030
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -2147483648
      let rhs = -2147483648
      let res = lhs % rhs
      expect(res == 0).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_3100
     * @tc.name      testExpressionsMultiplicativeRemainder0031
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 2147483647
      let rhs = -2147483648
      let res = lhs % rhs
      expect(res == 2147483647).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_3200
     * @tc.name      testExpressionsMultiplicativeRemainder0032
     * @tc.desc      Remainder of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -2147483648
      let rhs = 2147483647
      let res = lhs % rhs
      expect(res == -1).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_3300
     * @tc.name      testExpressionsMultiplicativeRemainder0033
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NaN
      let rhs = Double.NaN
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_3400
     * @tc.name      testExpressionsMultiplicativeRemainder0034
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 1.0
      let rhs = Double.NaN
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_3500
     * @tc.name      testExpressionsMultiplicativeRemainder0035
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NaN
      let rhs = 1.0
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_3600
     * @tc.name      testExpressionsMultiplicativeRemainder0036
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.POSITIVE_INFINITY
      let rhs = Double.NaN
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_3700
     * @tc.name      testExpressionsMultiplicativeRemainder0037
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NaN
      let rhs = Double.POSITIVE_INFINITY
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_3800
     * @tc.name      testExpressionsMultiplicativeRemainder0038
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NEGATIVE_INFINITY
      let rhs = Double.NaN
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_3900
     * @tc.name      testExpressionsMultiplicativeRemainder0039
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NaN
      let rhs = Double.NEGATIVE_INFINITY
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_4000
     * @tc.name      testExpressionsMultiplicativeRemainder0040
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 0.0
      let rhs = Double.NaN
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_4100
     * @tc.name      testExpressionsMultiplicativeRemainder0041
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NaN
      let rhs = 0.0
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_4200
     * @tc.name      testExpressionsMultiplicativeRemainder0042
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -0.0
      let rhs = Double.NaN
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_4300
     * @tc.name      testExpressionsMultiplicativeRemainder0043
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NaN
      let rhs = -0.0
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_4400
     * @tc.name      testExpressionsMultiplicativeRemainder0044
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.POSITIVE_INFINITY
      let rhs = 0.0
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_5000
     * @tc.name      testExpressionsMultiplicativeRemainder0050
     * @tc.desc      Remainder with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NEGATIVE_INFINITY
      let rhs = 0.0
      expect(Double.isNaN(lhs % rhs)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_5600
     * @tc.name      testExpressionsMultiplicativeRemainder0056
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: short = 1
      expect(x % y).assertEqual(0)
      expect(y % x).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_5700
     * @tc.name      testExpressionsMultiplicativeRemainder0057
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 127
      let y: short = 3
      expect(x % y).assertEqual(1)
      expect(y % x).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_5800
     * @tc.name      testExpressionsMultiplicativeRemainder0058
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -128
      let y: short = 3
      expect(x % y).assertEqual(-2)
      expect(y % x).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_5900
     * @tc.name      testExpressionsMultiplicativeRemainder0059
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      let y: long = 1
      expect(x % y).assertEqual(0)
      expect(y % x).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_6000
     * @tc.name      testExpressionsMultiplicativeRemainder0060
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483647
      let y: long = 2
      expect(x % y).assertEqual(1)
      expect(y % x).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_6100
     * @tc.name      testExpressionsMultiplicativeRemainder0061
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -2147483648
      let y: long = 2
      expect(x % y).assertEqual(0)
      expect(y % x).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_6200
     * @tc.name      testExpressionsMultiplicativeRemainder0062
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483647
      let y: long = -2
      expect(x % y).assertEqual(1)
      expect(y % x).assertEqual(-2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_6300
     * @tc.name      testExpressionsMultiplicativeRemainder0063
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -2147483648
      let y: long = -2
      expect(x % y).assertEqual(0)
      expect(y % x).assertEqual(-2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_6400
     * @tc.name      testExpressionsMultiplicativeRemainder0064
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483647
      let y: long = 2147483647
      expect(x % y).assertEqual(0)
      expect(y % x).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_6500
     * @tc.name      testExpressionsMultiplicativeRemainder0065
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -2147483648
      let y: long = -2147483648
      expect(x % y).assertEqual(0)
      expect(y % x).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_6600
     * @tc.name      testExpressionsMultiplicativeRemainder0066
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483647
      let y: long = -2147483648
      expect(x % y).assertEqual(2147483647)
      expect(y % x).assertEqual(-1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_REMAINDER_6700
     * @tc.name      testExpressionsMultiplicativeRemainder0067
     * @tc.desc      Remainder of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeRemainder0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -2147483648
      let y: long = 2147483647
      expect(x % y).assertEqual(-1)
      expect(y % x).assertEqual(2147483647)
    })

  })
}
