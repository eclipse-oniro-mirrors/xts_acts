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

type LTS_method_type = 'LTS'

final class A_method_type {
  static method() { }
  method() { }
  void1() {}
  void2() { return }
  nevermore(): never { throw new Error }
  giveu(): undefined { return undefined }
  givenull(): null { return null }
  lts(): LTS_method_type { return 'LTS' }
}

export default function ExpressionsMethodTypeTestSuite(): void {
  describe("ExpressionsMethodTypeTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_METHOD_TYPE_0100
     * @tc.name      testExpressionsMethodType0001
     * @tc.desc      Type of method call expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: LTS_method_type = new A_method_type().lts()
      expect("LTS").assertEqual(x)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_TYPE_0200
     * @tc.name      testExpressionsMethodType0002
     * @tc.desc      Type of method call expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uu = new A_method_type().giveu()
      expect(undefined).assertEqual(uu)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_TYPE_0300
     * @tc.name      testExpressionsMethodType0003
     * @tc.desc      Type of method call expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uu = new A_method_type().givenull()
      expect(null).assertEqual(uu)
    })
  })
}