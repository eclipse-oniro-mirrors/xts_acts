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

let expr_0_v: int|null = 5
let expr_0_w = expr_0_v

let expr_1_v: int|undefined = 5
let expr_1_w = expr_1_v

let expr_2_v: int|null|undefined = 5
let expr_2_w = expr_2_v

let expr_3_v: int|null = 5
let expr_3_w: int

let expr_4_v: int|null = 5
let expr_4_w: int

let expr_5_v: int|undefined = 5
let expr_5_w: int

let expr_6_v: int|undefined = 5
let expr_6_w: int|null

let expr_7_v: int|undefined|null = 5
let expr_7_w: int

let expr_8_v: string|boolean|number|null|undefined = 'a'
let expr_8_w: string|boolean|number = 1.0

let expr_13_v: null|Object[] = null
let expr_13_w: Object[] = ['']
let expr_13_e: Object = ''

let expr_14_v: Array<Object>|undefined
let expr_14_w: Array<Object> = ['abc']
let expr_14_e: Object = ''

let expr_15_v: null|FixedArray<int>|undefined
let expr_15_w: FixedArray<int> = [42]
let expr_15_e: int

let expr_16_v: [string, bigint]|null = null
let expr_16_w: [string, bigint] = ['1', 1n]
let expr_16_e: string = ''

let expr_17_v: [bigint, string]|undefined
let expr_17_w: [bigint, string] = [1n, '1']
let expr_17_e: string = ''

class expr_21_A<T> {
    meth(p: T): T {
        return p
    }
}
let expr_21_v: expr_21_A<string>|undefined = undefined
let expr_21_w: expr_21_A<string> = new expr_21_A<string>()
let expr_21_e: string = ''

let expr_22_v: ((p: int) => string)|null = null
let expr_22_w: ((p: int) => string)|null = (p: int) => 'a' + p
let expr_22_e: string = ''

let expr_23_v: ((p: int) => string)|undefined
let expr_23_w: (p: int) => string = (p: int) => 'a' + p
let expr_23_e: string = ''

let expr_24_v = null
let expr_24_w = new Error('msg')
let expr_24_e: string = ''

let expr_25_v = undefined
let expr_25_w = new Error('msg')
let expr_25_e: string = ''

let expr_26_v: string|null|undefined = 'abc'

