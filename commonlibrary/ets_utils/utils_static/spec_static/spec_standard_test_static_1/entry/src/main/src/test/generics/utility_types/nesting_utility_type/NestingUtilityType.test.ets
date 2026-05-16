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
} from "../../../../../../hypium"

interface Issue_0 {
  title?: string
  description?: string
}
type T0_0 = Required<Readonly<Issue_0>>
type T1_0 = Readonly<T0_0>
type T2_0 = Required<T1_0>
type T3_0 = Readonly<T2_0>
type T4_0 = Required<T3_0>
type T5_0 = Readonly<T4_0>
type T6_0 = Required<T5_0>
type T7_0 = Readonly<T6_0>
type T8_0 = Required<T7_0>
type T9_0 = Readonly<T8_0>
type TA_0 = Readonly<T9_0>
type TB_0 = Readonly<TA_0>
type TC_0 = Readonly<TB_0>
type TD_0 = Readonly<TC_0>
type TE_0 = Readonly<TD_0>
type TF_0 = NonNullable<TE_0>

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function NestingUtilityTypeTest() {
  describe("NestingUtilityTypeTest", () => {
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
     * @tc.number    SUB_NESTING_UTILITY_TYPE_0100
     * @tc.name      testNestingUtilityType0001
     * @tc.desc      If more than one utility types are required then they can be nested
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNestingUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myIssue: TF_0 = { title: 'aa', description: 'bb' }
      expect('aa').assertEqual(myIssue.title)
    })
  });
}