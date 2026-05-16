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

function pass_through(value: Any): Any { return value }

let a1: undefined[] = [undefined, undefined]
let a2: null[] = [null, null]
let elem3: byte = 1
let a3: byte[] = [elem3, elem3]
let elem4: short = 1
let a4: short[] = [elem4, elem4]
let a5: int[] = [1, 1]
let a6: long[] = [2147483648, 2147483648]
let a7: float[] = [1.0f, 1.0f]
let a8: double[] = [1.0, 1.0]
let a9: bigint[] = [1n, 1n]
let a10: boolean[] = [true, false]
let a11: char[] = [c'a', c'a']
let a12: string[] = ["string", "string"]
let elem13: Object = new Object()
let a13: Object[] = [elem13, elem13]
let a14: 'aa'[] = ["aa", "aa"]
class A {}
let elem15: A = new A
let a15: A[] = [elem15, elem15]
interface I {}
class A1 implements I {}
let elem16: I = new A1
let a16: I[] = [elem16, elem16]
let elem21: Any = null
let a21 = [elem21, elem21]
let a22 = [undefined, undefined]
let a28 = [1.0f, 1.0f]
let a32 = [c'a', c'a']
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
type my_type5 = null[]
type my_type6 = Array<null>
interface I8<T> {}
interface J<T> {}
class A17<T> implements I8<T> {}
class B<T> extends A17<T> implements J<T> {}
class C<T> {}
class D<T> extends C<T> {}


let c: C<int>
enum Rating1: double { A = 1.0, B = 1.5 }
enum Rating2: double { A = 1.0, B = 1.5 }
enum Rating3: double { A = 1.0, B = 1.5 }
let a95: Record<string, int> = { '1': 1 }
let a96: Record<string, int> = { '1': 1 }
interface I9 {}
interface J1 {}
class A19 implements I9 {}
class B1 extends A19 implements J1 {}
class C1 {}
class D1 extends C1 {}
let a97: A19
let b2: B1
let i2: I9
let j2: J1
let c2: C1
let d2: D1
type T3 = (x: Object) => string
let func2: T3
type T4 = (x: number[]) => null
let func3: T4
type T5 = (x: number, y: string) => undefined
let func4: T5

func2 = (x: Object) => { return "s" }
func3 = (x: number[]) => {}
func4 = (x: number, y: string) => { return undefined }

type T6 = (x: number, y: string) => undefined
let func5: T6
type T7 = (x: number, y: string) => undefined
let func6: T7
class Parent1 {}
class Child1 extends Parent1 {}
class GrandChild1 extends Child1 {}
type T8 = (x: Parent1, y?: Child1, z?: GrandChild1) => GrandChild1
let func7: T8
class Parent2 {}
class Child2 extends Parent2 {}
class GrandChild2 extends Child2 {}
type T9 = (x: Parent2, y?: Child2, z?: GrandChild2) => GrandChild2
let func8: T9
class Parent3 {}
class Child3 extends Parent3 {}
class GrandChild3 extends Child3 {}
type T10 = (x: Parent3, y?: Child3, z?: GrandChild3) => GrandChild3
let func9: T10
class Parent4 {}
class Child4 extends Parent4 {}
class GrandChild4 extends Child4 {}
type T11 = (x: Parent4, y?: Child4, z?: GrandChild4) => GrandChild4
let func10: T11
class Parent5 {}
class Child5 extends Parent5 {}
class GrandChild5 extends Child5 {}
type T12 = (x: Parent5, y?: Child5, z?: GrandChild5) => GrandChild5
let func11: T12
class Parent6 {}
class Child6 extends Parent6 {}
class GrandChild6 extends Child6 {}
type T13 = (x: Parent6, y?: Child6, z?: GrandChild6) => GrandChild6
let func12: T13
class Parent7 {}
class Child7 extends Parent7 {}
class GrandChild7 extends Child7 {}
type T14 = (x: Parent7, y?: Child7, z?: GrandChild7) => GrandChild7
let func13: T14
class Parent8 {}
class Child8 extends Parent8 {}
class GrandChild8 extends Child8 {}
type T15 = (x: Parent8, y?: Child8, z?: GrandChild8) => GrandChild8
let func14: T15
type T20 = (x: boolean, ...y: Object[]) => Object
let func19: T20
type T21 = (x: boolean, ...y: Object[]) => Object
let func20: T21
type T22 = (x: boolean, ...y: Object[]) => Object
let func21: T22
type T23 = (x: boolean, ...y: Object[]) => Object
let func22: T23
type T24 = (x: boolean, ...y: Object[]) => Object
let func23: T24
type T25 = (x: Array<number>, y: string, z: null) => undefined
let func24: T25
type T26 = (x: Array<number>, y: string, z: null) => undefined
let func25: T26
type T27 = (x: Array<number>, y: string, z: null) => undefined
let func26: T27
type T28 = (x: Array<number>, y: string, z: null) => undefined
let func27: T28
type T29 = (x: [int, string]) => [string, int]
let func28: T29
type T30 = (x: [int, string]) => [string, int]
let func29: T30
type T31 = (x: [int, string]) => [string, int]

