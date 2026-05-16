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

interface A_in_0 {}
interface B_in_0 {}

interface A_in_1 {}
class A_cls_in_1 implements A_in_1 {}
interface B_in_1 {
  ref: A_in_1
}

interface A_in_2 {
    b: B_in_2
}
interface B_in_2 {
    c: C_in_2
}
interface C_in_2 {
    name: string;
    age: number
}

interface A_in_3 {
    arr: string[]
}
function foo_in_3(a: A_in_3): A_in_3 {
    return { arr: [ a.arr[1], a.arr[0] ]}
}

interface A_in_4 {
    name: string|null
}
class B_in_4 implements A_in_4 {
    name: string|null = null
}

interface A_in_5 {
    name: string|null
}

interface A_in_6 {
    name?: string
}
interface B_in_6 extends A_in_6 {
    age: number
}

interface A_in_7 {
    name: string | undefined
}
interface B_in_7 extends A_in_7 {
    age: number
}

interface A_in_8 {}

interface A_in_9 {
    age: number
}
interface B_in_9 {
    age: number
}

interface A_in_10 {
    readonly name: string|null
}

interface A_in_11 {
    age: number;
    adult: boolean
}

interface A_in_12 {
    fld1: number;
    fld2: number;
    fld3: number
}

interface A_in_13 {
    first_name: string|undefined;
    last_name: string|undefined;
    full_name: string|undefined
}
function ln_in_13(): string {
    return "Smith"
}

interface A_in_14 {
    age: number
    name?: string
}

type FR_in_15 = (input: string) => string
interface A_in_15 {
    name: string | null
    func: FR_in_15
}

interface I_in_16 {
    c1: int;
    c2: string;
    foo(f: number): string|number
}

interface I_in_17 {
    c1: int;
    c2: string;
    foo(f: number): string|number {
        return f - 1
    }
}

interface I_in_18 {
    c1: int;
    c2: string;
    foo(f: number): string|number {
        return f + 1
    }
}

class A_cls_in_19 {
    a: string = 'a'
    foo(b: B_cls_in_19): A_cls_in_19 {
        return b as A_cls_in_19;
    }
}
class B_cls_in_19 extends A_cls_in_19 {
    b: string = 'b'
    foo(a: A_cls_in_19): B_cls_in_19 {
        return new B_cls_in_19()
    }
}
interface I_in_19 {
    c1: A_cls_in_19;
    c2: B_cls_in_19;
    foo(f: B_cls_in_19): string|number {
        return f.a
    }
}

class A_cls_in_20 {
    a: string = 'a'
    foo(b: B_cls_in_20): A_cls_in_20 {
        return b as A_cls_in_20;
    }
}
class B_cls_in_20 extends A_cls_in_20 {
    b: string = 'b'
    foo(a: A_cls_in_20): B_cls_in_20 {
        return new B_cls_in_20()
    }
}
interface I_in_20 {
    c1: A_cls_in_20;
    c2: B_cls_in_20;
    foo(f: B_cls_in_20): string|number
}

class A_cls_in_21 {
    a: string = 'a'
    foo(b: B_cls_in_21): A_cls_in_21 {
        return b as A_cls_in_21;
    }
}
class B_cls_in_21 extends A_cls_in_21 {
    b: string = 'b'
    foo(a: A_cls_in_21): B_cls_in_21 {
        return new B_cls_in_21()
    }
}
interface I_in_21 {
    c1: A_cls_in_21;
    c2: B_cls_in_21;
    foo(f: B_cls_in_21): string|number {
        return f.a
    }
}

interface Ordered_interface_composite_initialization_order {
    one: String;
    two: String;
    three: String;
    four: String;
}

interface Person_spec_ex1 {
    name: string
    age: number
}

interface ILiteral_spec_ex2_1_1 {
    foo(input: int): int
    name: string
}

interface ILiteral_spec_ex2_1_2 {
    foo(input: int): int {
        return input
    }
    name: string
}

interface ILiteral_spec_ex2_1_3 {
    foo(input: int): int {
        return input
    }
    name: string
}

interface Person_spec_ex3 {
    name: string
    age: number
    sex?: "male"|"female"
}

interface I2_spec_ex5 {
    get attr (): number
}

interface I_spec_ex6 {
    method(): number { return 1 }
}

