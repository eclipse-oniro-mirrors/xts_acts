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

type lmbd_safe_fcall_ftype = () => A_safe_fcall_ftype|null
type NullOrChaining_safe_call_arguments_evaluate = Chaining_safe_call_arguments_evaluate | null

function foo_fixed_array_predefined<T>(p: FixedArray<T>): T {
  return p[0]
}

function foo1_fixed_array_predefined<T>(p: T): Array<T> {
  let res: Array<T> = [p]
  return res
}

function foo1_caller_fixed_array_predefined_1(): FixedArray<float> {
  let p: float = 0.0f
  return [...foo1_fixed_array_predefined<float>(p)]
}

function test_param_fixed_array_predefined_1() {
  let foo_var = foo_fixed_array_predefined<float>
  let param: FixedArray<float> = [0.0f]
  let res = foo_var(param)
  expect(typeof res).assertEqual("number")
}

function foo1_caller_fixed_array_predefined_7(): FixedArray<char> {
  let p: char = c'c'
  return [...foo1_fixed_array_predefined<char>(p)]
}

function test_param_fixed_array_predefined_7() {
  let foo_var = foo_fixed_array_predefined<char>
  let param: FixedArray<char> = [c'c']
  let res = foo_var(param)
  expect(typeof res).assertEqual("string")
}

function callee_function_call_expression(a: int, b: boolean): int {
  if (b) {
    return a
  } else {
    return -a
  }
}

class A_optional_chaining_null_result {
  public evaluate(value: int): Int {
    return new Int(value)
  }
}

function getX_optional_chaining_null_result(): Int|undefined {
  let a: A_optional_chaining_null_result|undefined
  let res: Int|undefined = a?.evaluate(5)
  return res
}

class A_optional_chaining_value_result {
  public x: int = 5
}

function foo_optional_chaining_value_result(a?: A_optional_chaining_value_result|null): Int|undefined {
  return a?.x
}

function getX_optional_chaining_value_result(): Int|undefined {
  let a: A_optional_chaining_value_result|null = new A_optional_chaining_value_result()
  return foo_optional_chaining_value_result(a)
}

let ecf0_safe_call_arguments_evaluate: int = 0
function eval0_safe_call_arguments_evaluate(): string {
  ecf0_safe_call_arguments_evaluate++
  return 'Hello World'
}

let ecf1_safe_call_arguments_evaluate: int = 0
function eval1_safe_call_arguments_evaluate(): int {
  ecf1_safe_call_arguments_evaluate++
  return 100
}

let ecf2_safe_call_arguments_evaluate: int = 0
function eval2_safe_call_arguments_evaluate(): boolean {
  ecf2_safe_call_arguments_evaluate++
  return true
}

class Chaining_safe_call_arguments_evaluate {
  static callc: int = 0

  stepOne(rr: boolean = false): NullOrChaining_safe_call_arguments_evaluate {
    return rr ? this : null
  }

  stepTwo(p1: string, p2: int, p3: boolean) {
    Chaining_safe_call_arguments_evaluate.callc++
  }
}

class A_safe_fcall_ftype {
  check(): int { return 1 }
}

let lambda_safe_fcall_ftype: lmbd_safe_fcall_ftype = (): A_safe_fcall_ftype|null => { return new A_safe_fcall_ftype() }

let lambda_safe_fcall_lmbd = (): A_safe_fcall_ftype|null => { return new A_safe_fcall_ftype() }

class A_safe_function_call {
  check(): int {
    return 1
  }
}

function f_safe_function_call(): A_safe_function_call|null {
  return new A_safe_function_call()
}

