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

function bar(a: A_this_primary_expression_in_class): A_this_primary_expression_in_class {
  return a;
}

// 以下是从 this_access_private_field.js 到 this_with_nullable_type.js 中复用的全局定义
// 类型定义
type func_this_in_lambda = () => int
type func_this_primary_expression_in_lambda = (a: A_this_primary_expression_in_lambda) => int

// 接口定义
interface Container_this_generic_interface<T> {
  data: T
  getData(): T
  setData(val: T): void
  getSelf(): Container_this_generic_interface<T>
}

interface A_this_in_interface_method {
  bar(): int
  foo(): int
}

interface aClass_this_in_object_literal {
  x: int
  method(): int
  field: () => int
}

interface A_this_interface_field_access {
  x: int
  getX(): int
  setX(value: int): void
}

interface A_this_interface_method_call {
  helper(): int
  compute(): int
}

interface anInterface_this_type_in_class {
  method(): aClass_this_type_in_class
}

interface anInterface_this_type_in_interface {
  x: int
  method(): anInterface_this_type_in_interface
}

interface Fluent_this_return_type_interface {
  x: int
  setValue(val: int): Fluent_this_return_type_interface
  getSelf(): Fluent_this_return_type_interface
}


class A_this_access_private_field {
  private x: int
  public setX(value: int): void {
    this.x = value
  }
  public getX(): int {
    return this.x
  }
}

class A_this_field_access_from_method {
  public x: int
  public y: int
  public foo(): void {
    this.x = 10
    this.y = this.x + 5
  }
}

class A_this_generic_class<T> {
  private value: T
  constructor(val: T) {
    this.value = val
  }
  public getValue(): T {
    return this.value
  }
  public setValue(val: T): void {
    this.value = val
  }
  public getSelf(): A_this_generic_class<T> {
    return this
  }
}

class IntContainer_this_generic_interface implements Container_this_generic_interface<int> {
  public data: int = 0
  getData(): int {
    return this.data
  }
  setData(val: int): void {
    this.data = val
  }
  getSelf(): Container_this_generic_interface<int> {
    return this
  }
}

class StringContainer_this_generic_interface implements Container_this_generic_interface<string> {
  public data: string = ""
  getData(): string {
    return this.data
  }
  setData(val: string): void {
    this.data = val
  }
  getSelf(): Container_this_generic_interface<string> {
    return this
  }
}

class Builder_this_generic_method_chain<T> {
  private value: T
  public setValue(val: T): Builder_this_generic_method_chain<T> {
    this.value = val
    return this
  }
  public process(): Builder_this_generic_method_chain<T> {
    return this
  }
  public build(): T {
    return this.value
  }
}

class A_this_in_class_method {
  public x: int
  public foo(x: int): void {
    this.x = x
  }
}

class A_this_in_explicit_constructor_call {
  x: int
  y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  constructor(x: int) {
    this(x, 0)
  }
  constructor() {
    this(0)
  }
}

class B_this_in_interface_method implements A_this_in_interface_method {
  bar(): int {
    return 5
  }
  foo(): int {
    let x = this.bar()
    return x
  }
}

class A_this_in_lambda {
  public y = 6
  bar: func_this_in_lambda = (): int => { return this.y }
}

class AImpl_this_interface_field_access implements A_this_interface_field_access {
  public x: int = 0
  getX(): int {
    return this.x
  }
  setX(value: int): void {
    this.x = value
  }
}

class AImpl_this_interface_method_call implements A_this_interface_method_call {
  helper(): int {
    return 11
  }
  compute(): int {
    let value = this.helper()
    return value * 2
  }
}

class A_this_lambda_same_value {
  x: int = 0
  method(): void {
    let lambda = (): void => {
      this.x = 10
    }
    lambda()
  }
  getX(): int {
    return this.x
  }
}

class A_this_method_call_from_method {
  public x: int
  public getValue(): int {
    return this.x
  }
  public foo(value: int): int {
    this.x = value
    let result = this.getValue()
    return result
  }
}

