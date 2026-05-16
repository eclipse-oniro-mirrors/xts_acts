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

export default function ExpressionsMultiplicativeDivisionTest(): void {
  describe("ExpressionsMultiplicativeDivisionTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_0100
     * @tc.name      testExpressionsMultiplicativeDivision0001
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: short = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_0200
     * @tc.name      testExpressionsMultiplicativeDivision0002
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: int = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_0300
     * @tc.name      testExpressionsMultiplicativeDivision0003
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: long = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_0400
     * @tc.name      testExpressionsMultiplicativeDivision0004
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: bigint = 1n
      expect(BigInt(x) / y).assertEqual(1n)
      expect(y / BigInt(x)).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_0500
     * @tc.name      testExpressionsMultiplicativeDivision0005
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: float = 1.0f
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_0600
     * @tc.name      testExpressionsMultiplicativeDivision0006
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: double = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_0700
     * @tc.name      testExpressionsMultiplicativeDivision0007
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1
      let y: int = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_0800
     * @tc.name      testExpressionsMultiplicativeDivision0008
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1
      let y: long = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_0900
     * @tc.name      testExpressionsMultiplicativeDivision0009
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1
      let y: bigint = 1n
      expect(BigInt(x) / y).assertEqual(1n)
      expect(y / BigInt(x)).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_1000
     * @tc.name      testExpressionsMultiplicativeDivision0010
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1
      let y: float = 1.0f
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_1100
     * @tc.name      testExpressionsMultiplicativeDivision0011
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1
      let y: double = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_1200
     * @tc.name      testExpressionsMultiplicativeDivision0012
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      let y: long = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_1300
     * @tc.name      testExpressionsMultiplicativeDivision0013
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      let y: bigint = 1n
      expect(BigInt(x) / y).assertEqual(1n)
      expect(y / BigInt(x)).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_1400
     * @tc.name      testExpressionsMultiplicativeDivision0014
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      let y: float = 1.0f
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_1500
     * @tc.name      testExpressionsMultiplicativeDivision0015
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      let y: double = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_1600
     * @tc.name      testExpressionsMultiplicativeDivision0016
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1
      let y: bigint = 1n
      expect(BigInt(x) / y).assertEqual(1n)
      expect(y / BigInt(x)).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_1700
     * @tc.name      testExpressionsMultiplicativeDivision0017
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1
      let y: float = 1.0f
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_1800
     * @tc.name      testExpressionsMultiplicativeDivision0018
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1
      let y: double = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_1900
     * @tc.name      testExpressionsMultiplicativeDivision0019
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n
      let y: float = 1.0f
      expect(x / BigInt(y)).assertEqual(1n)
      expect(BigInt(y) / x).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_2000
     * @tc.name      testExpressionsMultiplicativeDivision0020
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n
      let y: double = 1
      expect(x / BigInt(y)).assertEqual(1n)
      expect(BigInt(y) / x).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_2100
     * @tc.name      testExpressionsMultiplicativeDivision0021
     * @tc.desc      Division of numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 1.0f
      let y: double = 1
      expect(x / y).assertEqual(1)
      expect(y / x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_2200
     * @tc.name      testExpressionsMultiplicativeDivision0022
     * @tc.desc      Division with Enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Color.White / Color.Black).assertEqual(Color.White)
      expect(Color.Red / Color.Black).assertEqual(Color.Red)
      expect(Color.Yellow / Color.Red).assertEqual(Color.Red)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_2300
     * @tc.name      testExpressionsMultiplicativeDivision0023
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.POSITIVE_INFINITY
      let rhs = 1.0
      let res = lhs / rhs
      expect( res).assertEqual(Double.POSITIVE_INFINITY );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_2400
     * @tc.name      testExpressionsMultiplicativeDivision0024
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.POSITIVE_INFINITY
      let rhs = -1.0
      let res = lhs / rhs
      expect( res).assertEqual(Double.NEGATIVE_INFINITY );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_2500
     * @tc.name      testExpressionsMultiplicativeDivision0025
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NEGATIVE_INFINITY
      let rhs = -1.0
      let res = lhs / rhs
      expect( res).assertEqual(Double.POSITIVE_INFINITY );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_2600
     * @tc.name      testExpressionsMultiplicativeDivision0026
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NEGATIVE_INFINITY
      let rhs = 1.0
      let res = lhs / rhs
      expect( res).assertEqual(Double.NEGATIVE_INFINITY );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_2700
     * @tc.name      testExpressionsMultiplicativeDivision0027
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 1.0
      let rhs = Double.POSITIVE_INFINITY
      let res = lhs / rhs
      expect( res).assertEqual(0.0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_2800
     * @tc.name      testExpressionsMultiplicativeDivision0028
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -1.0
      let rhs = Double.POSITIVE_INFINITY
      let res = lhs / rhs
      expect( res).assertEqual(-0.0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_2900
     * @tc.name      testExpressionsMultiplicativeDivision0029
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 1.0
      let rhs = Double.NEGATIVE_INFINITY
      let res = lhs / rhs
      expect( res).assertEqual(0.0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_3000
     * @tc.name      testExpressionsMultiplicativeDivision0030
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -1.0
      let rhs = Double.NEGATIVE_INFINITY
      let res = lhs / rhs
      expect( res).assertEqual(-0.0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_3100
     * @tc.name      testExpressionsMultiplicativeDivision0031
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 0.0
      let rhs = 1.0
      let res = lhs / rhs
      expect( res).assertEqual(0.0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_3200
     * @tc.name      testExpressionsMultiplicativeDivision0032
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 0.0
      let rhs = -1.0
      let res = lhs / rhs
      expect( res).assertEqual(-0.0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_3300
     * @tc.name      testExpressionsMultiplicativeDivision0033
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 1.0
      let rhs = 0.0
      let res = lhs / rhs
      expect( res).assertEqual(Double.POSITIVE_INFINITY );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_3400
     * @tc.name      testExpressionsMultiplicativeDivision0034
     * @tc.desc      Division with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = -1.0
      let rhs = 0.0
      let res = lhs / rhs
      expect( res).assertEqual(Double.NEGATIVE_INFINITY );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_3500
     * @tc.name      testExpressionsMultiplicativeDivision0035
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NaN
      let rhs = Double.NaN
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_3600
     * @tc.name      testExpressionsMultiplicativeDivision0036
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NaN
      let rhs = 1.0
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_3700
     * @tc.name      testExpressionsMultiplicativeDivision0037
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 1.0
      let rhs = Double.NaN
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_3800
     * @tc.name      testExpressionsMultiplicativeDivision0038
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NaN
      let rhs = Double.POSITIVE_INFINITY
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_3900
     * @tc.name      testExpressionsMultiplicativeDivision0039
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.POSITIVE_INFINITY
      let rhs = Double.NaN
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_4000
     * @tc.name      testExpressionsMultiplicativeDivision0040
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NaN
      let rhs = Double.NEGATIVE_INFINITY
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_4100
     * @tc.name      testExpressionsMultiplicativeDivision0041
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NEGATIVE_INFINITY
      let rhs = Double.NaN
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_4200
     * @tc.name      testExpressionsMultiplicativeDivision0042
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.POSITIVE_INFINITY
      let rhs = Double.POSITIVE_INFINITY
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_4300
     * @tc.name      testExpressionsMultiplicativeDivision0043
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.POSITIVE_INFINITY
      let rhs = Double.NEGATIVE_INFINITY
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_4400
     * @tc.name      testExpressionsMultiplicativeDivision0044
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NEGATIVE_INFINITY
      let rhs = Double.NEGATIVE_INFINITY
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_4500
     * @tc.name      testExpressionsMultiplicativeDivision0045
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = Double.NEGATIVE_INFINITY
      let rhs = Double.POSITIVE_INFINITY
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_DIVISION_4600
     * @tc.name      testExpressionsMultiplicativeDivision0046
     * @tc.desc      Division with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeDivision0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs = 0.0
      let rhs = 0.0
      expect(Double.isNaN(lhs / rhs)).assertTrue();
    })

  });
}
