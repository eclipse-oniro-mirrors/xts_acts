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


interface AddressType_chop_access {
  street?: string
  city?: string
}


class Person_chop_access {
  name?: string
  address?: AddressType_chop_access
}

class Person_chop_access01 {
  name?: string
  address: AddressType_chop_access
  
  constructor(address: AddressType_chop_access) {
    this.address = address
  }
}

class Person_chop_array {
  name: string|undefined
  
  constructor(name?: string) {
    this.name = name
  }
}

class Team_chop_array01 {
  members?: Person_chop_array01[]
  
  constructor(members?: Person_chop_array01[]) {
    this.members = members
  }
}

class Person_chop_array01 {
  name: string
  
  constructor(name: string) {
    this.name = name
  }
}

class Person_chop_asyn_func {
  name: string
  fetchData?: () => Promise<string|undefined>
  
  constructor(name: string) {
    this.name = name
  }
}

class Person_chop_com_func {
  name: string
  getGreeting?: () => string
  
  constructor(name: string) {
    this.name = name
  }
}

class Person_chop_com_index {
  name: string
  scores?: int[]
  
  constructor(name: string) {
    this.name = name
  }
}

class Address_chop_complex {
  city: string
  zipCode?: string
  
  constructor(city: string) {
    this.city = city
  }
}

class Person_chop_complex {
  name: string
  address?: Address_chop_complex
  
  constructor(name: string) {
    this.name = name
  }
}

class Company_chop_complex {
  CEO?: Person_chop_complex
  
  constructor(CEO?: Person_chop_complex) {
    this.CEO = CEO
  }
}

class Person_chop_existence {
  name: string
  spouse?: Person_chop_existence
  
  constructor(name: string) {
    this.name = name
  }
}

class Person_chop_field {
  name: string
  age?: number
  
  constructor(name: string, age?: number) {
    this.name = name
    this.age = age
  }
}

class Calculator_chop_method {
  add(a: number, b: number): number {
    return a + b
  }
}

class Builder_chop_method02 {
  private value = 0
  
  add(n: number): Builder_chop_method02 {
    this.value += n
    return this
  }
  
  getResult(): number {
    return this.value
  }
}

class A_chop_multilevel02 {
  b?: B_chop_multilevel02
}

class B_chop_multilevel02 {
  c?: C_chop_multilevel02
}

class C_chop_multilevel02 {
  value: string = "test"
}

class Address_chop_nested_obj {
  city: string
  street?: string
  
  constructor(city: string) {
    this.city = city
  }
}

class Person_chop_nested_obj {
  name: string
  address?: Address_chop_nested_obj
  
  constructor(name: string) {
    this.name = name
  }
}

class Person_chop_null {
  name: string
  spouse: Person_chop_null|null = null
  
  constructor(name: string) {
    this.name = name
  }
}

class Person_chop_nullish {
  name: string
  age?: number
  
  constructor(name: string) {
    this.name = name
  }
}

interface Config_chop_nullish01 {
  timeout: number | null
}

class Person_chop_record {
  name: string
  details?: Record<'read' | 'write', boolean>
  
  constructor(name: string, fillDetailed?: boolean) {
    this.name = name
    if (fillDetailed ?? false) {
      this.details = {"read": true, "write": false}
    }
  }
}

class Person_chop_type {
  name: string
  age?: number
  
  constructor(name: string) {
    this.name = name
  }
}

interface Data_chop_type01 {
  value?: string | null
}


function safeCall_chop_func(fn?: (msg: string) => string): string {
  return fn?.("Hello") ?? 'Default'
}

class A_chop0 {
  fldA: string|null = "abc"
  fldAn: string|null = null

  metA(p: string): string|null {
    return p == "null" ? null : p
  }
}

class B_chop0 {
  fldB: A_chop0|null = new A_chop0()
  fldBn: A_chop0|null = null

  metB(p: string): A_chop0|null {
    return p == "null" ? null : new A_chop0()
  }
}

function boo_chop0(p: string): B_chop0|null {
  return p == "null" ? null : new B_chop0()
}