class A_safe_fcall_ftype_1 {
  check(): Int|null { return null }
}
class A_safe_fcall_ftype_3 {
  check(): Int|null { return null }
}
class A_safe_fcall_lmbd_1 {
  check(): Int|null { return null }
}
class A_safe_fcall_lmbd_3 {
  check(): Int|null { return null }
}
class A_safe_function_call_1 {
  check(): Int|null {
    return null
  }
}
function f(): A_safe_function_call_1|null {
  return new A_safe_function_call_1()
}
function f2(): A_safe_function_call|null {
  return null
}
class A_safe_function_call_3 {
  check(): Int|null {
    return null
  }
}
function f3(): A_safe_function_call_3|null {
  return null
}
export default function ExpressionsFunctionCallOneTest() {
  describe("ExpressionsFunctionCallOneTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_0100
     * @tc.name      testExpressionsFunctionCallOne0001
     * @tc.desc      Function call expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(callee_function_call_expression(1, true)).assertEqual(1)
      expect(callee_function_call_expression(1, false)).assertEqual(-1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_0200
     * @tc.name      testExpressionsFunctionCallOne0002
     * @tc.desc      Optional chaining declaration with null result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getX_optional_chaining_null_result()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_0300
     * @tc.name      testExpressionsFunctionCallOne0003
     * @tc.desc      Optional chaining declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getX_optional_chaining_value_result()).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_0400
     * @tc.name      testExpressionsFunctionCallOne0004
     * @tc.desc      Arguments are not evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      ecf0_safe_call_arguments_evaluate = 0
      ecf1_safe_call_arguments_evaluate = 0
      ecf2_safe_call_arguments_evaluate = 0
      Chaining_safe_call_arguments_evaluate.callc = 0
      
      new Chaining_safe_call_arguments_evaluate().stepOne()?.stepTwo(
        eval0_safe_call_arguments_evaluate(), 
        eval1_safe_call_arguments_evaluate(), 
        eval2_safe_call_arguments_evaluate()
      )
      
      expect(ecf0_safe_call_arguments_evaluate).assertEqual(0)
      expect(ecf1_safe_call_arguments_evaluate).assertEqual(0)
      expect(ecf2_safe_call_arguments_evaluate).assertEqual(0)
      expect(Chaining_safe_call_arguments_evaluate.callc).assertEqual(0)
      
      ecf0_safe_call_arguments_evaluate = 0
      ecf1_safe_call_arguments_evaluate = 0
      ecf2_safe_call_arguments_evaluate = 0
      Chaining_safe_call_arguments_evaluate.callc = 0
      
      new Chaining_safe_call_arguments_evaluate().stepOne(true)?.stepTwo(
        eval0_safe_call_arguments_evaluate(), 
        eval1_safe_call_arguments_evaluate(), 
        eval2_safe_call_arguments_evaluate()
      )
      
      expect(ecf0_safe_call_arguments_evaluate).assertEqual(1)
      expect(ecf1_safe_call_arguments_evaluate).assertEqual(1)
      expect(ecf2_safe_call_arguments_evaluate).assertEqual(1)
      expect(Chaining_safe_call_arguments_evaluate.callc).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_0500
     * @tc.name      testExpressionsFunctionCallOne0005
     * @tc.desc      Save function call expression with lambda
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(lambda_safe_fcall_ftype()?.check()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_0600
     * @tc.name      testExpressionsFunctionCallOne0006
     * @tc.desc      Save function call expression with lambda
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lambda1 = (): A_safe_fcall_ftype_1|null => { return new A_safe_fcall_ftype_1() }
      expect(lambda1()?.check()).assertEqual(null)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_0700
     * @tc.name      testExpressionsFunctionCallOne0007
     * @tc.desc      Save function call expression with lambda
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lambda: lmbd_safe_fcall_ftype = (): A_safe_fcall_ftype|null => { return null }
      expect(lambda()?.check()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_0800
     * @tc.name      testExpressionsFunctionCallOne0008
     * @tc.desc      Save function call expression with lambda
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lambda: () => A_safe_fcall_ftype_3|null = (): A_safe_fcall_ftype_3|null => { return null }
      expect(lambda()?.check()).assertEqual(undefined)
      expect(lambda_safe_fcall_lmbd()?.check()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_0900
     * @tc.name      testExpressionsFunctionCallOne0009
     * @tc.desc      Save function call expression with lambda
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lambda = (): A_safe_fcall_lmbd_1|null => { return new A_safe_fcall_lmbd_1() }
      expect(lambda()?.check()).assertEqual(null)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_1000
     * @tc.name      testExpressionsFunctionCallOne0010
     * @tc.desc      Save function call expression with lambda
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lambda = (): A_safe_fcall_ftype|null => { return null }
      expect(lambda()?.check()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_1100
     * @tc.name      testExpressionsFunctionCallOne0011
     * @tc.desc      Save function call expression with lambda
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lambda = (): A_safe_fcall_lmbd_3|null => { return null }
      expect(lambda()?.check()).assertEqual(undefined)
      expect(f_safe_function_call()?.check()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_ONE_1200
     * @tc.name      testExpressionsFunctionCallOne0012
     * @tc.desc      Save function call expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCallOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(f()?.check()).assertEqual(null)
      expect(f2()?.check()).assertEqual(undefined)
      expect(f3()?.check()).assertEqual(undefined)
    })
  })
}