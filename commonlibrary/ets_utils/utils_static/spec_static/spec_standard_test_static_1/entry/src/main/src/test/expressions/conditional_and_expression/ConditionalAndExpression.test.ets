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

export default function ConditionalAndExpressionTest() {
  describe("ConditionalAndExpressionTest", () => {
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
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_0100
     * @tc.name      testConditionalAndExpression0001
     * @tc.desc      Conditional AND for 2x boolean - true true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true;
      let b: boolean = true;
      expect(a && b).assertTrue();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_0200
     * @tc.name      testConditionalAndExpression0002
     * @tc.desc      Conditional AND for 2x boolean - true false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true;
      let b: boolean = false;
      expect(a && b).assertFalse();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_0300
     * @tc.name      testConditionalAndExpression0003
     * @tc.desc      Conditional AND for 2x boolean - false unknown
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = false;
      let execRight = false;
      let result = a && (execRight = true);
      expect(result).assertFalse();
      expect(execRight).assertFalse();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_0400
     * @tc.name      testConditionalAndExpression0004
     * @tc.desc      Conditional AND left to right execution
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = false;
      let execRight = false;
      let result = (execRight = true) && a;
      expect(result).assertFalse();
      expect(execRight).assertTrue();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_0500
     * @tc.name      testConditionalAndExpression0005
     * @tc.desc      Conditional AND for 3x boolean - true true true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true;
      let b: boolean = true;
      let c: boolean = true;
      expect(a && b && c).assertTrue();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_0600
     * @tc.name      testConditionalAndExpression0006
     * @tc.desc      Conditional AND for 3x boolean - true true false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true;
      let b: boolean = true;
      let c: boolean = false;
      expect(a && b && c).assertFalse();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_0700
     * @tc.name      testConditionalAndExpression0007
     * @tc.desc      Conditional AND for 3x boolean - false unknown true - left to right grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = false;
      let b: boolean = true;
      let execRight = false;
      let result = a && (execRight = true) && b;
      expect(result).assertFalse();
      expect(execRight).assertFalse();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_0800
     * @tc.name      testConditionalAndExpression0008
     * @tc.desc      Conditional AND for 2x boolean - true true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true;
      let b: boolean = true;
      expect(a && b).assertTrue();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_0900
     * @tc.name      testConditionalAndExpression0009
     * @tc.desc      Conditional AND for 2x boolean - true false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true;
      let b: boolean = false;
      expect(a && b).assertFalse();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_1000
     * @tc.name      testConditionalAndExpression0010
     * @tc.desc      Conditional AND for 2x boolean - false unknown
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = false;
      let execRight = false;
      let result = a && (execRight = true);
      expect(result).assertFalse();
      expect(execRight).assertFalse();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_1100
     * @tc.name      testConditionalAndExpression0011
     * @tc.desc      Conditional AND left to right execution
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = false;
      let execRight = false;
      let result = (execRight = true) && a;
      expect(result).assertFalse();
      expect(execRight).assertTrue();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_1200
     * @tc.name      testConditionalAndExpression0012
     * @tc.desc      Conditional AND for 3x boolean - true true true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true;
      let b: boolean = true;
      let c: boolean = true;
      expect(a && b && c).assertTrue();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_1300
     * @tc.name      testConditionalAndExpression0013
     * @tc.desc      Conditional AND for 3x boolean - true true false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true;
      let b: boolean = true;
      let c: boolean = false;
      expect(a && b && c).assertFalse();
    })

    /**
     * @tc.number    SUB_CONDITIONAL_AND_EXPRESSION_1400
     * @tc.name      testConditionalAndExpression0014
     * @tc.desc      Conditional AND for 3x boolean - false unknown true - left to right grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConditionalAndExpression0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = false;
      let b: boolean = true;
      let execRight = false;
      let result = a && (execRight = true) && b;
      expect(result).assertFalse();
      expect(execRight).assertFalse();
    })
  })
}