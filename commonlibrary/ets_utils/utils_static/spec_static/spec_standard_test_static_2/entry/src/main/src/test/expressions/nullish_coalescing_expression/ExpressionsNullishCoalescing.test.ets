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

let lazy_operator_a: Any
function lazy_operator_non_eval(): int {
  expect(true).assertFalse() // 用于触发失败的函数
  return 0;
}
class lazy_operator_C {}

abstract class least_upper_bound_ACA {}
abstract class least_upper_bound_ACB {}
class least_upper_bound_CAA extends least_upper_bound_ACA {}
class least_upper_bound_CAB extends least_upper_bound_ACA {}
class least_upper_bound_CAAA extends least_upper_bound_CAA {}
class least_upper_bound_CAAB extends least_upper_bound_CAA {}
class least_upper_bound_CBA extends least_upper_bound_ACB {}
class least_upper_bound_CBB extends least_upper_bound_ACB {}
class least_upper_bound_CBBA extends least_upper_bound_CBB {}
class least_upper_bound_CBBB extends least_upper_bound_CBB {}

type mix_with_conditional_boolean_nullish = boolean | null | undefined
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
type nullish_coalescing_expression_array_int_nullish = int | null | undefined
let nullish_coalescing_expression_array_rec: Record<string, nullish_coalescing_expression_array_int_nullish> =
  {
    "a": null,
    "b": 1,
    "c": undefined,
  }
class nullish_coalescing_expression_array_C {
  public fld: string = "test"
}

type nullish_coalescing_expression_class_int_nullish = int | null | undefined
class nullish_coalescing_expression_class_C {
  public fld1: nullish_coalescing_expression_class_int_nullish
  private _fld2: nullish_coalescing_expression_class_int_nullish = 0

  constructor(value: nullish_coalescing_expression_class_int_nullish = 0) {
    this.fld1 = value;
  }
  set fld2(value: nullish_coalescing_expression_class_int_nullish) {
    this._fld2 = value;
  }
  get fld2(): nullish_coalescing_expression_class_int_nullish {
    return this._fld2;
  }
}

type nullish_coalescing_expression_record_int_nullish = int | null | undefined
function nullish_coalescing_expression_record_foo(): nullish_coalescing_expression_record_int_nullish { return 1; }
class nullish_coalescing_expression_array_7_C {}

class type_of_null_coalescing_0_A {}
function type_of_null_coalescing_0_foo(p: type_of_null_coalescing_0_A): int {
  return 2;
}

class type_of_null_coalescing_1_A {}
function type_of_null_coalescing_1_foo(p: Object): int {
  return 1;
}

class type_of_null_coalescing_2_A {}
class type_of_null_coalescing_2_BA extends type_of_null_coalescing_2_A {}