func5 = (x: number, y: string) => { return undefined }
func6 = (x: number, y: string) => { return undefined }
func7 = (x: Parent1, y?: Child1, z?: GrandChild1) => { return new GrandChild1() }
func8 = (x: Parent2, y?: Child2, z?: GrandChild2) => { return new GrandChild2() }
func9 = (x: Parent3, y?: Child3, z?: GrandChild3) => { return new GrandChild3() }
func10 = (x: Parent4, y?: Child4, z?: GrandChild4) => { return new GrandChild4() }
func11 = (x: Parent5, y?: Child5, z?: GrandChild5) => { return new GrandChild5() }
func12 = (x: Parent6, y?: Child6, z?: GrandChild6) => { return new GrandChild6() }
func13 = (x: Parent7, y?: Child7, z?: GrandChild7) => { return new GrandChild7() }
func14 = (x: Parent8, y?: Child8, z?: GrandChild8) => { return new GrandChild8() }
func19 = (x: boolean, ...y: Object[]) => { return new Object() }
func20 = (x: boolean, ...y: Object[]) => { return new Object() }
func21 = (x: boolean, ...y: Object[]) => { return new Object() }
func22 = (x: boolean, ...y: Object[]) => { return new Object() }
func23 = (x: boolean, ...y: Object[]) => { return new Object() }
func24 = (x: Array<number>, y: string, z: null) => { return undefined }
func25 = (x: Array<number>, y: string, z: null) => { return undefined }
func26 = (x: Array<number>, y: string, z: null) => { return undefined }
func27 = (x: Array<number>, y: string, z: null) => { return undefined }
func28 = (x: [int, string]) => { return [x[1], x[0]] }
func29 = (x: [int, string]) => { return [x[1], x[0]] }
interface IName1 { name: string }
class Holder1<X> {}
enum Color6 { Red, Green, Blue }
type AStringAlias1 = string

type TT3 = null
type FC3 = (input: TT3) => Any
class Pass3 {
  static pass(input: TT3): TT3 { return input }
  dpass(input: TT3): TT3 { return input }
}
function returnAsAny3(input: TT3): Any { return input }
let test3: TT3 = null

type TT4 = int
type FC4 = (input: TT4) => Any
class Pass4 {
  static pass(input: TT4): TT4 { return input }
  dpass(input: TT4): TT4 { return input }
}
function returnAsAny4(input: TT4): Any { return input }
let test4: TT4 = 333

type TT5 = bigint
type FC5 = (input: TT5) => Any
class Pass5 {
  static pass(input: TT5): TT5 { return input }
  dpass(input: TT5): TT5 { return input }
}
function returnAsAny5(input: TT5): Any { return input }
let test5: TT5 = 12345678901234567878901234567890n

type TT6 = IName1
type FC6 = (input: TT6) => Any
class Pass6 {
  static pass(input: TT6): TT6 { return input }
  dpass(input: TT6): TT6 { return input }
}
function returnAsAny6(input: TT6): Any { return input }
let test6: TT6 = {name: 'Bob'}

type TT7 = string
type FC7 = (input: TT7) => Any
class Pass7 {
  static pass(input: TT7): TT7 { return input }
  dpass(input: TT7): TT7 { return input }
}
function returnAsAny7(input: TT7): Any { return input }
let test7: TT7 = 'Hello world'

type TT8 = Pass8
type FC8 = (input: TT8) => Any
class Pass8 {
  static pass(input: TT8): TT8 { return input }
  dpass(input: TT8): TT8 { return input }
}
function returnAsAny8(input: TT8): Any { return input }
let test8: TT8 = new Pass8

type TT9 = Holder1<IName1>
type FC9 = (input: TT9) => Any
class Pass9 {
  static pass(input: TT9): TT9 { return input }
  dpass(input: TT9): TT9 { return input }
}
function returnAsAny9(input: TT9): Any { return input }
let test9: TT9 = new Holder1<IName1>

type TT10 = Color6
type FC10 = (input: TT10) => Any
class Pass10 {
  static pass(input: TT10): TT10 { return input }
  dpass(input: TT10): TT10 { return input }
}
function returnAsAny10(input: TT10): Any { return input }
let test10: TT10 = Color6.Red

type TT11 = FC11
type FC11 = (input: TT11) => Any
class Pass11 {
  static pass(input: TT11): TT11 { return input }
  dpass(input: TT11): TT11 { return input }
}
function returnAsAny11(input: TT11): Any { return input }
let test11: TT11 = returnAsAny11

type TT12 = string[]
type FC12 = (input: TT12) => Any
class Pass12 {
  static pass(input: TT12): TT12 { return input }
  dpass(input: TT12): TT12 { return input }
}
function returnAsAny12(input: TT12): Any { return input }
let test12: TT12 = ['One', 'Two', 'Three']

