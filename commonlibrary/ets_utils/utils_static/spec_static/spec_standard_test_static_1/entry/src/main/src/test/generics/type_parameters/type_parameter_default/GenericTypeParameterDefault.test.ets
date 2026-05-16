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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../../hypium';
class SomeTypeType1 {}
type SomeType1 = SomeTypeType1
class OtherTypeType1 {}
type OtherType1 = OtherTypeType1

interface BaseType<T = SomeType1> {}
type Base<T = SomeType1> = BaseType<T>
class DerivedType1 implements Base {}
type Derived1 = DerivedType1

class SomeTypeType2 {}
type SomeType2 = SomeTypeType2
class OtherTypeType2 {}
type OtherType2 = OtherTypeType2

interface BaseType2<T = SomeType2> {}
type Base2<T = SomeType2> = BaseType2<T>
class DerivedType2 implements Base2<OtherType2> {}
type Derived2 = DerivedType2

class SomeTypeType3 {}
type SomeType3 = SomeTypeType3
class OtherTypeType3 {}
type OtherType3 = OtherTypeType3

interface BaseType3<T = SomeType3> {}
type Base3<T = SomeType3> = BaseType3<T>
class DerivedType3<T = OtherType3> implements Base3<T> {}
type Derived3<T = OtherType3> = DerivedType3<T>

class SomeTypeType4 {}
type SomeType4 = SomeTypeType4
class OtherTypeType4 {}
type OtherType4 = OtherTypeType4

interface BaseType4<T = SomeType4, U = OtherType4> {}
type Base4<T = SomeType4, U = OtherType4> = BaseType4<T, U>
class DerivedType4 implements Base4 {}
type Derived4 = DerivedType4

class SomeTypeType5 {}
type SomeType5 = SomeTypeType5
class OtherTypeType5 {}
type OtherType5 = OtherTypeType5

interface BaseType5<T, U = OtherType5> {}
type Base5<T, U = OtherType5> = BaseType5<T, U>
class DerivedType5 implements Base5<SomeType5> {}
type Derived5 = DerivedType5

class SomeTypeType6 {}
type SomeType6 = SomeTypeType6
class OtherTypeType6 {}
type OtherType6 = OtherTypeType6

interface BaseType6<T, U = OtherType6> {}
type Base6<T, U = OtherType6> = BaseType6<T, U>
class DerivedType6 implements Base6<OtherType6, SomeType6> {}
type Derived6 = DerivedType6

class SomeTypeType7 {}
type SomeType7 = SomeTypeType7
class OtherTypeType7 {}
type OtherType7 = OtherTypeType7

interface BaseType7<T, U = OtherType7> {}
type Base7<T, U = OtherType7> = BaseType7<T, U>
class DerivedType7<V> implements BaseType7<V> {}
type Derived7<T> = DerivedType7<T>

class SomeTypeType8 {}
type SomeType8 = SomeTypeType8
class OtherTypeType8 {}
type OtherType8 = OtherTypeType8

interface BaseType8<T = BaseType8<SomeType8>> {}
type Base8<T = BaseType8<SomeType8>> = BaseType8<T>
class DerivedType8 implements Base8 {}
type Derived8 = DerivedType8

class SomeTypeType9 {}
type SomeType9 = SomeTypeType9
class OtherTypeType9 {}
type OtherType9 = OtherTypeType9

interface BaseType9<T, U = SomeType9, V = OtherType9> {}
type Base9<T, U = SomeType9, V = OtherType9> = BaseType9<T, U, V>

class SomeTypeType10 {}
type SomeType10 = SomeTypeType10
class OtherTypeType10 {}
type OtherType10 = OtherTypeType10

interface BaseType10<in T, in U = SomeType10, out V = OtherType10> {}
type Base10<T, U = SomeType10, V = OtherType10> = BaseType10<T, U, V>

class SomeTypeType11 {}
type SomeType11 = SomeTypeType11
class OtherTypeType11 {}
type OtherType11 = OtherTypeType11

