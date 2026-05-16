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

let a_1: boolean = false;
let b_1: boolean = false;
let c_1: boolean = false;
function ta_1(): int {
  expect(!a_1).assertTrue();
  expect(!b_1).assertTrue();
  expect(!c_1).assertTrue();
  a_1 = true;
  return 0;
}
function tb_1(): int {
  expect(a_1).assertTrue();
  expect(!b_1).assertTrue();
  expect(!c_1).assertTrue();
  b_1 = true;
  return 1;
}
function tc_1(): int {
  expect(a_1).assertTrue();
  expect(b_1).assertTrue();
  expect(!c_1).assertTrue();
  c_1 = true;
  return 2;
}
function td_1(): int {
  expect(a_1).assertTrue();
  expect(b_1).assertTrue();
  expect(c_1).assertTrue();
  return 3;
}
function test_1(a: int, b: int, c: int, d: int): void {
  expect(a).assertEqual(0);
  expect(b).assertEqual(1);
  expect(c).assertEqual(2);
  expect(d).assertEqual(3);
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionEvaluationArgumentsTest() {
  describe("ExpressionEvaluationArgumentsTest", () => {
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
     * @tc.number    SUB_EXPRESSION_EVALUATION_ARGUMENTS_0100
     * @tc.name      testExpressionEvaluationArguments0001
     * @tc.desc      Argument list evaluation order (functions)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationArguments0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_1 = b_1 = c_1 = false;
      test_1(ta_1(), tb_1(), tc_1(), td_1());
      expect(a_1).assertEqual(true);
    })
  });
}