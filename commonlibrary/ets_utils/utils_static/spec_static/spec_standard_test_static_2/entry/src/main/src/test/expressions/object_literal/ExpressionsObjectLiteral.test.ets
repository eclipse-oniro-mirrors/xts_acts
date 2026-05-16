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

class Person_class_composite_as_a_function_parameter {
  age: int
}
let checkVar_class_composite_as_a_function_parameter: int
function foo_class_composite_as_a_function_parameter(person: Person_class_composite_as_a_function_parameter): void {
  checkVar_class_composite_as_a_function_parameter = person.age
}

class Person_class_composite_in_class_composite {
  name: String = ""
  child: Child_class_composite_in_class_composite = {}
}
class Child_class_composite_in_class_composite {
  age: int
}

class Person_class_composite_inside_a_class_method {
  weight: int
  height: int
  static getPerson(): Person_class_composite_inside_a_class_method {
    let person: Person_class_composite_inside_a_class_method = { weight: 10, height: 5 }
    return person
  }
}

class Parent_class_composite_inside_the_class_constructor {
  name: String = ""
}
class Person_class_composite_inside_the_class_constructor {
  parent: Parent_class_composite_inside_the_class_constructor
  constructor(n: String) {
    this.parent = { name: n }
  }
}

class Parent_class_composite_with_inherited_fields {
  name: String = ""
  age: int
}
class Child_class_composite_with_inherited_fields extends Parent_class_composite_with_inherited_fields {
  weight: int
}

let res_execution_of_the_class_left_to_right: int
class Person_execution_of_the_class_left_to_right {
  name: String = ""
  age: int
}
function getName_execution_of_the_class_left_to_right(): String {
  res_execution_of_the_class_left_to_right = 1
  return "Bob"
}
function getAge_execution_of_the_class_left_to_right(): int {
  res_execution_of_the_class_left_to_right = 2
  return 18
}

class Person_internal_field_access {
  name: String = ""
  age: int
}

class Person_protected_field_access_from_derived_class {
  protected name: String = ""
  age: int
  getName(): string {
    return this.name
  }
}
class Child_protected_field_access_from_derived_class extends Person_protected_field_access_from_derived_class {
  static factory(): Child_protected_field_access_from_derived_class {
    let child: Child_protected_field_access_from_derived_class = { name: "Bob", age: 18 }
    return child
  }
}

class Base_spec_ex3 {}
class Derived_spec_ex3 extends Base_spec_ex3 {}
class aClass_spec_ex3 {
  private method(p: Derived_spec_ex3): Base_spec_ex3 {
    return new Base_spec_ex3();
  }
}
interface I_spec_ex3 {
  method(p: Derived_spec_ex3): Base_spec_ex3;
}

class Blue_spec_ex7 {
  name = "blue"
  m(): string {
    return "wrong"
  }
}
class Red_spec_ex7 extends Blue_spec_ex7 {
  name = "red";
  m(): string {
    return this.name;
  }
}

class A_union_inferred { x: double = 1 }
class B_union_inferred { y: double = 1 }
class C_union_inferred {
  a: A_union_inferred = {}
  x: long = 1
}
class D_union_inferred {
  a: A_union_inferred = {}
  y: long = 1
}
class Z_union_inferred {
  z?: number = 1
}
class X_union_inferred {}

export default function ExpressionsObjectLiteralTestSuite(): void {
  describe("ExpressionsObjectLiteralTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_0100
     * @tc.name      testExpressionsObjectLiteral0001
     * @tc.desc      Using a class composite as a function parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      checkVar_class_composite_as_a_function_parameter = 0
      expect(checkVar_class_composite_as_a_function_parameter).assertEqual(0)
      for (let i = 0; i < 20; i++) {
        foo_class_composite_as_a_function_parameter({ age: i })
        expect(checkVar_class_composite_as_a_function_parameter).assertEqual(i)
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_0200
     * @tc.name      testExpressionsObjectLiteral0002
     * @tc.desc      Checking access of a protected field inside a composite class outside the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Person_class_composite_in_class_composite = { name: "Bob", child: { age: 15 } }
      expect(person.child.age).assertEqual(15)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_0300
     * @tc.name      testExpressionsObjectLiteral0003
     * @tc.desc      Using a class composite inside a class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person = Person_class_composite_inside_a_class_method.getPerson()
      let index = person.weight / person.height
      expect(index).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_0400
     * @tc.name      testExpressionsObjectLiteral0004
     * @tc.desc      Using a class composite inside the class constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Person_class_composite_inside_the_class_constructor = new Person_class_composite_inside_the_class_constructor("Bob")
      expect(person.parent.name).assertEqual("Bob")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_0500
     * @tc.name      testExpressionsObjectLiteral0005
     * @tc.desc      Initializing a class with inherited fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: Child_class_composite_with_inherited_fields = { name: "Ben", age: 3, weight: 20 }
      expect(child.weight).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_0600
     * @tc.name      testExpressionsObjectLiteral0006
     * @tc.desc      Name-value pairs of the class composite are then executed from left to right
     *               in the textual order they occur in the source code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res_execution_of_the_class_left_to_right = 0
      let person: Person_execution_of_the_class_left_to_right = { name: getName_execution_of_the_class_left_to_right(), age: getAge_execution_of_the_class_left_to_right() }
      expect(res_execution_of_the_class_left_to_right).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_0700
     * @tc.name      testExpressionsObjectLiteral0007
     * @tc.desc      Checking a internal field in class composite
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Person_internal_field_access = { name: "Ben", age: 3 }
      expect(obj.name).assertEqual("Ben")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_0800
     * @tc.name      testExpressionsObjectLiteral0008
     * @tc.desc      Checking a protected field from a derived class inside a composite class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Child_protected_field_access_from_derived_class = Child_protected_field_access_from_derived_class.factory()
      expect(obj.getName()).assertEqual("Bob")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_0900
     * @tc.name      testExpressionsObjectLiteral0009
     * @tc.desc      A compile-time error occurs if a class has a private or a protected method,
     *               and its object literal contains same-name methods with override-compatible signatures
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x = new aClass_spec_ex3();
      expect(x instanceof aClass_spec_ex3).assertTrue();
      const o: I_spec_ex3 = {
        method(p: Derived_spec_ex3): Base_spec_ex3 {
          return new Base_spec_ex3();
        },
      };
      const result = o.method(new Derived_spec_ex3());
      expect(result instanceof Base_spec_ex3).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_1000
     * @tc.name      testExpressionsObjectLiteral0010
     * @tc.desc      any reference to this in object literals methods is the reference to the type
     *               of the object literal - the class defined above
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Red_spec_ex7()
      expect(r.m()).assertEqual("red")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_LITERAL_1100
     * @tc.name      testExpressionsObjectLiteral0011
     * @tc.desc      Compilation error when The context is a union type, and an object literal can
     *               be treated as value of several of union component types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectLiteral0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_union_inferred | B_union_inferred = { x: 1 }
      expect(a instanceof A_union_inferred).assertTrue()
      let c: D_union_inferred | A_union_inferred | C_union_inferred = { a: { x: 1 }, x: 1 }
      expect(c instanceof C_union_inferred).assertTrue()
      let z: X_union_inferred | Z_union_inferred = { z: 1 }
      expect(z instanceof Z_union_inferred).assertTrue()
    });
  });
}