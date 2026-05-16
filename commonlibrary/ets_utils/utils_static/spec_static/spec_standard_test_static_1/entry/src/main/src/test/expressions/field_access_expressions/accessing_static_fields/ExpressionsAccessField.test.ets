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

class A_access_non_static_field {
  a: int = 1
}

class B_access_non_static_field {
  a: int = 2
}

class A_access_non_static_field_2 {
  a: int
}

class A_access_non_static_field_3 {
  a: int
  constructor() {
    this.a = 1
  }
}

class A_access_non_static_field_4 {
  readonly a: int
  constructor() {
    this.a = 1
  }
}

class A_access_non_static_field_5 {
  readonly a: int = 1
}

class A_access_static_field {
  static a: int
  static {
    A_access_static_field.a = 1
  }
}

class A_access_static_field_2 {
  static a: int
  constructor() {
    A_access_static_field_2.a = 1
  }
}

let m_access_static_field_4: int = 0
class A_access_static_field_4 {
  static a: int
  constructor() {
    A_access_static_field_4.a = 1
  }
}

class A_access_static_field_5 {
  static a: int
  a: int
  constructor() {
    A_access_static_field_5.a = 1
    this.a = 2
  }
}

class A_access_static_field_6 {
  static a: int
  static {
    A_access_static_field_6.a = 1
  }
}

class A_access_static_field_7 {
  static a: int
  constructor() {
    A_access_static_field_7.a = 1
  }
}

class A_access_static_field_8 {
  static a: int
  static {
    A_access_static_field_8.a = 2
  }
  constructor() {
    A_access_static_field_8.a = 1
  }
}

class A_access_static_field_nn_0 {
  static a: byte = 2
}

class A_access_static_field_nn_1 {
  static a: short = 2
}

class A_access_static_field_nn_2 {
  static a: long = 2
}

class A_access_static_field_nn_3 {
  static a: float = 1.2f
}

class A_access_static_field_nn_4 {
  static a: double = 2
}

class A_access_static_field_nn_5 {
  static a: char = c'a'
}

class A_access_static_field_nn_6 {
  static a: boolean = true
}

class A_access_static_field_nn_7 {
  static a: string = "some string"
}

class A_access_static_field_nn_8 {
  static a: Byte = new Byte(2 as byte)
}

class A_access_static_field_nn_9 {
  static a: Short = new Short(2 as short)
}

class A_access_static_field_nn_10 {
  static a: Int = new Int(2)
}

class A_access_static_field_nn_11 {
  static a: Long = new Long(2)
}

class A_access_static_field_nn_12 {
  static a: Float = new Float(1.2)
}

class A_access_static_field_nn_13 {
  static a: Double = new Double(1.2)
}

class A_access_static_field_nn_14 {
  static a: Char = new Char(c'a')
}

class A_access_static_field_nn_15 {
  static a: Boolean = new Boolean(true)
}

class A_access_static_field_nn_16 {
  static a: String = new String("some string")
}

