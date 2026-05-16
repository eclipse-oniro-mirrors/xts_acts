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

class A_cl_0 {}
class B_cl_0 {}

class A_cl_1 {}
class B_cl_1 {
    ref: A_cl_1 = new A_cl_1()
}

class A_cl_2 {
    b: B_cl_2|null = null
}
class B_cl_2 {
    c: C_cl_2|null = null
}
class C_cl_2 {
    name: string = "";
    age: number = 0
}

class A_cl_3 {
    b?: B_cl_3
}
class B_cl_3 {
    c?: C_cl_3
}
class C_cl_3 {
    name: string = "";
    age: number = 0
}

class A_cl_4 {
    arr: string[] = ['new string[2]']
}
function foo_cl_4(a: A_cl_4): A_cl_4 {
    return { arr: [ a.arr[1], a.arr[0] ]}
}

class A_cl_5 {
  name: string | null = null; // 属性 `name` 初始值设置为 `null`
}

class A_cl_6 {
    name: string|null = null
}

class A_cl_7 {
    name: string|null = null
}
class B_cl_7 extends A_cl_7 {
    age: number
}

class A_cl_8 {
    age: number = 42
}

class A_cl_10 {
    age: number = 1
}
class B_cl_10 {
    age: number = 2
}

class A_cl_11 {
    name: string|null = null
}

class A_cl_12 {
    age: number;
    adult: boolean = false
}

class A_cl_13 {
    fld1: number;
    fld2: number;
    fld3: number
}

class A_cl_14 {
    first_name: string|undefined;
    last_name: string|undefined;
    full_name: string|undefined
}
function ln_cl_14(): string {
    return "Smith"
}

class A_cl_15 {
    first_name: string|undefined|null = "John";
    last_name: string|undefined|null = "Smith"
}

class B_cl_16 {
    c?: number
}
class A_cl_16 {
    b?: B_cl_16
}

class HasTuple_cl_17 {
    tuple: [boolean, Object] = [false, {}]
}
class HasArrayOfTuples_cl_17 {
    tuples: HasTuple_cl_17[] = []
}

type RecStrBool_cl_18 = Record<"yes" | "no", boolean>
class HasRecStrBool_cl_18 {
    r: RecStrBool_cl_18 = { "yes": true, "no": false }
}

class HasMethod_cl_19 {
    name: string = ''
    static someStaticMethod(value: HasMethod_cl_19): string {
      return value.name;
    }
}

class HasMethod_cl_20 {
    name: string = ''
    someMethod(): string {
      return this.name;
    }
}

interface IName_cl_21 {
  name: string
}
interface IAge_cl_21 {
  age: number
}
class Person_cl_21 implements IName_cl_21, IAge_cl_21 {
  _name: string = ''
  _age: number = 0.0

  get name(): string { return this._name }
  get age(): number { return this._age }
  set name(value: string) { this._name = value }
  set age(value: number) { this._age = value }
}

class Ordered_cl_23 {
    one: String = "";
    two: String = "";
    three: String = "";
    four: String = "";
}

class Person_cl_24 {
    name: string = ""
    age: number = 0
}
function foo_cl_24(p: Person_cl_24) {
    expect(p.age).assertEqual(18)
}

class Friend_cl_25 {
    name: string = ""
    private nick: string = ""
    age: number
    sex?: "male"|"female"
}

class OK_cl_26 {
    set attr (attr: number) {}
}

