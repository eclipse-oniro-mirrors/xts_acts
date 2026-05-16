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

export default function ExpressionEvaluationCompletionTest() {
  describe("ExpressionEvaluationCompletionTest", () => {
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
     * @tc.number    SUB_EXPRESSION_EVALUATION_COMPLETION_0100
     * @tc.name      testExpressionEvaluationCompletion0001
     * @tc.desc      ArithmeticError is thrown by an integer division or integer remainder operator
     *               if the right-hand operand expression has the zero value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationCompletion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1;
      let b = 1;
      let i = 1;
      let j = 1;
      let v: string = "X" + (a = 2) + i % j-- + (b = 2);
      expect(a).assertEqual(2);
      expect(b).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_COMPLETION_0200
     * @tc.name      testExpressionEvaluationCompletion0002
     * @tc.desc      ArithmeticError is thrown by an integer division or integer remainder operator
     *               if the right-hand operand expression has the zero value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationCompletion0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1;
      let b = 1;
      let i = 1;
      let j: int = 0;
      let v: boolean = (++a > 0) || (i / j) > 0;
      expect(a == 2 || b == 1).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_COMPLETION_0300
     * @tc.name      testExpressionEvaluationCompletion0003
     * @tc.desc      If the value of an array index expression is negative, or greater than, or equal
     *               to the length of the array, then an array indexing expression throws RangeError.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationCompletion0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number[][] = [[1, 2], [3, 4], [5, 6]];
      let a = 1;
      let b = 1;
      v[1][1]++; // ++v[1][1]
      let s: string = "X" + (a = 2) + v[1][1] + (b = 2);
      expect(a).assertEqual(2);
      expect(b).assertEqual(2);
    })

  });
}