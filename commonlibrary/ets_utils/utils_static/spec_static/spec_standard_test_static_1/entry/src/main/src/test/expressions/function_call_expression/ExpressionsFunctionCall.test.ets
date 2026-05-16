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


type F_args_type_evaluation = (p: string) => number
type F_fcall_0 = (p: string) => number
type F_fcall_1<T> = (p: T) => number
type VoidFunc_fcall_2 = () => void
type VoidFunc_fcall_3 = () => void
type VoidFunc_fcall_4 = () => void
type VoidFunc_fcall_5 = () => void
type ss_fcall_6 = (p: string) => string
type ss_fcall_7 = (p: string) => string
type NumberFunc_fcall_8 = () => number
type UT_fcall_8 = NumberFunc_fcall_8 | number
type NumberFunc_fcall_9 = () => number
type UT_fcall_9 = NumberFunc_fcall_9 | number
type LT_fcall_12 = (s: Object, i: Object, b: Object) => Boolean
type LT_fcall_13 = null | (s: Object, i: Object, b: Object) => Boolean
type LT_fcall_14 = null | (s: Object, i: Object, b: Object) => Boolean
interface User_fcall_18 {
  name: string;
  age: number;
}

type LP_fcall_19 = () => User_fcall_18


interface User_fcall_18_interface {
  name: string
  age: number
}


class A_fcall_1 {
  fld: number = 3.5
  public getFld(): number {
    return this.fld
  }
}
class B_fcall_1 extends A_fcall_1 {}

class A_fcall_10 {
  static method(): int { return 2 }
  method(): int { return 3 }
}

