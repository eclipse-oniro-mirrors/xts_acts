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
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level,
  expect
} from "../../../../../../hypium"


//  (从30)
// 函数定义
function foo_0<T, U>(p: T, q: U): [T, U] {
    return [p, q]
}

function foo_1<T, U>(p: T, q: U): T|U {
    return (p! as object).toString() > (q! as object).toString() ? p : q
}

function bar_2<T>(p: T): Array<T> {
    let x = Array.create<T>(5, p)
    return x
}
function foo_2<T, U>(p: T, q: U): [Array<T>, Array<U>] {
    return [bar_2(p), bar_2(q)]
}

class A_3 {}
class B_3 extends A_3 {}
function foo_3<T extends U, U extends Object>(p: T, q: U): boolean {
    return p.toString() + q.toString() > ""
}

class A_4 {}
class B_4 extends A_4 {}
class C_4 extends A_4 {}
function foo_4<T extends B_4|C_4, U extends number|never|B_4|null|boolean>(p: T, q: U): boolean {
    return "" + p + q > ""
}

function foo_5<T>(p: T, q: T): T {
    return p ?? q
}

function foo_6<T>(p: T): T {
    return p
}

function foo1_7(): number { return 1 }

// 类型定义
type X_8 = Array<Int>
function foo_8<T>(this: X_8, el: int): T {
    return this[el] as T
}
function bar_8<T>(this: X_8, el: int): T {
    let x1: T = this.foo_8<T>(el)
    return x1
}

// 类定义
class Cls_9 {
    foo<T, U>(p: T, q: U): [T, U] {
        return [p, q]
    }
}

class Bar_10 {
  static bar<T>(p: T): Array<T> {
    let x = Array.create<T>(5, p); // 创建一个长度为5的数组， 将数组中的所有元素填充为 `p`
    return x;
  }
}
class Foo_10 {
    foo<T, U>(p: T, q: U): [Array<T>, Array<U>] {
        return [Bar_10.bar(p), Bar_10.bar(q)]
    }
}

class Cls_11 {
    foo<T extends U, U extends Object>(p: T, q: U): boolean {
        return p.toString() + q.toString() > ""
    }
}

class Cls_12 {
    foo<T extends B_4|C_4, U extends number|never|B_4|null|boolean>(p: T, q: U): boolean {
        return "" + p + q > ""
    }
}

class Cls_13 {
    foo<T>(p: T, q: T): T {
        return p ?? q
    }
}

