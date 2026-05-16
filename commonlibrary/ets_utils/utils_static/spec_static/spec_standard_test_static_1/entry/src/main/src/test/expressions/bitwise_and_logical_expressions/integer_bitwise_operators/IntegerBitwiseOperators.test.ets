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
export default function IntegerBitwiseOperatorsTest() {
  describe("IntegerBitwiseOperatorsTest", () => {
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
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0100
     * @tc.name      testIntegerBitwiseOperators0001
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: short = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0200
     * @tc.name      testIntegerBitwiseOperators0002
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: int = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0300
     * @tc.name      testIntegerBitwiseOperators0003
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: long = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0400
     * @tc.name      testIntegerBitwiseOperators0004
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: bigint = 1n
        expect(BigInt(x) & y).assertEqual(1n)
        expect(y & BigInt(x)).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0500
     * @tc.name      testIntegerBitwiseOperators0005
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: float = 1.0f
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0600
     * @tc.name      testIntegerBitwiseOperators0006
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: double = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0700
     * @tc.name      testIntegerBitwiseOperators0007
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: int = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0800
     * @tc.name      testIntegerBitwiseOperators0008
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: long = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_0900
     * @tc.name      testIntegerBitwiseOperators0009
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: bigint = 1n
        expect(BigInt(x) & y).assertEqual(1n)
        expect(y & BigInt(x)).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1000
     * @tc.name      testIntegerBitwiseOperators0010
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: float = 1.0f
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1100
     * @tc.name      testIntegerBitwiseOperators0011
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: double = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1200
     * @tc.name      testIntegerBitwiseOperators0012
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: long = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1300
     * @tc.name      testIntegerBitwiseOperators0013
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: bigint = 1n
        expect(BigInt(x) & y).assertEqual(1n)
        expect(y & BigInt(x)).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1400
     * @tc.name      testIntegerBitwiseOperators0014
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: float = 1.0f
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1500
     * @tc.name      testIntegerBitwiseOperators0015
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: double = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1600
     * @tc.name      testIntegerBitwiseOperators0016
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: bigint = 1n
        expect(BigInt(x) & y).assertEqual(1n)
        expect(y & BigInt(x)).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1700
     * @tc.name      testIntegerBitwiseOperators0017
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: float = 1.0f
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1800
     * @tc.name      testIntegerBitwiseOperators0018
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: double = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_1900
     * @tc.name      testIntegerBitwiseOperators0019
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: bigint = 1n
        let y: float = 1.0f
        expect(x & BigInt(y)).assertEqual(1n)
        expect(BigInt(y) & x).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2000
     * @tc.name      testIntegerBitwiseOperators0020
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: bigint = 1n
        let y: double = 1
        expect(x & BigInt(y)).assertEqual(1n)
        expect(BigInt(y) & x).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2100
     * @tc.name      testIntegerBitwiseOperators0021
     * @tc.desc      Bitwise and with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: float = 1.0f
        let y: double = 1
        expect(x & y).assertEqual(1)
        expect(y & x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2200
     * @tc.name      testIntegerBitwiseOperators0022
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: short = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2300
     * @tc.name      testIntegerBitwiseOperators0023
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: int = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2400
     * @tc.name      testIntegerBitwiseOperators0024
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: long = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2500
     * @tc.name      testIntegerBitwiseOperators0025
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: bigint = 1n
        expect(BigInt(x) | y).assertEqual(1n)
        expect(y | BigInt(x)).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2600
     * @tc.name      testIntegerBitwiseOperators0026
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: float = 1.0f
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2700
     * @tc.name      testIntegerBitwiseOperators0027
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: double = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2800
     * @tc.name      testIntegerBitwiseOperators0028
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: int = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_2900
     * @tc.name      testIntegerBitwiseOperators0029
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: long = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_3000
     * @tc.name      testIntegerBitwiseOperators0030
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: bigint = 1n
        expect(BigInt(x) | y).assertEqual(1n)
        expect(y | BigInt(x)).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_3100
     * @tc.name      testIntegerBitwiseOperators0031
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: float = 1.0f
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_3200
     * @tc.name      testIntegerBitwiseOperators0032
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: double = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_3300
     * @tc.name      testIntegerBitwiseOperators0033
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: long = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_3400
     * @tc.name      testIntegerBitwiseOperators0034
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: bigint = 1n
        expect(BigInt(x) | y).assertEqual(1n)
        expect(y | BigInt(x)).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_3500
     * @tc.name      testIntegerBitwiseOperators0035
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: float = 1.0f
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_3600
     * @tc.name      testIntegerBitwiseOperators0036
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: double = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_3700
     * @tc.name      testIntegerBitwiseOperators0037
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: bigint = 1n
        expect(BigInt(x) | y).assertEqual(1n)
        expect(y | BigInt(x)).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_3800
     * @tc.name      testIntegerBitwiseOperators0038
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: float = 1.0f
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_3900
     * @tc.name      testIntegerBitwiseOperators0039
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: double = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_4000
     * @tc.name      testIntegerBitwiseOperators0040
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: bigint = 1n
        let y: float = 1.0f
        expect(x | BigInt(y)).assertEqual(1n)
        expect(BigInt(y) | x).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_4100
     * @tc.name      testIntegerBitwiseOperators0041
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: bigint = 1n
        let y: double = 1
        expect(x | BigInt(y)).assertEqual(1n)
        expect(BigInt(y) | x).assertEqual(1n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_4200
     * @tc.name      testIntegerBitwiseOperators0042
     * @tc.desc      Bitwise or with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: float = 1.0f
        let y: double = 1
        expect(x | y).assertEqual(1)
        expect(y | x).assertEqual(1)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_4300
     * @tc.name      testIntegerBitwiseOperators0043
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: short = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_4400
     * @tc.name      testIntegerBitwiseOperators0044
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: int = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_4500
     * @tc.name      testIntegerBitwiseOperators0045
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: long = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_4600
     * @tc.name      testIntegerBitwiseOperators0046
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: bigint = 1n
        expect(BigInt(x) ^ y).assertEqual(0n)
        expect(y ^ BigInt(x)).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_4700
     * @tc.name      testIntegerBitwiseOperators0047
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: float = 1.0f
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_4800
     * @tc.name      testIntegerBitwiseOperators0048
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 1
        let y: double = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_4900
     * @tc.name      testIntegerBitwiseOperators0049
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: int = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_5000
     * @tc.name      testIntegerBitwiseOperators0050
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: long = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_5100
     * @tc.name      testIntegerBitwiseOperators0051
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: bigint = 1n
        expect(BigInt(x) ^ y).assertEqual(0n)
        expect(y ^ BigInt(x)).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_5200
     * @tc.name      testIntegerBitwiseOperators0052
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: float = 1.0f
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_5300
     * @tc.name      testIntegerBitwiseOperators0053
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: short = 1
        let y: double = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_5400
     * @tc.name      testIntegerBitwiseOperators0054
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: long = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_5500
     * @tc.name      testIntegerBitwiseOperators0055
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: bigint = 1n
        expect(BigInt(x) ^ y).assertEqual(0n)
        expect(y ^ BigInt(x)).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_5600
     * @tc.name      testIntegerBitwiseOperators0056
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: float = 1.0f
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_5700
     * @tc.name      testIntegerBitwiseOperators0057
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int = 1
        let y: double = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_5800
     * @tc.name      testIntegerBitwiseOperators0058
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: bigint = 1n
        expect(BigInt(x) ^ y).assertEqual(0n)
        expect(y ^ BigInt(x)).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_5900
     * @tc.name      testIntegerBitwiseOperators0059
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: float = 1.0f
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_6000
     * @tc.name      testIntegerBitwiseOperators0060
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: long = 1
        let y: double = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_6100
     * @tc.name      testIntegerBitwiseOperators0061
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: bigint = 1n
        let y: float = 1.0f
        expect(x ^ BigInt(y)).assertEqual(0n)
        expect(BigInt(y) ^ x).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_6200
     * @tc.name      testIntegerBitwiseOperators0062
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: bigint = 1n
        let y: double = 1
        expect(x ^ BigInt(y)).assertEqual(0n)
        expect(BigInt(y) ^ x).assertEqual(0n)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_6300
     * @tc.name      testIntegerBitwiseOperators0063
     * @tc.desc      Bitwise xor with different operand types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: float = 1.0f
        let y: double = 1
        expect(x ^ y).assertEqual(0)
        expect(y ^ x).assertEqual(0)
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_6400
     * @tc.name      testIntegerBitwiseOperators0064
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 0;
        let y: byte = 0;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_6500
     * @tc.name      testIntegerBitwiseOperators0065
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 0;
        let y: byte = 85;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_6600
     * @tc.name      testIntegerBitwiseOperators0066
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 0;
        let y: byte = -86;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_6700
     * @tc.name      testIntegerBitwiseOperators0067
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 0;
        let y: byte = 15;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_6800
     * @tc.name      testIntegerBitwiseOperators0068
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 0;
        let y: byte = -16;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_6900
     * @tc.name      testIntegerBitwiseOperators0069
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 0;
        let y: byte = 51;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_7000
     * @tc.name      testIntegerBitwiseOperators0070
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 0;
        let y: byte = -52;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_7100
     * @tc.name      testIntegerBitwiseOperators0071
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 0;
        let y: byte = -127;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_7200
     * @tc.name      testIntegerBitwiseOperators0072
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 0;
        let y: byte = -103;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_7300
     * @tc.name      testIntegerBitwiseOperators0073
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 0;
        let y: byte = 102;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_7400
     * @tc.name      testIntegerBitwiseOperators0074
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 85;
        let y: byte = 0;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_7500
     * @tc.name      testIntegerBitwiseOperators0075
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 85;
        let y: byte = 85;
        let dest: byte = 85;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_7600
     * @tc.name      testIntegerBitwiseOperators0076
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 85;
        let y: byte = -86;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_7700
     * @tc.name      testIntegerBitwiseOperators0077
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 85;
        let y: byte = 15;
        let dest: byte = 5;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_7800
     * @tc.name      testIntegerBitwiseOperators0078
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 85;
        let y: byte = -16;
        let dest: byte = 80;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_7900
     * @tc.name      testIntegerBitwiseOperators0079
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 85;
        let y: byte = 51;
        let dest: byte = 17;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_8000
     * @tc.name      testIntegerBitwiseOperators0080
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 85;
        let y: byte = -52;
        let dest: byte = 68;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_8100
     * @tc.name      testIntegerBitwiseOperators0081
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 85;
        let y: byte = -127;
        let dest: byte = 1;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_8200
     * @tc.name      testIntegerBitwiseOperators0082
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 85;
        let y: byte = -103;
        let dest: byte = 17;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_8300
     * @tc.name      testIntegerBitwiseOperators0083
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 85;
        let y: byte = 102;
        let dest: byte = 68;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_8400
     * @tc.name      testIntegerBitwiseOperators0084
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = -86;
        let y: byte = 0;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_8500
     * @tc.name      testIntegerBitwiseOperators0085
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = -86;
        let y: byte = 85;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_8600
     * @tc.name      testIntegerBitwiseOperators0086
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = -86;
        let y: byte = -86;
        let dest: byte = -86;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_8700
     * @tc.name      testIntegerBitwiseOperators0087
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = -86;
        let y: byte = 15;
        let dest: byte = 10;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_8800
     * @tc.name      testIntegerBitwiseOperators0088
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = -86;
        let y: byte = -16;
        let dest: byte = -96;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_8900
     * @tc.name      testIntegerBitwiseOperators0089
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = -86;
        let y: byte = 51;
        let dest: byte = 34;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_9000
     * @tc.name      testIntegerBitwiseOperators0090
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = -86;
        let y: byte = -52;
        let dest: byte = -120;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_9100
     * @tc.name      testIntegerBitwiseOperators0091
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = -86;
        let y: byte = -127;
        let dest: byte = -128;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_9200
     * @tc.name      testIntegerBitwiseOperators0092
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = -86;
        let y: byte = -103;
        let dest: byte = -120;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_9300
     * @tc.name      testIntegerBitwiseOperators0093
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = -86;
        let y: byte = 102;
        let dest: byte = 34;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_9400
     * @tc.name      testIntegerBitwiseOperators0094
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 15;
        let y: byte = 0;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_9500
     * @tc.name      testIntegerBitwiseOperators0095
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 15;
        let y: byte = 85;
        let dest: byte = 5;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_9600
     * @tc.name      testIntegerBitwiseOperators0096
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 15;
        let y: byte = -86;
        let dest: byte = 10;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_9700
     * @tc.name      testIntegerBitwiseOperators0097
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 15;
        let y: byte = 15;
        let dest: byte = 15;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_9800
     * @tc.name      testIntegerBitwiseOperators0098
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 15;
        let y: byte = -16;
        let dest: byte = 0;
        expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_9900
     * @tc.name      testIntegerBitwiseOperators0099
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperators0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: byte = 15;
        let y: byte = 51;
        let dest: byte = 3;
        expect((x & y)).assertEqual(dest);
    })

  })
}