class BaseType11<T = SomeType11> {}
type Base11<T = SomeType11> = BaseType11<T>
class DerivedType11 extends Base11 {}
type Derived11 = DerivedType11

class SomeTypeType12 {}
type SomeType12 = SomeTypeType12
class OtherTypeType12 {}
type OtherType12 = OtherTypeType12

class BaseType12<T = SomeType12> {}
type Base12<T = SomeType12> = BaseType12<T>
class DerivedType12 extends Base12<OtherType12> {}
type Derived12 = DerivedType12

class SomeTypeType13 {}
type SomeType13 = SomeTypeType13
class OtherTypeType13 {}
type OtherType13 = OtherTypeType13

class BaseType13<T = SomeType13> {}
type Base13<T = SomeType13> = BaseType13<T>
class DerivedType13<T = OtherType13> extends Base13<T> {}
type Derived13 = DerivedType13

class SomeTypeType14 {}
type SomeType14 = SomeTypeType14
class OtherTypeType14 {}
type OtherType14 = OtherTypeType14

class BaseType14<T = SomeType14, U = OtherType14> {}
type Base14<T = SomeType14, U = OtherType14> = BaseType14<T, U>
class DerivedType14 extends Base14 {}
type Derived14 = DerivedType14

class SomeTypeType15 {}
type SomeType15 = SomeTypeType15
class OtherTypeType15 {}
type OtherType15 = OtherTypeType15

class BaseType15<T, U = OtherType15> {}
type Base15<T, U = OtherType15> = BaseType15<T, U>
class DerivedType15 extends Base15<SomeType15> {}
type Derived15 = DerivedType15

class SomeTypeType16 {}
type SomeType16 = SomeTypeType16
class OtherTypeType16 {}
type OtherType16 = OtherTypeType16

class BaseType16<T, U = OtherType16> {}
type Base16<T, U> = BaseType16<T, U>
class DerivedType16 extends Base16<OtherType16, SomeType16> {}
type Derived16 = DerivedType16

class SomeTypeType17 {}
type SomeType17 = SomeTypeType17
class OtherTypeType17 {}
type OtherType17 = OtherTypeType17

class BaseType17<T, U = OtherType17> {}
type Base17<T> = BaseType17<T>
class DerivedType17<V> extends Base17<V> {}
type Derived17<T> = DerivedType17<T>

class SomeTypeType18 {}
type SomeType18 = SomeTypeType18
class OtherTypeType18 {}
type OtherType18 = OtherTypeType18

class BaseType18<T = BaseType18<SomeType18>> {}
type Base18<T = BaseType18<SomeType18>> = BaseType18<T>
class DerivedType18 extends Base18 {}
type Derived18 = DerivedType18

class SomeTypeType19 {}
type SomeType19 = SomeTypeType19
class OtherTypeType19 {}
type OtherType19 = OtherTypeType19

interface BaseType19<T, U = SomeType19, V = OtherType19> {}
type Base19<T, U = SomeType19, V = OtherType19> = BaseType19<T, U, V>

class C {
  foo<T, U = string>(a: T, b: U): T {
    return a
  }
}
function foo<T, U = string>(a: T, b: U): T {
  return a
}
class ImplBaseType9 implements BaseType9<number> {}
class ImplBaseType9_2 implements BaseType9<number, OtherType9> {}
class ImplBaseType9_3 implements BaseType9<number, Object, SomeType9> {}
class ImplBaseType10 implements BaseType10<number> {}
class ImplBaseType10_2 implements BaseType10<number, OtherType10> {}