class A_chop1 {
  fldA: string|undefined = "abc"
  fldAn: string|undefined = undefined

  metA(p: string): string|undefined {
    return p == "undefined" ? undefined : p
  }
}

class B_chop1 {
  fldB: A_chop1|undefined = new A_chop1()
  fldBn: A_chop1|undefined = undefined

  metB(p: string): A_chop1|undefined {
    return p == "undefined" ? undefined : new A_chop1()
  }
}

function boo_chop1(p: string): B_chop1|undefined {
  return p == "undefined" ? undefined : new B_chop1()
}

class Example_chop2 {
  field: int = 1

  method(): int {
    return 1
  }
}

function foo_undefined_chop2(): undefined { return undefined }
let lambda_undefined_chop2 = (): undefined => { return undefined }

function foo_null_chop2(): null { return null }

function foo_undefined_chop3(): Example_chop2|undefined { return undefined }

function foo_null_chop3(): Example_chop2|null { return null }

class A_chop4 {
  name: string = "a"
}

function test_chop4(a: A_chop4|null|undefined): string|undefined {
  return a?.name
}

type Foo_condition_compile_time = () => int

class A_expression_not_nullish_0 {
  fldA: string = "abc"
  metA(p: string): string {
    return p
  }
}

class Person_expression_not_nullish_3 {
  name: string
  scores: int[]

  constructor(name: string) {
    this.name = name
    this.scores = [90, 85, 95]
  }
}

function greet_expression_not_nullish_4(name?: string): string {
  return `Hello, ${name}`
}

class A_expression_not_nullish_5 {
  b: B_expression_not_nullish_5 = new B_expression_not_nullish_5()
}

class B_expression_not_nullish_5 {
  c: C_expression_not_nullish_5 = new C_expression_not_nullish_5()
}

