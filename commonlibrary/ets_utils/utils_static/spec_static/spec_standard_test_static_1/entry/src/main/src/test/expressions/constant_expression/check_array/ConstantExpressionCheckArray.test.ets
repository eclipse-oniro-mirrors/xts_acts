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

export default function ConstantExpressionCheckArrayTest() {
  describe("ConstantExpressionCheckArrayTest", () => {
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
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_0100
     * @tc.name      testConstantExpressionCheckArray0001
     * @tc.desc      Constant expression with bitwise complement as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: int = -16
      const data: int[] = new Array<int>(~testValue)
      expect(data.length).assertEqual(15)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_0200
     * @tc.name      testConstantExpressionCheckArray0002
     * @tc.desc      Constant expression with bitwise complement as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: int = -30
      const data: int[] = new Array<int>(~testValue)
      expect(data.length).assertEqual(29)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_0300
     * @tc.name      testConstantExpressionCheckArray0003
     * @tc.desc      Constant expression with bitwise complement as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: int = -50
      const data: int[] = new Array<int>(~testValue.toInt())
      expect(data.length).assertEqual(49)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_0400
     * @tc.name      testConstantExpressionCheckArray0004
     * @tc.desc      Constant expression with bitwise complement as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: float = -12.2f
      const data: int[] = new Array<int>(~testValue.toInt())
      expect(data.length).assertEqual(11)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_0500
     * @tc.name      testConstantExpressionCheckArray0005
     * @tc.desc      Constant expression with bitwise complement as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValue: float = -55.9f
      const data: int[] = new Array<int>(~testValue.toInt())
      expect(data.length).assertEqual(54)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_0600
     * @tc.name      testConstantExpressionCheckArray0006
     * @tc.desc      Constant bitwise expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const size: int = (value1 & 7).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_0700
     * @tc.name      testConstantExpressionCheckArray0007
     * @tc.desc      Constant bitwise expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const size: int = (value1 | 7).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(15)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_0800
     * @tc.name      testConstantExpressionCheckArray0008
     * @tc.desc      Constant bitwise expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const size: int = (value1 ^ 7).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(13)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_0900
     * @tc.name      testConstantExpressionCheckArray0009
     * @tc.desc      Constant bitwise expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 10.5f
      const size: int = (value1 & 7.0).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_1000
     * @tc.name      testConstantExpressionCheckArray0010
     * @tc.desc      Constant bitwise expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 10.5f
      const size: int = (value1 | 7.0).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(15)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_1100
     * @tc.name      testConstantExpressionCheckArray0011
     * @tc.desc      Constant bitwise expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 10.5f
      const size: int = (value1 ^ 7.0).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(13)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_1200
     * @tc.name      testConstantExpressionCheckArray0012
     * @tc.desc      Constant bitwise expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 10.9f
      const size: int = (value1 & 7.1).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_1300
     * @tc.name      testConstantExpressionCheckArray0013
     * @tc.desc      Constant bitwise expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 10.9f
      const size: int = (value1 | 7.1).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(15)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_1400
     * @tc.name      testConstantExpressionCheckArray0014
     * @tc.desc      Constant bitwise expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 10.9f
      const size: int = (value1 ^ 7.1).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(13)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_1500
     * @tc.name      testConstantExpressionCheckArray0015
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 26
      const value2: int = 10
      const size: int = (value1 * value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(260)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_1600
     * @tc.name      testConstantExpressionCheckArray0016
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 26
      const value2: int = 10
      const size: int = (value1 / value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_1700
     * @tc.name      testConstantExpressionCheckArray0017
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 38
      const value2: int = 10
      const size: int = (value1 * value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(380)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_1800
     * @tc.name      testConstantExpressionCheckArray0018
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 308
      const value2: int = 10
      const size: int = (value1 / value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(30)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_1900
     * @tc.name      testConstantExpressionCheckArray0019
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 308
      const value2: int = 10
      const size: int = (value1 % value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(8)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_2000
     * @tc.name      testConstantExpressionCheckArray0020
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 308
      const value2: int = 10
      const size: int = (value1 + value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(318)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_2100
     * @tc.name      testConstantExpressionCheckArray0021
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 308
      const value2: int = 10
      const size: int = (value1 - value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(298)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_2200
     * @tc.name      testConstantExpressionCheckArray0022
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 56
      const value2: int = 10
      const size: int = (value1 * value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(560)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_2300
     * @tc.name      testConstantExpressionCheckArray0023
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 506
      const value2: int = 10
      const size: int = (value1 / value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(50)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_2400
     * @tc.name      testConstantExpressionCheckArray0024
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 506
      const value2: int = 10
      const size: int = (value1 % value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(6)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_2500
     * @tc.name      testConstantExpressionCheckArray0025
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 506
      const value2: int = 10
      const size: int = (value1 + value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(516)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_2600
     * @tc.name      testConstantExpressionCheckArray0026
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 506
      const value2: int = 10
      const size: int = (value1 - value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(496)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_2700
     * @tc.name      testConstantExpressionCheckArray0027
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 26
      const value2: int = 10
      const size: int = (value1 % value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(6)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_2800
     * @tc.name      testConstantExpressionCheckArray0028
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const value2: int = 10
      const size: int = (value1 * value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(1232)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_2900
     * @tc.name      testConstantExpressionCheckArray0029
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const value2: int = 10
      const size: int = (value1 / value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(12)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_3000
     * @tc.name      testConstantExpressionCheckArray0030
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const value2: int = 10
      const size: int = (value1 % value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_3100
     * @tc.name      testConstantExpressionCheckArray0031
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const value2: int = 10
      const size: int = (value1 + value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(133)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_3200
     * @tc.name      testConstantExpressionCheckArray0032
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 123.2f
      const value2: int = 10
      const size: int = (value1 - value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(113)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_3300
     * @tc.name      testConstantExpressionCheckArray0033
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 551.9f
      const value2: int = 10
      const size: int = (value1 * value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(5519)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_3400
     * @tc.name      testConstantExpressionCheckArray0034
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 551.9f
      const value2: int = 10
      const size: int = (value1 / value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(55)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_3500
     * @tc.name      testConstantExpressionCheckArray0035
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 551.9f
      const value2: int = 10
      const size: int = (value1 % value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_3600
     * @tc.name      testConstantExpressionCheckArray0036
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 551.9f
      const value2: int = 10
      const size: int = (value1 + value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(561)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_3700
     * @tc.name      testConstantExpressionCheckArray0037
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 551.9f
      const value2: int = 10
      const size: int = (value1 - value2).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(541)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_3800
     * @tc.name      testConstantExpressionCheckArray0038
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 26
      const value2: int = 10
      const size: int = (value1 + value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(36)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_3900
     * @tc.name      testConstantExpressionCheckArray0039
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 26
      const value2: int = 10
      const size: int = (value1 - value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(16)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_4000
     * @tc.name      testConstantExpressionCheckArray0040
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 260
      const value2: int = 10
      const size: int = (value1 / value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(26)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_4100
     * @tc.name      testConstantExpressionCheckArray0041
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 260
      const value2: int = 10
      const size: int = (value1 % value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_4200
     * @tc.name      testConstantExpressionCheckArray0042
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 260
      const value2: int = 10
      const size: int = (value1 + value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(270)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_4300
     * @tc.name      testConstantExpressionCheckArray0043
     * @tc.desc      Constant expression with mathematical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 260
      const value2: int = 10
      const size: int = (value1 - value2)
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(250)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_4400
     * @tc.name      testConstantExpressionCheckArray0044
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const decision: boolean = value1 < 12
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_4500
     * @tc.name      testConstantExpressionCheckArray0045
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const decision: boolean = value1 < 12.0f
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_4600
     * @tc.name      testConstantExpressionCheckArray0046
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 21.7f
      const decision: boolean = value1 === 21.7f
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(46)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_4700
     * @tc.name      testConstantExpressionCheckArray0047
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 22.3f
      const decision: boolean = value1 === 22.3f
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(47)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_4800
     * @tc.name      testConstantExpressionCheckArray0048
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const decision: boolean = value1 < 12
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_4900
     * @tc.name      testConstantExpressionCheckArray0049
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const decision: boolean = value1 < 12.0f
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_5000
     * @tc.name      testConstantExpressionCheckArray0050
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 260
      const decision: boolean = value1 <= 25
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(285)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_5100
     * @tc.name      testConstantExpressionCheckArray0051
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 30
      const decision: boolean = value1 >= -30
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(30)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_5200
     * @tc.name      testConstantExpressionCheckArray0052
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 260
      const decision: boolean = value1 === 259
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(285)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_5300
     * @tc.name      testConstantExpressionCheckArray0053
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 26.0f
      const decision: boolean = value1 === 26.0f
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(26)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_5400
     * @tc.name      testConstantExpressionCheckArray0054
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 27.0f
      const decision: boolean = value1 === 27
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(27)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_5500
     * @tc.name      testConstantExpressionCheckArray0055
     * @tc.desc      Constant expression with logical calculations as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 28.3f
      const decision: boolean = value1 === 28.3f
      const size: int = (decision ? value1 : value1 + 25).toInt()
      const data: int[] = new Array<int>(size)
      expect(data.length).assertEqual(53)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_5600
     * @tc.name      testConstantExpressionCheckArray0056
     * @tc.desc      Constant expression with number conversion as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = 16
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(16)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_5700
     * @tc.name      testConstantExpressionCheckArray0057
     * @tc.desc      Constant expression with number conversion as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = 30
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(30)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_5800
     * @tc.name      testConstantExpressionCheckArray0058
     * @tc.desc      Constant expression with number conversion as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = 'p'.charCodeAt(0)
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(112)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_5900
     * @tc.name      testConstantExpressionCheckArray0059
     * @tc.desc      Constant expression with number conversion as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = 300
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(300)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_6000
     * @tc.name      testConstantExpressionCheckArray0060
     * @tc.desc      Constant expression with number conversion as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = 500
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(500)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_6100
     * @tc.name      testConstantExpressionCheckArray0061
     * @tc.desc      Constant expression with number conversion as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: float = 120.2f
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(120)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_6200
     * @tc.name      testConstantExpressionCheckArray0062
     * @tc.desc      Constant expression with number conversion as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: float = 550.9f
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(550)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_6300
     * @tc.name      testConstantExpressionCheckArray0063
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const size = value1 << 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(80)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_6400
     * @tc.name      testConstantExpressionCheckArray0064
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const size = value1 >> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_6500
     * @tc.name      testConstantExpressionCheckArray0065
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 46
      const size = value1 >> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_6600
     * @tc.name      testConstantExpressionCheckArray0066
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 46
      const size = value1 >>> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_6700
     * @tc.name      testConstantExpressionCheckArray0067
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 53.2f
      const size = value1 << 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(424)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_6800
     * @tc.name      testConstantExpressionCheckArray0068
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 53.2f
      const size = value1 >> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(6)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_6900
     * @tc.name      testConstantExpressionCheckArray0069
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 53.2f
      const size = value1 >>> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(6)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_7000
     * @tc.name      testConstantExpressionCheckArray0070
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 61.9f
      const size = value1 << 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(488)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_7100
     * @tc.name      testConstantExpressionCheckArray0071
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 61.9f
      const size = value1 >> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(7)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_7200
     * @tc.name      testConstantExpressionCheckArray0072
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: float = 61.9f
      const size = value1 >>> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(7)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_7300
     * @tc.name      testConstantExpressionCheckArray0073
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 10
      const size = value1 >>> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_7400
     * @tc.name      testConstantExpressionCheckArray0074
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 20
      const size = value1 << 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(160)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_7500
     * @tc.name      testConstantExpressionCheckArray0075
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 20
      const size = value1 >> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_7600
     * @tc.name      testConstantExpressionCheckArray0076
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 20
      const size = value1 >>> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_7700
     * @tc.name      testConstantExpressionCheckArray0077
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 38
      const size = value1 << 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(304)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_7800
     * @tc.name      testConstantExpressionCheckArray0078
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 38
      const size = value1 >> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(4)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_7900
     * @tc.name      testConstantExpressionCheckArray0079
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 38
      const size = value1 >>> 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(4)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_8000
     * @tc.name      testConstantExpressionCheckArray0080
     * @tc.desc      Constant shift expression as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: int = 46
      const size = value1 << 3
      const data: int[] = new Array<int>(size.toInt())
      expect(data.length).assertEqual(368)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_8100
     * @tc.name      testConstantExpressionCheckArray0081
     * @tc.desc      Constant expression with unary minus as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = -16
      const data: int[] = new Array<int>(-size.toInt())
      expect(data.length).assertEqual(16)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_8200
     * @tc.name      testConstantExpressionCheckArray0082
     * @tc.desc      Constant expression with unary minus as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = -30
      const data: int[] = new Array<int>(-size.toInt())
      expect(data.length).assertEqual(30)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_8300
     * @tc.name      testConstantExpressionCheckArray0083
     * @tc.desc      Constant expression with unary minus as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = -31
      const data: int[] = new Array<int>(-size.toInt())
      expect(data.length).assertEqual(31)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_8400
     * @tc.name      testConstantExpressionCheckArray0084
     * @tc.desc      Constant expression with unary minus as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = -510
      const data: int[] = new Array<int>(-size.toInt())
      expect(data.length).assertEqual(510)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_8500
     * @tc.name      testConstantExpressionCheckArray0085
     * @tc.desc      Constant expression with unary minus as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: float = -12.2f
      const data: int[] = new Array<int>(-size.toInt())
      expect(data.length).assertEqual(12)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_8600
     * @tc.name      testConstantExpressionCheckArray0086
     * @tc.desc      Constant expression with unary minus as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: float = -50.9f
      const data: int[] = new Array<int>(-size.toInt())
      expect(data.length).assertEqual(50)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_8700
     * @tc.name      testConstantExpressionCheckArray0087
     * @tc.desc      Constant expression with unary plus as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = 16
      const data: int[] = new Array<int>(+size.toInt())
      expect(data.length).assertEqual(16)
    })

    /**
     * @tc.number    SUB_CONSTANT_EXPRESSION_CHECK_ARRAY_8800
     * @tc.name      testConstantExpressionCheckArray0088
     * @tc.desc      Constant expression with unary plus as array size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstantExpressionCheckArray0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size1: int = 30
      const data1: int[] = new Array<int>(+size1.toInt())
      expect(data1.length).assertEqual(30)

      const size2: int = 31
      const data2: int[] = new Array<int>(+size2.toInt())
      expect(data2.length).assertEqual(31)

      const size3: int = 510
      const data3: int[] = new Array<int>(+size3.toInt())
      expect(data3.length).assertEqual(510)

      const size4: float = 12.2f
      const data4: int[] = new Array<int>(+size4.toInt())
      expect(data4.length).assertEqual(12)

      const size5: float = 50.9f
      const data5: int[] = new Array<int>(+size5.toInt())
      expect(data5.length).assertEqual(50)
    })
  })
}