export default function ExpressionsObjectClassTestSuite(): void {
  describe("ExpressionsObjectClassTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_0100
     * @tc.name      testExpressionsObjectClass0001
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_cl_0 = {}
      let b: B_cl_0 = {}
      expect( a instanceof A_cl_0 ).assertTrue()
      expect( b instanceof B_cl_0 ).assertTrue()
      expect( a != b ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_0200
     * @tc.name      testExpressionsObjectClass0002
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_cl_1 = {}
      let b1: B_cl_1 = { ref: {} }
      let b2: B_cl_1 = { ref: a }
      let b3: B_cl_1 = { ref: new A_cl_1() }
      expect( b1.ref instanceof A_cl_1 ).assertTrue()
      expect( b2.ref instanceof A_cl_1 ).assertTrue()
      expect( b3.ref instanceof A_cl_1 ).assertTrue()
      expect( b2.ref == a ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_0300
     * @tc.name      testExpressionsObjectClass0003
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_cl_2 = { b: { c: { age: 42, name: "John" } as C_cl_2} as B_cl_2}
      expect( a.b!.c!.name ).assertEqual( "John" )
      expect( a.b!.c!.age ).assertEqual( 42 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_0400
     * @tc.name      testExpressionsObjectClass0004
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_cl_3 = { b: { c: { age: 42, name: "John" } as C_cl_3} as B_cl_3}
      expect( a.b!.c!.name ).assertEqual( "John" )
      expect( a.b!.c!.age ).assertEqual( 42 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_0500
     * @tc.name      testExpressionsObjectClass0005
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( { arr: ["a", "b"] } as A_cl_4 != { arr: ["a", "b"] } as A_cl_4 ).assertTrue()
      let a: A_cl_4 = foo_cl_4({ arr: ["a", "b"]})
      expect( a.arr[0] == "b" ).assertTrue()
      expect( a.arr[1] == "a" ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_0600
     * @tc.name      testExpressionsObjectClass0006
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: A_cl_5[] = [new A_cl_5(), new A_cl_5()];
      arr[0].name = "John";
      arr[1].name = "Jack";
      expect(arr[0] instanceof A_cl_5 && arr[0].name == "John").assertTrue();
      expect(arr[1] instanceof A_cl_5 && arr[1].name == "Jack").assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_0700
     * @tc.name      testExpressionsObjectClass0007
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: A_cl_6[] = [ { name: "John" }, { name: null } ]
      expect( arr[0] instanceof A_cl_6 && arr[0].name == "John" ).assertTrue()
      expect( arr[1] instanceof A_cl_6 && arr[1].name == null ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_0800
     * @tc.name      testExpressionsObjectClass0008
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_cl_7 = { name: "John", age: 42 }
      expect( b instanceof B_cl_7 && b.age == 42 && b.name == "John" ).assertTrue()
      let a: A_cl_7 = b
      expect( a instanceof A_cl_7 && a.name == "John" ).assertTrue()
      let c: B_cl_7 = {}
      expect( c instanceof B_cl_7 && c.age == 0 && c.name == null ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_0900
     * @tc.name      testExpressionsObjectClass0009
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_cl_8 = {}
      expect( a instanceof A_cl_8 && a.age == 42 ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_1000
     * @tc.name      testExpressionsObjectClass0010
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object[] = [{}, {}, {}, {}, {}]
      expect( v.length == 5 && v[0] instanceof Object && v[0] != v[4] ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_1100
     * @tc.name      testExpressionsObjectClass0011
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object[] = [ {} as A_cl_10, {} as B_cl_10, {} ]
      expect( v[0] instanceof A_cl_10 && (v[0] as A_cl_10).age == 1 ).assertTrue()
      expect( v[1] instanceof B_cl_10 && (v[1] as B_cl_10).age == 2 ).assertTrue()
      expect( v[2] instanceof Object ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_1200
     * @tc.name      testExpressionsObjectClass0012
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_cl_11 = { name: "John" }
      expect( a.name == "John" ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_1300
     * @tc.name      testExpressionsObjectClass0013
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = 42
      // expressions in field values
      let a: A_cl_12 = { age: v, adult: v >= 18 }
      expect(a.age == 42 && a.adult).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_1400
     * @tc.name      testExpressionsObjectClass0014
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = 42
      // expressions in field values
      let a: A_cl_13 = { fld1: v++, fld2: v++, fld3: v++ }
      expect(v == 45 && a.fld1 == 42 && a.fld2 == 43 && a.fld3 == 44).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_1500
     * @tc.name      testExpressionsObjectClass0015
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = "John"
      // expressions in field values
      let a: A_cl_14 = { first_name: fn, last_name: ln_cl_14(), full_name: fn + " " + ln_cl_14() }
      expect(a.full_name == "John Smith").assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_1600
     * @tc.name      testExpressionsObjectClass0016
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // expressions in field values
      let a: A_cl_15 = { first_name: undefined, last_name: null }
      expect(a.first_name === undefined && a.last_name === null).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_1700
     * @tc.name      testExpressionsObjectClass0017
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_cl_16 = {}
      expect(a instanceof A_cl_16).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_1800
     * @tc.name      testExpressionsObjectClass0018
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: HasTuple_cl_17 = {tuple: [true, {}]}
      expect(t instanceof HasTuple_cl_17).assertTrue()
      let at: HasArrayOfTuples_cl_17 = {tuples: [{tuple: [false, {}]}, t]}
      expect(at instanceof HasArrayOfTuples_cl_17).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_1900
     * @tc.name      testExpressionsObjectClass0019
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: HasRecStrBool_cl_18 = { r: {"yes": false, "no": true} }
      expect(f instanceof HasRecStrBool_cl_18).assertTrue()
      expect(f.r["yes"]).assertEqual(false)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_2000
     * @tc.name      testExpressionsObjectClass0020
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: HasMethod_cl_19 = { name: 'Alice' }
      expect(f instanceof HasMethod_cl_19).assertTrue()
      expect('Alice').assertEqual(HasMethod_cl_19.someStaticMethod(f))
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_2100
     * @tc.name      testExpressionsObjectClass0021
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: HasMethod_cl_20 = { name: 'Alice' }
      expect(f instanceof HasMethod_cl_20).assertTrue()
      expect('Alice').assertEqual(f.someMethod())
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_2200
     * @tc.name      testExpressionsObjectClass0022
     * @tc.desc      If the class type C is inferred from the context, then the type of object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f0: Person_cl_21 = { name: 'Alice', age: 17 }
      let f1: Person_cl_21 = { _name: 'Alice', _age: 17 }

      expect(f0 instanceof IName_cl_21).assertTrue()
      expect(f1 instanceof IAge_cl_21).assertTrue()
      expect(f0.age).assertEqual(f1.age)
      expect(f0._name).assertEqual(f1.name)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_2300
     * @tc.name      testExpressionsObjectClass0023
     * @tc.desc      Compilation no error when attempt to init fields out of order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Ordered_cl_23 = { four: "four",  three: "three", two: "two", one: "one"}

      expect(a.one).assertEqual("one")
      expect(a.two).assertEqual("two")
      expect(a.three).assertEqual("three")
      expect(a.four).assertEqual("four")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_2400
     * @tc.name      testExpressionsObjectClass0024
     * @tc.desc      If class type C is inferred from the context, then type of an object literal
     *               is C.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Person_cl_24 = {name: "Bob", age: 25}  // ok, variable type is used
      expect(p instanceof Person_cl_24).assertTrue()
      expect(p.age).assertEqual(25)
      foo_cl_24({name: "Alice", age: 18}) // ok, parameter type is used
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_2500
     * @tc.name      testExpressionsObjectClass0025
     * @tc.desc      If some class fields have default values (see Default Values for Types) or explicit
     *               initializers (see Variable and Constant Declarations), then such fields can be skipped
     *               in the object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // name, nick, age, and sex have either default value or explicit initializer
      let f: Friend_cl_25 = {}
      expect(f instanceof Friend_cl_25).assertTrue()
      expect(f.name).assertEqual("")
      expect(f.age).assertEqual(0)
      expect(f.sex).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_CLASS_2600
     * @tc.name      testExpressionsObjectClass0026
     * @tc.desc      If a class has accessors (see Accessor Declarations) for a property, and its
     *               setter is provided, then this property can be used as a part of an object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectClass0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: OK_cl_26 = {attr: 42} // OK, as the setter be called
      expect(a instanceof OK_cl_26).assertTrue()
    });
  });
}