class Cls_14 {
    foo<T>(p: T): T {
        return p
    }
}
class Cls_15 {
  foo<T>(p: T): T {
    return p
  }
}
function foo1_15(): number { return 1 }

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericImplicitInstantiationsTest() {
  describe("GenericImplicitInstantiationsTest", () => {
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
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_0100
     * @tc.name      testGenericInstantiationsImplicit0001
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_0(1.0, true);
      expect(z instanceof object && z[0] instanceof number && z[1] instanceof boolean).assertTrue();
      expect(z[0] == 1.0 && z[1]).assertTrue();

      let y = foo_0(new Error(), "abc");
      expect(y instanceof object && y[0] instanceof object && y[1] instanceof string).assertTrue();
      expect(y[0] instanceof Error && y[1] == "abc").assertTrue();

      let x = foo_0(z, y);
      expect(x[0][0] == 1.0 && x[0][1] && x[1][0] instanceof Error && x[1][1] == "abc").assertTrue();

      let w = foo_0(null, undefined);
      expect(w[0] === null && w[1] === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_0200
     * @tc.name      testGenericInstantiationsImplicit0002
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo_0((p: number): number => p * p, (p: number): number => p + p);
      expect(v[0](5.0) == 25.0 && v[1](42.0) == 84.0).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_0300
     * @tc.name      testGenericInstantiationsImplicit0003
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo_1(1.0, 11.0);
      expect(v as number).assertEqual(11.0);

      let w = foo_1(["a", "b", "c", "d"], [1, 2]);
      expect((w as string[]).length == 4).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_0400
     * @tc.name      testGenericInstantiationsImplicit0004
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new Error();
      let z = foo_2(42.0f, err);
      expect(z[0][0] == 42.0f && z[0][4] == 42.0f && z[1][0] == err && z[1][4] == err).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_0500
     * @tc.name      testGenericInstantiationsImplicit0005
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_3(new Object(), new Object())).assertTrue();
      expect(foo_3(new A_3(), new Object())).assertTrue();
      expect(foo_3(new B_3(), new Object())).assertTrue();
      expect(foo_3(new A_3(), new A_3())).assertTrue();
      expect(foo_3(new B_3(), new A_3())).assertTrue();
      expect(foo_3(new B_3(), new B_3())).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_0600
     * @tc.name      testGenericInstantiationsImplicit0006
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_4(new C_4(), true)).assertTrue();
      expect(foo_4(new B_4(), new B_4())).assertTrue();
      expect(foo_4(new C_4(), 42.0)).assertTrue();
      expect(foo_4(new B_4(), null)).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_0700
     * @tc.name      testGenericInstantiationsImplicit0007
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Object();
      let b = "abc";
      expect(foo_5(a, b) instanceof String).assertFalse();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_0800
     * @tc.name      testGenericInstantiationsImplicit0008
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = "a";
      let b = "b";
      expect(foo_5<string>(a, b)).assertEqual("a");
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_0900
     * @tc.name      testGenericInstantiationsImplicit0009
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_5<string>("a", "b")).assertEqual("a");
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_1000
     * @tc.name      testGenericInstantiationsImplicit0010
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: [number, string] = [1, "abc"];
      let z = foo_6(arg);
      expect(z[0] instanceof number).assertTrue();
      expect(z[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_1100
     * @tc.name      testGenericInstantiationsImplicit0011
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: FixedArray<number> = [1];
      let z = foo_6(arg);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_1200
     * @tc.name      testGenericInstantiationsImplicit0012
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: Any = null;
      let z = foo_6(arg);
      expect(z instanceof Any).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_1300
     * @tc.name      testGenericInstantiationsImplicit0013
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_6(123n);
      expect(z instanceof bigint).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_1400
     * @tc.name      testGenericInstantiationsImplicit0014
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: "aa" | "bb" = "aa";
      let z = foo_6(arg);
      expect(z instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_1500
     * @tc.name      testGenericInstantiationsImplicit0015
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_6(foo1_7);
      expect(z() instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_1600
     * @tc.name      testGenericInstantiationsImplicit0016
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_6(undefined);
      expect(z === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_1700
     * @tc.name      testGenericInstantiationsImplicit0017
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = foo_6(null);
      expect(z === null).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_1800
     * @tc.name      testGenericInstantiationsImplicit0018
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: Array<number> = [1];
      let z = foo_6(arg);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_1900
     * @tc.name      testGenericInstantiationsImplicit0019
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: number[] = [1];
      let z = foo_6(arg);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_2000
     * @tc.name      testGenericInstantiationsImplicit0020
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: X_8 = [1, 2, 3];
      let res = x.bar_8<int>(1);
      expect(res).assertEqual(2);
      expect(res instanceof int).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_2100
     * @tc.name      testGenericInstantiationsImplicit0021
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_9();
      let z = cls.foo(1.0, true);
      expect(z instanceof object && z[0] instanceof number && z[1] instanceof boolean).assertTrue();
      expect(z[0] == 1.0 && z[1]).assertTrue();

      let y = cls.foo(new Error(), "abc");
      expect(y instanceof object && y[0] instanceof object && y[1] instanceof string).assertTrue();
      expect(y[0] instanceof Error && y[1] == "abc").assertTrue();

      let x = cls.foo(z, y);
      expect(x[0][0] == 1.0 && x[0][1] && x[1][0] instanceof Error && x[1][1] == "abc").assertTrue();

      let w = cls.foo(null, undefined);
      expect(w[0] === null && w[1] === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_2200
     * @tc.name      testGenericInstantiationsImplicit0022
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_9();
      let v = cls.foo((p: number): number => p * p, (p: number): number => p + p);
      expect(v[0](5.0) == 25.0 && v[1](42.0) == 84.0).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_2300
     * @tc.name      testGenericInstantiationsImplicit0023
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_9();

      let v = cls.foo(1.0, 11.0);
      expect(v[1]).assertEqual(11.0);

      let w = cls.foo(["a", "b", "c", "d"], [1, 2]);
      expect(w[0].length == 4).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_2400
     * @tc.name      testGenericInstantiationsImplicit0024
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new Error();
      let z = new Foo_10().foo(42.0f, err);
      expect(z[0][0] == 42.0f && z[0][4] == 42.0f && z[1][0] == err && z[1][4] == err).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_2500
     * @tc.name      testGenericInstantiationsImplicit0025
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_11();
      expect(cls.foo(new Object(), new Object())).assertTrue();
      expect(cls.foo(new A_3(), new Object())).assertTrue();
      expect(cls.foo(new B_3(), new Object())).assertTrue();
      expect(cls.foo(new A_3(), new A_3())).assertTrue();
      expect(cls.foo(new B_3(), new A_3())).assertTrue();
      expect(cls.foo(new B_3(), new B_3())).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_2600
     * @tc.name      testGenericInstantiationsImplicit0026
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_12();
      expect(cls.foo(new C_4(), true)).assertTrue();
      expect(cls.foo(new B_4(), new B_4())).assertTrue();
      expect(cls.foo(new C_4(), 42.0)).assertTrue();
      expect(cls.foo(new B_4(), null)).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_2700
     * @tc.name      testGenericInstantiationsImplicit0027
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_13();
      let a = new Object();
      let b = "abc";
      expect(cls.foo(a, b) instanceof String).assertFalse();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_2800
     * @tc.name      testGenericInstantiationsImplicit0028
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_13();
      let a = "a";
      let b = "b";
      expect(cls.foo<string>(a, b)).assertEqual("a");
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_2900
     * @tc.name      testGenericInstantiationsImplicit0029
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_13();
      expect(cls.foo<string>("a", "b")).assertEqual("a");
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_3000
     * @tc.name      testGenericInstantiationsImplicit0030
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: [number, string] = [1, "abc"];
      let z = new Cls_14().foo(arg);
      expect(z[0] instanceof number).assertTrue();
      expect(z[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_3100
     * @tc.name      testGenericInstantiationsImplicit0031
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: FixedArray<number> = [1];
      let z = new Cls_15().foo(arg);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_3200
     * @tc.name      testGenericInstantiationsImplicit0032
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: Any = null;
      let z = new Cls_15().foo(arg);
      expect(z instanceof Any).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_3300
     * @tc.name      testGenericInstantiationsImplicit0033
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_15().foo(123n);
      expect(z instanceof bigint).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_3400
     * @tc.name      testGenericInstantiationsImplicit0034
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: "aa" | "bb" = "aa";
      let z = new Cls_15().foo(arg);
      expect(z instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_3500
     * @tc.name      testGenericInstantiationsImplicit0035
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_15().foo(foo1_15);
      expect(z() instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_3600
     * @tc.name      testGenericInstantiationsImplicit0036
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_15().foo(undefined);
      expect(z === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_3700
     * @tc.name      testGenericInstantiationsImplicit0037
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_15().foo(null);
      expect(z === null).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_3800
     * @tc.name      testGenericInstantiationsImplicit0038
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: Array<number> = [1];
      let z = new Cls_15().foo(arg);
      expect(z[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_IMPLICIT_3900
     * @tc.name      testGenericInstantiationsImplicit0039
     * @tc.desc      In an implicit instantiation, type arguments are not specified explicitly. Such
     *               type arguments are inferred from the context the generic is referred in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiationsImplicit0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arg: number[] = [1];
      let z = new Cls_15().foo(arg);
      expect(z[0] instanceof number).assertTrue();
    })
  });
}