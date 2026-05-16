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

interface IName_access_by_super_in_field_nn {
  name: String
}

class A_access_by_super_from_method {
  private _x: int
  get x(): int {
    return this._x
  }
}

final class B_access_by_super_from_method extends A_access_by_super_from_method {
  public bar(): int {
    return super.x
  }
}

class A_access_by_super_from_method_1 {
  private _x: int
  get x(): int {
    return this._x
  }
}

final class B_access_by_super_from_method_1 extends A_access_by_super_from_method_1 {
  private foo(): int {
    return super.x
  }
  public bar(): int {
    return this.foo()
  }
}

class A_access_by_super_from_method_2 {
  private _x: int
  protected get x(): int {
    return this._x
  }
  protected set x(p: int) {
    this._x = p
  }
}

class B_access_by_super_from_method_2 extends A_access_by_super_from_method_2 {
  constructor() {
    super()
    super.x = 7
  }
  public bar(): int {
    return this.x
  }
}

class A_access_by_super_in_constructor {
  public x: int
  public constructor(x: int) {
    this.x = x
  }
}

class B_access_by_super_in_constructor extends A_access_by_super_in_constructor {
  public constructor() {
    super(5)
  }
}

class A_access_by_super_in_constructor_1 {
  public x: int
  protected constructor(x: int) {
    this.x = x
  }
}

class B_access_by_super_in_constructor_1 extends A_access_by_super_in_constructor_1 {
  public constructor() {
    super(5)
  }
}

class A_access_by_super_in_field {
  private readonly _x: int = 5
  get x(): int {
    return this._x
  }
}

class B_access_by_super_in_field extends A_access_by_super_in_field {
  public y: int = super.x
}

class A_access_by_super_in_field_1 {
  private _x: int = 5
  protected get x(): int {
    return this._x
  }
}

class B_access_by_super_in_field_1 extends A_access_by_super_in_field_1 {
  private y: int = super.x
  foo(): int {
    return this.y
  }
}

class A_access_by_super_in_field_2 {
  private _x: int = 5
  protected get x(): int {
    return this._x
  }
}

class B_access_by_super_in_field_2 extends A_access_by_super_in_field_2 {
  protected readonly y: int = super.x
  foo(): int {
    return this.y
  }
}

class A_access_by_super_in_field_3 {
  private _x: String = new String("some text")
  protected get x(): String {
    return this._x
  }
}

class B_access_by_super_in_field_3 extends A_access_by_super_in_field_3 {
  protected readonly y: String = super.x
  foo(): String {
    return this.y
  }
}

class A_access_by_super_in_field_nn_0 {
  private _a: byte = 2
  get a(): byte {
    return this._a
  }
}

class B_access_by_super_in_field_nn_0 extends A_access_by_super_in_field_nn_0 {
}

final class C_access_by_super_in_field_nn_0 extends B_access_by_super_in_field_nn_0 {
  b: byte = super.a
}

class A_access_by_super_in_field_nn_1 {
  private _a: short = 2
  get a(): short {
    return this._a
  }
}

class B_access_by_super_in_field_nn_1 extends A_access_by_super_in_field_nn_1 {
}

final class C_access_by_super_in_field_nn_1 extends B_access_by_super_in_field_nn_1 {
  b: short = super.a
}

class A_access_by_super_in_field_nn_2 {
  private _a: long = 2
  get a(): long {
    return this._a
  }
}

class B_access_by_super_in_field_nn_2 extends A_access_by_super_in_field_nn_2 {
}

final class C_access_by_super_in_field_nn_2 extends B_access_by_super_in_field_nn_2 {
  b: long = super.a
}

class A_access_by_super_in_field_nn_3 {
  private _a: float = 1.2f
  get a(): float {
    return this._a
  }
}

class B_access_by_super_in_field_nn_3 extends A_access_by_super_in_field_nn_3 {
}

final class C_access_by_super_in_field_nn_3 extends B_access_by_super_in_field_nn_3 {
  b: float = super.a
}

class A_access_by_super_in_field_nn_4 {
  private _a: double = 2
  get a(): double {
    return this._a
  }
}

class B_access_by_super_in_field_nn_4 extends A_access_by_super_in_field_nn_4 {
}

final class C_access_by_super_in_field_nn_4 extends B_access_by_super_in_field_nn_4 {
  b: double = super.a
}

class A_access_by_super_in_field_nn_5 {
  private _a: number = 2
  get a(): number {
    return this._a
  }
}

class B_access_by_super_in_field_nn_5 extends A_access_by_super_in_field_nn_5 {
}