class A_this_nested_method_calls {
  private x: int
  constructor(x: int) {
    this.x = x
  }
  public calculate(): int {
    return this.getValue() + this.getDouble()
  }
  public getValue(): int {
    return this.x
  }
  public getDouble(): int {
    return this.getValue() * 2
  }
}

class A_this_primary_expression_in_class {
  public x: int
  public foo(): A_this_primary_expression_in_class {
    return bar(this)
  }
}

class A_this_primary_expression_in_lambda {
  public x = 1
  public foo(): int {
    let bar: func_this_primary_expression_in_lambda = (a: A_this_primary_expression_in_lambda): int => { return this.x }
    return bar(this)
  }
}

class A_this_return_type_class {
  public x: int
  public setValue(val: int): A_this_return_type_class {
    this.x = val
    return this
  }
  public getSelf(): A_this_return_type_class {
    return this
  }
}

class FluentImpl_this_return_type_interface implements Fluent_this_return_type_interface {
  public x: int = 0
  setValue(val: int): Fluent_this_return_type_interface {
    this.x = val
    return this
  }
  getSelf(): Fluent_this_return_type_interface {
    return this
  }
}

class BaseClass_this_subtyping {
  method(): BaseClass_this_subtyping {
    return this
  }
}

class DerivedClass_this_subtyping extends BaseClass_this_subtyping {
  override method(): BaseClass_this_subtyping {
    return this
  }
}

class aClass_this_type_in_class implements anInterface_this_type_in_class {
  public x: int = 11
  method(): aClass_this_type_in_class {
    return this
  }
}

class ImplClass_this_type_in_interface implements anInterface_this_type_in_interface {
  public x: int = 33
  method(): anInterface_this_type_in_interface {
    return this
  }
}

class A_this_with_nullable_type {
  public x: Int|undefined
  public foo(x: int): void {
    this.x = x
  }
}

