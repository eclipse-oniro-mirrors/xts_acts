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

interface I_22 {
  a: number
  b: string
}

enum ENM_22 {Red = 8, Blue, Green}

// 类型定义
type p_0 = Awaited<number>
type o_0 = Awaited<p_0>

type p_1 = Awaited<Array<number>>
type o_1 = Awaited<p_1>

type p_3 = Awaited<number[]>
type o_3 = Awaited<p_3>

type p_4 = Awaited<I_22>
type o_4 = Awaited<p_4>

type p_5 = Awaited<ENM_22>
type o_5 = Awaited<p_5>

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function AwaitedUtilityTypeTest() {
  describe("AwaitedUtilityTypeTest", () => {
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
     * @tc.number    SUB_AWAITED_UTILITY_TYPE_0100
     * @tc.name      testAwaitedUtilityType0001
     * @tc.desc      Any occurrence of Awaited type is recursively removed until a generic, a function,
     *               an array, or a tuple type is detected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAwaitedUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: o_0 = 100;
      expect(i).assertEqual(100);
    })

    /**
     * @tc.number    SUB_AWAITED_UTILITY_TYPE_0200
     * @tc.name      testAwaitedUtilityType0002
     * @tc.desc      Any occurrence of Awaited type is recursively removed until a generic, a function,
     *               an array, or a tuple type is detected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAwaitedUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: o_1 = Array.create<number>(3, 1);
      expect(i.at(0)).assertEqual(1);
      expect(i instanceof Array).assertTrue();
    })

    /**
     * @tc.number    SUB_AWAITED_UTILITY_TYPE_0300
     * @tc.name      testAwaitedUtilityType0003
     * @tc.desc      Any occurrence of Awaited type is recursively removed until a generic, a function,
     *               an array, or a tuple type is detected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAwaitedUtilityType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: o_3 = [1.0, 2.0];
      expect(i[0]).assertEqual(1.0);
      expect(i instanceof Array).assertTrue();
    })

    /**
     * @tc.number    SUB_AWAITED_UTILITY_TYPE_0400
     * @tc.name      testAwaitedUtilityType0004
     * @tc.desc      Any occurrence of Awaited type is recursively removed until a generic, a function,
     *               an array, or a tuple type is detected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAwaitedUtilityType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: o_4 = {a: 3, b: "str"};
      expect(i.b).assertEqual("str");
    })

    /**
     * @tc.number    SUB_AWAITED_UTILITY_TYPE_0500
     * @tc.name      testAwaitedUtilityType0005
     * @tc.desc      Any occurrence of Awaited type is recursively removed until a generic, a function,
     *               an array, or a tuple type is detected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAwaitedUtilityType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: o_5 = ENM_22.Red;
      expect(i).assertEqual(ENM_22.Red);
    })
  });
}