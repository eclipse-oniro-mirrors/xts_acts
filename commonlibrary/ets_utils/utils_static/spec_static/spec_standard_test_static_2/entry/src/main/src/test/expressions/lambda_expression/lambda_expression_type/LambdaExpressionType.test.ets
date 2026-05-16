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

export default function LambdaExpressionType(): void {
  describe("LambdaExpressionType", () => {
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
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_0100
     * @tc.name      testLambdaExpressionType0001
     * @tc.desc      Lambda expression type is a function type that has lambda parameters (if any) as parameters of the function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let foo = (p1: string, p2: number) => p1 + p2
        expect(foo('string ', 1)).assertEqual('string 1')
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_0200
     * @tc.name      testLambdaExpressionType0002
     * @tc.desc      Lambda expression type is a function type that has lambda parameters (if any) as parameters of the function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let foo = (p1: string, p2: number = 1) => p1 + p2
        expect(foo('string ')).assertEqual('string 1')
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_0300
     * @tc.name      testLambdaExpressionType0003
     * @tc.desc      Lambda expression type is a function type that has lambda parameters (if any) as parameters of the function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let foo = (p1: string, p2?: number) => p1 + p2
        expect(foo('param ')).assertEqual('param undefined')
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_0400
     * @tc.name      testLambdaExpressionType0004
     * @tc.desc      Lambda expression type is a function type that has lambda parameters (if any) as parameters of the function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let foo = (p1: number, p2: string = ' params ' , p3?: string) => p1 + p2 + p3
        expect(foo(3)).assertEqual('3 params undefined')
        expect(foo(3, ' parameters ')).assertEqual('3 parameters undefined')
        expect(foo(3, ' parameters ', 'set')).assertEqual('3 parameters set')
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_0500
     * @tc.name      testLambdaExpressionType0005
     * @tc.desc      Lambda expression type is a function type that has lambda parameters (if any) as parameters of the function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let foo = (p1: string, ...p2: string[]) => {
            let str = p1
            for(let i = 0; i < p2.length; i++) {
                str += p2[i]
            }
            return str
        }
        expect(foo('param ')).assertEqual('param ')
        expect(foo('param ', 'extra')).assertEqual('param extra')
        expect(foo('param ', 'extra1', 'extra2')).assertEqual('param extra1extra2')
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_0600
     * @tc.name      testLambdaExpressionType0006
     * @tc.desc      Lambda expression type is a function type that has lambda parameters (if any) as parameters of the function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let foo = (p1: string, p2: string = 'optional', ...p3: string[]) => {
            let str = p1 + p2
            for(let i = 0; i < p3.length; i++) {
                str += p3[i]
            }
            return str
        }
        expect(foo('param ')).assertEqual('param optional')
        expect(foo('optional param ', 'set')).assertEqual('optional param set')
        expect(foo('optional ', 'and ', 'rest ', 'params ', 'set')).assertEqual('optional and rest params set')
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_0700
     * @tc.name      testLambdaExpressionType0007
     * @tc.desc      Lambda expression type is a function type that has lambda parameters (if any) as parameters of the function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let foo = (p1: string, p2: int = 1, ...p3: string[]) => {
            let str = p1 + p2
            for(let i = 0; i < p3.length; i++) {
                str += p3[i]
            }
            return str
        }
        expect(foo('param ')).assertEqual('param 1')
        expect(foo('param ', 2)).assertEqual('param 2')
        expect(foo('param ', 2, 'extra')).assertEqual('param 2extra')
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_0800
     * @tc.name      testLambdaExpressionType0008
     * @tc.desc      Lambda expression type is a function type that has lambda parameters (if any) as parameters of the function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let p: number = 1
        let q: number = 1
        let foo = (p: number) => { p++ }
        foo(q)
        expect(p).assertEqual(1)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_0900
     * @tc.name      testLambdaExpressionType0009
     * @tc.desc      Return type can be inferred from the lambda body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f2 = (a: int, b: int) => a + b
        let x: int = f2(1, 2)
        expect(x instanceof int).assertTrue()
        expect(x).assertEqual(3)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_1000
     * @tc.name      testLambdaExpressionType0010
     * @tc.desc      Return type can be inferred from the lambda body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f2 = (a: String, b: String) => a + b
        let y = f2('Hello', 'World')
        expect(y).assertEqual('HelloWorld')
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_1100
     * @tc.name      testLambdaExpressionType0011
     * @tc.desc      Return type can be inferred from the lambda body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let FO = (a: int, b: int) => () => a + b
        let F1 = FO(40, 2)
        let R = F1()
        expect(R).assertEqual(42)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_1200
     * @tc.name      testLambdaExpressionType0012
     * @tc.desc      Return type can be inferred from the lambda body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let F0 = (flag: boolean) => () => flag ? 'Hello World' : 12
        let r = F0(true)
        expect(r()).assertEqual('Hello World')
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_1300
     * @tc.name      testLambdaExpressionType0013
     * @tc.desc      Return type can be inferred from the lambda body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (x: number) => x + 1
        expect(f(1)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_1400
     * @tc.name      testLambdaExpressionType0014
     * @tc.desc      Return type can be inferred from the lambda body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (x: number) => { return x + 1 }
        expect(f(1)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_1500
     * @tc.name      testLambdaExpressionType0015
     * @tc.desc      Return type can be inferred from the lambda body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (x: number): number => x + 1
        expect(f(1)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_1600
     * @tc.name      testLambdaExpressionType0016
     * @tc.desc      Return type can be inferred from the lambda body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (x: number): number => { return x + 1 }
        expect(f(1)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_LAMBDA_EXPRESSION_TYPE_1700
     * @tc.name      testLambdaExpressionType0017
     * @tc.desc      Return type can be inferred from the lambda body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaExpressionType0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = (x: string) => x.length
        expect(f('hello')).assertEqual(5)
    })

  })
}