export default function ExpressionsThisTest(): void {
  describe("ExpressionsThisTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_0100
     * @tc.name      testExpressionsThis0001
     * @tc.desc      The keyword this can be used to access private fields from within instance
     *               methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_this_access_private_field = new A_this_access_private_field()
      a.setX(11)
      expect(a.getX()).assertEqual(11)

      a.setX(100)
      expect(a.getX()).assertEqual(100)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_0200
     * @tc.name      testExpressionsThis0002
     * @tc.desc      The keyword this can be used to access instance fields from within instance
     *               methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_this_field_access_from_method = new A_this_field_access_from_method()
      a.foo()
      expect(a.x).assertEqual(10)
      expect(a.y).assertEqual(15)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_0300
     * @tc.name      testExpressionsThis0003
     * @tc.desc      The keyword this works correctly in generic class methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_this_generic_class<int> = new A_this_generic_class<int>(11)
      expect(a.getValue()).assertEqual(11)

      a.setValue(100)
      expect(a.getValue()).assertEqual(100)

      let self: A_this_generic_class<int> = a.getSelf()
      expect(self).assertEqual(a)
      expect(self.getValue()).assertEqual(100)

      let strA: A_this_generic_class<string> = new A_this_generic_class<string>("hello")
      expect(strA.getValue()).assertEqual("hello")
      expect(strA.getSelf()).assertEqual(strA)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_0400
     * @tc.name      testExpressionsThis0004
     * @tc.desc      The keyword this works correctly in generic interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intC: IntContainer_this_generic_interface = new IntContainer_this_generic_interface()
      intC.setData(11)
      expect(intC.getData()).assertEqual(11)

      let self: Container_this_generic_interface<int> = intC.getSelf()
      expect(self).assertEqual(intC)

      let strC: StringContainer_this_generic_interface = new StringContainer_this_generic_interface()
      strC.setData("hello")
      expect(strC.getData()).assertEqual("hello")
      expect(strC.getSelf()).assertEqual(strC)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_0500
     * @tc.name      testExpressionsThis0005
     * @tc.desc      The keyword this enables fluent API pattern in generic classes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = new Builder_this_generic_method_chain<string>()
        .setValue("hello")
        .process()
        .build()

      expect(result).assertEqual("hello")

      let numResult: int = new Builder_this_generic_method_chain<int>()
        .setValue(11)
        .process()
        .build()

      expect(numResult).assertEqual(11)

      let builder: Builder_this_generic_method_chain<string> = new Builder_this_generic_method_chain<string>()
        .setValue("test")
        .process()

      expect(builder instanceof Builder_this_generic_method_chain).assertTrue()
      expect(builder.build()).assertEqual("test")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_0600
     * @tc.name      testExpressionsThis0006
     * @tc.desc      The keyword this can only be used as an expression in the body of an instance
     *               method of a class, enum or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A_this_in_class_method()
      a.foo(10)
      expect(a.x).assertEqual(10)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_0700
     * @tc.name      testExpressionsThis0007
     * @tc.desc      The keyword this in a direct call expression this(arguments) can only be used
     *               in an explicit constructor call statement.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A_this_in_explicit_constructor_call = new A_this_in_explicit_constructor_call(10, 20)
      expect(a1.x).assertEqual(10)
      expect(a1.y).assertEqual(20)

      let a2: A_this_in_explicit_constructor_call = new A_this_in_explicit_constructor_call(5)
      expect(a2.x).assertEqual(5)
      expect(a2.y).assertEqual(0)

      let a3: A_this_in_explicit_constructor_call = new A_this_in_explicit_constructor_call()
      expect(a3.x).assertEqual(0)
      expect(a3.y).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_0800
     * @tc.name      testExpressionsThis0008
     * @tc.desc      The keyword this can only be used as an expression in the body of an instance
     *               method of a class, enum or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new B_this_in_interface_method()
      let result = b.foo()
      expect(result).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_0900
     * @tc.name      testExpressionsThis0009
     * @tc.desc      It may be used in a lambda expression only if it is allowed in the context
     *               in which the lambda expression appears.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_this_in_lambda = new A_this_in_lambda()
      expect(instance.bar()).assertEqual(6)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_1000
     * @tc.name      testExpressionsThis0010
     * @tc.desc      The keyword this can access interface fields from within interface methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: AImpl_this_interface_field_access = new AImpl_this_interface_field_access()
      expect(a.getX()).assertEqual(0)

      a.setX(11)
      expect(a.getX()).assertEqual(11)
      expect(a.x).assertEqual(11)

      a.setX(100)
      expect(a.getX()).assertEqual(100)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_1100
     * @tc.name      testExpressionsThis0011
     * @tc.desc      The keyword this can call interface methods from within another interface
     *               method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: AImpl_this_interface_method_call = new AImpl_this_interface_method_call()
      expect(a.helper()).assertEqual(11)
      expect(a.compute()).assertEqual(22)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_1200
     * @tc.name      testExpressionsThis0012
     * @tc.desc      The parameter this in a lambda body and in the surrounding context denote
     *               the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_this_lambda_same_value = new A_this_lambda_same_value()
      expect(a.getX()).assertEqual(0)

      a.method()
      expect(a.getX()).assertEqual(10)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_1300
     * @tc.name      testExpressionsThis0013
     * @tc.desc      The keyword this can be used to access instance methods from within another
     *               instance method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_this_method_call_from_method = new A_this_method_call_from_method()
      let result: int = a.foo(11)
      expect(result).assertEqual(11)
      expect(a.getValue()).assertEqual(11)

      result = a.foo(100)
      expect(result).assertEqual(100)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_1400
     * @tc.name      testExpressionsThis0014
     * @tc.desc      The keyword this can be used in nested method calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_this_nested_method_calls = new A_this_nested_method_calls(10)
      expect(a.getValue()).assertEqual(10)
      expect(a.getDouble()).assertEqual(20)
      expect(a.calculate()).assertEqual(30)  // 10 + 20

      let a2: A_this_nested_method_calls = new A_this_nested_method_calls(5)
      expect(a2.calculate()).assertEqual(15)  // 5 + 10
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_1500
     * @tc.name      testExpressionsThis0015
     * @tc.desc      The keyword this used as a primary expression denotes a value that is a reference
     *               to the object for which the instance method was called or to the object being constructed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A_this_primary_expression_in_class()
      a.x = 10
      let result = a.foo()
      expect(result).assertEqual(a)
      expect(result.x).assertEqual(10)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_1600
     * @tc.name      testExpressionsThis0016
     * @tc.desc      The value denoted by this in a lambda body and in the surrounding context
     *               is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_this_primary_expression_in_lambda = new A_this_primary_expression_in_lambda()
      expect(instance.foo()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_1700
     * @tc.name      testExpressionsThis0017
     * @tc.desc      The keyword this should return the class type when used in a class method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_this_return_type_class = new A_this_return_type_class()
      let result: A_this_return_type_class = a.setValue(15)
      expect(result).assertEqual(a)
      expect(result.x).assertEqual(15)

      let self: A_this_return_type_class = a.getSelf()
      expect(self).assertEqual(a)

      // Test method chaining
      let chained: A_this_return_type_class = a.setValue(10).setValue(20).getSelf()
      expect(chained).assertEqual(a)
      expect(chained.x).assertEqual(20)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_1800
     * @tc.name      testExpressionsThis0018
     * @tc.desc      The keyword this should return the interface type when used in an interface
     *               method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: FluentImpl_this_return_type_interface = new FluentImpl_this_return_type_interface()
      let result: Fluent_this_return_type_interface = f.setValue(11)
      expect(result).assertEqual(f)
      expect(f.x).assertEqual(11)

      let self: Fluent_this_return_type_interface = f.getSelf()
      expect(self).assertEqual(f)

      // Test method chaining
      let chained: Fluent_this_return_type_interface = f.setValue(10).setValue(20).getSelf()
      expect(chained).assertEqual(f)
      expect(f.x).assertEqual(20)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_1900
     * @tc.name      testExpressionsThis0019
     * @tc.desc      The class of the actual object referred to at runtime can be T if T is a class
     *               type, or a subclass of T.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: BaseClass_this_subtyping = new BaseClass_this_subtyping()
      let baseResult: BaseClass_this_subtyping = base.method()
      expect(baseResult).assertEqual(base)
      expect(baseResult instanceof BaseClass_this_subtyping).assertTrue()

      let derived: DerivedClass_this_subtyping = new DerivedClass_this_subtyping()
      let derivedResult: BaseClass_this_subtyping = derived.method()
      expect(derivedResult).assertEqual(derived)
      expect(derivedResult instanceof DerivedClass_this_subtyping).assertTrue()
      expect(derivedResult instanceof BaseClass_this_subtyping).assertTrue()

      // Polymorphism test: call method through base reference
      let polyBase: BaseClass_this_subtyping = new DerivedClass_this_subtyping()
      let polyResult: BaseClass_this_subtyping = polyBase.method()
      expect(polyResult).assertEqual(polyBase)
      expect(polyResult instanceof DerivedClass_this_subtyping).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_2000
     * @tc.name      testExpressionsThis0020
     * @tc.desc      A corresponding class type is the type of this expression when used in class
     *               method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: aClass_this_type_in_class = new aClass_this_type_in_class()
      let result: aClass_this_type_in_class = instance.method()

      expect(result.x).assertEqual(11)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_2100
     * @tc.name      testExpressionsThis0021
     * @tc.desc      A corresponding interface type is the type of this expression when used in
     *               interface method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: ImplClass_this_type_in_interface = new ImplClass_this_type_in_interface()
      let result: anInterface_this_type_in_interface = instance.method()

      expect(result.x).assertEqual(33)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_THIS_TEST_2200
     * @tc.name      testExpressionsThis0022
     * @tc.desc      "Any lexically enclosing instance (§??and §??) can be referred to by\
     *               \ explicitly qualifying the keyword this."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsThis0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A_this_with_nullable_type()
      a.foo(10)
      expect(a.x).assertEqual(10)
    })
  })
}