final class C_access_by_super_in_field_nn_5 extends B_access_by_super_in_field_nn_5 {
  b: number = super.a
}

class A_access_by_super_in_field_nn_6 {
  private _a: bigint = new BigInt(Long.MAX_VALUE * 2)
  get a(): bigint {
    return this._a
  }
}

class B_access_by_super_in_field_nn_6 extends A_access_by_super_in_field_nn_6 {
}

final class C_access_by_super_in_field_nn_6 extends B_access_by_super_in_field_nn_6 {
  b: bigint = super.a
}

class A_access_by_super_in_field_nn_7 {
  private _a: char = c'a'
  get a(): char {
    return this._a
  }
}

class B_access_by_super_in_field_nn_7 extends A_access_by_super_in_field_nn_7 {
}

final class C_access_by_super_in_field_nn_7 extends B_access_by_super_in_field_nn_7 {
  b: char = super.a
}

class A_access_by_super_in_field_nn_8 {
  private _a: boolean = true
  get a(): boolean {
    return this._a
  }
}

class B_access_by_super_in_field_nn_8 extends A_access_by_super_in_field_nn_8 {
}

final class C_access_by_super_in_field_nn_8 extends B_access_by_super_in_field_nn_8 {
  b: boolean = super.a
}

class A_access_by_super_in_field_nn_9 {
  private _a: string = "some string"
  get a(): string {
    return this._a
  }
}

class B_access_by_super_in_field_nn_9 extends A_access_by_super_in_field_nn_9 {
}

final class C_access_by_super_in_field_nn_9 extends B_access_by_super_in_field_nn_9 {
  b: string = super.a
}

class A_access_by_super_in_field_nn_10 {
  private _a: Byte = new Byte(2 as byte)
  get a(): Byte {
    return this._a
  }
}

class B_access_by_super_in_field_nn_10 extends A_access_by_super_in_field_nn_10 {
}

final class C_access_by_super_in_field_nn_10 extends B_access_by_super_in_field_nn_10 {
  b: Byte = super.a
}

class A_access_by_super_in_field_nn_11 {
  private _a: Short = new Short(2 as short)
  get a(): Short {
    return this._a
  }
}

class B_access_by_super_in_field_nn_11 extends A_access_by_super_in_field_nn_11 {
}

final class C_access_by_super_in_field_nn_11 extends B_access_by_super_in_field_nn_11 {
  b: Short = super.a
}

class A_access_by_super_in_field_nn_12 {
  private _a: Int = new Int(2)
  get a(): Int {
    return this._a
  }
}

class B_access_by_super_in_field_nn_12 extends A_access_by_super_in_field_nn_12 {
}

final class C_access_by_super_in_field_nn_12 extends B_access_by_super_in_field_nn_12 {
  b: Int = super.a
}

class A_access_by_super_in_field_nn_13 {
  private _a: Long = new Long(2 as long)
  get a(): Long {
    return this._a
  }
}

class B_access_by_super_in_field_nn_13 extends A_access_by_super_in_field_nn_13 {
}

final class C_access_by_super_in_field_nn_13 extends B_access_by_super_in_field_nn_13 {
  b: Long = super.a
}

class A_access_by_super_in_field_nn_14 {
  private _a: Float = new Float(1.2)
  get a(): Float {
    return this._a
  }
}

class B_access_by_super_in_field_nn_14 extends A_access_by_super_in_field_nn_14 {
}

final class C_access_by_super_in_field_nn_14 extends B_access_by_super_in_field_nn_14 {
  b: Float = super.a
}

class A_access_by_super_in_field_nn_15 {
  private _a: Double = new Double(1.2)
  get a(): Double {
    return this._a
  }
}

class B_access_by_super_in_field_nn_15 extends A_access_by_super_in_field_nn_15 {
}

final class C_access_by_super_in_field_nn_15 extends B_access_by_super_in_field_nn_15 {
  b: Double = super.a
}

class A_access_by_super_in_field_nn_16 {
  private _a: Char = new Char(c'a')
  get a(): Char {
    return this._a
  }
}

class B_access_by_super_in_field_nn_16 extends A_access_by_super_in_field_nn_16 {
}

final class C_access_by_super_in_field_nn_16 extends B_access_by_super_in_field_nn_16 {
  b: Char = super.a
}

class A_access_by_super_in_field_nn_17 {
  private _a: Boolean = new Boolean(true)
  get a(): Boolean {
    return this._a
  }
}

class B_access_by_super_in_field_nn_17 extends A_access_by_super_in_field_nn_17 {
}