type TT13 = Array<number>
type FC13 = (input: TT13) => Any
class Pass13 {
  static pass(input: TT13): TT13 { return input }
  dpass(input: TT13): TT13 { return input }
}
function returnAsAny13(input: TT13): Any { return input }
let test13: TT13 = [1, 2, 3]

type TT14 = string | IName1
type FC14 = (input: TT14) => Any
class Pass14 {
  static pass(input: TT14): TT14 { return input }
  dpass(input: TT14): TT14 { return input }
}
function returnAsAny14(input: TT14): Any { return input }
let test14: TT14 = 'Hello world'

type TT15 = string | IName1
type FC15 = (input: TT15) => Any
class Pass15 {
  static pass(input: TT15): TT15 { return input }
  dpass(input: TT15): TT15 { return input }
}
function returnAsAny15(input: TT15): Any { return input }
let test15: TT15 = {name: 'Bob'}

type TT16 = [string, number]
type FC16 = (input: TT16) => Any
class Pass16 {
  static pass(input: TT16): TT16 { return input }
  dpass(input: TT16): TT16 { return input }
}
function returnAsAny16(input: TT16): Any { return input }
let test16: TT16 = ['Hello', 42]

type TT17 = readonly [string, number]
type FC17 = (input: TT17) => Any
class Pass17 {
  static pass(input: TT17): TT17 { return input }
  dpass(input: TT17): TT17 { return input }
}
function returnAsAny17(input: TT17): Any { return input }
let test17: TT17 = ['Hello', 42]

type TT18 = () => [string, number]
type FC18 = (input: TT18) => Any
class Pass18 {
  static pass(input: TT18): TT18 { return input }
  dpass(input: TT18): TT18 { return input }
}
function returnAsAny18(input: TT18): Any { return input }
let test18: TT18 = () => ['Hello', 42]

type TT19 = FixedArray<string>
type FC19 = (input: TT19) => Any
class Pass19 {
  static pass(input: TT19): TT19 { return input }
  dpass(input: TT19): TT19 { return input }
}
function returnAsAny19(input: TT19): Any { return input }
let test19: TT19 = ["a", "b", "c"]

type TT20 = Readonly<IName1>
type FC20 = (input: TT20) => Any
class Pass20 {
  static pass(input: TT20): TT20 { return input }
  dpass(input: TT20): TT20 { return input }
}
function returnAsAny20(input: TT20): Any { return input }
let test20: TT20 = {name: 'Bob'}

type TT21 = Partial<IName1>
type FC21 = (input: TT21) => Any
class Pass21 {
  static pass(input: TT21): TT21 { return input }
  dpass(input: TT21): TT21 { return input }
}
function returnAsAny21(input: TT21): Any { return input }
let test21: TT21 = {name: 'Bob'}

type TT22 = Partial<IName1>
type FC22 = (input: TT22) => Any
class Pass22 {
  static pass(input: TT22): TT22 { return input }
  dpass(input: TT22): TT22 { return input }
}
function returnAsAny22(input: TT22): Any { return input }
let test22: TT22 = {}

type TT23 = Required<IName1>
type FC23 = (input: TT23) => Any
class Pass23 {
  static pass(input: TT23): TT23 { return input }
  dpass(input: TT23): TT23 { return input }
}
function returnAsAny23(input: TT23): Any { return input }
let test23: TT23 = {name: 'Bob'}

type TT24 = Record<int, string>
type FC24 = (input: TT24) => Any
class Pass24 {
  static pass(input: TT24): TT24 { return input }
  dpass(input: TT24): TT24 { return input }
}
function returnAsAny24(input: TT24): Any { return input }
let test24: TT24 = {1: "1"}

type TT25 = Object
type FC25 = (input: TT25) => Any
class Pass25 {
  static pass(input: TT25): TT25 { return input }
  dpass(input: TT25): TT25 { return input }
}
function returnAsAny25(input: TT25): Any { return input }
let test25: TT25 = new Pass25

type TT26 = 'string literal'
type FC26 = (input: TT26) => Any
class Pass26 {
  static pass(input: TT26): TT26 { return input }
  dpass(input: TT26): TT26 { return input }
}
function returnAsAny26(input: TT26): Any { return input }
let test26: TT26 = 'string literal'

type TT27 = AStringAlias1
type FC27 = (input: TT27) => Any
class Pass27 {
  static pass(input: TT27): TT27 { return input }
  dpass(input: TT27): TT27 { return input }
}
function returnAsAny27(input: TT27): Any { return input }
let test27: TT27 = 'Hello world'

type TT28 = Char
type FC28 = (input: TT28) => Any
class Pass28 {
  static pass(input: TT28): TT28 { return input }
  dpass(input: TT28): TT28 { return input }
}
function returnAsAny28(input: TT28): Any { return input }
let test28: TT28 = c''

