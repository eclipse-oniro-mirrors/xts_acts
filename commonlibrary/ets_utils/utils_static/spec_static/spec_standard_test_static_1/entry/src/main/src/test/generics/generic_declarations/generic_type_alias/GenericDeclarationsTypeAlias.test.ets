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

// 3
// 类、接口、类型别名定义
class A_0 {}
class C_0<T> {}
type my_type_0<T> = C_0<T>

class A_1 {}
interface I_1<T> {}
class C_1<T> implements I_1<T> {}
type my_type_1<T> = I_1<T>

class A_2 {}
type my_type_2<T> = (param: T) => boolean

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericDeclarationsTypeAliasTest() {
  describe("GenericDeclarationsTypeAliasTest", () => {
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
     * @tc.number    SUB_GENERIC_DECLARATIONS_TYPE_ALIAS_0100
     * @tc.name      testGenericDeclarationsTypeAlias0001
     * @tc.desc      Declaration generic type alias. Note more thorough coverage for this functionality
     *               is provided in tests for chapter 4.5.1 Type Alias Declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsTypeAlias0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type_0<A_0> = new C_0<A_0>()
      expect(v instanceof C_0).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_TYPE_ALIAS_0200
     * @tc.name      testGenericDeclarationsTypeAlias0002
     * @tc.desc      Declaration generic type alias. Note more thorough coverage for this functionality
     *               is provided in tests for chapter 4.5.1 Type Alias Declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsTypeAlias0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type_1<A_1> = new C_1<A_1>()
      expect(v instanceof C_1).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_TYPE_ALIAS_0300
     * @tc.name      testGenericDeclarationsTypeAlias0003
     * @tc.desc      Declaration generic type alias. Note more thorough coverage for this functionality
     *               is provided in tests for chapter 4.5.1 Type Alias Declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsTypeAlias0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foo: my_type_2<A_2> = (param: A_2) => { return param instanceof A_2 }
      expect(foo(new A_2())).assertTrue()
    })
  });
}