final class C_access_by_super_in_field_nn_17 extends B_access_by_super_in_field_nn_17 {
  b: Boolean = super.a
}

class A_access_by_super_in_field_nn_18 {
  private _a: String = new String("some string")
  get a(): String {
    return this._a
  }
}

class B_access_by_super_in_field_nn_18 extends A_access_by_super_in_field_nn_18 {
}

final class C_access_by_super_in_field_nn_18 extends B_access_by_super_in_field_nn_18 {
  b: String = super.a
}

class A_access_by_super_in_field_nn_19 {
  private _a: IName_access_by_super_in_field_nn = { name: "Bob" }
  get a(): IName_access_by_super_in_field_nn {
    return this._a
  }
}

class B_access_by_super_in_field_nn_19 extends A_access_by_super_in_field_nn_19 {
}

final class C_access_by_super_in_field_nn_19 extends B_access_by_super_in_field_nn_19 {
  b: IName_access_by_super_in_field_nn = super.a
}

class A_access_by_super_of_generic {
  private _x: int = 1
  get x(): int {
    return this._x
  }
}

class B_access_by_super_of_generic extends A_access_by_super_of_generic {
  public y: int
}

final class C_access_by_super_of_generic<T> extends A_access_by_super_of_generic {
  public bar(): int {
    return super.x
  }
}

class AAA_access_super_property_0 {
  private readonly _x: int = 5
  get x(): int {
    Counter_access_super_property_0.cc++
    return this._x
  }
}

final class BBB_access_super_property_0 extends AAA_access_super_property_0 {
  override get x(): int {
    Counter_access_super_property_0.cc++
    return super.x
  }
}

final class Counter_access_super_property_0 {
  static cc: int = 0
}

final class Counter_access_super_property_1 {
  static cc: int = 0
}

class AAA_access_super_property_1 {
  private readonly _x: int = 5
  get x(): int {
    Counter_access_super_property_1.cc++
    return this._x
  }
}

final class BBB_access_super_property_1 extends AAA_access_super_property_1 {
  override get x(): int {
    Counter_access_super_property_1.cc++
    return super.x
  }
}

class Zero_accessing_by_super_indirect_0 {
  private readonly _x: int = 5
  final get x(): int {
    return this._x
  }
}

class One_accessing_by_super_indirect_0 extends Zero_accessing_by_super_indirect_0 {
}

final class Two_accessing_by_super_indirect_0 extends One_accessing_by_super_indirect_0 {
  public y: int = super.x
}

