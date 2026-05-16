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

class Cls_0<T, U> {
  a: T
  b: U
  constructor(a: T, b: U) {
    this.a = a
    this.b = b
  }
}

class Cls_1<T, U> {
  a: [T, U]
  constructor(a: T, b: U) {
    this.a = [a, b]
  }
}

class A_2<T>{
  a: T
  constructor(a: T) {
    this.a = a
  }
}

class B_2<T, U> extends A_2<T>{
  b: U
  constructor(a: T, b: U) {
    super(a)
    this.b = b
  }
}

class GenericClass<T> {
  a: T
  constructor(a: T) {
    this.a = a
  }
}

function foo_8(): number { return 1 }

interface I_12<T, U> {
  a: T
  b: U
}

function genericTwoParams<T, U>(p: T, q: U): [T, U] {
  return [p, q]
}

// 唯一逻辑函数
function foo_14<T, U>(p: T, q: U): T|U {
  return (p! as object).toString() > (q! as object).toString() ? p : q
}

function bar_15<T>(p: T): Array<T> {
  let x = Array.create<T>(5, p)
  return x
}

function foo_15<T, U>(p: T, q: U): [Array<T>, Array<U>] {
  return [bar_15(p), bar_15(q)]
}

// 所有重复空类 → 统一只保留一套
class BaseClass {}
class DerivedClass extends BaseClass {}
class C_17 extends BaseClass {}
class C_36 extends BaseClass {}

// 泛型约束函数
function foo_16<T extends U, U extends Object>(p: T, q: U): boolean {
  return p.toString() + q.toString() > ""
}

function foo_17<T extends DerivedClass | C_17, U extends number | never | DerivedClass | null | boolean>(p: T, q: U): boolean {
  return "" + p + q > ""
}

function genericOneParam<T>(p: T): T {
  return p
}

function foo1_26(): number { return 1 }

interface I_30<T, U> {
  a: [T, U]
}

interface A_31<T> {
  a: T
}

interface B_31<T, U> extends A_31<T> {
  b: U
}

class Cls_32 {
  foo<T, U>(p: T, q: U): [T, U] {
    return [p, q]
  }
}

class Cls_33 {
  foo<T, U>(p: T, q: U): T|U {
    return (p! as object).toString() > (q! as object).toString() ? p : q
  }
}

class Bar_34 {
  static bar<T>(p: T): Array<T> {
    let x = Array.create<T>(5, p)
    return x
  }
}

class Foo_34 {
  foo<T, U>(p: T, q: U): [Array<T>, Array<U>] {
    return [Bar_34.bar(p), Bar_34.bar(q)]
  }
}

class Cls_35 {
  foo<T extends U, U extends Object>(p: T, q: U): boolean {
    return p.toString() + q.toString() > ""
  }
}

class Cls_36 {
  foo<T extends DerivedClass | C_36, U extends number | never | DerivedClass | null | boolean>(p: T, q: U): boolean {
    return "" + p + q > ""
  }
}

class Cls_37 {
  foo<T>(p: T): T {
    return p
  }
}

class Base_30 {}
class Derived_30 extends Base_30 {}

interface BaseI_30 {}
interface DerivedI_30 extends BaseI_30 {}

function fooBase_30(d1: Derived_30, d2: Derived_30): Base_30 { return d1 }
type fooBaseType_30 = (d1: Derived_30, d2: Derived_30) => Base_30
function fooSubtype_30(d1: Derived_30, d2: Base_30): Derived_30 { return d1 }

