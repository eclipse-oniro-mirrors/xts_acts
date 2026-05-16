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
export default function AssignmentTest() {
  describe("AssignmentTest", () => {
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
     * @tc.number    SUB_ASSIGNMENT_TEST_ONE_0100
     * @tc.name      testAssignment0001
     * @tc.desc      All assignment operators are syntactically right-associative (they group right-to-left). Thus, a=b=c means a=(b=c), which assigns the value of c to b and then assigns the value of b to a.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x = 1
        let y = 2
        x = x = x = x = x = x = y * 2
        expect(x).assertEqual(4)
    })
    /**
     * @tc.number    SUB_ASSIGNMENT_TEST_ONE_0200
     * @tc.name      testAssignment0002
     * @tc.desc      All assignment operators are syntactically right-associative (they group right-to-left). Thus, a=b=c means a=(b=c), which assigns the value of c to b and then assigns the value of b to a.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignment0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x = 1
        let y = 2
        x = y = x = y = x = y = x + y
        expect(x != 3 || y != 3).assertFalse()
    })
    /**
     * @tc.number    SUB_ASSIGNMENT_TEST_ONE_0300
     * @tc.name      testAssignment0003
     * @tc.desc      All assignment operators are syntactically right-associative (they group right-to-left). Thus, a=b=c means a=(b=c), which assigns the value of c to b and then assigns the value of b to a.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignment0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: int[] = [5, 5]
        let y = 2
        x[--y] = x[--y] = y
        expect(y != 0 || x[0] != 0 || x[1] != 0).assertFalse()
    })
    /**
     * @tc.number    SUB_ASSIGNMENT_TEST_ONE_0400
     * @tc.name      testAssignment0004
     * @tc.desc      All assignment operators are syntactically right-associative (they group right-to-left). Thus, a=b=c means a=(b=c), which assigns the value of c to b and then assigns the value of b to a.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignment0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: String = "a"
        expect((s += s += s += "b")).assertEqual("aaab")
    })
  })
}