class ImplBaseType19 implements BaseType19<SomeType19> {}
class ImplBaseType19_2 implements BaseType19<SomeType19, OtherType19> {}
class ImplBaseType19_3 implements BaseType19<SomeType19, Object, OtherType19> {}
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function GenericTypeParameterDefaultTest() {
  describe("GenericTypeParameterDefaultTest", () => {
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
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_0100
     * @tc.name      testGenericTypeParameterDefault0001
     * @tc.desc      Test for type_alias_i_type_parameter_default_0.js & 1.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived1()
      expect(a instanceof BaseType).assertTrue()
      // Verify type compatibility by assigning to a variable of the expected default type
      let baseA: BaseType<SomeType1> = a;
      expect(baseA instanceof BaseType).assertTrue()
      let b = new Derived2()
      expect(b instanceof BaseType2).assertTrue()
      let baseB: BaseType2<OtherType2> = b;
      expect(baseB instanceof BaseType2).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_0200
     * @tc.name      testGenericTypeParameterDefault0002
     * @tc.desc      Test for type_alias_i_type_parameter_default_2.js & 3.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived3()
      expect(a instanceof BaseType3).assertTrue()
      let b = new Derived4()
      expect(b instanceof BaseType4).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_0300
     * @tc.name      testGenericTypeParameterDefault0003
     * @tc.desc      Test for type_alias_i_type_parameter_default_4.js & 5.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived5()
      expect(a instanceof BaseType5).assertTrue()
      let b = new Derived6()
      expect(b instanceof BaseType6).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_0400
     * @tc.name      testGenericTypeParameterDefault0004
     * @tc.desc      Test for type_alias_i_type_parameter_default_6.js & 7.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived7<SomeType7>()
      expect(a instanceof BaseType7).assertTrue()
      let b = new Derived8()
      expect(b instanceof BaseType8).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_0500
     * @tc.name      testGenericTypeParameterDefault0005
     * @tc.desc      Test for type_alias_i_type_parameter_default_8.js & 9.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base9<number> = new ImplBaseType9()
      let b: Base9<number, OtherType9> = new ImplBaseType9_2()
      let c: Base9<number, Object, SomeType9> = new ImplBaseType9_3()
      expect(a instanceof BaseType9).assertTrue()
      expect(b instanceof BaseType9).assertTrue()
      expect(c instanceof BaseType9).assertTrue()
      let d: Base10<number> = new ImplBaseType10()
      let e: Base10<number, OtherType10> = new ImplBaseType10_2()
      let f: Base10<number, Object, SomeType10> = {}
      expect(d instanceof BaseType10).assertTrue()
      expect(e instanceof BaseType10).assertTrue()
      expect(f instanceof BaseType10).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_0600
     * @tc.name      testGenericTypeParameterDefault0006
     * @tc.desc      Test for type_alias_type_parameter_default_0.js & 1.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived11()
      expect(a instanceof BaseType11).assertTrue()
      let b = new Derived12()
      expect(b instanceof BaseType12).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_0700
     * @tc.name      testGenericTypeParameterDefault0007
     * @tc.desc      Test for type_alias_type_parameter_default_2.js & 3.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived13()
      expect(a instanceof BaseType13).assertTrue()
      let b = new Derived14()
      expect(b instanceof BaseType14).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_0800
     * @tc.name      testGenericTypeParameterDefault0008
     * @tc.desc      Test for type_alias_type_parameter_default_4.js & 5.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived15()
      expect(a instanceof BaseType15).assertTrue()
      let b = new Derived16()
      expect(b instanceof BaseType16).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_0900
     * @tc.name      testGenericTypeParameterDefault0009
     * @tc.desc      Test for type_alias_type_parameter_default_6.js & 7.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Derived17<SomeType17>()
      expect(a instanceof BaseType17).assertTrue()
      let b = new Derived18()
      expect(b instanceof BaseType18).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_1000
     * @tc.name      testGenericTypeParameterDefault0010
     * @tc.desc      Test for type_alias_type_parameter_default_8.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ImplBaseType19()
      let b = new ImplBaseType19_2()
      let c = new ImplBaseType19_3()
      expect(a instanceof BaseType19).assertTrue()
      expect(b instanceof BaseType19).assertTrue()
      expect(c instanceof BaseType19).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_TYPE_PARAMETER_DEFAULT_1100
     * @tc.name      testGenericTypeParameterDefault0011
     * @tc.desc      Test for method_missing_non_default_parameter.js
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeParameterDefault0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C().foo(1, "s")).assertEqual(1)
      expect(foo(1, "s")).assertEqual(1)
    })
    
  })
}