export default function ExpressionsSuperClassTestSuite() {
  describe("ExpressionsSuperClassTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_0100
     * @tc.name      testExpressionsSuperClass0001
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_access_by_super_from_method = new B_access_by_super_from_method()
      expect(instance.bar()).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_0200
     * @tc.name      testExpressionsSuperClass0002
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_access_by_super_from_method_1 = new B_access_by_super_from_method_1()
      expect(instance.bar()).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_0300
     * @tc.name      testExpressionsSuperClass0003
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_access_by_super_from_method_2 = new B_access_by_super_from_method_2()
      expect(instance.bar()).assertEqual(7)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_0400
     * @tc.name      testExpressionsSuperClass0004
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_access_by_super_in_constructor = new B_access_by_super_in_constructor()
      expect(instance.x).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_0500
     * @tc.name      testExpressionsSuperClass0005
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_access_by_super_in_constructor_1 = new B_access_by_super_in_constructor_1()
      expect(instance.x).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_0600
     * @tc.name      testExpressionsSuperClass0006
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_access_by_super_in_field = new B_access_by_super_in_field()
      expect(instance.y).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_0700
     * @tc.name      testExpressionsSuperClass0007
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_access_by_super_in_field_1 = new B_access_by_super_in_field_1()
      expect(instance.foo()).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_0800
     * @tc.name      testExpressionsSuperClass0008
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_access_by_super_in_field_2 = new B_access_by_super_in_field_2()
      expect(instance.foo()).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_0900
     * @tc.name      testExpressionsSuperClass0009
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_access_by_super_in_field_3 = new B_access_by_super_in_field_3()
      expect(instance.foo()).assertEqual("some text")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_1000
     * @tc.name      testExpressionsSuperClass0010
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_0 = new C_access_by_super_in_field_nn_0()
      expect(instance.b == 2).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_1100
     * @tc.name      testExpressionsSuperClass0011
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_1 = new C_access_by_super_in_field_nn_1()
      expect(instance.b == 2).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_1200
     * @tc.name      testExpressionsSuperClass0012
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_2 = new C_access_by_super_in_field_nn_2()
      expect(instance.b == 2).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_1300
     * @tc.name      testExpressionsSuperClass0013
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_3 = new C_access_by_super_in_field_nn_3()
      expect(instance.b == 1.2f as float).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_1400
     * @tc.name      testExpressionsSuperClass0014
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_4 = new C_access_by_super_in_field_nn_4()
      expect(instance.b == 2).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_1500
     * @tc.name      testExpressionsSuperClass0015
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_5 = new C_access_by_super_in_field_nn_5()
      expect(instance.b == 2).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_1600
     * @tc.name      testExpressionsSuperClass0016
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_6 = new C_access_by_super_in_field_nn_6()
      expect(instance.b == new BigInt(Long.MAX_VALUE * 2)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_1700
     * @tc.name      testExpressionsSuperClass0017
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_7 = new C_access_by_super_in_field_nn_7()
      expect(instance.b == c'a').assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_1800
     * @tc.name      testExpressionsSuperClass0018
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_8 = new C_access_by_super_in_field_nn_8()
      expect(instance.b == true).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_1900
     * @tc.name      testExpressionsSuperClass0019
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_9 = new C_access_by_super_in_field_nn_9()
      expect(instance.b == "some string").assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_2000
     * @tc.name      testExpressionsSuperClass0020
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_10 = new C_access_by_super_in_field_nn_10()
      expect(instance.b == 2).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_2100
     * @tc.name      testExpressionsSuperClass0021
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_11 = new C_access_by_super_in_field_nn_11()
      expect(instance.b == 2).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_2200
     * @tc.name      testExpressionsSuperClass0022
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_12 = new C_access_by_super_in_field_nn_12()
      expect(instance.b == 2).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_2300
     * @tc.name      testExpressionsSuperClass0023
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_13 = new C_access_by_super_in_field_nn_13()
      expect(instance.b == 2).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_2400
     * @tc.name      testExpressionsSuperClass0024
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_14 = new C_access_by_super_in_field_nn_14()
      expect(instance.b == new Float(1.2)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_2500
     * @tc.name      testExpressionsSuperClass0025
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_15 = new C_access_by_super_in_field_nn_15()
      expect(instance.b == 1.2).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_2600
     * @tc.name      testExpressionsSuperClass0026
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_16 = new C_access_by_super_in_field_nn_16()
      expect(instance.b == c'a').assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_2700
     * @tc.name      testExpressionsSuperClass0027
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_17 = new C_access_by_super_in_field_nn_17()
      expect(instance.b == true).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_2800
     * @tc.name      testExpressionsSuperClass0028
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_18 = new C_access_by_super_in_field_nn_18()
      expect(instance.b == "some string").assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_2900
     * @tc.name      testExpressionsSuperClass0029
     * @tc.desc      The result of the field access expression is computed at runtime. For a non-static
     *               field: The object reference expression is evaluated. Only the object reference type
     *               (not the class type of an actual object referred at runtime) is used to determine
     *               the field to be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_in_field_nn_19 = new C_access_by_super_in_field_nn_19()
      expect(instance.b.name == "Bob").assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_3000
     * @tc.name      testExpressionsSuperClass0030
     * @tc.desc      The field access expression super.f is handled in the same way as the expression
     *               this.f in the body of class S.
     *               Assuming that super.f appears within class C, f is accessible in S from class C (see Scopes) while
     *               the direct superclass of the class denoted by T is a class with S as its fully qualified name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: C_access_by_super_of_generic<B_access_by_super_of_generic> = new C_access_by_super_of_generic<B_access_by_super_of_generic>()
      expect(instance.bar()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_3100
     * @tc.name      testExpressionsSuperClass0031
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Counter_access_super_property_0.cc = 0
      let instance = new BBB_access_super_property_0()
      expect(5).assertEqual(instance.x)
      expect(2).assertEqual(Counter_access_super_property_0.cc)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_3200
     * @tc.name      testExpressionsSuperClass0032
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Counter_access_super_property_1.cc = 0
      let instance = new BBB_access_super_property_1()
      expect(5).assertEqual(instance.x)
      expect(2).assertEqual(Counter_access_super_property_1.cc)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_SUPER_CLASS_3300
     * @tc.name      testExpressionsSuperClass0033
     * @tc.desc      The forms using the keyword super are valid in instance methods, constructors
     *               of a class or in the initializer of an instance variable of a class. Compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSuperClass0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Two_accessing_by_super_indirect_0()
      expect(instance.y).assertEqual(5)
    })
  })
}