export default function ExpressionsNullishCoalescing(): void {
  describe("ExpressionsNullishCoalescing", () => {
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
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_0100
     * @tc.name      testExpressionsNullishCoalescing0001
     * @tc.desc      null safety -> Null-Coalescing Operator.
     *               assert: This operator is lazy, meaning that if the evaluation of the left-hand-side
     *               expression is not equal to null, the right-hand-side expression is not evaluated.
     *               New object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      lazy_operator_a = new lazy_operator_C()
      let x5 = lazy_operator_a ?? lazy_operator_non_eval()
      // 如果运行到这里，说明 lazy_operator_non_eval() 没有被调用
      expect(x5 instanceof lazy_operator_C).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_0200
     * @tc.name      testExpressionsNullishCoalescing0002
     * @tc.desc      The type of a nullish-coalescing expression is the least upper bound (see Least
     *               Upper Bound) of the non-nullish variant of the types of the left-hand-side and right-hand-side
     *               expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: least_upper_bound_CAAA | null = null;
      let b: least_upper_bound_CBBB = new least_upper_bound_CBBB();
      let c = a ?? b;
      expect(c instanceof least_upper_bound_ACB).assertTrue()
      expect(c instanceof least_upper_bound_ACA).assertFalse()
      // verify exact type
      let d: least_upper_bound_CAAA | least_upper_bound_CBBB = c
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_0300
     * @tc.name      testExpressionsNullishCoalescing0003
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = true;
      let x = (a_nullish ?? true) && true;
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_0400
     * @tc.name      testExpressionsNullishCoalescing0004
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = true;
      let x = true && (a_nullish ?? true);
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_0500
     * @tc.name      testExpressionsNullishCoalescing0005
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = true;
      let x = (a_nullish ?? true) || true;
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_0600
     * @tc.name      testExpressionsNullishCoalescing0006
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = true;
      let x = true || (a_nullish ?? true);
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_0700
     * @tc.name      testExpressionsNullishCoalescing0007
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = false;
      let x = (a_nullish ?? true) && true;
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_0800
     * @tc.name      testExpressionsNullishCoalescing0008
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = false;
      let x = true && (a_nullish ?? true);
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_0900
     * @tc.name      testExpressionsNullishCoalescing0009
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = false;
      let x = (a_nullish ?? true) || true;
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_1000
     * @tc.name      testExpressionsNullishCoalescing0010
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = false;
      let x = true || (a_nullish ?? true);
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_1100
     * @tc.name      testExpressionsNullishCoalescing0011
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = null;
      let x = (a_nullish ?? true) && true;
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_1200
     * @tc.name      testExpressionsNullishCoalescing0012
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = null;
      let x = true && (a_nullish ?? true);
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_1300
     * @tc.name      testExpressionsNullishCoalescing0013
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = null;
      let x = (a_nullish ?? true) || true;
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_1400
     * @tc.name      testExpressionsNullishCoalescing0014
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = null;
      let x = true || (a_nullish ?? true);
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_1500
     * @tc.name      testExpressionsNullishCoalescing0015
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = undefined;
      let x = (a_nullish ?? true) && true;
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_1600
     * @tc.name      testExpressionsNullishCoalescing0016
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = undefined;
      let x = true && (a_nullish ?? true);
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_1700
     * @tc.name      testExpressionsNullishCoalescing0017
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = undefined;
      let x = (a_nullish ?? true) || true;
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_1800
     * @tc.name      testExpressionsNullishCoalescing0018
     * @tc.desc      A compile-time error occurs if the nullish-coalescing operator is mixed with
     *               conditional-and or
     *               conditional-or operators without parentheses.
     *               Verify that with parentheses this mix works fine.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_nullish: mix_with_conditional_boolean_nullish = undefined;
      let x = true || (a_nullish ?? true);
      expect(x instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_1900
     * @tc.name      testExpressionsNullishCoalescing0019
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     *               Empty array is not nullish
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: Array<nullish_coalescing_expression_array_int_nullish> = []
      let rhs: Array<int> = [0]
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: Array<nullish_coalescing_expression_array_int_nullish>|Array<int> = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_2000
     * @tc.name      testExpressionsNullishCoalescing0020
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: Array<nullish_coalescing_expression_array_int_nullish> = [null, 0, undefined]
      let rhs: boolean = false
      let x = lhs[0] ?? rhs
      let x$ = lhs[0]
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|boolean = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_2100
     * @tc.name      testExpressionsNullishCoalescing0021
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: FixedArray<nullish_coalescing_expression_array_int_nullish> = [null, 0, undefined]
      let rhs: Array<Any> = [false]
      let x = lhs[1] ?? rhs
      let x$ = lhs[1]
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|Array<Any> = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_2200
     * @tc.name      testExpressionsNullishCoalescing0022
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: nullish_coalescing_expression_array_int_nullish[] = [null, 0, undefined]
      let rhs: Record<string, nullish_coalescing_expression_array_int_nullish> = {
        "a": null,
        "b": 1,
        "c": undefined,
      }
      let x = lhs[2] ?? rhs
      let x$ = lhs[2]
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|Record<string, nullish_coalescing_expression_array_int_nullish> = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_2300
     * @tc.name      testExpressionsNullishCoalescing0023
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: Array<Record<string, nullish_coalescing_expression_array_int_nullish>> = [nullish_coalescing_expression_array_rec];
      let rhs: nullish_coalescing_expression_array_int_nullish = undefined;
      let x = lhs[0] ?? rhs
      let x$ = lhs[0]
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: Record<string, nullish_coalescing_expression_array_int_nullish>|undefined = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_2400
     * @tc.name      testExpressionsNullishCoalescing0024
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: Array<Record<string, nullish_coalescing_expression_array_int_nullish>> = [nullish_coalescing_expression_array_rec];
      let rhs: nullish_coalescing_expression_array_7_C = new nullish_coalescing_expression_array_7_C();
      let x = lhs[0]["b"] ?? rhs
      let x$ = lhs[0]["b"]
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|nullish_coalescing_expression_array_7_C = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_2500
     * @tc.name      testExpressionsNullishCoalescing0025
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: Array<Record<string, nullish_coalescing_expression_array_int_nullish>> = [nullish_coalescing_expression_array_rec];
      let rhs: nullish_coalescing_expression_array_C = new nullish_coalescing_expression_array_C();
      let x = lhs[0]["c"] ?? rhs.fld
      let x$ = lhs[0]["c"]
      if (x$ == null) {
        expect(x).assertEqual(rhs.fld)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|string = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_2600
     * @tc.name      testExpressionsNullishCoalescing0026
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: [null, nullish_coalescing_expression_array_int_nullish, int] = [null, undefined, 0];
      let rhs: "literal" = "literal"
      let x = lhs[1] ?? rhs
      let x$ = lhs[1]
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|"literal" = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_2700
     * @tc.name      testExpressionsNullishCoalescing0027
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: nullish_coalescing_expression_class_C = new nullish_coalescing_expression_class_C();
      let rhs: string = "test";
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: nullish_coalescing_expression_class_C|string = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_2800
     * @tc.name      testExpressionsNullishCoalescing0028
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: nullish_coalescing_expression_class_C = new nullish_coalescing_expression_class_C(null);
      let rhs: string = "test";
      let x = lhs.fld1 ?? rhs
      let x$ = lhs.fld1
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|string = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_2900
     * @tc.name      testExpressionsNullishCoalescing0029
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: nullish_coalescing_expression_class_C = new nullish_coalescing_expression_class_C(undefined);
      let rhs: string = "test";
      let x = lhs.fld1 ?? rhs
      let x$ = lhs.fld1
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|string = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_3000
     * @tc.name      testExpressionsNullishCoalescing0030
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: nullish_coalescing_expression_class_C = new nullish_coalescing_expression_class_C(0);
      let rhs: string = "test";
      let x = lhs.fld1 ?? rhs
      let x$ = lhs.fld1
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|string = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_3100
     * @tc.name      testExpressionsNullishCoalescing0031
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: nullish_coalescing_expression_class_C = new nullish_coalescing_expression_class_C();
      let rhs: string = "test";
      let x = lhs.fld2 ?? rhs
      let x$ = lhs.fld2
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|string = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_3200
     * @tc.name      testExpressionsNullishCoalescing0032
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: nullish_coalescing_expression_class_C = new nullish_coalescing_expression_class_C();
      lhs.fld2 = null
      let rhs: string = "test";
      let x = lhs.fld2 ?? rhs
      let x$ = lhs.fld2
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|string = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_3300
     * @tc.name      testExpressionsNullishCoalescing0033
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: nullish_coalescing_expression_class_C = new nullish_coalescing_expression_class_C();
      lhs.fld2 = undefined
      let rhs: string = "test";
      let x = lhs.fld2 ?? rhs
      let x$ = lhs.fld2
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|string = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_3400
     * @tc.name      testExpressionsNullishCoalescing0034
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: Record<string, nullish_coalescing_expression_record_int_nullish> =
        {
          "a": null,
          "b": 1,
          "c": undefined,
        }
      let rhs: byte = 1
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: Record<string, nullish_coalescing_expression_record_int_nullish>|byte = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_3500
     * @tc.name      testExpressionsNullishCoalescing0035
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: Record<string, nullish_coalescing_expression_record_int_nullish> =
        {
          "a": null,
          "b": 1,
          "c": undefined,
        }
      let rhs: [null, nullish_coalescing_expression_record_int_nullish] = [null, 0]
      let x = lhs["a"] ?? rhs[0]
      let x$ = lhs["a"]
      if (x$ == null) {
        expect(x).assertEqual(rhs[0])
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|null = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_3600
     * @tc.name      testExpressionsNullishCoalescing0036
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: Record<string, nullish_coalescing_expression_record_int_nullish> =
        {
          "a": null,
          "b": 1,
          "c": undefined,
        }
      let rhs: FixedArray<nullish_coalescing_expression_record_int_nullish> = [0]
      let x = lhs["b"] ?? rhs[0]
      let x$ = lhs["b"]
      if (x$ == null) {
        expect(x).assertEqual(rhs[0])
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|nullish_coalescing_expression_record_int_nullish = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_3700
     * @tc.name      testExpressionsNullishCoalescing0037
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: Record<string, nullish_coalescing_expression_record_int_nullish> =
        {
          "a": null,
          "b": 1,
          "c": undefined,
        }
      let rhs: () => nullish_coalescing_expression_record_int_nullish = nullish_coalescing_expression_record_foo
      let x = lhs["c"] ?? rhs
      let x$ = lhs["c"]
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      // check that x is exactly of expected type, without extra unions
      let y: int|((() => int|null|undefined)) = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_3800
     * @tc.name      testExpressionsNullishCoalescing0038
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: null | undefined | int = null
      let rhs: double = 1.0
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      expect(x).assertEqual(1.0)
      // check that x is exactly of expected type, without extra unions
      let y: int|double = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_3900
     * @tc.name      testExpressionsNullishCoalescing0039
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: null | int | undefined | Byte = undefined
      let rhs: double = 1.0
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      expect(x).assertEqual(1.0)
      // check that x is exactly of expected type, without extra unions
      let y: int|Byte|double = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_4000
     * @tc.name      testExpressionsNullishCoalescing0040
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: null | undefined | bigint = 0n
      let rhs: double = 1.0
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      expect(x).assertEqual(0n)
      // check that x is exactly of expected type, without extra unions
      let y: bigint|double = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_4100
     * @tc.name      testExpressionsNullishCoalescing0041
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: null | undefined = undefined
      let rhs: double = 1.0
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      expect(x).assertEqual(1.0)
      // check that x is exactly of expected type, without extra unions
      let y: double = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_4200
     * @tc.name      testExpressionsNullishCoalescing0042
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: undefined = undefined
      let rhs: null = null
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      expect(x).assertEqual(null)
      // check that x is exactly of expected type, without extra unions
      let y: null = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_4300
     * @tc.name      testExpressionsNullishCoalescing0043
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: boolean = false
      let rhs: undefined | null = undefined
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      expect(x).assertEqual(false)
      // check that x is exactly of expected type, without extra unions
      let y: boolean | undefined | null = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_4400
     * @tc.name      testExpressionsNullishCoalescing0044
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     *               Same type for union
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: string = ""
      let rhs: string = "abc"
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      expect(x).assertEqual("")
      // check that x is exactly of expected type, without extra unions
      let y: string = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_4500
     * @tc.name      testExpressionsNullishCoalescing0045
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: Any = null
      let rhs: boolean = false
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      expect(x).assertEqual(false)
      // check that x is exactly of expected type, without extra unions
      let y: Any|boolean = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_4600
     * @tc.name      testExpressionsNullishCoalescing0046
     * @tc.desc      A nullish-coalescing expression checks whether the evaluation of the left-hand-side
     *               expression equals the nullish
     *               value:
     *               • If so, then the right-hand-side
     *               expression evaluation is the result of a nullish-coalescing expression.
     *               • If not so, then the result of the left-hand-side expression evaluation is the
     *               result of a nullish-coalescing expres-
     *               sion, and the right-hand-side expression
     *               is not evaluated (the operator '??' is thus lazy).
     *               The type of a nullish-coalescing
     *               expression is a normalized union type (see Union Types) formed from the following:
     *                  • Non-nullish variant of the type of the left-hand-side expression; and
     *                  • Type of the right-hand-side expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: byte
      let rhs: short
      let x = lhs ?? rhs
      let x$ = lhs
      if (x$ == null) {
        expect(x).assertEqual(rhs)
      }
      else {
        expect(x).assertEqual(x$!)
      }
      expect(x).assertEqual(0)
      // check that x is exactly of expected type, without extra unions
      let y: byte|short = x
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_4700
     * @tc.name      testExpressionsNullishCoalescing0047
     * @tc.desc      The type of null-coalescing expression is the least upper bound of the non-nullable
     *               variant of the type of the left-hand-side expression and the type of the right-hand-side
     *               expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: type_of_null_coalescing_0_A = new type_of_null_coalescing_0_A();
      let b: type_of_null_coalescing_0_A = new type_of_null_coalescing_0_A();
      let c = a ?? b;
      expect(type_of_null_coalescing_0_foo(c)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_NULLISH_COALESCING_4800
     * @tc.name      testExpressionsNullishCoalescing0048
     * @tc.desc      The type of null-coalescing expression is the least upper bound of the non-nullable
     *               variant of the type of the left-hand-side expression and the type of the right-hand-side
     *               expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNullishCoalescing0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: type_of_null_coalescing_1_A = new type_of_null_coalescing_1_A();
      let b: Int = 2;
      let c = a ?? b;
      expect(type_of_null_coalescing_1_foo(c)).assertEqual(1);
    });
  });
}