class C_expression_not_nullish_5 {
  value: string = "test"
}
export default function ExpressionsChainingOperatorTest() {
  describe("ExpressionsChainingOperatorTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_0100
     * @tc.name      testExpressionsChainingOperator0001
     * @tc.desc      Chaining operator, access nested object properties, the intermediate value is
     *               empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person1 = new Person_chop_access()
      expect(person1?.name?.length).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_0200
     * @tc.name      testExpressionsChainingOperator0002
     * @tc.desc      Chaining operator, access nested object properties.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person1 = new Person_chop_access01({})
      person1.address.street = "123"
      expect(person1.address?.city).assertEqual(undefined)
      person1.address.city = "xian"
      person1.name = "Alice"
      expect(person1?.address.city).assertEqual("xian")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_0300
     * @tc.name      testExpressionsChainingOperator0003
     * @tc.desc      Chaining operator, accessing object fields in an array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const people: Person_chop_array[] = [new Person_chop_array("Alice"), new Person_chop_array("Bob"), new Person_chop_array()]
      expect(people[0]?.name).assertEqual("Alice")
      expect(people[1]?.name).assertEqual("Bob")
      expect(people[2]?.name).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_0400
     * @tc.name      testExpressionsChainingOperator0004
     * @tc.desc      Chaining operator, access to an element of an array (union type with and without
     *               smart cast).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let usersOuter: string[] | null = null
      let users: string[] | null = ['']
      expect(usersOuter?.[0]).assertEqual(undefined)
      expect(users?.[0]).assertEqual('')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_0500
     * @tc.name      testExpressionsChainingOperator0005
     * @tc.desc      Chaining operator, combination of the chaining operator and array methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const team = new Team_chop_array01()
      expect(team.members?.[0]).assertEqual(undefined)
      expect(team.members?.[0]?.name).assertEqual(undefined)
      team.members = [new Person_chop_array01("Alice"), new Person_chop_array01("Bob")]
      expect(team.members?.[0]?.name).assertEqual("Alice")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_0600
     * @tc.name      testExpressionsChainingOperator0006
     * @tc.desc      Chaining operator, access to an element of an array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let users: string[] | null = null
      users = ["John", "Jane"]
      expect(users?.[1]).assertEqual("Jane")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_0700
     * @tc.name      testExpressionsChainingOperator0007
     * @tc.desc      Chaining operator, call an asynchronous function that may be undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const bob = new Person_chop_asyn_func("Bob")
      const resultPromise = bob.fetchData?.() ?? Promise.resolve(undefined)
      const result = await resultPromise
      expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_0800
     * @tc.name      testExpressionsChainingOperator0008
     * @tc.desc      Chaining operator, combining chaining operator with function calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bob = new Person_chop_com_func("Bob")
      expect(bob.getGreeting?.()).assertEqual(undefined)
      bob.getGreeting = () => `Hello, ${bob.name}`
      expect(bob.getGreeting?.()).assertEqual("Hello, Bob")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_0900
     * @tc.name      testExpressionsChainingOperator0009
     * @tc.desc      Chaining operator, combining chaining operator with index access.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bob = new Person_chop_com_index("Bob")
      expect(bob.scores?.[0]).assertEqual(undefined)
      bob.scores = [90, 85, 95]
      expect(bob.scores?.[0]).assertEqual(90)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_1000
     * @tc.name      testExpressionsChainingOperator0010
     * @tc.desc      Chaining operator, chaining operator with complex nested structures test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const company = new Company_chop_complex()
      expect(company.CEO?.address?.zipCode).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_1100
     * @tc.name      testExpressionsChainingOperator0011
     * @tc.desc      Chaining operator, field existence test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bob = new Person_chop_existence("Bob")
      bob.spouse = new Person_chop_existence("Alice")
      expect(bob.spouse?.name).assertEqual("Alice")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_1200
     * @tc.name      testExpressionsChainingOperator0012
     * @tc.desc      Chaining operator, field access expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person1 = new Person_chop_field("John")
      expect(person1.age?.toString()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_1300
     * @tc.name      testExpressionsChainingOperator0013
     * @tc.desc      Chaining operator, method chaining call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      //without optional function parameter
      expect(safeCall_chop_func()).assertEqual('Default')
      //with optional function parameter
      expect(safeCall_chop_func((msg: string) => {return msg})).assertEqual('Hello')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_1400
     * @tc.name      testExpressionsChainingOperator0014
     * @tc.desc      Chaining operator, matrix element access.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const matrix: number[][] | undefined = [[1, 2], [3, 4]]
      expect(matrix?.[0]?.[1]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_1500
     * @tc.name      testExpressionsChainingOperator0015
     * @tc.desc      Chaining operator, method call expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Calculator_chop_method | undefined = undefined
      calc = new Calculator_chop_method()
      expect(calc?.add(1, 2)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_1600
     * @tc.name      testExpressionsChainingOperator0016
     * @tc.desc      Chaining operator, method call expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Calculator_chop_method | undefined = undefined
      expect(calc?.add(1, 2)).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_1700
     * @tc.name      testExpressionsChainingOperator0017
     * @tc.desc      Chaining operator, method chaining call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let builder: Builder_chop_method02 | null = null
      // both methods of nullable object returns undefined
      expect(builder?.add(5)).assertEqual(builder?.getResult())
      
      builder = new Builder_chop_method02()
      expect(builder?.add(5)?.getResult()).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_1800
     * @tc.name      testExpressionsChainingOperator0018
     * @tc.desc      Chaining operator, multi-level chaining operator access.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bob = new Person_chop_existence("Bob")
      expect(bob.spouse?.spouse?.name).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_1900
     * @tc.name      testExpressionsChainingOperator0019
     * @tc.desc      Chaining operator, multi-level chaining operator access.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new A_chop_multilevel02()
      expect(a1?.b?.c?.value).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_2000
     * @tc.name      testExpressionsChainingOperator0020
     * @tc.desc      Chaining operator, accessing fields of nested objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bob = new Person_chop_nested_obj("Bob")
      expect(bob.address?.city).assertEqual(undefined)
      bob.address = new Address_chop_nested_obj("New York")
      expect(bob.address?.city).assertEqual("New York")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_2100
     * @tc.name      testExpressionsChainingOperator0021
     * @tc.desc      Chaining operator, field null test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bob = new Person_chop_null("Bob")
      expect(bob.spouse?.name).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_2200
     * @tc.name      testExpressionsChainingOperator0022
     * @tc.desc      Chaining operator, combining chaining operator with nullish coalescing operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bob = new Person_chop_nullish("Bob")
      bob.age = bob.age ?? 30
      expect(bob?.age).assertEqual(30)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_2300
     * @tc.name      testExpressionsChainingOperator0023
     * @tc.desc      Chaining operator, combine with the nullish coalescing operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config: Config_chop_nullish01 = {
        timeout: null
      }
      
      let timeoutValue = config?.timeout ?? 3000
      expect(timeoutValue).assertEqual(3000)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_2400
     * @tc.name      testExpressionsChainingOperator0024
     * @tc.desc      Chaining operator, combine with the nullish coalescing operator assign.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config: Config_chop_nullish01 = {
        timeout: null
      }
      
      let timeoutValue = config?.timeout ?? 3000
      config.timeout = 5000
      timeoutValue = config.timeout ?? 3000
      expect(timeoutValue).assertEqual(5000)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_2500
     * @tc.name      testExpressionsChainingOperator0025
     * @tc.desc      Chaining operator, the chaining operator and dynamic property access.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bob = new Person_chop_record("Bob")
      const key = "read"
      expect(bob.details?.[key]).assertEqual(undefined)
      
      const alice = new Person_chop_record("Alice", true)
      expect(alice.details?.[key]).assertEqual(true)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_2600
     * @tc.name      testExpressionsChainingOperator0026
     * @tc.desc      Chaining operator, combining chaining operator with type assertion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bob = new Person_chop_type("Bob")
      const age = bob.age as number | undefined
      expect(age).assertEqual(undefined)
      
      bob.age = 25
      expect(bob.age as number).assertEqual(25)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_2700
     * @tc.name      testExpressionsChainingOperator0027
     * @tc.desc      Chaining operator, type assertion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Data_chop_type01 = { value: "hello" }
      const length = data.value?.toUpperCase()?.length
      expect(length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_2800
     * @tc.name      testExpressionsChainingOperator0028
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(boo_chop0("not null")?.fldB?.fldA).assertEqual("abc")
      expect(boo_chop0("not null")?.fldB?.fldAn).assertEqual(null)
      expect(boo_chop0("not null")?.fldB?.metA("xyz")).assertEqual("xyz")
      expect(boo_chop0("not null")?.fldB?.metA("null")).assertEqual(null)

      expect(boo_chop0("not null")?.metB("not null")?.fldA).assertEqual("abc")
      expect(boo_chop0("not null")?.metB("not null")?.fldAn).assertEqual(null)
      expect(boo_chop0("not null")?.metB("not null")?.metA("xyz")).assertEqual("xyz")
      expect(boo_chop0("not null")?.metB("not null")?.metA("null")).assertEqual(null)

      expect(boo_chop0("not null")?.fldBn?.fldA).assertEqual(undefined)
      expect(boo_chop0("not null")?.fldBn?.fldAn).assertEqual(undefined)
      expect(boo_chop0("not null")?.fldBn?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop0("not null")?.fldBn?.metA("null")).assertEqual(undefined)

      expect(boo_chop0("not null")?.metB("null")?.fldA).assertEqual(undefined)
      expect(boo_chop0("not null")?.metB("null")?.fldAn).assertEqual(undefined)
      expect(boo_chop0("not null")?.metB("null")?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop0("not null")?.metB("null")?.metA("null")).assertEqual(undefined)

      expect(boo_chop0("null")?.fldB?.fldA).assertEqual(undefined)
      expect(boo_chop0("null")?.fldB?.fldAn).assertEqual(undefined)
      expect(boo_chop0("null")?.fldB?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop0("null")?.fldB?.metA("null")).assertEqual(undefined)

      expect(boo_chop0("null")?.metB("not null")?.fldA).assertEqual(undefined)
      expect(boo_chop0("null")?.metB("not null")?.fldAn).assertEqual(undefined)
      expect(boo_chop0("null")?.metB("not null")?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop0("null")?.metB("not null")?.metA("null")).assertEqual(undefined)

      expect(boo_chop0("null")?.fldBn?.fldA).assertEqual(undefined)
      expect(boo_chop0("null")?.fldBn?.fldAn).assertEqual(undefined)
      expect(boo_chop0("null")?.fldBn?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop0("null")?.fldBn?.metA("null")).assertEqual(undefined)

      expect(boo_chop0("null")?.metB("null")?.fldA).assertEqual(undefined)
      expect(boo_chop0("null")?.metB("null")?.fldAn).assertEqual(undefined)
      expect(boo_chop0("null")?.metB("null")?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop0("null")?.metB("null")?.metA("null")).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_2900
     * @tc.name      testExpressionsChainingOperator0029
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(boo_chop1("not undefined")?.fldB?.fldA).assertEqual("abc")
      expect(boo_chop1("not undefined")?.fldB?.fldAn).assertEqual(undefined)
      expect(boo_chop1("not undefined")?.fldB?.metA("xyz")).assertEqual("xyz")
      expect(boo_chop1("not undefined")?.fldB?.metA("undefined")).assertEqual(undefined)

      expect(boo_chop1("not undefined")?.metB("not undefined")?.fldA).assertEqual("abc")
      expect(boo_chop1("not undefined")?.metB("not undefined")?.fldAn).assertEqual(undefined)
      expect(boo_chop1("not undefined")?.metB("not undefined")?.metA("xyz")).assertEqual("xyz")
      expect(boo_chop1("not undefined")?.metB("not undefined")?.metA("undefined")).assertEqual(undefined)

      expect(boo_chop1("not undefined")?.fldBn?.fldA).assertEqual(undefined)
      expect(boo_chop1("not undefined")?.fldBn?.fldAn).assertEqual(undefined)
      expect(boo_chop1("not undefined")?.fldBn?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop1("not undefined")?.fldBn?.metA("undefined")).assertEqual(undefined)

      expect(boo_chop1("not undefined")?.metB("undefined")?.fldA).assertEqual(undefined)
      expect(boo_chop1("not undefined")?.metB("undefined")?.fldAn).assertEqual(undefined)
      expect(boo_chop1("not undefined")?.metB("undefined")?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop1("not undefined")?.metB("undefined")?.metA("undefined")).assertEqual(undefined)

      expect(boo_chop1("undefined")?.fldB?.fldA).assertEqual(undefined)
      expect(boo_chop1("undefined")?.fldB?.fldAn).assertEqual(undefined)
      expect(boo_chop1("undefined")?.fldB?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop1("undefined")?.fldB?.metA("undefined")).assertEqual(undefined)

      expect(boo_chop1("undefined")?.metB("not undefined")?.fldA).assertEqual(undefined)
      expect(boo_chop1("undefined")?.metB("not undefined")?.fldAn).assertEqual(undefined)
      expect(boo_chop1("undefined")?.metB("not undefined")?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop1("undefined")?.metB("not undefined")?.metA("undefined")).assertEqual(undefined)

      expect(boo_chop1("undefined")?.fldBn?.fldA).assertEqual(undefined)
      expect(boo_chop1("undefined")?.fldBn?.fldAn).assertEqual(undefined)
      expect(boo_chop1("undefined")?.fldBn?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop1("undefined")?.fldBn?.metA("undefined")).assertEqual(undefined)

      expect(boo_chop1("undefined")?.metB("undefined")?.fldA).assertEqual(undefined)
      expect(boo_chop1("undefined")?.metB("undefined")?.fldAn).assertEqual(undefined)
      expect(boo_chop1("undefined")?.metB("undefined")?.metA("xyz")).assertEqual(undefined)
      expect(boo_chop1("undefined")?.metB("undefined")?.metA("undefined")).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_3000
     * @tc.name      testExpressionsChainingOperator0030
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ex = new Example_chop2()

      // 随机条件测试，这里我们模拟随机结果
      let cond: boolean = Math.random() > 0.5
      let aa = new Example_chop2()
      let a1: Example_chop2|undefined = cond ? aa : foo_undefined_chop2()
      let a2: Example_chop2|undefined = cond ? foo_undefined_chop2() : aa
      let res1: int|undefined = a1?.field
      let res2: int|undefined = a2?.field
      expect((res1 == 1) || (res2 == 1)).assertTrue()
      expect((res1 == undefined) || (res2 == undefined)).assertTrue()
      let res3: int|undefined = a1?.method()
      let res4: int|undefined = a2?.method()
      expect((res3 == 1) || (res4 == 1)).assertTrue()
      expect((res3 == undefined) || (res4 == undefined)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_3100
     * @tc.name      testExpressionsChainingOperator0031
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ex = new Example_chop2()

      // 测试null版本
      let cond: boolean = Math.random() > 0.5
      let aa = new Example_chop2()
      let a1: Example_chop2|null = cond ? aa : foo_null_chop2()
      let a2: Example_chop2|null = cond ? foo_null_chop2() : aa
      let res1: int|undefined = a1?.field
      let res2: int|undefined = a2?.field
      expect((res1 == 1) || (res2 == 1)).assertTrue()
      expect((res1 == undefined) || (res2 == undefined)).assertTrue()
      let res3: int|undefined = a1?.method()
      let res4: int|undefined = a2?.method()
      expect((res3 == 1) || (res4 == 1)).assertTrue()
      expect((res3 == undefined) || (res4 == undefined)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_3200
     * @tc.name      testExpressionsChainingOperator0032
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ex = new Example_chop2()

      // 测试lambda版本
      let cond: boolean = Math.random() > 0.5
      let aa = new Example_chop2()
      let a1: Example_chop2|undefined = cond ? aa : lambda_undefined_chop2()
      let a2: Example_chop2|undefined = cond ? lambda_undefined_chop2() : aa
      let res1: int|undefined = a1?.field
      let res2: int|undefined = a2?.field
      expect((res1 == 1) || (res2 == 1)).assertTrue()
      expect((res1 == undefined) || (res2 == undefined)).assertTrue()
      let res3: int|undefined = a1?.method()
      let res4: int|undefined = a2?.method()
      expect((res3 == 1) || (res4 == 1)).assertTrue()
      expect((res3 == undefined) || (res4 == undefined)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_3300
     * @tc.name      testExpressionsChainingOperator0033
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Example_chop2|undefined = foo_undefined_chop3()
      let res1: int|undefined = a1?.field
      expect(res1).assertEqual(undefined)
      let res3: int|undefined = a1?.method()
      expect(res3).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_3400
     * @tc.name      testExpressionsChainingOperator0034
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Example_chop2|null = foo_null_chop3()
      let res1: int|undefined = a1?.field
      expect(res1).assertEqual(undefined)
      let res3: int|undefined = a1?.method()
      expect(res3).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_3500
     * @tc.name      testExpressionsChainingOperator0035
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A_chop4()
      let res1 = test_chop4(a)
      expect(res1).assertEqual("a")
      let res2 = test_chop4(undefined)
      expect(res2).assertEqual(undefined)
      let res3 = test_chop4(null)
      expect(res3).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_3600
     * @tc.name      testExpressionsChainingOperator0036
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression. If an expression is not of a nullish type, then the chaining
     *               operator has no effect.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bob = new Person_expression_not_nullish_3("Bob")
      expect(bob.scores?.[0]).assertEqual(90)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_3700
     * @tc.name      testExpressionsChainingOperator0037
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression. If an expression is not of a nullish type, then the chaining
     *               operator has no effect.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = "Alice"
      expect(greet_expression_not_nullish_4(name?.toUpperCase())).assertEqual("Hello, ALICE")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CHAINING_OPERATOR_3800
     * @tc.name      testExpressionsChainingOperator0038
     * @tc.desc      If the object to the left of ('?.') is undefined or null, then the evaluation
     *               of the entire surrounding expression is dropped, and undefined is used as the result
     *               of the expression. If an expression is not of a nullish type, then the chaining
     *               operator has no effect.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsChainingOperator0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new A_expression_not_nullish_5()
      expect(a1?.b?.c?.value).assertEqual("test")
    })
  })
}