function null_check1_foo(arg: Object) : int {
  return 1;
}
function null_check1_foo2(arg: Object|null) : int {
  return 2;
}
let null_check1_a: Object|null = new Object();
let null_check1_b: Object|null = null;
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsEnsureNotNullishTest() {
  describe("ExpressionsEnsureNotNullishTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_0100
     * @tc.name      testExpressionsEnsureNotNullish0001
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expr_0_w = null
      expect(expr_0_w).assertEqual(null)
      expr_0_w = 42
      expect(expr_0_w).assertEqual(42)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_0200
     * @tc.name      testExpressionsEnsureNotNullish0002
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expr_1_w = undefined
      expect(expr_1_w).assertEqual(undefined)
      expr_1_w = 42
      expect(expr_1_w).assertEqual(42)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_0300
     * @tc.name      testExpressionsEnsureNotNullish0003
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(expr_2_w).assertEqual(5)
      expr_2_w = undefined
      expect(expr_2_w).assertEqual(undefined)
      expr_2_w = null
      expect(expr_2_w).assertEqual(null)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_0400
     * @tc.name      testExpressionsEnsureNotNullish0004
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expr_3_w = expr_3_v!
      expect(expr_3_w).assertEqual(5)
      expr_3_w = expr_3_w + expr_3_v! + 42
      expect(expr_3_w).assertEqual(52)
      expr_3_w = expr_3_w != 0 ? expr_3_v! : 42
      expect(expr_3_w).assertEqual(5)
      expr_3_w = (expr_3_w != 0 ? expr_3_v : expr_3_w)!
      expect(expr_3_w).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_0500
     * @tc.name      testExpressionsEnsureNotNullish0005
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expr_4_w = expr_4_v!
      expect(expr_4_w).assertEqual(5)
      expr_4_w = expr_4_w + expr_4_v! + 42
      expect(expr_4_w).assertEqual(52)
      expr_4_w = expr_4_w != 0 ? expr_4_v! : 42
      expect(expr_4_w).assertEqual(5)
      expr_4_w = (expr_4_w != 0 ? expr_4_v : expr_4_w)!
      expect(expr_4_w).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_0600
     * @tc.name      testExpressionsEnsureNotNullish0006
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expr_5_w = expr_5_v!
      expect(expr_5_w).assertEqual(5)
      expr_5_w = expr_5_w + expr_5_v! + 42
      expect(expr_5_w).assertEqual(52)
      expr_5_w = expr_5_w != 0 ? expr_5_v! : 42
      expect(expr_5_w).assertEqual(5)
      expr_5_w = (expr_5_w != 0 ? expr_5_v : expr_5_w)!
      expect(expr_5_w).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_0700
     * @tc.name      testExpressionsEnsureNotNullish0007
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expr_6_w = expr_6_v!
      expect(expr_6_w).assertEqual(5)
      expr_6_w = expr_6_w! + expr_6_v! + 42
      expect(expr_6_w).assertEqual(52)
      expr_6_w = expr_6_w! != 0 ? expr_6_v! : 42
      expect(expr_6_w).assertEqual(5)
      expr_6_w = (expr_6_w! != 0 ? expr_6_v : expr_6_w)!
      expect(expr_6_w).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_0800
     * @tc.name      testExpressionsEnsureNotNullish0008
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expr_7_w = expr_7_v!
      expect(expr_7_w).assertEqual(5)
      expr_7_w = expr_7_w + expr_7_v! + 42
      expect(expr_7_w).assertEqual(52)
      expr_7_w = expr_7_w != 0 ? expr_7_v! : 42
      expect(expr_7_w).assertEqual(5)
      expr_7_w = (expr_7_w != 0 ? expr_7_v : expr_7_w)!
      expect(expr_7_w).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_0900
     * @tc.name      testExpressionsEnsureNotNullish0009
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expr_8_w = expr_8_v!
      expect(expr_8_w).assertEqual('a')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_1000
     * @tc.name      testExpressionsEnsureNotNullish0010
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(() => { expr_13_e = expr_13_v![0] }).assertThrow("")
      expect(() => { expr_13_v![0] = expr_13_e }).assertThrow("")
      expect((expr_13_w.length == 0 ? expr_13_v! : expr_13_w)[0]).assertEqual("")
      expect(() => { expr_13_e = (expr_13_w.length != 0 ? expr_13_v! : expr_13_w)[0] }).assertThrow("")
      expect(() => { (expr_13_w.length != 0 ? expr_13_v! : expr_13_w)[0] = expr_13_e }).assertThrow("")
      expect((expr_13_w.length == 0 ? expr_13_v : expr_13_w)![0]).assertEqual("")
      expect(() => { expr_13_e = (expr_13_w.length != 0 ? expr_13_v : expr_13_w)![0] }).assertThrow("")
      expect(() => { (expr_13_w.length != 0 ? expr_13_v : expr_13_w)![0] = expr_13_e }).assertThrow("")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_1100
     * @tc.name      testExpressionsEnsureNotNullish0011
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(() => { expr_14_e = expr_14_v![0] }).assertThrow("")
      expect(() => { expr_14_v![0] = expr_14_e }).assertThrow("")
      expect((expr_14_w.length == 0 ? expr_14_v! : expr_14_w)[0]).assertEqual("abc")
      expect(() => { expr_14_e = (expr_14_w.length != 0 ? expr_14_v! : expr_14_w)[0] }).assertThrow("")
      expect(() => { (expr_14_w.length != 0 ? expr_14_v! : expr_14_w)[0] = expr_14_e }).assertThrow("")
      expect((expr_14_w.length == 0 ? expr_14_v : expr_14_w)![0]).assertEqual("abc")
      expect(() => { expr_14_e = (expr_14_w.length != 0 ? expr_14_v : expr_14_w)![0] }).assertThrow("")
      expect(() => { (expr_14_w.length != 0 ? expr_14_v : expr_14_w)![0] = expr_14_e }).assertThrow("")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_1200
     * @tc.name      testExpressionsEnsureNotNullish0012
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(expr_15_w![0]).assertEqual(42)
      expect(() => { expr_15_e = expr_15_v![0] }).assertThrow("")
      expect(() => { expr_15_v![0] = expr_15_e }).assertThrow("")
      expect((expr_15_w.length == 0 ? expr_15_v! : expr_15_w!)[0]).assertEqual(42)
      expect(() => { expr_15_e = (expr_15_w.length != 0 ? expr_15_v! : expr_15_w)[0] }).assertThrow("")
      expect(() => { (expr_15_w.length != 0 ? expr_15_v! : expr_15_w)[0] = expr_15_e }).assertThrow("")
      expect((expr_15_w.length == 0 ? expr_15_v : expr_15_w)![0]).assertEqual(42)
      expect(() => { expr_15_e = (expr_15_w.length != 0 ? expr_15_v : expr_15_w)![0] }).assertThrow("")
      expect(() => { (expr_15_w.length != 0 ? expr_15_v : expr_15_w)![0] = expr_15_e }).assertThrow("")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_1300
     * @tc.name      testExpressionsEnsureNotNullish0013
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(expr_16_w![0]).assertEqual("1")
      expect(() => { expr_16_e = expr_16_v![0] }).assertThrow("")
      expect(() => { expr_16_v![0] = expr_16_e }).assertThrow("")
      expect((expr_16_e != '' ? expr_16_v! : expr_16_w!)[0]).assertEqual("1")
      expect(() => { expr_16_e = (expr_16_e == '' ? expr_16_v! : expr_16_w)[0] }).assertThrow("")
      expect(() => { (expr_16_e == '' ? expr_16_v! : expr_16_w)[0] = expr_16_e }).assertThrow("")
      expect((expr_16_e != '' ? expr_16_v : expr_16_w)![0]).assertEqual("1")
      expect(() => { expr_16_e = (expr_16_e == '' ? expr_16_v : expr_16_w)![0] }).assertThrow("")
      expect(() => { (expr_16_e == '' ? expr_16_v : expr_16_w)![0] = expr_16_e }).assertThrow("")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_1400
     * @tc.name      testExpressionsEnsureNotNullish0014
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(expr_17_w![1]).assertEqual("1")
      expect(() => { expr_17_e = expr_17_v![1] }).assertThrow("")
      expect(() => { expr_17_v![1] = expr_17_e }).assertThrow("")
      expect((expr_17_e != '' ? expr_17_v! : expr_17_w!)[1]).assertEqual("1")
      expect(() => { expr_17_e = (expr_17_e == '' ? expr_17_v! : expr_17_w!)[1] }).assertThrow("")
      expect(() => { (expr_17_e == '' ? expr_17_v! : expr_17_w)[1] = expr_17_e }).assertThrow("")
      expect((expr_17_e != '' ? expr_17_v : expr_17_w)![1]).assertEqual("1")
      expect(() => { expr_17_e = (expr_17_e == '' ? expr_17_v : expr_17_w)![1] }).assertThrow("")
      expect(() => { (expr_17_e == '' ? expr_17_v : expr_17_w)![1] = expr_17_e }).assertThrow("")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_1500
     * @tc.name      testExpressionsEnsureNotNullish0015
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(expr_21_w!.meth('abc')).assertEqual("abc")
      expect(() => { expr_21_e = expr_21_v!.meth('abc') }).assertThrow("")
      expect((expr_21_e != '' ? expr_21_v! : expr_21_w).meth('abc')).assertEqual("abc")
      expect(() => { expr_21_e = (expr_21_e == '' ? expr_21_v! : expr_21_w).meth('abc') }).assertThrow("")
      expect((expr_21_e != '' ? expr_21_v : expr_21_w)!.meth('abc')).assertEqual("abc")
      expect(() => { expr_21_e = (expr_21_e == '' ? expr_21_v : expr_21_w)!.meth('abc') }).assertThrow("")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_1600
     * @tc.name      testExpressionsEnsureNotNullish0016
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(expr_22_w!(42)).assertEqual("a42")
      expect(() => { expr_22_e = expr_22_v!(42) }).assertThrow("")
      expect((expr_22_e != '' ? expr_22_v! : expr_22_w!)(42)).assertEqual("a42")
      expect(() => { expr_22_e = (expr_22_e == '' ? expr_22_v! : expr_22_w!)(42) }).assertThrow("")
      expect((expr_22_e != '' ? expr_22_v : expr_22_w)!(42)).assertEqual("a42")
      expect(() => { expr_22_e = (expr_22_e == '' ? expr_22_v : expr_22_w)!(42) }).assertThrow("")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_1700
     * @tc.name      testExpressionsEnsureNotNullish0017
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(expr_23_w!(42)).assertEqual("a42")
      expect(() => { expr_23_e = expr_23_v!(42) }).assertThrow("")
      expect((expr_23_e != '' ? expr_23_v! : expr_23_w)(42)).assertEqual("a42")
      expect(() => { expr_23_e = (expr_23_e == '' ? expr_23_v! : expr_23_w)(42) }).assertThrow("")
      expect((expr_23_e != '' ? expr_23_v : expr_23_w)!(42)).assertEqual("a42")
      expect(() => { expr_23_e = (expr_23_e == '' ? expr_23_v : expr_23_w)!(42) }).assertThrow("")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_1800
     * @tc.name      testExpressionsEnsureNotNullish0018
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((expr_24_w as Error|null)!.message).assertEqual("msg")
      expect((expr_24_w! as Error).message).assertEqual("msg")
      expect(() => { expr_24_e = (expr_24_v! as Error).message }).assertThrow("")
      expect(() => { expr_24_e = (expr_24_v as Error|null)!.message }).assertThrow("")
      expect(((expr_24_e != '' ? expr_24_v! : expr_24_w!) as Error).message).assertEqual("msg")
      expect(() => { expr_24_e = 'abc' + ((expr_24_e == '' ? expr_24_v! : expr_24_w!) as Error).message }).assertThrow("")
      expect(((expr_24_e != '' ? expr_24_v : expr_24_w)! as Error).message).assertEqual("msg")
      expect(() => { expr_24_e = 'abc' + ((expr_24_e == '' ? expr_24_v : expr_24_w)! as Error).message }).assertThrow("")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_1900
     * @tc.name      testExpressionsEnsureNotNullish0019
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((expr_25_w as Error|undefined)!.message).assertEqual("msg")
      expect((expr_25_w! as Error).message).assertEqual("msg")
      expect(() => { expr_25_e = (expr_25_v! as Error).message }).assertThrow("")
      expect(() => { expr_25_e = (expr_25_v as Error|undefined)!.message }).assertThrow("")
      expect(((expr_25_e != '' ? expr_25_v! : expr_25_w!) as Error).message).assertEqual("msg")
      expect(() => { expr_25_e = 'abc' + ((expr_25_e == '' ? expr_25_v! : expr_25_w) as Error).message }).assertThrow("")
      expect(((expr_25_e != '' ? expr_25_v : expr_25_w)! as Error).message).assertEqual("msg")
      expect(() => { expr_25_e = 'abc' + ((expr_25_e == '' ? expr_25_v : expr_25_w)! as Error).message }).assertThrow("")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_2000
     * @tc.name      testExpressionsEnsureNotNullish0020
     * @tc.desc      if the expression 'e' is not a nullable type, then the operator '!' has no effect.
     *               If the result of the evaluation of e is not equal to null or undefined, then the
     *               result of e! is the outcome of the evaluation of e. If the result of the evaluation
     *               of e is equal to null or undefined, then NullPointerError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let w = expr_26_v!!
      expect(w).assertEqual("abc")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ENSURE_NOT_NULLISH_2100
     * @tc.name      testExpressionsEnsureNotNullish0021
     * @tc.desc      For an expression e!, if the type of e is nullable, an ensure not-null expression
     *               checks whether the evaluation of e is equal to null and, if it is, throws a NullPointerError.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEnsureNotNullish0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null_check1_foo2(null_check1_a)).assertEqual(2)
      expect(null_check1_foo(null_check1_a!)).assertEqual(1)
      expect(null_check1_foo2(null_check1_b)).assertEqual(2)
      expect(() => { null_check1_foo(null_check1_b!) }).assertThrow("")
    });
  });
}
