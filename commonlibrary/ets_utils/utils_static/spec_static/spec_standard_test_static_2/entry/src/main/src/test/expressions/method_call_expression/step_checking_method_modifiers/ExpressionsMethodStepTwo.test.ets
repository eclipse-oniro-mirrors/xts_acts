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

class A_fixed_array_support_0 {
  static met<T>(): FixedArray<string> {
    let res: FixedArray<string> = ["a"]
    return res
  }
}

class A_fixed_array_support_1<T> {
  met(): FixedArray<string> {
    let res: FixedArray<string> = ["a"]
    return res
  }
}

class A_fixed_array_support_2<T> {
  met(x: FixedArray<T>): T {
    return x[0]
  }
}

class A_fixed_array_support_3 {
  met<T>(x: FixedArray<T>): T {
    return x[0]
  }
}

class A_step3a_0 {
  static met(): string {
    return "S"
  }
}

class A_step3a_1 {
  static met(): string {
    return "S"
  }
}
type TA_step3a_1 = A_step3a_1

class A_step3b_0 {
  met(): string {
    return "A"
  }
}
function cr_step3b_0(): A_step3b_0 {
  return new A_step3b_0()
}

interface I_step3b_1 {
  met(): string {
    return "I"
  }
}
class A_step3b_1 implements I_step3b_1 {}
function cr_step3b_1(): I_step3b_1 {
  return new A_step3b_1()
}

interface I_step3c_0 {
  met(): string {
    return "I"
  }
}
class A_step3c_0 implements I_step3c_0 {
  met(): string {
    return "A"
  }
}
class B_step3c_0 extends A_step3c_0 {
  override met(): string {
    return "B" + super.met()
  }
}

interface I_step3c_1 {
  met(): string
}
class A_step3c_1 implements I_step3c_1 {
  override met(): string {
    return "A"
  }
}
class B_step3c_1 extends A_step3c_1 {
  override met(): string {
    return "B" + super.met()
  }
}

export default function ExpressionsMethodStepTwoTest(): void {
  describe("ExpressionsMethodStepTwoTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_TWO_0100
     * @tc.name      testExpressionsMethodStepTwo0001
     * @tc.desc      If the method call has the form typeReference.identifier, then the method must
     *               be declared static; a compile-time error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_fixed_array_support_0.met<string>()[0]).assertEqual("a")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_TWO_0200
     * @tc.name      testExpressionsMethodStepTwo0002
     * @tc.desc      If the method call has the form typeReference.identifier, then the method must
     *               be declared static; a compile-time error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_fixed_array_support_1<string> = new A_fixed_array_support_1<string>()
      expect(a.met()[0]).assertEqual("a")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_TWO_0300
     * @tc.name      testExpressionsMethodStepTwo0003
     * @tc.desc      If the method call has the form typeReference.identifier, then the method must
     *               be declared static; a compile-time error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<string> = ["a"]
      let a: A_fixed_array_support_2<string> = new A_fixed_array_support_2<string>()
      expect(a.met(x)).assertEqual("a")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_TWO_0400
     * @tc.name      testExpressionsMethodStepTwo0004
     * @tc.desc      If the method call has the form typeReference.identifier, then the method must
     *               be declared static; a compile-time error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<string> = ["a"]
      let a: A_fixed_array_support_3 = new A_fixed_array_support_3()
      expect(a.met<string>(x)).assertEqual("a")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_TWO_0500
     * @tc.name      testExpressionsMethodStepTwo0005
     * @tc.desc      Method call: typeReference.identifier The method must be declared static. Otherwise,
     *               a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_step3a_0.met() == "S").assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_TWO_0600
     * @tc.name      testExpressionsMethodStepTwo0006
     * @tc.desc      Method call: typeReference.identifier The method must be declared static. Otherwise,
     *               a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TA_step3a_1.met() == "S").assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_TWO_0700
     * @tc.name      testExpressionsMethodStepTwo0007
     * @tc.desc      Method call: expression.identifier The method must not be declared static.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(cr_step3b_0().met()).assertEqual("A")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_TWO_0800
     * @tc.name      testExpressionsMethodStepTwo0008
     * @tc.desc      Method call: expression.identifier The method must not be declared static.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(cr_step3b_1().met()).assertEqual("I")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_TWO_0900
     * @tc.name      testExpressionsMethodStepTwo0009
     * @tc.desc      Method call: super.identifier The method must not be declared abstract or static.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I_step3c_0 = new B_step3c_0()
      expect(i.met()).assertEqual("BA")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_TWO_1000
     * @tc.name      testExpressionsMethodStepTwo0010
     * @tc.desc      Method call: super.identifier The method must not be declared abstract or static.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_step3c_1 = new B_step3c_1()
      expect(a.met()).assertEqual("BA")
    })
  })
}