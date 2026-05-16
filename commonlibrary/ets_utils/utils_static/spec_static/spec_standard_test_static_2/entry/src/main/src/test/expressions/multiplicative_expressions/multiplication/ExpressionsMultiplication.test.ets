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

export default function ExpressionsMultiplicationTest(): void {
  describe("ExpressionsMultiplicationTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_0100
     * @tc.name      testExpressionsMultiplication0001
     * @tc.desc      Multiplications with Enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Color.White * Color.White).assertEqual(Color.White)
      expect(Color.White * Color.Black).assertEqual(Color.White)
      expect(Color.Black * Color.Red).assertEqual(Color.Red)
      expect(Color.Red * Color.Red).assertEqual(Color.Yellow)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_0200
     * @tc.name      testExpressionsMultiplication0002
     * @tc.desc      Multiplications with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.POSITIVE_INFINITY * 1.0;
      expect( res).assertEqual(Double.POSITIVE_INFINITY )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_0300
     * @tc.name      testExpressionsMultiplication0003
     * @tc.desc      Multiplications with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.POSITIVE_INFINITY * -1.0;
      expect( res).assertEqual(Double.NEGATIVE_INFINITY )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_0400
     * @tc.name      testExpressionsMultiplication0004
     * @tc.desc      Multiplications with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.NEGATIVE_INFINITY * -1.0;
      expect( res).assertEqual(Double.POSITIVE_INFINITY )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_0500
     * @tc.name      testExpressionsMultiplication0005
     * @tc.desc      Multiplications with INF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.NEGATIVE_INFINITY * 1.0;
      expect( res).assertEqual(Double.NEGATIVE_INFINITY )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_0600
     * @tc.name      testExpressionsMultiplication0006
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( 0 * 0).assertEqual(0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_0700
     * @tc.name      testExpressionsMultiplication0007
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( 0 * 1).assertEqual(0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_0800
     * @tc.name      testExpressionsMultiplication0008
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( 1 * 0).assertEqual(0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_0900
     * @tc.name      testExpressionsMultiplication0009
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( 0 * -1).assertEqual(0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_1000
     * @tc.name      testExpressionsMultiplication0010
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( -1 * 0).assertEqual(0 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_1100
     * @tc.name      testExpressionsMultiplication0011
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( 2 * 2).assertEqual(4 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_1200
     * @tc.name      testExpressionsMultiplication0012
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( 2 * 1).assertEqual(2 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_1300
     * @tc.name      testExpressionsMultiplication0013
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( 1 * 2).assertEqual(2 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_1400
     * @tc.name      testExpressionsMultiplication0014
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( 2 * -1).assertEqual(-2 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_1500
     * @tc.name      testExpressionsMultiplication0015
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( -2 * 1).assertEqual(-2 );
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_1600
     * @tc.name      testExpressionsMultiplication0016
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: short = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_1700
     * @tc.name      testExpressionsMultiplication0017
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: int = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_1800
     * @tc.name      testExpressionsMultiplication0018
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: long = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_1900
     * @tc.name      testExpressionsMultiplication0019
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: bigint = 1n
      expect(BigInt(x) * y).assertEqual(1n)
      expect(y * BigInt(x)).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_2000
     * @tc.name      testExpressionsMultiplication0020
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: float = 1.0f
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_2100
     * @tc.name      testExpressionsMultiplication0021
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1
      let y: double = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_2200
     * @tc.name      testExpressionsMultiplication0022
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1
      let y: int = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_2300
     * @tc.name      testExpressionsMultiplication0023
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1
      let y: long = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_2400
     * @tc.name      testExpressionsMultiplication0024
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1
      let y: bigint = 1n
      expect(BigInt(x) * y).assertEqual(1n)
      expect(y * BigInt(x)).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_2500
     * @tc.name      testExpressionsMultiplication0025
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1
      let y: float = 1.0f
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_2600
     * @tc.name      testExpressionsMultiplication0026
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1
      let y: double = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_2700
     * @tc.name      testExpressionsMultiplication0027
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      let y: long = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_2800
     * @tc.name      testExpressionsMultiplication0028
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      let y: bigint = 1n
      expect(BigInt(x) * y).assertEqual(1n)
      expect(y * BigInt(x)).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_2900
     * @tc.name      testExpressionsMultiplication0029
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      let y: float = 1.0f
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_3000
     * @tc.name      testExpressionsMultiplication0030
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      let y: double = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_3100
     * @tc.name      testExpressionsMultiplication0031
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1
      let y: bigint = 1n
      expect(BigInt(x) * y).assertEqual(1n)
      expect(y * BigInt(x)).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_3200
     * @tc.name      testExpressionsMultiplication0032
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1
      let y: float = 1.0f
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_3300
     * @tc.name      testExpressionsMultiplication0033
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1
      let y: double = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_3400
     * @tc.name      testExpressionsMultiplication0034
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n
      let y: float = 1.0f
      expect(x * BigInt(y)).assertEqual(1n)
      expect(BigInt(y) * x).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_3500
     * @tc.name      testExpressionsMultiplication0035
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n
      let y: double = 1
      expect(x * BigInt(y)).assertEqual(1n)
      expect(BigInt(y) * x).assertEqual(1n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_3600
     * @tc.name      testExpressionsMultiplication0036
     * @tc.desc      Multiplication of integer numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 1.0f
      let y: double = 1
      expect(x * y).assertEqual(1)
      expect(y * x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_3700
     * @tc.name      testExpressionsMultiplication0037
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.NaN * Double.NaN;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_3800
     * @tc.name      testExpressionsMultiplication0038
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.NaN * 0.0;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_3900
     * @tc.name      testExpressionsMultiplication0039
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = 0.0 * Double.NaN;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_4000
     * @tc.name      testExpressionsMultiplication0040
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.NaN * 1.0;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_4100
     * @tc.name      testExpressionsMultiplication0041
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = 1.0 * Double.NaN;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_4200
     * @tc.name      testExpressionsMultiplication0042
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.NaN * Double.POSITIVE_INFINITY;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_4300
     * @tc.name      testExpressionsMultiplication0043
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.POSITIVE_INFINITY * Double.NaN;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_4400
     * @tc.name      testExpressionsMultiplication0044
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.NaN * Double.NEGATIVE_INFINITY;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_4500
     * @tc.name      testExpressionsMultiplication0045
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.NEGATIVE_INFINITY * Double.NaN;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_4600
     * @tc.name      testExpressionsMultiplication0046
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.POSITIVE_INFINITY * 0.0;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_4700
     * @tc.name      testExpressionsMultiplication0047
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.POSITIVE_INFINITY * -0.0;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_4800
     * @tc.name      testExpressionsMultiplication0048
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.NEGATIVE_INFINITY * 0.0;
      expect( Double.isNaN(res) ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATION_TEST_4900
     * @tc.name      testExpressionsMultiplication0049
     * @tc.desc      Multiplications with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplication0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = Double.NEGATIVE_INFINITY * -0.0;
      expect( Double.isNaN(res) ).assertTrue()
    })

  });
}