export default function ExpressionsAccessFieldTest() {
  describe("ExpressionsAccessFieldTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_0100
     * @tc.name      testExpressionsAccessField0001
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_access_non_static_field = new A_access_non_static_field()
      let ii: B_access_non_static_field = new B_access_non_static_field()
      expect(i.a).assertEqual(1)
      expect(ii.a).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_0200
     * @tc.name      testExpressionsAccessField0002
     * @tc.desc      The result of the field access expression is value or variable of the instance
     *               field in the class or interface that is the type of the object reference expression.
     *               If the field is not readonly, then the result is variable, and its value can be
     *               changed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_access_non_static_field_2 = new A_access_non_static_field_2()
      i.a = 2
      expect(i.a).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_0300
     * @tc.name      testExpressionsAccessField0003
     * @tc.desc      The result of the field access expression is value or variable of the instance
     *               field in the class or interface that is the type of the object reference expression.
     *               If the field is not readonly, then the result is variable, and its value can be
     *               changed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_access_non_static_field_3 = new A_access_non_static_field_3()
      i.a = 2
      expect(i.a).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_0400
     * @tc.name      testExpressionsAccessField0004
     * @tc.desc      The result of the field access expression is value or variable of the instance
     *               field in the class or interface that is the type of the object reference expression.
     *               If the field is readonly, then the result is value (except where the field access
     *               occurs in a constructor).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_access_non_static_field_4 = new A_access_non_static_field_4()
      expect(i.a * 2).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_0500
     * @tc.name      testExpressionsAccessField0005
     * @tc.desc      The result of the field access expression is value or variable of the instance
     *               field in the class or interface that is the type of the object reference expression.
     *               If the field is readonly, then the result is value (except where the field access
     *               occurs in a constructor).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_access_non_static_field_5 = new A_access_non_static_field_5()
      expect(i.a * 2).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_0600
     * @tc.name      testExpressionsAccessField0006
     * @tc.desc      The result of the field access expression is computed at runtime. For a static
     *               field: the result of an object reference expression evaluation is discarded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A_access_static_field()
      expect(A_access_static_field.a).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_0700
     * @tc.name      testExpressionsAccessField0007
     * @tc.desc      The result of the field access expression is computed at runtime. For a static
     *               field: the result of an object reference expression evaluation is discarded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_access_static_field.a).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_0800
     * @tc.name      testExpressionsAccessField0008
     * @tc.desc      The result of the field access expression is computed at runtime. For a static
     *               field: the result of an object reference expression evaluation is discarded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A_access_static_field_2()
      expect(A_access_static_field_2.a).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_0900
     * @tc.name      testExpressionsAccessField0009
     * @tc.desc      The result of the field access expression is computed at runtime. For a static
     *               field: the result of an object reference expression evaluation is discarded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_access_static_field_2.a).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_1000
     * @tc.name      testExpressionsAccessField0010
     * @tc.desc      The result of the field access expression is value or variable of the static
     *               field in the class or interface that is the type of the object reference expression:
     *               For a static field: the result of an object reference expression evaluation is discarded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      if (m_access_static_field_4 === 0) {
        expect(A_access_static_field_4.a === 0).assertTrue()
        m_access_static_field_4++
      }
      new A_access_static_field_4()
      expect(A_access_static_field_4.a).assertEqual(1)
      expect(m_access_static_field_4).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_1100
     * @tc.name      testExpressionsAccessField0011
     * @tc.desc      The result of the field access expression is value or variable of the static
     *               field in the class or interface that is the type of the object reference expression:
     *               For a static field: the result of an object reference expression evaluation is discarded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: A_access_static_field_5 = new A_access_static_field_5()
      expect(A_access_static_field_5.a).assertEqual(1)
      expect(i.a).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_1200
     * @tc.name      testExpressionsAccessField0012
     * @tc.desc      The result of the field access expression is value or variable of the static
     *               field in the class or interface that is the type of the object reference expression.
     *               If the field is not readonly, then the result is variable, and its value can be
     *               changed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A_access_static_field_6()
      A_access_static_field_6.a = 2
      expect(A_access_static_field_6.a).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_1300
     * @tc.name      testExpressionsAccessField0013
     * @tc.desc      The result of the field access expression is value or variable of the static
     *               field in the class or interface that is the type of the object reference expression.
     *               If the field is not readonly, then the result is variable, and its value can be
     *               changed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A_access_static_field_7()
      A_access_static_field_7.a = 2
      expect(A_access_static_field_7.a).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_1400
     * @tc.name      testExpressionsAccessField0014
     * @tc.desc      The result of the field access expression is value or variable of the static
     *               field in the class or interface that is the type of the object reference expression.
     *               If the field is not readonly, then the result is variable, and its value can be
     *               changed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A_access_static_field_8()
      expect(A_access_static_field_8.a).assertEqual(1)
      A_access_static_field_8.a = 3
      expect(A_access_static_field_8.a).assertEqual(3)
      new A_access_static_field_nn_0()
      expect(A_access_static_field_nn_0.a).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_1500
     * @tc.name      testExpressionsAccessField0015
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A_access_static_field_nn_1()
      expect(A_access_static_field_nn_1.a).assertEqual(2)
      new A_access_static_field_nn_2()
      expect(A_access_static_field_nn_2.a).assertEqual(2)
      new A_access_static_field_nn_3()
      expect(A_access_static_field_nn_3.a).assertEqual(1.2f)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_1600
     * @tc.name      testExpressionsAccessField0016
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A_access_static_field_nn_4()
      expect(A_access_static_field_nn_4.a).assertEqual(2)
      new A_access_static_field_nn_5()
      expect(A_access_static_field_nn_5.a).assertEqual(c'a')
      new A_access_static_field_nn_6()
      expect(A_access_static_field_nn_6.a).assertEqual(true)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_1700
     * @tc.name      testExpressionsAccessField0017
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A_access_static_field_nn_7()
      expect(A_access_static_field_nn_7.a).assertEqual("some string")
      new A_access_static_field_nn_8()
      expect(A_access_static_field_nn_8.a).assertEqual(2)
      new A_access_static_field_nn_9()
      expect(A_access_static_field_nn_9.a).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_1800
     * @tc.name      testExpressionsAccessField0018
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A_access_static_field_nn_10()
      expect(A_access_static_field_nn_10.a).assertEqual(2)
      new A_access_static_field_nn_11()
      expect(A_access_static_field_nn_11.a).assertEqual(2)
      new A_access_static_field_nn_12()
      expect(A_access_static_field_nn_12.a).assertEqual(1.2f)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ACCESS_FIELD_1900
     * @tc.name      testExpressionsAccessField0019
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAccessField0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new A_access_static_field_nn_13()
      expect(A_access_static_field_nn_13.a).assertEqual(1.2)
      new A_access_static_field_nn_14()
      expect(A_access_static_field_nn_14.a).assertEqual(c'a')
      new A_access_static_field_nn_15()
      expect(A_access_static_field_nn_15.a).assertEqual(true)
      new A_access_static_field_nn_16()
      expect(A_access_static_field_nn_16.a).assertEqual("some string")
    })
  })
}