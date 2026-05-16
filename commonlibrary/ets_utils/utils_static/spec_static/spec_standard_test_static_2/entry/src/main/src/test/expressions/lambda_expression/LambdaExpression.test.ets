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

export default function LambdaExpression(): void {
  describe("LambdaExpression", () => {
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
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_0100
     * @tc.name      testLambdaExpression0001
     * @tc.desc      Callbacks and type inference from context, one value arg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let test = (op: (a: int) => int): int => {
            const arg = 4
            return op(arg)
        }
        expect(test((n) => n + n)).assertEqual(8)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_0200
     * @tc.name      testLambdaExpression0002
     * @tc.desc      Callbacks and type inference from context, two value args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let test = (op: (a: int, b: int) => int): int => {
            const a = 5
            const b = 3
            return op(a, b)
        }
        expect(test((a, b) => a + b)).assertEqual(8)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_0300
     * @tc.name      testLambdaExpression0003
     * @tc.desc      Callbacks and type inference from context, three value args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let test = (op: (a: int, b: int, c: int) => int): int => {
            const a = 1
            const b = 2
            const c = 3
            return op(a, b, c)
        }
        expect(test((a, b, c) => a + b + c)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_0400
     * @tc.name      testLambdaExpression0004
     * @tc.desc      Callbacks and type inference from context, return value from callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let test = (op: (a: int) => int): int => {
            return op(5) + op(6)
        }
        expect(test((a) => a * 2)).assertEqual(22)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_0500
     * @tc.name      testLambdaExpression0005
     * @tc.desc      Full declaration with reference arguments, no args, no return
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arg = 0
        let lf: () => void = () => { arg++ }
        lf()
        expect(arg).assertEqual(1)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_0600
     * @tc.name      testLambdaExpression0006
     * @tc.desc      Full declaration with reference arguments, one value arg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arg = 0
        let lf: (p: int) => void = (p: int) => { arg = p }
        lf(5)
        expect(arg).assertEqual(5)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_0700
     * @tc.name      testLambdaExpression0007
     * @tc.desc      Full declaration with reference arguments, two value args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arg = 0
        let lf: (p: int, q: int) => void = (p: int, q: int) => { arg = p + q }
        lf(3, 4)
        expect(arg).assertEqual(7)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_0800
     * @tc.name      testLambdaExpression0008
     * @tc.desc      Full declaration with reference arguments, one ref arg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arg = 0
        let lf: (p: int) => int = (p: int) => { return p }
        expect(lf(5)).assertEqual(5)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_0900
     * @tc.name      testLambdaExpression0009
     * @tc.desc      Full declaration with reference arguments, two ref args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let lf: (p: int, q: int) => int = (p: int, q: int) => { return p + q }
        expect(lf(3, 4)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_1000
     * @tc.name      testLambdaExpression0010
     * @tc.desc      Full declaration with reference arguments, three ref args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let lf: (p: int, q: int, r: int) => int = (p: int, q: int, r: int) => { return p + q + r }
        expect(lf(1, 2, 3)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_1100
     * @tc.name      testLambdaExpression0011
     * @tc.desc      Full declaration with value arguments, no args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: () => int = () => { return 1234 }
        expect(f()).assertEqual(1234)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_1200
     * @tc.name      testLambdaExpression0012
     * @tc.desc      Full declaration with value arguments, one arg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int) => int = (p: int) => { return p }
        expect(f(5)).assertEqual(5)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_1300
     * @tc.name      testLambdaExpression0013
     * @tc.desc      Full declaration with value arguments, two args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int) => int = (p: int, q: int) => { return p + q }
        expect(f(3, 4)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_1400
     * @tc.name      testLambdaExpression0014
     * @tc.desc      Full declaration with value arguments, three args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int, r: int) => int = (p: int, q: int, r: int) => { return p + q + r }
        expect(f(1, 2, 3)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_1500
     * @tc.name      testLambdaExpression0015
     * @tc.desc      Full declaration with value arguments, four args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int, r: int, s: int) => int = (p: int, q: int, r: int, s: int) => { return p + q + r + s }
        expect(f(1, 2, 3, 4)).assertEqual(10)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_1600
     * @tc.name      testLambdaExpression0016
     * @tc.desc      Short declaration with reference arguments, no args, no return
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arg = 0
        let lf = () => { arg++ }
        lf()
        expect(arg).assertEqual(1)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_1700
     * @tc.name      testLambdaExpression0017
     * @tc.desc      Short declaration with reference arguments, one value arg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arg = 0
        let lf = (p: int) => { arg = p }
        lf(5)
        expect(arg).assertEqual(5)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_1800
     * @tc.name      testLambdaExpression0018
     * @tc.desc      Short declaration with reference arguments, two value args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arg = 0
        let lf = (p: int, q: int) => { arg = p + q }
        lf(3, 4)
        expect(arg).assertEqual(7)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_1900
     * @tc.name      testLambdaExpression0019
     * @tc.desc      Short declaration with reference arguments, one ref arg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let lf = (p: int) => { return p }
        expect(lf(5)).assertEqual(5)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_2000
     * @tc.name      testLambdaExpression0020
     * @tc.desc      Short declaration with reference arguments, two ref args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let lf = (p: int, q: int) => { return p + q }
        expect(lf(3, 4)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_2100
     * @tc.name      testLambdaExpression0021
     * @tc.desc      Short declaration with value arguments, no args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = () => { return 1234 }
        expect(f()).assertEqual(1234)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_2200
     * @tc.name      testLambdaExpression0022
     * @tc.desc      Short declaration with value arguments, one arg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (p: int) => { return p }
        expect(f(5)).assertEqual(5)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_2300
     * @tc.name      testLambdaExpression0023
     * @tc.desc      Short declaration with value arguments, two args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (p: int, q: int) => { return p + q }
        expect(f(3, 4)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_2400
     * @tc.name      testLambdaExpression0024
     * @tc.desc      Short declaration with value arguments, three args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (p: int, q: int, r: int) => { return p + q + r }
        expect(f(1, 2, 3)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_2500
     * @tc.name      testLambdaExpression0025
     * @tc.desc      Short declaration with value arguments, four args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (p: int, q: int, r: int, s: int) => { return p + q + r + s }
        expect(f(1, 2, 3, 4)).assertEqual(10)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_2600
     * @tc.name      testLambdaExpression0026
     * @tc.desc      Short declaration with value arguments, five args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (p: int, q: int, r: int, s: int, t: int) => { return p + q + r + s + t }
        expect(f(1, 2, 3, 4, 5)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TEST_2700
     * @tc.name      testLambdaExpression0027
     * @tc.desc      Short declaration with value arguments, six args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpression0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (p: int, q: int, r: int, s: int, t: int, u: int) => { return p + q + r + s + t + u }
        expect(f(1, 2, 3, 4, 5, 6)).assertEqual(21)
    })

  })
}
