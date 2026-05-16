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

interface I_step1_0 {
  met(): string
}
class A_step1_0 implements I_step1_0 {
  override met(): string {
    return "A"
  }
}
class B_step1_0 extends A_step1_0 {
  override met(): string {
    return "B"
  }
}
class C_step1_0 {
  met(): string {
    return "C"
  }
}

interface I_step1_1 {
  met(): string
}
class A_step1_1 implements I_step1_1 {
  override met(): string {
    return "A"
  }
}
class B_step1_1 extends A_step1_1 {
  override met(): string {
    return "B"
  }
}
class C_step1_1 {
  met(): string {
    return "C"
  }
}
type TA_step1_1 = A_step1_1
type TB_step1_1 = B_step1_1
type TC_step1_1 = C_step1_1

interface I_step1_2 {
  met(): string {
    return "I"
  }
}
class A_step1_2 implements I_step1_2 {
  override met(): string {
    return "A"
  }
}
class B_step1_2 extends A_step1_2 {
  override met(): string {
    return "B" + super.met()
  }
}
class C_step1_2 implements I_step1_2 {}

class Base_step1_3 {
  met(): string {
    return "Base"
  }
}
class A_step1_3 extends Base_step1_3 {}
class B_step1_3 extends A_step1_3 {
  override met(): string {
    return "B" + super.met()
  }
}

interface I_step1_4 {
  met(): string {
    return "I"
  }
}
class A_step1_4 implements I_step1_4 {
  override met(): string {
    return "A"
  }
}
class B_step1_4 extends A_step1_4 {
  override met(): string {
    return "B" + super.met()
  }
}
class C_step1_4 implements I_step1_4 {}
function createA_step1_4(): A_step1_4 {
  return new A_step1_4()
}
function createB_step1_4(): B_step1_4 {
  return new B_step1_4()
}
function createC_step1_4(): C_step1_4 {
  return new C_step1_4()
}

class X_step1_5 {
  met(): string {
    return "X"
  }
}
class Y_step1_5 extends X_step1_5 {}
class Z_step1_5 extends Y_step1_5 {}
class A_step1_5<T extends X_step1_5> {
  fld: T|null = null

  setFld(p: T) {
    this.fld = p
  }

  m(): string {
    return this.fld!.met()
  }
}

class X_step1_6 {
  met(): string {
    return "X"
  }
}
class Y_step1_6 extends X_step1_6 {
  override met(): string {
    return "Y"
  }
}
class Z_step1_6 extends Y_step1_6 {}
class A_step1_6<T extends X_step1_6> {
  fld: T|null = null

  setFld(p: T) {
    this.fld = p
  }

  m(): string {
    return this.fld!.met()
  }
}

interface MH_step1_7 { name(): string }

class A_step1_7 implements MH_step1_7 {
  name(): string {
    return 'I am A'
  }
}

class B_step1_7 implements MH_step1_7 {
  name(): string {
    return 'I am B'
  }
}

class C_step1_7 {
  name(): string {
    return 'I am C'
  }
}

type UT_step1_7 = A_step1_7 | B_step1_7 | C_step1_7

interface MH_step1_8 { name(): string }

final class A_step1_8 implements MH_step1_8 {
  name(): string {
    return 'I am A'
  }
}

final class B_step1_8 implements MH_step1_8 {
  name(): string {
    return 'I am B'
  }
}

final class C_step1_8 {
  name(): string {
    return 'I am not MH'
  }
}

type UT_step1_8 = MH_step1_8 | C_step1_8

