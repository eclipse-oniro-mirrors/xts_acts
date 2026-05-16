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

type Incrementor_0 = (i: int) => int;
let sg_0: int;
let ig_0: int = 1;
class A_0 {
  public fld: int = 42 + (sg_0 = "abc".length);
  private f: Incrementor_0;
  public constructor(f: Incrementor_0) {
      this.f = f;
  }
  public meth(): int {
      return this.f(sg_0);
  }
  public static i: int;
  static {
    A_0.i = 12 + ig_0;
  }
}
function inc_0(p: int): int {
    return p + 1;
}

type Inc_1 = (i: int) => number;
function inc_1(p: int): number {
    return p + 1;
}
function foo_1(i: int, func: Inc_1): number {
    return func(i);
}

let sg_2: string = "a";
let ig_2: int = 42;
function foo_2(p: int, s: string): int {
    sg_2 += s;
    ig_2 = -1;
    return p - s.length;
}
class A_2 {
  meth(p: int, s: string): int {
    sg_2 += s;
    ig_2 = 1;
    return p - s.length;
  }
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsEvaluationTest() {
  describe("ExpressionsEvaluationTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_EVALUATION_TEST_0100
     * @tc.name      testExpressionsEvaluation0001
     * @tc.desc      An expression may occur: - inside a declaration of type (class or interface),
     *               i.e. in a field initializer, static initializer, constructor declaration, method
     *               declaration or annotation;
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEvaluation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_0 = new A_0(inc_0);
      expect(a.fld).assertEqual(45)
      expect(A_0.i).assertEqual(13)
      expect(a.meth()).assertEqual(4)
      expect(sg_0).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_EVALUATION_TEST_0200
     * @tc.name      testExpressionsEvaluation0002
     * @tc.desc      An expression may occur: - inside a function body;
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEvaluation0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = foo_1(12, inc_1);
      expect(i).assertEqual(13)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_EVALUATION_TEST_0300
     * @tc.name      testExpressionsEvaluation0003
     * @tc.desc      Expressions may contain assignments, increment operators, decrement operators,
     *               method calls and function calls; as a result, an evaluation of an expression can
     *               produce side effects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsEvaluation0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      sg_2 = "a";
      ig_2 = 42;
      let i: int = (sg_2 += "b").length + (ig_2 = 43);
      expect(i).assertEqual(45)
      expect(sg_2).assertEqual("ab")
      expect(ig_2).assertEqual(43)
      let k: int = ig_2++ + ++ig_2;
      expect(k).assertEqual(88)
      expect(ig_2).assertEqual(45)
      let j: int = ig_2-- + --ig_2;
      expect(j).assertEqual(88)
      expect(ig_2).assertEqual(43)
      let m: int = foo_2(j, sg_2);
      expect(m).assertEqual(86)
      expect(ig_2).assertEqual(-1)
      expect(sg_2).assertEqual("abab")
      let n: int = new A_2().meth(m, sg_2);
      expect(n).assertEqual(82)
      expect(ig_2).assertEqual(1)
      expect(sg_2).assertEqual("abababab")
    })
  });
}