export default function ExpressionsObjectInterfaceTestSuite(): void {
  describe("ExpressionsObjectInterfaceTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_0100
     * @tc.name      testExpressionsObjectInterface0001
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_in_0 = {}
      let b: B_in_0 = {}
      expect( a instanceof A_in_0 ).assertTrue()
      expect( b instanceof B_in_0 ).assertTrue()
      expect( a != b ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_0200
     * @tc.name      testExpressionsObjectInterface0002
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 显式声明类型
      let a: A_in_1 = {}; // 空对象 {} 可以赋值给 A_in_1
      // 创建符合 B_in_1 的对象 b1
      let b1: B_in_1 = { ref: {} as A_in_1 }; // 将 {} 强制声明为 A_in_1 类型
      // 创建另一个符合 B_in_1 的对象 b2
      let b2: B_in_1 = { ref: a }; // a 是 A_in_1 类型，可以直接赋值到 ref
      // 创建 b3，其中 ref 是类 A_cls_in_1 的实例
      let b3: B_in_1 = { ref: new A_cls_in_1() }; // A_cls_in_1 显式实现了 A_in_1，因此可以赋值
      // 断言测试
      expect(b1.ref instanceof A_in_1).assertTrue(); // 检查 b1.ref 是否是 A_in_1 类型
      expect(b2.ref instanceof A_in_1).assertTrue(); // 检查 b2.ref 是否是 A_in_1 类型
      expect(b3.ref instanceof A_in_1).assertTrue(); // 检查 b3.ref 是否是 A_in_1 类型
      expect(b2.ref === a).assertTrue(); // 检查 b2.ref 是否等于 a
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_0300
     * @tc.name      testExpressionsObjectInterface0003
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_in_2 = { b: { c: { age: 42, name: "John" }}}
      expect( a.b.c.name ).assertEqual( "John" )
      expect( a.b.c.age ).assertEqual( 42 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_0400
     * @tc.name      testExpressionsObjectInterface0004
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( { arr: ["a", "b"] } as A_in_3 != { arr: ["a", "b"] } as A_in_3 ).assertTrue()
      let a: A_in_3 = foo_in_3({ arr: ["a", "b"]})
      expect( a.arr[0] == "b" ).assertTrue()
      expect( a.arr[1] == "a" ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_0500
     * @tc.name      testExpressionsObjectInterface0005
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: A_in_4[] = [new B_in_4, new B_in_4]
      arr[0] = { name: "John" }
      arr[1] = { name: "Jack" }
      expect( arr[0] instanceof A_in_4 && arr[0].name == "John" ).assertTrue()
      expect( arr[1] instanceof A_in_4 && arr[1].name == "Jack" ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_0600
     * @tc.name      testExpressionsObjectInterface0006
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: A_in_5[] = [ { name: "John" }, { name: null } ]
      expect( arr[0] instanceof A_in_5 && arr[0].name == "John" ).assertTrue()
      expect( arr[1] instanceof A_in_5 && arr[1].name == null ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_0700
     * @tc.name      testExpressionsObjectInterface0007
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_in_6 = { name: "John", age: 42 }
      expect( b instanceof B_in_6 && b.age == 42 && b.name == "John" ).assertTrue()
      let a: A_in_6 = b
      expect( a instanceof A_in_6 && a.name == "John" ).assertTrue()
      let c: B_in_6 = {age: 0}
      expect( c instanceof B_in_6 && c.age == 0 && c.name == undefined ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_0800
     * @tc.name      testExpressionsObjectInterface0008
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_in_7 = { name: "John", age: 42 }
      expect( b instanceof B_in_7 && b.age == 42 && b.name == "John" ).assertTrue()
      let a: A_in_7 = b
      expect( a instanceof A_in_7 && a.name == "John" ).assertTrue()
      let c: B_in_7 = {age: 0}
      expect( c instanceof B_in_7 && c.age == 0 && c.name == undefined ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_0900
     * @tc.name      testExpressionsObjectInterface0009
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A_in_8[] = [{}, {}, {}, {}, {}]
      expect( v.length == 5 && v[0] instanceof A_in_8 && v[0] != v[4] ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_1000
     * @tc.name      testExpressionsObjectInterface0010
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object[] = [ {age: 0} as A_in_9, {age: 0} as B_in_9, {} ]
      expect( v[0] instanceof A_in_9 && (v[0] as A_in_9).age == 0 ).assertTrue()
      expect( v[1] instanceof B_in_9 && (v[1] as B_in_9).age == 0 ).assertTrue()
      expect( v[2] instanceof Object ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_1100
     * @tc.name      testExpressionsObjectInterface0011
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_in_10 = { name: "John" }
      expect( a.name == "John" ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_1200
     * @tc.name      testExpressionsObjectInterface0012
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = 42
      // expressions in field values
      let a: A_in_11 = { age: v, adult: v >= 18 }
      expect(a.age == 42 && a.adult).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_1300
     * @tc.name      testExpressionsObjectInterface0013
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = 42
      // expressions in field values
      let a: A_in_12 = { fld1: v++, fld2: v++, fld3: v++ }
      expect(v == 45 && a.fld1 == 42 && a.fld2 == 43 && a.fld3 == 44).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_1400
     * @tc.name      testExpressionsObjectInterface0014
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = "John"
      // expressions in field values
      let a: A_in_13 = { first_name: fn, last_name: ln_in_13(), full_name: fn + " " + ln_in_13() }
      expect(a.full_name == "John Smith").assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_1500
     * @tc.name      testExpressionsObjectInterface0015
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_in_14 = { age: 42 }
      expect(a instanceof A_in_14).assertTrue()
      expect(a.age).assertEqual(42)
      expect(a.name).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_1600
     * @tc.name      testExpressionsObjectInterface0016
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_in_15 = { name: 'John', func: (input: string) => { return input + input } }
      expect('JohnJohn').assertEqual(a.func('John'))
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_1700
     * @tc.name      testExpressionsObjectInterface0017
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: I_in_16 = {
        c1: 2,
        c2: 'c2',
        foo(f: number): string|number {
            return f - 1
        }
      }
      expect(c.c1).assertEqual(2)
      expect(c.c2).assertEqual('c2')
      expect(c.foo(1)).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_1800
     * @tc.name      testExpressionsObjectInterface0018
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: I_in_17 = {
        c1: 2,
        c2: 'c2'
      }
      expect(c.c1).assertEqual(2)
      expect(c.c2).assertEqual('c2')
      expect(c.foo(1)).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_1900
     * @tc.name      testExpressionsObjectInterface0019
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: I_in_18 = {
        c1: 2,
        c2: 'c2',
        foo(f: number): string|number {
            return f - 1
        }
      }
      expect(c.c1).assertEqual(2)
      expect(c.c2).assertEqual('c2')
      expect(c.foo(1)).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_2000
     * @tc.name      testExpressionsObjectInterface0020
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: I_in_19 = {
        c1: { a: 'aa'},
        c2: { a: 'aaa', b: 'bb'}
      }
      expect(c.c1.a).assertEqual('aa')
      expect(c.c2.a).assertEqual('aaa')
      expect(c.c2.b).assertEqual('bb')
      expect(c.foo(c.c2)).assertEqual('aaa')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_2100
     * @tc.name      testExpressionsObjectInterface0021
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: I_in_20 = {
        c1: { a: 'aa'},
        c2: { a: 'aaa', b: 'bb'},
        foo(f: A_cls_in_20): string {
            return f.a
        }
      }
      expect(c.c1.a).assertEqual('aa')
      expect(c.c2.a).assertEqual('aaa')
      expect(c.c2.b).assertEqual('bb')
      expect(c.foo(c.c2)).assertEqual('aaa')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_2200
     * @tc.name      testExpressionsObjectInterface0022
     * @tc.desc      If the interface type I is inferred from the context, then the type of the object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: I_in_21 = {
        c1: { a: 'aa'},
        c2: { a: 'aaa', b: 'bb'},
        foo(f: A_cls_in_21): string {
            return f.a
        }
      }
      expect(c.c1.a).assertEqual('aa')
      expect(c.c2.a).assertEqual('aaa')
      expect(c.c2.b).assertEqual('bb')
      expect(c.foo(c.c2)).assertEqual('aaa')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_2300
     * @tc.name      testExpressionsObjectInterface0023
     * @tc.desc      Compilation no error when attempt to init fields out of order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Ordered_interface_composite_initialization_order = { four: "four",  three: "three", two: "two", one: "one"}

      expect(a.one).assertEqual("one")
      expect(a.two).assertEqual("two")
      expect(a.three).assertEqual("three")
      expect(a.four).assertEqual("four")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_2400
     * @tc.name      testExpressionsObjectInterface0024
     * @tc.desc      If the interface type I is inferred from the context, then type of an object
     *               literal is an anonymous class implicitly created for interface I.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Person_spec_ex1 = {name: "Bob", age: 25}
      expect(p.age).assertEqual(25)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_2500
     * @tc.name      testExpressionsObjectInterface0025
     * @tc.desc      Only an object literal of interface type can contain object literal methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ii: ILiteral_spec_ex2_1_1 = { foo(input: int): int { return input }, name: 'Alice' }
      expect(42).assertEqual(ii.foo(42))
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_2600
     * @tc.name      testExpressionsObjectInterface0026
     * @tc.desc      Only an object literal of interface type can contain object literal methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ii: ILiteral_spec_ex2_1_2 = { name: 'Alice' }
      expect(21).assertEqual(ii.foo(21))
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_2700
     * @tc.name      testExpressionsObjectInterface0027
     * @tc.desc      Only an object literal of interface type can contain object literal methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ii: ILiteral_spec_ex2_1_3 = { foo(input: int): int { return input * 2 }, name: 'Alice' }
      expect(42).assertEqual(ii.foo(21))
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_2800
     * @tc.name      testExpressionsObjectInterface0028
     * @tc.desc      If some interface properties are of an optional type, then such properties can
     *               be skipped in an object literal, their values are set to undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Person_spec_ex3 = {name: "Bob", age: 25}
      expect(b.sex).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_2900
     * @tc.name      testExpressionsObjectInterface0029
     * @tc.desc      If an interface has accessors for some property, and the property is used in
     *               an object literal, then a compile-time error does not occurs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: I2_spec_ex5 = {attr: 42}
      expect(b.attr).assertEqual(42)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_INTERFACE_3000
     * @tc.name      testExpressionsObjectInterface0030
     * @tc.desc      If an interface has a method implementation, then its object literal can optionally
     *               provide a new method implementation. Otherwise, the interface implementation is
     *               used
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectInterface0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i1: I_spec_ex6 = {}
      const i2: I_spec_ex6 = {
        method(): number { return 2 }
      }
      expect(i1.method()).assertEqual(1)
      expect(i2.method()).assertEqual(2)
    });
  });
}