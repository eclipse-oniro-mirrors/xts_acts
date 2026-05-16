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

interface I_mcall {
  meth(s: String): String
}

class A_mcall implements I_mcall {
  public override meth(s: String): String {
    return s + "A"
  }
}

class B_mcall extends A_mcall {
  public override meth(s: String): String {
    return super.meth(s) + "B"
  }
}

class C_step2_0 {
  met(p: number): string {
    return "n"
  }
}

class C_step2_1 {
  met(p: Number): string {
    return "N"
  }
}

class C_step2_2 {
  met(...p: number[]): string {
    return "nR"
  }
}

class C_step2_3 {
  met(...p: Number[]): string {
    return "NR"
  }
}

class C_step2_4 {
  met(p: number, q: number = 0.0): string {
    return "nD1"
  }
}

class C_step2_5 {
  met(p: Number, q: number = 0.0): string {
    return "ND1"
  }
}

class C_step2_6 {
  met(p: number, q?: Number): string {
    return "nD2"
  }
}

class C_step2_7 {
  met(p: Number, q?: Number): string {
    return "ND2"
  }
}

class C_step2_8 {
  met(...p: number[]): string {
    return "nR"
  }
  met(p: Number, q: number = 0.0): string {
    return "ND1"
  }
}

class C_step2_9 {
  met(...p: number[]): string {
    return "nR"
  }
  met(p: Number, q?: Number): string {
    return "nR"
  }
}

class C_step2_10 {
  met(p: number, q: number = 0.0): string {
    return "nD1"
  }
  met(...p: Number[]): string {
    return "NR"
  }
}

class C_step2_11 {
  met(p: number, q?: Number): string {
    return "nD2"
  }
  met(...p: Number[]): string {
    return "NR"
  }
}

class C_step2_12 {
  met(p: number): string {
    return 'n'
  }
  met(...p: FixedArray<Number>): string {
    return 'NR'
  }
}

class C_step2_13 {
  met(p: Number): string {
    return 'N'
  }
  met(...p: FixedArray<number>): string {
    return 'nR'
  }
}

class C_step2_14 {
  met(p: number): string {
    return "n"
  }
  met(p: Number, q: number = 0.0): string {
    return "ND1"
  }
}

class C_step2_15 {
  met(p: number): string {
    return "n"
  }
  met(p: number, q: number = 0.0): string {
    return "nD1"
  }
}

class C_step2_16 {
  met(p: Number): string {
    return "N"
  }
  met(p: number, q: number = 0.0): string {
    return "nD1"
  }
}

class C_step2_17 {
  met(p: number): string {
    return "n"
  }
  met(p: Number, q?: Number): string {
    return "ND2"
  }
}

class C_step2_18 {
  overload met { metNumber, metNumberAndOptional }
  metNumber(p: number): string {
    return 'n'
  }
  metNumberAndOptional(p: number, q?: Number): string {
    return 'nD2'
  }
}

class A_step2_19 {
  met(p: boolean): string {
    return "A-" + p
  }
}
class B_step2_19 extends A_step2_19 {
  met(p: Boolean): string {
    return "B-" + p
  }
}
class C_step2_19 extends B_step2_19 {
  override met(p: boolean): string {
    return "C-" + p
  }
}

class C_step2_20 {
  met(p: number): string {
    return "n"
  }
  met(...p: number[]): string {
    return "nR"
  }
  met(p: number, q: number = 0.0): string {
    return "nD1"
  }
}

class C_step2_21 {
  met(p: number): string {
    return "n"
  }
  met(...p: number[]): string {
    return "nR"
  }
  met(p: number, q?: Number): string {
    return "nD2"
  }
}