function foo1_22(): number { return 1 }

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericInstantiationsTest() {
  describe("GenericInstantiationsTest", () => {
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
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_0100
     * @tc.name      testGenericInstantiations0001
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_0<number, string>(1, "abc");
      expect(cls.a instanceof number).assertTrue();
      expect(cls.b instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_0200
     * @tc.name      testGenericInstantiations0002
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_1<number, string>(1, "abc");
      expect(cls.a instanceof object).assertTrue();
      expect(cls.a[0] instanceof number).assertTrue();
      expect(cls.a[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_0300
     * @tc.name      testGenericInstantiations0003
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: B_2<number, string> = new B_2<number, string>(1, "abc");
      expect(cls.a instanceof number).assertTrue();
      expect(cls.b instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_0400
     * @tc.name      testGenericInstantiations0004
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<[number, string]>([1, "abc"]);
      expect(cls.a[0] instanceof number).assertTrue();
      expect(cls.a[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_0500
     * @tc.name      testGenericInstantiations0005
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<FixedArray<number>>([1]);
      expect(cls.a[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_0600
     * @tc.name      testGenericInstantiations0006
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<Any>(null);
      expect(cls.a instanceof Any).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_0700
     * @tc.name      testGenericInstantiations0007
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<bigint>(123n);
      expect(cls.a instanceof bigint).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_0800
     * @tc.name      testGenericInstantiations0008
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<"aa" | "bb">("aa");
      expect(cls.a instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_0900
     * @tc.name      testGenericInstantiations0009
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<() => number>(foo_8);
      expect(cls.a() instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_1000
     * @tc.name      testGenericInstantiations0010
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<undefined>(undefined);
      expect(cls.a === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_1100
     * @tc.name      testGenericInstantiations0011
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<Array<number>>([1]);
      expect(cls.a[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_1200
     * @tc.name      testGenericInstantiations0012
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<number[]>([1]);
      expect(cls.a[0] instanceof number).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_1300
     * @tc.name      testGenericInstantiations0013
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = genericTwoParams<number, boolean>(1.0, true);
      expect(z instanceof object && z[0] instanceof number && z[1] instanceof boolean).assertTrue();
      expect(z[0] == 1.0 && z[1]).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_1400
     * @tc.name      testGenericInstantiations0014
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo_14<double, double>(1.0, 11.0);
      expect(v as number).assertEqual(11.0);
      let w = foo_14<[string, string, string, string], [number, number]>(["a", "b", "c", "d"], [1, 2]);
      let x = foo_14<[string], [number, number]>(["a"], [1, 2]);
      expect(w instanceof object).assertTrue();
      expect(x instanceof object).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_1500
     * @tc.name      testGenericInstantiations0015
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new Error();
      let z = foo_15<float, Error>(42.0f, err);
      expect(z[0][0] == 42.0f && z[0][4] == 42.0f && z[1][0] == err && z[1][4] == err).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_1600
     * @tc.name      testGenericInstantiations0016
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_16<Object, Object>(new Object(), new Object())).assertTrue();
      expect(foo_16<BaseClass, Object>(new BaseClass(), new Object())).assertTrue();
      expect(foo_16<DerivedClass, Object>(new DerivedClass(), new Object())).assertTrue();
      expect(foo_16<BaseClass, BaseClass>(new BaseClass(), new BaseClass())).assertTrue();
      expect(foo_16<DerivedClass, BaseClass>(new DerivedClass(), new BaseClass())).assertTrue();
      expect(foo_16<DerivedClass, DerivedClass>(new DerivedClass(), new DerivedClass())).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_1700
     * @tc.name      testGenericInstantiations0017
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_17<C_17, boolean>(new C_17(), true)).assertTrue();
      expect(foo_17<DerivedClass, DerivedClass>(new DerivedClass(), new DerivedClass())).assertTrue();
      expect(foo_17<C_17, double>(new C_17(), 42.0)).assertTrue();
      expect(foo_17<DerivedClass, null>(new DerivedClass(), null)).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_1800
     * @tc.name      testGenericInstantiations0018
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I_12<number, string> = {a: 1, b: "abc"};
      expect(i.a instanceof number).assertTrue();
      expect(i.b instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_1900
     * @tc.name      testGenericInstantiations0019
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: I_30<number, string> = {a: [1, "abc"]};
      expect(i.a instanceof object).assertTrue();
      expect(i.a[0] instanceof number).assertTrue();
      expect(i.a[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_2000
     * @tc.name      testGenericInstantiations0020
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: B_31<number, string> = {a: 1, b: "abc"};
      expect(i.a instanceof number).assertTrue();
      expect(i.b instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_2100
     * @tc.name      testGenericInstantiations0021
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_32();
      let z = cls.foo<number, boolean>(1.0, true);
      expect(z instanceof object && z[0] instanceof number && z[1] instanceof boolean).assertTrue();
      expect(z[0] == 1.0 && z[1]).assertTrue();

      let y = cls.foo<Error, string>(new Error(), "abc");
      expect(y instanceof object && y[0] instanceof object && y[1] instanceof string).assertTrue();
      expect(y[0] instanceof Error && y[1] == "abc").assertTrue();

      let x = cls.foo<[Number, Boolean], [Error, string]>(z, y);
      expect(x[0][0] == 1.0 && x[0][1] && x[1][0] instanceof Error && x[1][1] == "abc").assertTrue();

      let w = cls.foo<null, undefined>(null, undefined);
      expect(w[0] === null && w[1] === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_2200
     * @tc.name      testGenericInstantiations0022
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_33();
      let v = cls.foo<number, number>(1.0, 11.0);
      expect(v as number).assertEqual(11.0);
      let w = cls.foo<[string, string, string, string], [number, number]>(["a", "b", "c", "d"], [1, 2]);
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_2300
     * @tc.name      testGenericInstantiations0023
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new Error();
      let z = new Foo_34().foo<float, Error>(42.0f, err);
      expect(z[0][0] == 42.0f && z[0][4] == 42.0f && z[1][0] == err && z[1][4] == err).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_2400
     * @tc.name      testGenericInstantiations0024
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_35();
      expect(cls.foo<Object, Object>(new Object(), new Object())).assertTrue();
      expect(cls.foo<BaseClass, Object>(new BaseClass(), new Object())).assertTrue();
      expect(cls.foo<DerivedClass, Object>(new DerivedClass(), new Object())).assertTrue();
      expect(cls.foo<BaseClass, BaseClass>(new BaseClass(), new BaseClass())).assertTrue();
      expect(cls.foo<DerivedClass, BaseClass>(new DerivedClass(), new BaseClass())).assertTrue();
      expect(cls.foo<DerivedClass, DerivedClass>(new DerivedClass(), new DerivedClass())).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_2500
     * @tc.name      testGenericInstantiations0025
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new Cls_36();
      expect(cls.foo<C_36, boolean>(new C_36(), true)).assertTrue();
      expect(cls.foo<DerivedClass, DerivedClass>(new DerivedClass(), new DerivedClass())).assertTrue();
      expect(cls.foo<C_36, double>(new C_36(), 42.0)).assertTrue();
      expect(cls.foo<DerivedClass, null>(new DerivedClass(), null)).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_2600
     * @tc.name      testGenericInstantiations0026
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z = new Cls_37().foo<[number, string]>([1, "abc"]);
      expect(z[0] instanceof number).assertTrue();
      expect(z[1] instanceof string).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_2700
     * @tc.name      testGenericInstantiations0027
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<Base_30>(new Derived_30());
      expect(cls.a instanceof Derived_30).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_INSTANTIATIONS_TEST_2800
     * @tc.name      testGenericInstantiations0028
     * @tc.desc      An explicit generic instantiation is a language construct, which provides a
     *               list of type arguments that specify real types or type parameters to substitute
     *               corresponding type parameters of a generic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericInstantiations0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = new GenericClass<fooBaseType_30>(fooSubtype_30);
      expect(cls.a instanceof fooBaseType_30).assertTrue();
    })
  });
}