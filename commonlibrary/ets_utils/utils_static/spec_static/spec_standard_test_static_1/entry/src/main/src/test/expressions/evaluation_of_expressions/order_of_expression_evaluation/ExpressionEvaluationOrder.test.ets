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

export default function ExpressionEvaluationOrderTest() {
  describe("ExpressionEvaluationOrderTest", () => {
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
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_0100
     * @tc.name      testExpressionEvaluationOrder0001
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 + 3 + 4 + 5).assertEqual((2 + 3) + 4 + 5);
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_0200
     * @tc.name      testExpressionEvaluationOrder0002
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 + 3 + 4 + 5).assertEqual((2 + 3) + (4 + 5));
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_0300
     * @tc.name      testExpressionEvaluationOrder0003
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 + 3 + 4 + 5).assertEqual(2 + (3 + 4) + 5);
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_0400
     * @tc.name      testExpressionEvaluationOrder0004
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 + 3 + 4 + 5).assertEqual(2 + 3 + (4 + 5));
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_0500
     * @tc.name      testExpressionEvaluationOrder0005
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 + 3 + 4 + 5).assertEqual(((2 + 3) + 4) + 5);
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_0700
     * @tc.name      testExpressionEvaluationOrder0007
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 * 3 * 4 * 5).assertEqual((2 * 3) * 4 * 5);
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_0800
     * @tc.name      testExpressionEvaluationOrder0008
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 * 3 * 4 * 5).assertEqual((2 * 3) * (4 * 5));
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_0900
     * @tc.name      testExpressionEvaluationOrder0009
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 * 3 * 4 * 5).assertEqual(2 * (3 * 4) * 5);
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_1000
     * @tc.name      testExpressionEvaluationOrder0010
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 * 3 * 4 * 5).assertEqual(2 * 3 * (4 * 5));
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_1100
     * @tc.name      testExpressionEvaluationOrder0011
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 * 3 * 4 * 5).assertEqual(((2 * 3) * 4) * 5);
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_ORDER_1200
     * @tc.name      testExpressionEvaluationOrder0012
     * @tc.desc      Integer addition and multiplication are associative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationOrder0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 * 3 * 4 * 5).assertEqual((2 * 3) * 4 * 5);
    })

  });
}