export default function ExpressionsMethodStepOneTest(): void {
  describe("ExpressionsMethodStepOneTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_0100
     * @tc.name      testExpressionsMethodStepOne0001
     * @tc.desc      After the type to use is known, the method to call must be determined. If a
     *               method name in the call refers an overload declaration (see Overload Declarations),
     *               then Overload Resolution for Overload Declarations is used to select the method
     *               to call. A compile-time error occurs if no method is available to call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_mcall = new A_mcall()
      expect(a.meth("X")).assertEqual("XA")

      a = new B_mcall()
      expect(a.meth("Y")).assertEqual("YAB")

      let i: I_mcall = new A_mcall()
      expect(i.meth("Z")).assertEqual("ZA")

      i = new B_mcall()
      expect(i.meth("W")).assertEqual("WAB")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_0200
     * @tc.name      testExpressionsMethodStepOne0002
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let c: C_step2_0 = new C_step2_0()
      expect(c.met(0.0)).assertEqual("n")
      expect(c.met(new Number())).assertEqual("n")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_0300
     * @tc.name      testExpressionsMethodStepOne0003
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_1 = new C_step2_1()
      expect(c.met(0.0)).assertEqual("N")
      expect(c.met(new Number())).assertEqual("N")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_0400
     * @tc.name      testExpressionsMethodStepOne0004
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_2 = new C_step2_2()
      expect(c.met(0.0)).assertEqual("nR")
      expect(c.met(new Number())).assertEqual("nR")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_0500
     * @tc.name      testExpressionsMethodStepOne0005
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_3 = new C_step2_3()
      expect(c.met(0.0)).assertEqual("NR")
      expect(c.met(new Number())).assertEqual("NR")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_0600
     * @tc.name      testExpressionsMethodStepOne0006
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_4 = new C_step2_4()
      expect(c.met(0.0)).assertEqual("nD1")
      expect(c.met(new Number())).assertEqual("nD1")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_0700
     * @tc.name      testExpressionsMethodStepOne0007
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_5 = new C_step2_5()
      expect(c.met(0.0)).assertEqual("ND1")
      expect(c.met(new Number())).assertEqual("ND1")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_0800
     * @tc.name      testExpressionsMethodStepOne0008
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_6 = new C_step2_6()
      expect(c.met(0.0)).assertEqual("nD2")
      expect(c.met(new Number())).assertEqual("nD2")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_0900
     * @tc.name      testExpressionsMethodStepOne0009
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_7 = new C_step2_7()
      expect(c.met(0.0)).assertEqual("ND2")
      expect(c.met(new Number())).assertEqual("ND2")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_1000
     * @tc.name      testExpressionsMethodStepOne0010
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_8 = new C_step2_8()
      expect(c.met(0.0)).assertEqual("nR")
      expect(c.met(1, 2)).assertEqual("nR")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_1100
     * @tc.name      testExpressionsMethodStepOne0011
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_9 = new C_step2_9()
      expect(c.met(0.0)).assertEqual("nR")
      expect(c.met(2, 3)).assertEqual("nR")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_1200
     * @tc.name      testExpressionsMethodStepOne0012
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_10 = new C_step2_10()
      expect(c.met(0.0)).assertEqual("nD1")
      expect(c.met(3, 4)).assertEqual("nD1")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_1300
     * @tc.name      testExpressionsMethodStepOne0013
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_11 = new C_step2_11()
      expect(c.met(0.0)).assertEqual("nD2")
      expect(c.met(4, 5)).assertEqual("nD2")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_1400
     * @tc.name      testExpressionsMethodStepOne0014
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_12 = new C_step2_12()
      expect(c.met(0.0)).assertEqual('n')
      expect(c.met(new Number(), new Number(), new Number())).assertEqual('NR')
      expect(c.met(1, 2, new Number())).assertEqual('NR')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_1500
     * @tc.name      testExpressionsMethodStepOne0015
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_13 = new C_step2_13()
      expect(c.met(0.0)).assertEqual('N')
      expect(c.met(new Number(), new Number(), new Number())).assertEqual('nR')
      expect(c.met(1, 2, 3)).assertEqual('nR')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_1600
     * @tc.name      testExpressionsMethodStepOne0016
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_14 = new C_step2_14()
      expect(c.met(0.0)).assertEqual("n")
      expect(c.met(new Number())).assertEqual("n")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_1700
     * @tc.name      testExpressionsMethodStepOne0017
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_15 = new C_step2_15()
      expect(c.met(0.0)).assertEqual("n")
      expect(c.met(new Number())).assertEqual("n")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_1800
     * @tc.name      testExpressionsMethodStepOne0018
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_16 = new C_step2_16()
      expect(c.met(0.0)).assertEqual("N")
      expect(c.met(new Number())).assertEqual("N")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_1900
     * @tc.name      testExpressionsMethodStepOne0019
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_17 = new C_step2_17()
      expect(c.met(0.0)).assertEqual("n")
      expect(c.met(new Number())).assertEqual("n")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_2000
     * @tc.name      testExpressionsMethodStepOne0020
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_18 = new C_step2_18()
      expect(c.met(0.0)).assertEqual('n')
      expect(c.met(new Number(), 20.0)).assertEqual('nD2')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_2100
     * @tc.name      testExpressionsMethodStepOne0021
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_step2_19 = new C_step2_19()
      expect(a.met(true)).assertEqual("C-true")

      let b: B_step2_19 = new B_step2_19()
      expect(b.met(false)).assertEqual("B-false")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_2200
     * @tc.name      testExpressionsMethodStepOne0022
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_20 = new C_step2_20()
      expect(c.met(0.0)).assertEqual("n")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_STEP_ONE_2300
     * @tc.name      testExpressionsMethodStepOne0023
     * @tc.desc      As there is more than one applicable method, the most specific method must be
     *               selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodStepOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_step2_21 = new C_step2_21()
      expect(c.met(0.0)).assertEqual("n")
    })
  })
}