export default function ExpressionsInstanceThreeTest(): void {
  describe("ExpressionsInstanceThreeTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_0100
     * @tc.name      testExpressionsInstanceThree0001
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a95)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a95)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_0200
     * @tc.name      testExpressionsInstanceThree0002
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a96)() instanceof Record
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a96)() instanceof Record)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_0300
     * @tc.name      testExpressionsInstanceThree0003
     * @tc.desc      The result of an instanceof expression is true if the actual type of evaluated
     *               expr is a subtype of T (see Subtyping). Otherwise, the result is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a97 = new A19()
      expect(a97 instanceof A19).assertTrue()
      expect(a97 instanceof I9).assertTrue()
      expect(a97 instanceof B1).assertFalse()
      expect(a97 instanceof J1).assertFalse()

      a97 = new B1()
      expect(a97 instanceof A19).assertTrue()
      expect(a97 instanceof I9).assertTrue()
      expect(a97 instanceof B1).assertTrue()
      expect(a97 instanceof J1).assertTrue()

      i2 = new A19()
      expect(i2 instanceof A19).assertTrue()
      expect(i2 instanceof I9).assertTrue()
      expect(i2 instanceof B1).assertFalse()
      expect(i2 instanceof J1).assertFalse()

      i2 = new B1()
      expect(i2 instanceof A19).assertTrue()
      expect(i2 instanceof I9).assertTrue()
      expect(i2 instanceof B1).assertTrue()
      expect(i2 instanceof J1).assertTrue()

      b2 = new B1()
      expect(b2 instanceof A19).assertTrue()
      expect(b2 instanceof I9).assertTrue()
      expect(b2 instanceof B1).assertTrue()
      expect(b2 instanceof J1).assertTrue()

      j2 = new B1()
      expect(j2 instanceof A19).assertTrue()
      expect(j2 instanceof I9).assertTrue()
      expect(j2 instanceof B1).assertTrue()
      expect(j2 instanceof J1).assertTrue()

      c2 = new C1()
      d2 = new D1()
      expect(c2 instanceof C1).assertTrue()
      expect(d2 instanceof D1).assertTrue()
      expect(d2 instanceof C1).assertTrue()
      expect(c2 instanceof D1).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_0400
     * @tc.name      testExpressionsInstanceThree0004
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func2 instanceof ((x: Object) => string)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_0500
     * @tc.name      testExpressionsInstanceThree0005
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func2 instanceof ((x: string) => Object)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_0600
     * @tc.name      testExpressionsInstanceThree0006
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func2 instanceof ((x: Object) => 'a')).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_0700
     * @tc.name      testExpressionsInstanceThree0007
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func2 instanceof ((x: Any) => Object)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_0800
     * @tc.name      testExpressionsInstanceThree0008
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func2 instanceof ((x?: Object) => string)).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_0900
     * @tc.name      testExpressionsInstanceThree0009
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func2 instanceof (() => string)).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_1000
     * @tc.name      testExpressionsInstanceThree0010
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func2 instanceof ((x: Object, y: Object) => string)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_1100
     * @tc.name      testExpressionsInstanceThree0011
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func2 instanceof ((x: Object, y?: Object) => string)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_1200
     * @tc.name      testExpressionsInstanceThree0012
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func2 instanceof ((x: Object, ...y: Array) => string)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_1300
     * @tc.name      testExpressionsInstanceThree0013
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func3 instanceof ((...x: Array) => null)).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_1400
     * @tc.name      testExpressionsInstanceThree0014
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func4 instanceof ((x: float, y: Any) => undefined)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_1500
     * @tc.name      testExpressionsInstanceThree0015
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func5 instanceof ((x: Object, y: 'a') => undefined)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_1600
     * @tc.name      testExpressionsInstanceThree0016
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func6 instanceof ((x: float, y: 'a') => undefined)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_1700
     * @tc.name      testExpressionsInstanceThree0017
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func7 instanceof ((x: Parent1, y?: Child1, z?: GrandChild1) => GrandChild1)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_1800
     * @tc.name      testExpressionsInstanceThree0018
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func8 instanceof ((x: GrandChild2, y?: GrandChild2, z?: GrandChild2) => Parent2)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_1900
     * @tc.name      testExpressionsInstanceThree0019
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func9 instanceof ((x: Parent3) => GrandChild3)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_2000
     * @tc.name      testExpressionsInstanceThree0020
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func10 instanceof ((x: Parent4, y?: Child4) => GrandChild4)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_2100
     * @tc.name      testExpressionsInstanceThree0021
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func11 instanceof ((x: Parent5, y?: Parent5, z?: GrandChild5) => GrandChild5)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_2200
     * @tc.name      testExpressionsInstanceThree0022
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func12 instanceof ((x: Parent6, y: Child6, z?: GrandChild6) => GrandChild6)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_2300
     * @tc.name      testExpressionsInstanceThree0023
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func13 instanceof ((x?: Parent7, y?: Child7, z?: GrandChild7) => GrandChild7)).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_2400
     * @tc.name      testExpressionsInstanceThree0024
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func14 instanceof ((x: bigint, y?: char) => void)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_2500
     * @tc.name      testExpressionsInstanceThree0025
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func19 instanceof ((x: boolean, ...y: Array) => Any)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_2600
     * @tc.name      testExpressionsInstanceThree0026
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func20 instanceof ((x: boolean, y: Array) => Object)).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_2700
     * @tc.name      testExpressionsInstanceThree0027
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func21 instanceof ((x: boolean, y: Array, ...z: Array) => Object)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_2800
     * @tc.name      testExpressionsInstanceThree0028
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func22 instanceof ((x: boolean, ...y: Array) => Object)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_2900
     * @tc.name      testExpressionsInstanceThree0029
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func23 instanceof ((x: Array, y: string, z: null) => undefined)).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_3000
     * @tc.name      testExpressionsInstanceThree0030
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func24 instanceof ((x: Array, y: 'a', z: null) => void)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_3100
     * @tc.name      testExpressionsInstanceThree0031
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func25 instanceof ((x: FixedArray<number>, y: string, z: null) => undefined)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_3200
     * @tc.name      testExpressionsInstanceThree0032
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func26 instanceof ((x: Array, y: string, z: never) => undefined)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_3300
     * @tc.name      testExpressionsInstanceThree0033
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func27 instanceof (((x: Tuple) => Tuple))).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_3400
     * @tc.name      testExpressionsInstanceThree0034
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func28 instanceof (((x: Tuple) => Array))).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_3500
     * @tc.name      testExpressionsInstanceThree0035
     * @tc.desc      Check instanceof behaviour for function types with regard to function subtyping
     *               (15.2.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(func29 instanceof (((x: Array) => Array))).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_3600
     * @tc.name      testExpressionsInstanceThree0036
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass3 = new Pass3
      let fCall: FC3 = returnAsAny3
      let d1 = Pass3.pass(test3)
      let d2 = fCall(test3)
      let d3 = ((input: Any): Any => { return input })(test3)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass3.pass(runner.dpass(test3))))
      expect(d1 instanceof TT3).assertTrue()
      expect(d2 instanceof TT3).assertTrue()
      expect(d3 instanceof TT3).assertTrue()
      expect(d4 instanceof TT3).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_3700
     * @tc.name      testExpressionsInstanceThree0037
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass4 = new Pass4
      let fCall: FC4 = returnAsAny4
      let d1 = Pass4.pass(test4)
      let d2 = fCall(test4)
      let d3 = ((input: Any): Any => { return input })(test4)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass4.pass(runner.dpass(test4))))
      expect(d1 instanceof TT4).assertTrue()
      expect(d2 instanceof TT4).assertTrue()
      expect(d3 instanceof TT4).assertTrue()
      expect(d4 instanceof TT4).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_3800
     * @tc.name      testExpressionsInstanceThree0038
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass5 = new Pass5
      let fCall: FC5 = returnAsAny5
      let d1 = Pass5.pass(test5)
      let d2 = fCall(test5)
      let d3 = ((input: Any): Any => { return input })(test5)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass5.pass(runner.dpass(test5))))
      expect(d1 instanceof TT5).assertTrue()
      expect(d2 instanceof TT5).assertTrue()
      expect(d3 instanceof TT5).assertTrue()
      expect(d4 instanceof TT5).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_3900
     * @tc.name      testExpressionsInstanceThree0039
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass6 = new Pass6
      let fCall: FC6 = returnAsAny6
      let d1 = Pass6.pass(test6)
      let d2 = fCall(test6)
      let d3 = ((input: Any): Any => { return input })(test6)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass6.pass(runner.dpass(test6))))
      expect(d1 instanceof TT6).assertTrue()
      expect(d2 instanceof TT6).assertTrue()
      expect(d3 instanceof TT6).assertTrue()
      expect(d4 instanceof TT6).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_4000
     * @tc.name      testExpressionsInstanceThree0040
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass7 = new Pass7
      let fCall: FC7 = returnAsAny7
      let d1 = Pass7.pass(test7)
      let d2 = fCall(test7)
      let d3 = ((input: Any): Any => { return input })(test7)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass7.pass(runner.dpass(test7))))
      expect(d1 instanceof TT7).assertTrue()
      expect(d2 instanceof TT7).assertTrue()
      expect(d3 instanceof TT7).assertTrue()
      expect(d4 instanceof TT7).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_4100
     * @tc.name      testExpressionsInstanceThree0041
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass8 = new Pass8
      let fCall: FC8 = returnAsAny8
      let d1 = Pass8.pass(test8)
      let d2 = fCall(test8)
      let d3 = ((input: Any): Any => { return input })(test8)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass8.pass(runner.dpass(test8))))
      expect(d1 instanceof TT8).assertTrue()
      expect(d2 instanceof TT8).assertTrue()
      expect(d3 instanceof TT8).assertTrue()
      expect(d4 instanceof TT8).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_4200
     * @tc.name      testExpressionsInstanceThree0042
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass9 = new Pass9
      let fCall: FC9 = returnAsAny9
      let d1 = Pass9.pass(test9)
      let d2 = fCall(test9)
      let d3 = ((input: Any): Any => { return input })(test9)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass9.pass(runner.dpass(test9))))
      expect(d1 instanceof TT9).assertTrue()
      expect(d2 instanceof TT9).assertTrue()
      expect(d3 instanceof TT9).assertTrue()
      expect(d4 instanceof TT9).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_4300
     * @tc.name      testExpressionsInstanceThree0043
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass10 = new Pass10
      let fCall: FC10 = returnAsAny10
      let d1 = Pass10.pass(test10)
      let d2 = fCall(test10)
      let d3 = ((input: Any): Any => { return input })(test10)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass10.pass(runner.dpass(test10))))
      expect(d1 instanceof TT10).assertTrue()
      expect(d2 instanceof TT10).assertTrue()
      expect(d3 instanceof TT10).assertTrue()
      expect(d4 instanceof TT10).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_4400
     * @tc.name      testExpressionsInstanceThree0044
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass11 = new Pass11
      let fCall: FC11 = returnAsAny11
      let d1 = Pass11.pass(test11)
      let d2 = fCall(test11)
      let d3 = ((input: Any): Any => { return input })(test11)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass11.pass(runner.dpass(test11))))
      expect(d1 instanceof TT11).assertTrue()
      expect(d2 instanceof TT11).assertTrue()
      expect(d3 instanceof TT11).assertTrue()
      expect(d4 instanceof TT11).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_4500
     * @tc.name      testExpressionsInstanceThree0045
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass12 = new Pass12
      let fCall: FC12 = returnAsAny12
      let d1 = Pass12.pass(test12)
      let d2 = fCall(test12)
      let d3 = ((input: Any): Any => { return input })(test12)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass12.pass(runner.dpass(test12))))
      expect(d1 instanceof TT12).assertTrue()
      expect(d2 instanceof TT12).assertTrue()
      expect(d3 instanceof TT12).assertTrue()
      expect(d4 instanceof TT12).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_4600
     * @tc.name      testExpressionsInstanceThree0046
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass13 = new Pass13
      let fCall: FC13 = returnAsAny13
      let d1 = Pass13.pass(test13)
      let d2 = fCall(test13)
      let d3 = ((input: Any): Any => { return input })(test13)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass13.pass(runner.dpass(test13))))
      expect(d1 instanceof TT13).assertTrue()
      expect(d2 instanceof TT13).assertTrue()
      expect(d3 instanceof TT13).assertTrue()
      expect(d4 instanceof TT13).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_4700
     * @tc.name      testExpressionsInstanceThree0047
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass14 = new Pass14
      let fCall: FC14 = returnAsAny14
      let d1 = Pass14.pass(test14)
      let d2 = fCall(test14)
      let d3 = ((input: Any): Any => { return input })(test14)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass14.pass(runner.dpass(test14))))
      expect(d1 instanceof TT14).assertTrue()
      expect(d2 instanceof TT14).assertTrue()
      expect(d3 instanceof TT14).assertTrue()
      expect(d4 instanceof TT14).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_4800
     * @tc.name      testExpressionsInstanceThree0048
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass15 = new Pass15
      let fCall: FC15 = returnAsAny15
      let d1 = Pass15.pass(test15)
      let d2 = fCall(test15)
      let d3 = ((input: Any): Any => { return input })(test15)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass15.pass(runner.dpass(test15))))
      expect(d1 instanceof TT15).assertTrue()
      expect(d2 instanceof TT15).assertTrue()
      expect(d3 instanceof TT15).assertTrue()
      expect(d4 instanceof TT15).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_4900
     * @tc.name      testExpressionsInstanceThree0049
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass16 = new Pass16
      let fCall: FC16 = returnAsAny16
      let d1 = Pass16.pass(test16)
      let d2 = fCall(test16)
      let d3 = ((input: Any): Any => { return input })(test16)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass16.pass(runner.dpass(test16))))
      expect(d1 instanceof TT16).assertTrue()
      expect(d2 instanceof TT16).assertTrue()
      expect(d3 instanceof TT16).assertTrue()
      expect(d4 instanceof TT16).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_5000
     * @tc.name      testExpressionsInstanceThree0050
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass17 = new Pass17
      let fCall: FC17 = returnAsAny17
      let d1 = Pass17.pass(test17)
      let d2 = fCall(test17)
      let d3 = ((input: Any): Any => { return input })(test17)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass17.pass(runner.dpass(test17))))
      expect(d1 instanceof TT17).assertTrue()
      expect(d2 instanceof TT17).assertTrue()
      expect(d3 instanceof TT17).assertTrue()
      expect(d4 instanceof TT17).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_5100
     * @tc.name      testExpressionsInstanceThree0051
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass18 = new Pass18
      let fCall: FC18 = returnAsAny18
      let d1 = Pass18.pass(test18)
      let d2 = fCall(test18)
      let d3 = ((input: Any): Any => { return input })(test18)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass18.pass(runner.dpass(test18))))
      expect(d1 instanceof TT18).assertTrue()
      expect(d2 instanceof TT18).assertTrue()
      expect(d3 instanceof TT18).assertTrue()
      expect(d4 instanceof TT18).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_5200
     * @tc.name      testExpressionsInstanceThree0052
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass19 = new Pass19
      let fCall: FC19 = returnAsAny19
      let d1 = Pass19.pass(test19)
      let d2 = fCall(test19)
      let d3 = ((input: Any): Any => { return input })(test19)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass19.pass(runner.dpass(test19))))
      expect(d1 instanceof TT19).assertTrue()
      expect(d2 instanceof TT19).assertTrue()
      expect(d3 instanceof TT19).assertTrue()
      expect(d4 instanceof TT19).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_5300
     * @tc.name      testExpressionsInstanceThree0053
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass20 = new Pass20
      let fCall: FC20 = returnAsAny20
      let d1 = Pass20.pass(test20)
      let d2 = fCall(test20)
      let d3 = ((input: Any): Any => { return input })(test20)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass20.pass(runner.dpass(test20))))
      expect(d1 instanceof TT20).assertTrue()
      expect(d2 instanceof TT20).assertTrue()
      expect(d3 instanceof TT20).assertTrue()
      expect(d4 instanceof TT20).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_5400
     * @tc.name      testExpressionsInstanceThree0054
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass21 = new Pass21
      let fCall: FC21 = returnAsAny21
      let d1 = Pass21.pass(test21)
      let d2 = fCall(test21)
      let d3 = ((input: Any): Any => { return input })(test21)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass21.pass(runner.dpass(test21))))
      expect(d1 instanceof TT21).assertTrue()
      expect(d2 instanceof TT21).assertTrue()
      expect(d3 instanceof TT21).assertTrue()
      expect(d4 instanceof TT21).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_5500
     * @tc.name      testExpressionsInstanceThree0055
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass22 = new Pass22
      let fCall: FC22 = returnAsAny22
      let d1 = Pass22.pass(test22)
      let d2 = fCall(test22)
      let d3 = ((input: Any): Any => { return input })(test22)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass22.pass(runner.dpass(test22))))
      expect(d1 instanceof TT22).assertTrue()
      expect(d2 instanceof TT22).assertTrue()
      expect(d3 instanceof TT22).assertTrue()
      expect(d4 instanceof TT22).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_5600
     * @tc.name      testExpressionsInstanceThree0056
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass23 = new Pass23
      let fCall: FC23 = returnAsAny23
      let d1 = Pass23.pass(test23)
      let d2 = fCall(test23)
      let d3 = ((input: Any): Any => { return input })(test23)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass23.pass(runner.dpass(test23))))
      expect(d1 instanceof TT23).assertTrue()
      expect(d2 instanceof TT23).assertTrue()
      expect(d3 instanceof TT23).assertTrue()
      expect(d4 instanceof TT23).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_5700
     * @tc.name      testExpressionsInstanceThree0057
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass24 = new Pass24
      let fCall: FC24 = returnAsAny24
      let d1 = Pass24.pass(test24)
      let d2 = fCall(test24)
      let d3 = ((input: Any): Any => { return input })(test24)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass24.pass(runner.dpass(test24))))
      expect(d1 instanceof TT24).assertTrue()
      expect(d2 instanceof TT24).assertTrue()
      expect(d3 instanceof TT24).assertTrue()
      expect(d4 instanceof TT24).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_5800
     * @tc.name      testExpressionsInstanceThree0058
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass25 = new Pass25
      let fCall: FC25 = returnAsAny25
      let d1 = Pass25.pass(test25)
      let d2 = fCall(test25)
      let d3 = ((input: Any): Any => { return input })(test25)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass25.pass(runner.dpass(test25))))
      expect(d1 instanceof TT25).assertTrue()
      expect(d2 instanceof TT25).assertTrue()
      expect(d3 instanceof TT25).assertTrue()
      expect(d4 instanceof TT25).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_5900
     * @tc.name      testExpressionsInstanceThree0059
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass26 = new Pass26
      let fCall: FC26 = returnAsAny26
      let d1 = Pass26.pass(test26)
      let d2 = fCall(test26)
      let d3 = ((input: Any): Any => { return input })(test26)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass26.pass(runner.dpass(test26))))
      expect(d1 instanceof TT26).assertTrue()
      expect(d2 instanceof TT26).assertTrue()
      expect(d3 instanceof TT26).assertTrue()
      expect(d4 instanceof TT26).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_6000
     * @tc.name      testExpressionsInstanceThree0060
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass27 = new Pass27
      let fCall: FC27 = returnAsAny27
      let d1 = Pass27.pass(test27)
      let d2 = fCall(test27)
      let d3 = ((input: Any): Any => { return input })(test27)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass27.pass(runner.dpass(test27))))
      expect(d1 instanceof TT27).assertTrue()
      expect(d2 instanceof TT27).assertTrue()
      expect(d3 instanceof TT27).assertTrue()
      expect(d4 instanceof TT27).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_6100
     * @tc.name      testExpressionsInstanceThree0061
     * @tc.desc      Any instanceof expression in the form expr instanceof T The result of an instanceof
     *               expression is true if the actual type of evaluated expr is a subtype of T
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let runner: Pass28 = new Pass28
      let fCall: FC28 = returnAsAny28
      let d1 = Pass28.pass(test28)
      let d2 = fCall(test28)
      let d3 = ((input: Any): Any => { return input })(test28)
      let d4 = ((input: Any): Any => { return input })(fCall(Pass28.pass(runner.dpass(test28))))
      expect(d1 instanceof TT28).assertTrue()
      expect(d2 instanceof TT28).assertTrue()
      expect(d3 instanceof TT28).assertTrue()
      expect(d4 instanceof TT28).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_6200
     * @tc.name      testExpressionsInstanceThree0062
     * @tc.desc      SUB_EXPRESSIONS_INSTANCE_THREE_The result of an instanceof expression is true if the actual type of evaluated
     *               expr is a subtype of T.
     *               Otherwise, the result is false. Generic type in the form of type name can be used
     *               as T operand of an instanceof expression. In this case, the check is performed against the type name,
     *               and type parameters are ignored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pass_through(a1) instanceof (Array)).assertTrue();
      expect(pass_through(a2) instanceof (Array)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_6300
     * @tc.name      testExpressionsInstanceThree0063
     * @tc.desc      SUB_EXPRESSIONS_INSTANCE_THREE_The result of an instanceof expression is true if the actual type of evaluated
     *               expr is a subtype of T.
     *               Otherwise, the result is false. Generic type in the form of type name can be used
     *               as T operand of an instanceof expression. In this case, the check is performed against the type name,
     *               and type parameters are ignored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pass_through(a3) instanceof (Array)).assertTrue();
      expect(pass_through(a4) instanceof (Array)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_6400
     * @tc.name      testExpressionsInstanceThree0064
     * @tc.desc      SUB_EXPRESSIONS_INSTANCE_THREE_The result of an instanceof expression is true if the actual type of evaluated
     *               expr is a subtype of T.
     *               Otherwise, the result is false. Generic type in the form of type name can be used
     *               as T operand of an instanceof expression. In this case, the check is performed against the type name,
     *               and type parameters are ignored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pass_through(a5) instanceof (Array)).assertTrue();
      expect(pass_through(a6) instanceof (Array)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_6500
     * @tc.name      testExpressionsInstanceThree0065
     * @tc.desc      SUB_EXPRESSIONS_INSTANCE_THREE_The result of an instanceof expression is true if the actual type of evaluated
     *               expr is a subtype of T.
     *               Otherwise, the result is false. Generic type in the form of type name can be used
     *               as T operand of an instanceof expression. In this case, the check is performed against the type name,
     *               and type parameters are ignored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pass_through(a9) instanceof (my_type5)).assertTrue();
      expect(pass_through(a10) instanceof (my_type5)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_6600
     * @tc.name      testExpressionsInstanceThree0066
     * @tc.desc      SUB_EXPRESSIONS_INSTANCE_THREE_The result of an instanceof expression is true if the actual type of evaluated
     *               expr is a subtype of T.
     *               Otherwise, the result is false. Generic type in the form of type name can be used
     *               as T operand of an instanceof expression. In this case, the check is performed against the type name,
     *               and type parameters are ignored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pass_through(a11) instanceof (my_type6)).assertTrue();
      expect(pass_through(a12) instanceof (my_type6)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_6700
     * @tc.name      testExpressionsInstanceThree0067
     * @tc.desc      SUB_EXPRESSIONS_INSTANCE_THREE_The result of an instanceof expression is true if the actual type of evaluated
     *               expr is a subtype of T.
     *               Otherwise, the result is false. Generic type in the form of type name can be used
     *               as T operand of an instanceof expression. In this case, the check is performed against the type name,
     *               and type parameters are ignored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pass_through(a13) instanceof (Array)).assertTrue();
      expect(pass_through(a14) instanceof (Array)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_6800
     * @tc.name      testExpressionsInstanceThree0068
     * @tc.desc      SUB_EXPRESSIONS_INSTANCE_THREE_The result of an instanceof expression is true if the actual type of evaluated
     *               expr is a subtype of T.
     *               Otherwise, the result is false. Generic type in the form of type name can be used
     *               as T operand of an instanceof expression. In this case, the check is performed against the type name,
     *               and type parameters are ignored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pass_through(a15) instanceof (Array)).assertTrue();
      expect(pass_through(a16) instanceof (Array)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_THREE_6900
     * @tc.name      testExpressionsInstanceThree0069
     * @tc.desc      SUB_EXPRESSIONS_INSTANCE_THREE_The result of an instanceof expression is true if the actual type of evaluated
     *               expr is a subtype of T.
     *               Otherwise, the result is false. Generic type in the form of type name can be used
     *               as T operand of an instanceof expression. In this case, the check is performed against the type name,
     *               and type parameters are ignored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceThree0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pass_through(a21) instanceof (Array | undefined)).assertTrue();
      expect(pass_through(a22) instanceof (Array | undefined)).assertTrue();
    });
  });
}