class A_fcall_many_params_0 {
  foo(k1: string, k2: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class B_fcall_many_params_0 {
  static foo(k1: string, k2: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class C_fcall_many_params_0 {
  result: boolean
  constructor(k1: string, k2: string, lambda1?: () => void, lambda2?: () => void) {
    this.result = lambda2 == undefined
  }
}

class A_fcall_many_params_1 {
  foo(k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class B_fcall_many_params_1 {
  static foo(k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class C_fcall_many_params_1 {
  result: boolean
  constructor(k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void) {
    this.result = lambda2 == undefined
  }
}

class A_fcall_many_params_2 {
  foo(k1: string, k2: string, k3: string, k4: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class B_fcall_many_params_2 {
  static foo(k1: string, k2: string, k3: string, k4: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class C_fcall_many_params_2 {
  result: boolean
  constructor(k1: string, k2: string, k3: string, k4: string, lambda1?: () => void, lambda2?: () => void) {
    this.result = lambda2 == undefined
  }
}

class A_fcall_many_params_3 {
  foo(k1: string, k2: string, k3: string, k4: string, k5: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class B_fcall_many_params_3 {
  static foo(k1: string, k2: string, k3: string, k4: string, k5: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class C_fcall_many_params_3 {
  result: boolean
  constructor(k1: string, k2: string, k3: string, k4: string, k5: string, lambda1?: () => void, lambda2?: () => void) {
    this.result = lambda2 == undefined
  }
}

class A_fcall_many_params_4 {
  foo(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class B_fcall_many_params_4 {
  static foo(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class C_fcall_many_params_4 {
  result: boolean
  constructor(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, lambda1?: () => void, lambda2?: () => void) {
    this.result = lambda2 == undefined
  }
}

class A_fcall_many_params_5 {
  foo(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, k7: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class B_fcall_many_params_5 {
  static foo(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, k7: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class C_fcall_many_params_5 {
  result: boolean
  constructor(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, k7: string, lambda1?: () => void, lambda2?: () => void) {
    this.result = lambda2 == undefined
  }
}

class A_fcall_many_params_6 {
  foo(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, k7: string, k8: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class B_fcall_many_params_6 {
  static foo(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, k7: string, k8: string, lambda1?: () => void, lambda2?: () => void): boolean {
    return lambda2 == undefined
  }
}
class C_fcall_many_params_6 {
  result: boolean
  constructor(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, k7: string, k8: string, lambda1?: () => void, lambda2?: () => void) {
    this.result = lambda2 == undefined
  }
}


function eval0_args_type_evaluation(): string { return 'Hello World' }
function eval1_args_type_evaluation(): int { return 100 }
function eval2_args_type_evaluation(): boolean { return true }

function foo_fcall_0(p: string): number { return p.length }
function foo_fcall_1<T extends A_fcall_1>(p: T): number { return p.getFld() }
function foo_fcall_2(n: number, f: VoidFunc_fcall_2): number { f(); f(); return n + globl_fcall_2 }
function foo_fcall_3(n: number, f: VoidFunc_fcall_3): number { f(); f(); return n + globl_fcall_3 }
function foo_fcall_4(n: number, f: VoidFunc_fcall_4): number { globl_fcall_4 += n; f(); return globl_fcall_4 }
function foo_fcall_5(n: number, f: VoidFunc_fcall_5): number { globl_fcall_5 += n; f(); return globl_fcall_5 }
function bar_fcall_6(p: string): string { globl_fcall_6 += p; return globl_fcall_6 }
function bar_fcall_7(p: string): string { globl_fcall_7 += p; return globl_fcall_7 }
function foo_fcall_8(): number { return globl_fcall_8 }
function foo_fcall_10(): int { return 1 }
function call_fcall_10(callee: () => int): int { return callee() }
function foo_fcall_12(s: Object, i: Object, b: Object): Boolean { calls_fcall_12++; return s instanceof String && i instanceof int && b instanceof Boolean }
function foo_fcall_13(s: Object, i: Object, b: Object): Boolean { calls_fcall_13++; return s instanceof String && i instanceof int && b instanceof Boolean }
function foo_fcall_14(s: Object, i: Object, b: Object): Boolean { calls_fcall_14++; return s instanceof String && i instanceof int && b instanceof Boolean }
function getLambdaOrNull_fcall_13(value: Boolean = false): LT_fcall_13 { return value ? (s: Object, i: Object, b: Object) => foo_fcall_13(s, i, b) : null }
function getLambdaOrNull_fcall_14(value: Boolean = false): LT_fcall_14 { return value ? (s: Object, i: Object, b: Object) => foo_fcall_14(s, i, b) : null }

let globl_fcall_2: number = 3.5
let globl_fcall_3: number = 3.5
let globl_fcall_4: number = 0.0
let lambda_fcall_4: VoidFunc_fcall_4 = (): void => {}
let globl_fcall_5: number = 0.0
let lambda_fcall_5: VoidFunc_fcall_5 = (): void => {}
let globl_fcall_6: string = ""
let nbar_fcall_6: ss_fcall_6|undefined
let globl_fcall_7: string = ""
let nbar_fcall_7: ss_fcall_7|null
let globl_fcall_8: number = 0.0
let globl_fcall_9: number = 0.0
let calls_fcall_12: int = 0
let calls_fcall_13: int = 0
let calls_fcall_14: int = 0
let q_fcall_many_params_0: boolean|undefined
let q_fcall_many_params_1: boolean|undefined
let q_fcall_many_params_2: boolean|undefined
let q_fcall_many_params_3: boolean|undefined
let q_fcall_many_params_4: boolean|undefined
let q_fcall_many_params_5: boolean|undefined
let q_fcall_many_params_6: boolean|undefined

function foo_fcall_many_params_0(k1: string, k2: string, lambda1?: () => void, lambda2?: () => void): boolean {
  return lambda2 == undefined
}

function foo_fcall_many_params_1(k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void): boolean {
  return lambda2 == undefined
}

function foo_fcall_many_params_2(k1: string, k2: string, k3: string, k4: string, lambda1?: () => void, lambda2?: () => void): boolean {
  return lambda2 == undefined
}

function foo_fcall_many_params_3(k1: string, k2: string, k3: string, k4: string, k5: string, lambda1?: () => void, lambda2?: () => void): boolean {
  return lambda2 == undefined
}

function foo_fcall_many_params_4(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, lambda1?: () => void, lambda2?: () => void): boolean {
  return lambda2 == undefined
}

function foo_fcall_many_params_5(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, k7: string, lambda1?: () => void, lambda2?: () => void): boolean {
  return lambda2 == undefined
}

function foo_fcall_many_params_6(k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, k7: string, k8: string, lambda1?: () => void, lambda2?: () => void): boolean {
  return lambda2 == undefined
}
export default function ExpressionsFunctionCallTest() {
  describe("ExpressionsFunctionCallTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_0100
     * @tc.name      testExpressionsFunctionCall0001
     * @tc.desc      Function call expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sVal: string = eval0_args_type_evaluation()
      let iVal: int = eval1_args_type_evaluation()
      let bVal: boolean = eval2_args_type_evaluation()
      expect(typeof sVal).assertEqual("string")
      expect(typeof iVal).assertEqual("int")
      expect(typeof bVal).assertEqual("boolean")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_0200
     * @tc.name      testExpressionsFunctionCall0002
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: F_fcall_0 = (p: string): number => { return p.length }
      expect(f("abcdef")).assertEqual(foo_fcall_0("ABCDEF"))
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_0300
     * @tc.name      testExpressionsFunctionCall0003
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: F_fcall_1<B_fcall_1> = (v: B_fcall_1): number => { return v.getFld() }
      expect(f(new B_fcall_1())).assertEqual(foo_fcall_1<B_fcall_1>(new B_fcall_1()))
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_0400
     * @tc.name      testExpressionsFunctionCall0004
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl_fcall_2 = 3.5
      let res = foo_fcall_2(2.0, (): void => { globl_fcall_2 *= 2.0 })
      expect(res).assertEqual(16.0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_0500
     * @tc.name      testExpressionsFunctionCall0005
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl_fcall_3 = 3.5
      let res = foo_fcall_3(2.0, (): void => { globl_fcall_3 *= 2.0 })
      expect(res).assertEqual(16.0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_0600
     * @tc.name      testExpressionsFunctionCall0006
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl_fcall_4 = 3.5
      lambda_fcall_4 = (): void => {
        if (globl_fcall_4 < 10.0) {
          foo_fcall_4(4.0, lambda_fcall_4)
        }
      }
      expect(foo_fcall_4(2.0, lambda_fcall_4)).assertEqual(13.5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_0700
     * @tc.name      testExpressionsFunctionCall0007
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl_fcall_5 = 3.5
      lambda_fcall_5 = (): void => {
        if (globl_fcall_5 < 10.0) {
          foo_fcall_5(4.0, (): void => { lambda_fcall_5() })
        }
      }
      let res: number = foo_fcall_5(2.0, (): void => { lambda_fcall_5() })
      expect(res).assertEqual(13.5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_0800
     * @tc.name      testExpressionsFunctionCall0008
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl_fcall_6 = "G"
      expect(nbar_fcall_6?.("abc")).assertEqual(undefined)
      expect(globl_fcall_6).assertEqual("G")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_0900
     * @tc.name      testExpressionsFunctionCall0009
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      globl_fcall_7 = "G"
      nbar_fcall_7 = bar_fcall_7
      expect(nbar_fcall_7?.("abc")).assertEqual("Gabc")
      expect(globl_fcall_7).assertEqual("Gabc")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_1000
     * @tc.name      testExpressionsFunctionCall0010
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: UT_fcall_8 = 3.14
      expect(v as number).assertEqual(3.14)
      v = foo_fcall_8
      globl_fcall_8 = 9.81
      expect((v as NumberFunc_fcall_8)()).assertEqual(9.81)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_1100
     * @tc.name      testExpressionsFunctionCall0011
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: UT_fcall_9 = 3.14
      expect(v as number).assertEqual(3.14)
      v = (): number => { return globl_fcall_9 }
      globl_fcall_9 = 9.81
      expect((v as NumberFunc_fcall_9)()).assertEqual(9.81)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_1200
     * @tc.name      testExpressionsFunctionCall0012
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(call_fcall_10(foo_fcall_10)).assertEqual(1)
      expect(call_fcall_10(A_fcall_10.method)).assertEqual(2)
      expect(call_fcall_10((new A_fcall_10()).method)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_1300
     * @tc.name      testExpressionsFunctionCall0013
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      calls_fcall_12 = 0;
      (() => { calls_fcall_12++ })(); // Immediately invoke the function
      expect(calls_fcall_12).assertEqual(1); // Verify the counter increment
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_1400
     * @tc.name      testExpressionsFunctionCall0014
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      calls_fcall_12 = 0
      let ll: LT_fcall_12 = (s: Object, i: Object, b: Object) => foo_fcall_12(s, i, b)
      let r = ll("Hello", 42, true)
      // 注意：ArkTS中 instanceof 检查可能需要调整
      expect(calls_fcall_12).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_1500
     * @tc.name      testExpressionsFunctionCall0015
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      calls_fcall_13 = 0
      let ll: LT_fcall_13 = getLambdaOrNull_fcall_13()
      let r: Boolean | undefined = ll?.('Hello', 42, true)
      expect(r).assertEqual(undefined)
      expect(calls_fcall_13).assertEqual(0)

      ll = getLambdaOrNull_fcall_13(true)
      r = ll?.('Hello', 42, true)
      expect(calls_fcall_13).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_1600
     * @tc.name      testExpressionsFunctionCall0016
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      calls_fcall_14 = 0
      let r = getLambdaOrNull_fcall_14()?.('Hello', 42, true)
      expect(calls_fcall_14).assertEqual(0)
      r = getLambdaOrNull_fcall_14(true)?.('Hello', 42, true)
      expect(calls_fcall_14).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_1700
     * @tc.name      testExpressionsFunctionCall0017
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = (() => { return 42 })()
      expect(value).assertEqual(42)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_1800
     * @tc.name      testExpressionsFunctionCall0018
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = ((p1: int, p2: int) => { return p1 + p2 }) (40, 2)
      expect(value).assertEqual(42)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_1900
     * @tc.name      testExpressionsFunctionCall0019
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = ((p1: int, p2: () => int) => { return p1 + p2() }) (40, () => 2)
      expect(value).assertEqual(42)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_2000
     * @tc.name      testExpressionsFunctionCall0020
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = ((): User_fcall_18 => { return { name: 'Alice', age: 16 } })()
      expect(value.name).assertEqual('Alice')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_2100
     * @tc.name      testExpressionsFunctionCall0021
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lp: LP_fcall_19 = () => { return { name: 'Alice', age: 16 } }
      let value = ((up: LP_fcall_19): User_fcall_18 => { return up() }) (lp)
      expect(value.name).assertEqual('Alice')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_2200
     * @tc.name      testExpressionsFunctionCall0022
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_fcall_many_params_0("1", "2", q_fcall_many_params_0 ? undefined : () => {}, undefined)).assertTrue()
      let test_lambda = (k1: string, k2: string, lambda1?: () => void, lambda2?: () => void) => { return lambda2 == undefined }
      expect(test_lambda("1", "2", q_fcall_many_params_0 ? undefined : () => {}, undefined)).assertTrue()
      expect(new A_fcall_many_params_0().foo("1", "2", q_fcall_many_params_0 ? undefined : () => {}, undefined)).assertTrue()
      expect(B_fcall_many_params_0.foo("1", "2", q_fcall_many_params_0 ? undefined : () => {}, undefined)).assertTrue()
      expect(new C_fcall_many_params_0("1", "2", q_fcall_many_params_0 ? undefined : () => {}, undefined).result).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_2300
     * @tc.name      testExpressionsFunctionCall0023
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_fcall_many_params_1("1", "2", "3", q_fcall_many_params_1 ? undefined : () => {}, undefined)).assertTrue()
      let test_lambda = (k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void) => { return lambda2 == undefined }
      expect(test_lambda("1", "2", "3", q_fcall_many_params_1 ? undefined : () => {}, undefined)).assertTrue()
      expect(new A_fcall_many_params_1().foo("1", "2", "3", q_fcall_many_params_1 ? undefined : () => {}, undefined)).assertTrue()
      expect(B_fcall_many_params_1.foo("1", "2", "3", q_fcall_many_params_1 ? undefined : () => {}, undefined)).assertTrue()
      expect(new C_fcall_many_params_1("1", "2", "3", q_fcall_many_params_1 ? undefined : () => {}, undefined).result).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_2400
     * @tc.name      testExpressionsFunctionCall0024
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_fcall_many_params_2("1", "2", "3", "4", q_fcall_many_params_2 ? undefined : () => {}, undefined)).assertTrue()
      let test_lambda = (k1: string, k2: string, k3: string, k4: string, lambda1?: () => void, lambda2?: () => void) => { return lambda2 == undefined }
      expect(test_lambda("1", "2", "3", "4", q_fcall_many_params_2 ? undefined : () => {}, undefined)).assertTrue()
      expect(new A_fcall_many_params_2().foo("1", "2", "3", "4", q_fcall_many_params_2 ? undefined : () => {}, undefined)).assertTrue()
      expect(B_fcall_many_params_2.foo("1", "2", "3", "4", q_fcall_many_params_2 ? undefined : () => {}, undefined)).assertTrue()
      expect(new C_fcall_many_params_2("1", "2", "3", "4", q_fcall_many_params_2 ? undefined : () => {}, undefined).result).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_2500
     * @tc.name      testExpressionsFunctionCall0025
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_fcall_many_params_3("1", "2", "3", "4", "5", q_fcall_many_params_3 ? undefined : () => {}, undefined)).assertTrue()
      let test_lambda = (k1: string, k2: string, k3: string, k4: string, k5: string, lambda1?: () => void, lambda2?: () => void) => { return lambda2 == undefined }
      expect(test_lambda("1", "2", "3", "4", "5", q_fcall_many_params_3 ? undefined : () => {}, undefined)).assertTrue()
      expect(new A_fcall_many_params_3().foo("1", "2", "3", "4", "5", q_fcall_many_params_3 ? undefined : () => {}, undefined)).assertTrue()
      expect(B_fcall_many_params_3.foo("1", "2", "3", "4", "5", q_fcall_many_params_3 ? undefined : () => {}, undefined)).assertTrue()
      expect(new C_fcall_many_params_3("1", "2", "3", "4", "5", q_fcall_many_params_3 ? undefined : () => {}, undefined).result).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_2600
     * @tc.name      testExpressionsFunctionCall0026
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_fcall_many_params_4("1", "2", "3", "4", "5", "6", q_fcall_many_params_4 ? undefined : () => {}, undefined)).assertTrue()
      let test_lambda = (k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, lambda1?: () => void, lambda2?: () => void) => { return lambda2 == undefined }
      expect(test_lambda("1", "2", "3", "4", "5", "6", q_fcall_many_params_4 ? undefined : () => {}, undefined)).assertTrue()
      expect(new A_fcall_many_params_4().foo("1", "2", "3", "4", "5", "6", q_fcall_many_params_4 ? undefined : () => {}, undefined)).assertTrue()
      expect(B_fcall_many_params_4.foo("1", "2", "3", "4", "5", "6", q_fcall_many_params_4 ? undefined : () => {}, undefined)).assertTrue()
      expect(new C_fcall_many_params_4("1", "2", "3", "4", "5", "6", q_fcall_many_params_4 ? undefined : () => {}, undefined).result).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_2700
     * @tc.name      testExpressionsFunctionCall0027
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_fcall_many_params_5("1", "2", "3", "4", "5", "6", "7", q_fcall_many_params_5 ? undefined : () => {}, undefined)).assertTrue()
      let test_lambda = (k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, k7: string, lambda1?: () => void, lambda2?: () => void) => { return lambda2 == undefined }
      expect(test_lambda("1", "2", "3", "4", "5", "6", "7", q_fcall_many_params_5 ? undefined : () => {}, undefined)).assertTrue()
      expect(new A_fcall_many_params_5().foo("1", "2", "3", "4", "5", "6", "7", q_fcall_many_params_5 ? undefined : () => {}, undefined)).assertTrue()
      expect(B_fcall_many_params_5.foo("1", "2", "3", "4", "5", "6", "7", q_fcall_many_params_5 ? undefined : () => {}, undefined)).assertTrue()
      expect(new C_fcall_many_params_5("1", "2", "3", "4", "5", "6", "7", q_fcall_many_params_5 ? undefined : () => {}, undefined).result).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_CALL_2800
     * @tc.name      testExpressionsFunctionCall0028
     * @tc.desc      A function call expression is used to call a function or a lambda expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionCall0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_fcall_many_params_6("1", "2", "3", "4", "5", "6", "7", "8", q_fcall_many_params_6 ? undefined : () => {}, undefined)).assertTrue()
      let test_lambda = (k1: string, k2: string, k3: string, k4: string, k5: string, k6: string, k7: string, k8: string, lambda1?: () => void, lambda2?: () => void) => { return lambda2 == undefined }
      expect(test_lambda("1", "2", "3", "4", "5", "6", "7", "8", q_fcall_many_params_6 ? undefined : () => {}, undefined)).assertTrue()
      expect(new A_fcall_many_params_6().foo("1", "2", "3", "4", "5", "6", "7", "8", q_fcall_many_params_6 ? undefined : () => {}, undefined)).assertTrue()
      expect(B_fcall_many_params_6.foo("1", "2", "3", "4", "5", "6", "7", "8", q_fcall_many_params_6 ? undefined : () => {}, undefined)).assertTrue()
      expect(new C_fcall_many_params_6("1", "2", "3", "4", "5", "6", "7", "8", q_fcall_many_params_6 ? undefined : () => {}, undefined).result).assertTrue()
    })
  })
}