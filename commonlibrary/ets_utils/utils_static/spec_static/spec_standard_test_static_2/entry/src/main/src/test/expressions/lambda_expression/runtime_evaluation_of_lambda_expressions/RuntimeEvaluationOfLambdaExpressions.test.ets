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

type function_type = () => void

export default function RuntimeEvaluationOfLambdaExpressions(): void {
  describe("RuntimeEvaluationOfLambdaExpressions", () => {
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
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_0100
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0001
     * @tc.desc      Every time a lambda expression is evaluated, the outer variables referred to by the lambda expression are captured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = 1
      let x = () => { return y + 1 }
      expect(x()).assertEqual(2)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_0200
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0002
     * @tc.desc      Every time a lambda expression is evaluated, the outer variables referred to by the lambda expression are captured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = 1
      let x = () => { y++ }
      x()
      expect(y).assertEqual(2)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_0300
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0003
     * @tc.desc      Every time a lambda expression is evaluated, the outer variables referred to by the lambda expression are captured.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = 1
      let x = () => { return y + 1 }
      expect(x()).assertEqual(y + 1)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_0400
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0004
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const lambda: () => void = () => { }
        expect(lambda instanceof function_type).assertTrue()
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_0500
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0005
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const lambda: (p: int) => void = (p: int) => { }
        expect(lambda instanceof function_type).assertFalse()
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_0600
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0006
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const lambda: (p: int, q: int) => void = (p: int, q: int) => { }
        expect(lambda instanceof function_type).assertFalse()
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_0700
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0007
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let lambda: () => void = () => { }
        expect(lambda instanceof function_type).assertTrue()
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_0800
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0008
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let lambda: (p: int) => void = (p: int) => { }
        expect(lambda instanceof function_type).assertFalse()
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_0900
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0009
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let lambda: (p: int, q: int) => void = (p: int, q: int) => { }
        expect(lambda instanceof function_type).assertFalse()
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_1000
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0010
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int) => int = (p: int) => { return p }
        expect(f(1)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_1100
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0011
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int) => int = (p: int, q: int) => { return p + q }
        expect(f(1, 2)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_1200
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0012
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int, r: int) => int = (p: int, q: int, r: int) => { return p + q + r }
        expect(f(1, 2, 3)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_1300
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0013
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int, r: int, s: int) => int = (p: int, q: int, r: int, s: int) => { return p + q + r + s }
        expect(f(1, 2, 3, 4)).assertEqual(10)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_1400
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0014
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int, r: int, s: int, t: int) => int = (p: int, q: int, r: int, s: int, t: int) => { return p + q + r + s + t }
        expect(f(1, 2, 3, 4, 5)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_1500
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0015
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int) => int = (p: int) => p
        expect(f(1)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_1600
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0016
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int) => int = (p: int, q: int) => p + q
        expect(f(1, 2)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_1700
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0017
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int, r: int) => int = (p: int, q: int, r: int) => p + q + r
        expect(f(1, 2, 3)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_1800
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0018
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int, r: int, s: int) => int = (p: int, q: int, r: int, s: int) => p + q + r + s
        expect(f(1, 2, 3, 4)).assertEqual(10)
    })

    /**
     * @tc.number    SUB_RUNTIME_EVALUATION_OF_LAMBDA_EXPRESSIONS_1900
     * @tc.name      testRuntimeEvaluationOfLambdaExpressions0019
     * @tc.desc      If completing normally at runtime, the evaluation of a lambda expression produces a new instance of a function type that corresponds to the lambda signature. In that case, it is similar to the evaluation of a class instance creation expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRuntimeEvaluationOfLambdaExpressions0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f: (p: int, q: int, r: int, s: int, t: int) => int = (p: int, q: int, r: int, s: int, t: int) => p + q + r + s + t
        expect(f(1, 2, 3, 4, 5)).assertEqual(15)
    })

  })
}
