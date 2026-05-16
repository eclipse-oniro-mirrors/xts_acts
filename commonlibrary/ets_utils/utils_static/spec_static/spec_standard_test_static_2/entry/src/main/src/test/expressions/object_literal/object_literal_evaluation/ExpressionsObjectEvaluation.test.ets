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

class X_class_with_readonly {
    a: number
    b: number
}

class A_ex1 {
    name: string|null = null
    age: number|null = null
}
let a_ex1: A_ex1 = { name: "Alice", age: 4 };
function foo_ex1(): void {
  let t: number[] = [1, 2, 3, 4, 5]
  let a: A_ex1|null = null;
  a = { name: "Bob", age: t[5] } as A_ex1
}
let checkException_ex1 = (e: Error): boolean => { return e instanceof RangeError }

class A_ex2 {
    name: string = ""
    age: number
    getAge(): number {
        return this.age
    }
}
let a_ex2: A_ex2|null = null;
function foo_a_ex2(a: A_ex2|null): number {
    return a!.getAge()
}
function foo_ex2(): void {
  let a: A_ex2|null = null;
  a = { name: "Bob", age: foo_a_ex2(a) } as A_ex2
}
let checkException_ex2 = (e: Error): boolean => { return e instanceof NullPointerError }

interface I_iface_with_readonly {
    a: number
    readonly b: number
}

export default function ExpressionsObjectEvaluationTestSuite(): void {
  describe("ExpressionsObjectEvaluationTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_OBJECT_EVALUATION_0100
     * @tc.name      testExpressionsObjectEvaluation0001
     * @tc.desc      Assignment of the value of expression to the corresponding field of x as its
     *               initial value. This rule also applies to readonly fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectEvaluation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: X_class_with_readonly = { a: 1, b: 2 }
      expect(x.a).assertEqual(1)
      expect(x.b).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_EVALUATION_0200
     * @tc.name      testExpressionsObjectEvaluation0002
     * @tc.desc      The execution of the object literal completes abruptly if so does the execution
     *               of a name-value pair.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectEvaluation0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 先验证原始变量的值
      expect(a_ex1.age).assertEqual(4)
      
      // 测试异常抛出
      let hasException = false
      try {
        foo_ex1()
      } catch (e) {
        hasException = true
        expect(checkException_ex1(e)).assertTrue()
      }
      expect(hasException).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_EVALUATION_0300
     * @tc.name      testExpressionsObjectEvaluation0003
     * @tc.desc      The execution of the object literal completes abruptly if so does the execution
     *               of a name-value pair.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectEvaluation0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 先验证原始变量的值
      expect(a_ex2).assertEqual(null)
      
      // 测试异常抛出
      let hasException = false
      try {
        foo_ex2()
      } catch (e) {
        hasException = true
        expect(checkException_ex2(e)).assertTrue()
      }
      expect(hasException).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_EVALUATION_0400
     * @tc.name      testExpressionsObjectEvaluation0004
     * @tc.desc      Assignment of the value of expression to the corresponding field of x as its
     *               initial value. This rule also applies to readonly fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectEvaluation0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I_iface_with_readonly = { a: 1, b: 2 }
      expect(i.a).assertEqual(1)
      expect(i.b).assertEqual(2)
    });
  });
}