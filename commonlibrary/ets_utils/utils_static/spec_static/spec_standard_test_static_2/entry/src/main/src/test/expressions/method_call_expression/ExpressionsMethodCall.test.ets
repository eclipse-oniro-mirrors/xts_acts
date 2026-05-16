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

class A_class_method {
  public foo(x: int): int {
    return x * 2
  }
}

class A_class_static_method {
  public static foo(x: int): int {
    return x * 2
  }
}

interface A_interface_method {
  bar(x: int): int {
    return x * 2
  }
}
class B_interface_method implements A_interface_method {}

class A_safe_method_call_0 {
  public foo(x: int): int {
    return x * 2
  }
}

class A_safe_method_call_1 {
  public foo(x: int): Int {
    return x * 2
  }
}

export default function ExpressionsMethodCallTestSuite(): void {
  describe("ExpressionsMethodCallTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_METHOD_CALL_0100
     * @tc.name      testExpressionsMethodCall0001
     * @tc.desc      A method call expression calls a static or instance method of a class or an
     *               interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodCall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_class_method = new A_class_method()
      expect(instance.foo(3)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_CALL_0200
     * @tc.name      testExpressionsMethodCall0002
     * @tc.desc      A method call expression calls a static or instance method of a class or an
     *               interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodCall0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_class_static_method.foo(3)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_CALL_0300
     * @tc.name      testExpressionsMethodCall0003
     * @tc.desc      A method call expression calls a static or instance method of a class or an
     *               interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodCall0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_interface_method = new B_interface_method()
      expect(instance.bar(3)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_CALL_0400
     * @tc.name      testExpressionsMethodCall0004
     * @tc.desc      A method call with '?.' in objectReference is called a safe method
     *               call because it handles null safely.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodCall0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_safe_method_call_0|null = ((): A_safe_method_call_0|null => { 
        return new A_safe_method_call_0() 
      })()
      expect(instance?.foo(3)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_CALL_0500
     * @tc.name      testExpressionsMethodCall0005
     * @tc.desc      A method call with '?.' in objectReference is called a safe method
     *               call because it handles null safely.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodCall0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_safe_method_call_1|null = ((): A_safe_method_call_1|null => { 
        return null 
      })()
      expect(instance?.foo(3)).assertEqual(undefined)
    })
  })
}