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
} from "../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsMultiplicativeExpressionTest(): void {
  describe("ExpressionsMultiplicativeExpressionTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_0100
     * @tc.name      testExpressionsMultiplicativeExpression0001
     * @tc.desc      Multiplicative expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 * 5 % 3).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_0200
     * @tc.name      testExpressionsMultiplicativeExpression0002
     * @tc.desc      Multiplicative expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(17 % 5 * 2).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_0300
     * @tc.name      testExpressionsMultiplicativeExpression0003
     * @tc.desc      Multiplicative expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(12 + 5 * 2).assertEqual(22);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_0400
     * @tc.name      testExpressionsMultiplicativeExpression0004
     * @tc.desc      Multiplicative expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10 - 2 * 3).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_0500
     * @tc.name      testExpressionsMultiplicativeExpression0005
     * @tc.desc      Multiplicative expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(20 / 2 + 3 * 4).assertEqual(22);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_0600
     * @tc.name      testExpressionsMultiplicativeExpression0006
     * @tc.desc      Multiplicative expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(20 / (2 + 3) * 4).assertEqual(16);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_0700
     * @tc.name      testExpressionsMultiplicativeExpression0007
     * @tc.desc      Multiplicative expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(20 / 2 / 2 * 4).assertEqual(20);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_0800
     * @tc.name      testExpressionsMultiplicativeExpression0008
     * @tc.desc      Multiplicative expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10 % 3 % 2 * 5).assertEqual(5);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_0900
     * @tc.name      testExpressionsMultiplicativeExpression0009
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 5;
      let y: byte = 3;
      let z = x * y;
      expect(z instanceof int).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_1000
     * @tc.name      testExpressionsMultiplicativeExpression0010
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 10;
      let y: byte = 3;
      let z = x % y;
      expect(z instanceof int).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_1100
     * @tc.name      testExpressionsMultiplicativeExpression0011
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 100;
      let y: byte = 3;
      let z = x * y;
      expect(z instanceof int).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_1200
     * @tc.name      testExpressionsMultiplicativeExpression0012
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 100;
      let y: short = 3;
      let z = x * y;
      expect(z instanceof int).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_1300
     * @tc.name      testExpressionsMultiplicativeExpression0013
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 100;
      let y: int = 3;
      let z = x * y;
      expect(z instanceof long).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_1400
     * @tc.name      testExpressionsMultiplicativeExpression0014
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 100;
      let y: int = 3;
      let z = x / y;
      expect(z instanceof long).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_1500
     * @tc.name      testExpressionsMultiplicativeExpression0015
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 5.5f;
      let y: int = 2;
      let z = x * y;
      expect(z instanceof float).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_1600
     * @tc.name      testExpressionsMultiplicativeExpression0016
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 5.5f;
      let y: int = 2;
      let z = x / y;
      expect(z instanceof float).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_1700
     * @tc.name      testExpressionsMultiplicativeExpression0017
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 5.5f;
      let y: int = 2;
      let z = x % y;
      expect(z instanceof float).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_1800
     * @tc.name      testExpressionsMultiplicativeExpression0018
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 5.5;
      let y: int = 2;
      let z = x * y;
      expect(z instanceof double).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_1900
     * @tc.name      testExpressionsMultiplicativeExpression0019
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 5.5;
      let y: int = 2;
      let z = x / y;
      expect(z instanceof double).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_2000
     * @tc.name      testExpressionsMultiplicativeExpression0020
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 5.5;
      let y: int = 2;
      let z = x % y;
      expect(z instanceof double).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_2100
     * @tc.name      testExpressionsMultiplicativeExpression0021
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 10;
      let y: short = 20;
      let z = x * y;
      expect(z instanceof int).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_2200
     * @tc.name      testExpressionsMultiplicativeExpression0022
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 10;
      let y: int = 20;
      let z = x * y;
      expect(z instanceof int).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_2300
     * @tc.name      testExpressionsMultiplicativeExpression0023
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 10;
      let y: long = 20;
      let z = x * y;
      expect(z instanceof long).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_2400
     * @tc.name      testExpressionsMultiplicativeExpression0024
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 10.5f;
      let y: double = 2.5;
      let z = x * y;
      expect(z instanceof double).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_2500
     * @tc.name      testExpressionsMultiplicativeExpression0025
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 10.5;
      let y: float = 2.5f;
      let z = x * y;
      expect(z instanceof double).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_MULTIPLICATIVE_EXPRESSION_2600
     * @tc.name      testExpressionsMultiplicativeExpression0026
     * @tc.desc      Multiplicative operations with implicit type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMultiplicativeExpression0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10;
      let y: number = 20;
      let z = x * y;
      expect(typeof z === 'number').assertTrue();
    })
  })
}