export default function ExpressionsMethodStepTestSuite(): void {
  describe("ExpressionsMethodStepTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_0100
     * @tc.name      testExpressionsMethodStep0001
     * @tc.desc      The object reference and the method identifier are used to determine the type
     *               in which to search the method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStep0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // using class type references
      let a: A_step1_0 = new A_step1_0()
      expect(a.met()).assertEqual("A")
      let b: B_step1_0 = new B_step1_0()
      expect(b.met()).assertEqual("B")
      let c: C_step1_0 = new C_step1_0()
      expect(c.met()).assertEqual("C")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_0200
     * @tc.name      testExpressionsMethodStep0002
     * @tc.desc      The object reference and the method identifier are used to determine the type
     *               in which to search the method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStep0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // using type aliases
      let a: TA_step1_1 = new TA_step1_1()
      expect(a.met()).assertEqual("A")
      let b: TB_step1_1 = new TB_step1_1()
      expect(b.met()).assertEqual("B")
      let c: TC_step1_1 = new TC_step1_1()
      expect(c.met()).assertEqual("C")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_0300
     * @tc.name      testExpressionsMethodStep0003
     * @tc.desc      The object reference and the method identifier are used to determine the type
     *               in which to search the method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStep0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // using super for referring immediate superclass
      expect(new A_step1_2().met()).assertEqual("A")
      expect(new B_step1_2().met()).assertEqual("BA")
      expect(new C_step1_2().met()).assertEqual("I")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_0400
     * @tc.name      testExpressionsMethodStep0004
     * @tc.desc      The object reference and the method identifier are used to determine the type
     *               in which to search the method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStep0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // using super for referring 2nd level superclass
      expect(new Base_step1_3().met()).assertEqual("Base")
      expect(new A_step1_3().met()).assertEqual("Base")
      expect(new B_step1_3().met()).assertEqual("BBase")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_0500
     * @tc.name      testExpressionsMethodStep0005
     * @tc.desc      The object reference and the method identifier are used to determine the type
     *               in which to search the method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStep0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // using class type expression
      expect(createA_step1_4().met()).assertEqual("A")
      expect(createB_step1_4().met()).assertEqual("BA")
      expect(createC_step1_4().met()).assertEqual("I")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_0600
     * @tc.name      testExpressionsMethodStep0006
     * @tc.desc      The object reference and the method identifier are used to determine the type
     *               in which to search the method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStep0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A_step1_5<Z_step1_5> = new A_step1_5<Z_step1_5>()
      v.setFld(new Z_step1_5())
      expect(v.m()).assertEqual("X")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_0700
     * @tc.name      testExpressionsMethodStep0007
     * @tc.desc      The object reference and the method identifier are used to determine the type
     *               in which to search the method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStep0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A_step1_6<Z_step1_6> = new A_step1_6<Z_step1_6>()
      v.setFld(new Z_step1_6())
      expect(v.m()).assertEqual("Y")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_0800
     * @tc.name      testExpressionsMethodStep0008
     * @tc.desc      The object reference and the method identifier are used to determine the type
     *               in which to search the method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStep0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let test0: UT_step1_7 = ((): UT_step1_7 => new A_step1_7())()
      expect(((p: UT_step1_7): string => p.name())(test0)).assertEqual('I am A')
      let test1: UT_step1_7 = ((): UT_step1_7 => new B_step1_7())()
      expect(((p: UT_step1_7): string => p.name())(test1)).assertEqual('I am B')
      let test2: UT_step1_7 = ((): UT_step1_7 => new C_step1_7())()
      expect(((p: UT_step1_7): string => p.name())(test2)).assertEqual('I am C')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_0900
     * @tc.name      testExpressionsMethodStep0009
     * @tc.desc      The object reference and the method identifier are used to determine the type
     *               in which to search the method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStep0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let test0: UT_step1_8 = ((): UT_step1_8 => new A_step1_8())()
      expect(((p: UT_step1_8): string => p.name())(test0)).assertEqual('I am A')
      let test1: UT_step1_8 = ((): UT_step1_8 => new B_step1_8())()
      expect(((p: UT_step1_8): string => p.name())(test1)).assertEqual('I am B')
      let test2: UT_step1_8 = ((): UT_step1_8 => new C_step1_8())()
      expect(((p: UT_step1_8): string => p.name())(test2)).assertEqual('I am not MH')
    })
  })
}