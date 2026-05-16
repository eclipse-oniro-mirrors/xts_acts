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

function reduce<T, R>(arr: Array<T>, callback: (prev: R, next: T) => R, initialValue: R): R {
  let result = initialValue
  for (let i = 0; i < arr.length; i++) {
    result = callback(result, arr[i])
  }
  return result
}

function bar_spex_lmbd_24(...p: number[]): number {
  let res = 0.0
  for (let el of p) res += el
  return res
}

let a1_spex_lmbd_28_29 = ["1", "2", "3"]
class A_spex_lmbd_41 {
  fld: [int, char]
  constructor(p: int, q: char) {
    this.fld = [p, q]
  }
  meth(): int {
    return 10 + ((...p: [int, char]): int => 100 + p[0])(...this.fld)
  }
}

abstract class A_spex_lmbd_42 {
  fld: [int, char]
  constructor(p: [int, char]) {
    this.fld = p
  }
  meth(): [int, char] {
    return this.fld
  }
}
class B_spex_lmbd_42 extends A_spex_lmbd_42 {
  constructor(p: int, q: char) {
    super([p, q])
  }
  meth(): [int, char] {
    this.fld[0] = 10 + ((...p: [int, char]): int => 100 + p[0])(...super.meth())
    return this.fld
  }
}

let a1_spex_lmbd_33: [Object, Error]|null = [new Object, new Error]
let a1_spex_lmbd_35: [Object, Error]|null = null
let a2_spex_lmbd_35: [Object, Error]|null = [new Object, new Error]

function foo_spex_lmbd_37(): [number, string] {
  return [1.0, "X"]
}

let a1_spex_lmbd_40: [int, int] = [1, 2]
let a2_spex_lmbd_40: [int, int] = [5, 6]

let a2_spex_lmbd_43: [int, int] = [6, 5]

type F_spex_meth_7 = (p: number) => number

enum Color_spex_meth_8 { Red, Green, Blue }

let a1_spex_meth_10_12_13: Object[]|null = [new Object, new Object]
let a1_spex_meth_12: Object[]|null = null
let a2_spex_meth_12: Object[]|null = [new Object, new Object]

let a1_spex_meth_19 = ["1", "2", "3"]
let a2_spex_meth_19 = ["a", "b"]

class A_spex_meth_20 {
  fld: boolean[]
  constructor(p: boolean[], q: boolean[]) {
    this.fld = [...p, ...q]
  }
  meth(): number {
    return B_spex_meth_20.foo(42, ...this.fld)
  }
}
class B_spex_meth_20 {
  static foo(a: int, ...p: boolean[]): number {
    return a + p.length
  }
}

abstract class A_spex_meth_21 {
  fld: boolean[]
  constructor(p: boolean[]) {
    this.fld = p
  }
  meth(): boolean[] {
    return this.fld
  }
}
class B_spex_meth_21 extends A_spex_meth_21 {
  obj: C_spex_meth_21
  constructor(p: boolean[], q: boolean[], obj: C_spex_meth_21) {
    super([...p, ...q])
    this.obj = obj
  }
  bar(): number {
    return this.obj.foo(42, ...super.meth())
  }
}
class C_spex_meth_21 {
  foo(a: int, ...p: boolean[]): number {
    return a + p.length
  }
}

class A_spex_meth_24_25 {
  foo(...p: (Double|Short|Byte)[]): double {
    let res = 0.0
    for (let el of p) res += (el as Numeric).toDouble()
    return res
  }
}

class A_spex_meth_26 {
  foo(...p: (Int|Number|String|undefined)[]): number {
    return p.length
  }
}

class A_spex_meth_27<T> {}
class B_spex_meth_27<T> {}
class C_spex_meth_27<T> {}
class Z_spex_meth_27<T, U, V> {
  foo(...p: (A_spex_meth_27<T>|B_spex_meth_27<U>|C_spex_meth_27<V>|null)[]): number {
    return p.length
  }
}

let a1_spex_meth_28_29 = ["1", "2", "3"]
class A_spex_meth_28_29 {
  foo(...p: string[]): string {
    return String.join(p, "")
  }
}

class A_24700 {
  foo(...p: Object[]): number {
    return p.length
  }
}

class A_24800 {
  foo(...p: char[]): number {
    return p.length
  }
}
class A_24900 {
  static foo(a: int, ...p: byte[]): int {
    return a + reduce(p, (prev: int, next: byte) => prev + next, 0)
  }
}
class A_25000 {
  foo(a: int, ...p: short[]): int {
    return a + reduce(p, (prev: int, next: short) => prev + next, 0)
  }
}
class A_25100 {
  static foo(a: long, ...p: long[]): long {
    return a + reduce(p, (prev: long, next: long) => prev + next, 0 as long)
  }
}
class A_25200 {
  foo(a: float, ...p: float[]): float {
    return a + reduce(p, (prev: float, next: float) => prev + next, 0.0f)
  }
}
class A_25300 {
  static foo(a: number, ...p: number[]): number {
    return a + reduce(p, (prev: number, next: number) => prev + next, 0.0)
  }
}
class A_25400 {
  foo(a: number, ...p: F_spex_meth_7[]): number {
    let res = a
    for (let el of p) res += el(res)
    return res
  }
}
class A_25500 {
  foo(...p: Color_spex_meth_8[]): Color_spex_meth_8 {
    return p.length ? p[p.length - 1] : Color_spex_meth_8.Red
  }
}
class A_25600 {
  static foo(...p: number[]): number {
    return p.length ? p[p.length - 1] : -1.0
  }
}
abstract class A_25700 {
  foo(a: int, ...p: Object[]): number {
    return a + p.length
  }
}
class B_25700 extends A_25700 {}
class A_25900 {
  foo(a: int, ...p: Object[]): number {
    return a + p.length
  }
}
interface I_26100 {
  foo(...p: string[]): string
}
class A_26100 implements I_26100 {
  foo(...p: string[]): string {
    return String.join(p, "")
  }
}
class A_26300 {
  static foo(...p: double[]): double {
    return p[0] + p[1]
  }
}
class A_26400 {
  foo(...p: double[]): double {
    return p[0] + p[1] + p[2]
  }
}
class A_26600 {
  foo(...p: string[]): string {
    return String.join(p, "-")
  }
}
class A_27000 {
  foo(...p: number[][]): number[] {
    let res: number[] = []
    for (let el of p) res = [...res, ...el]
    return res
  }
  bar(...p: number[]): number {
    let res = 0.0
    for (let el of p) res += el
    return res
  }
}
class A_26000 {
  foo(): number[] {
    return [1.0, 2.0]
  }
  bar(...p: number[]): number {
    return reduce(p, (prev: number, next: number) => prev + next, 0.0)
  }
}
class A_26200 {
  foo(...p: number[]): number {
    return p.length ? p[p.length - 1] : -1
  }
}

class A_26500 {
  foo(...p: string[]): string {
    return String.join(p, "-")
  }
}
class B_26500 extends A_26500 {}
class A_26900 {
  foo(...p: number[][]): number {
    let res = 0
    for (let el of p) res += el.length
    return res
  }
}
interface A_spex_meth_45_46_47 {}

interface test_spex_meth_45_46_47 {
  t: A_spex_meth_45_46_47[]
}

interface B_spex_meth_45_46_47 {
  unsorted: A_spex_meth_45_46_47[]
}

class C_spex_meth_45_46_47 {
  static foo(...arg: B_spex_meth_45_46_47[]): void {
    expect(arg.length).assertEqual(3)
  }
}

class C_spex_meth_46 {
  static foo(...arg: B_spex_meth_45_46_47[]): void {
    expect(arg.length).assertEqual(3)
    expect(arg[arg.length - 1].unsorted.length).assertEqual(6)
  }
}

interface A_spex_meth_47 {
  cnt?: int
}

interface test_spex_meth_47 {
  t: A_spex_meth_47[]
}

interface B_spex_meth_47 {
  unsorted: A_spex_meth_47[]
}

class C_spex_meth_47 {
  static foo(...arg: B_spex_meth_47[]): void {
    expect(arg.length).assertEqual(3)
    expect(reduce(arg,
      (p: int, c: B_spex_meth_47) => p + reduce(c.unsorted,
        (p: int, c: A_spex_meth_47) => p + (c.cnt ? c.cnt! : 0), 0), 0
    )).assertEqual(7)
  }
}

class A_spex_meth_41 {
  fld: [int, char]
  obj: Z_spex_meth_41
  constructor(p: int, q: char, obj: Z_spex_meth_41) {
    this.fld = [p, q]
    this.obj = obj
  }
  meth(): int {
    return 10 + this.obj.foo(...this.fld)
  }
}
class Z_spex_meth_41 {
  foo(...p: [int, char]): int {
    return 100 + p[0]
  }
}

abstract class A_spex_meth_42 {
  fld: [int, char]
  constructor(p: [int, char]) {
    this.fld = p
  }
  meth(): [int, char] {
    return this.fld
  }
}
class B_spex_meth_42 extends A_spex_meth_42 {
  constructor(p: int, q: char) {
    super([p, q])
  }
  meth(): [int, char] {
    this.fld[0] = 10 + Z_spex_meth_42.foo(...super.meth())
    return this.fld
  }
}
class Z_spex_meth_42 {
  static foo(...p: [int, char]): int {
    return 100 + p[0]
  }
}

class A_spex_meth_43<T> {}
class B_spex_meth_43<T> {}
class Z_spex_meth_43<T, U> {
  foo(...p: [A_spex_meth_43<T>, B_spex_meth_43<U>]): boolean {
    return p[0] == p[1]
  }
}

interface I_spex_meth_37 {
  foo(): [number, string]
}
class A_spex_meth_37 implements I_spex_meth_37 {
  foo(): [number, string] {
    return [1.0, "X"]
  }
  bar(...p: [number, string]): [string, number] {
    return [p[1], p[0]]
  }
}

function fooReadonlyRestParam_spex_to_readonly(...p_ro: readonly int[]) {
  expect(p_ro[0]).assertEqual(1)
  expect(p_ro[1]).assertEqual(2)
}

let a1_spex_meth_40: [int, int] = [1, 2]
let a2_spex_meth_40: [int, int] = [5, 6]

let a2_spex_meth_44: [int, int] = [6, 5]

const tests_spex_meth_45: test_spex_meth_45_46_47[] = [{ t: [{}, {}] }, { t: [{}] }, { t: [{}, {}, {}] }]
const tests_spex_meth_46: test_spex_meth_45_46_47[] = [{ t: [{}, {}] }, { t: [{}] }, { t: [{}, {}, {}] }]
const tests_spex_meth_47: test_spex_meth_47[] = [{ t: [{}, {}, {}, {}] }, { t: [{}] }, { t: [{}, {}] }]

class A_27700 {
  foo(...p: [number, boolean]): [boolean, number] {
    return [p[1], p[0]]
  }
}

class A_27900 {
  foo(...p: [byte, short, int, long, float, double, boolean, char, string]): [byte, short, int, long, float, double, boolean, char, string, int] {
    return [...p, 42]
  }
}
class A_28000 {
  static foo(...p: [Object, Error]): int {
    return p[0] != p[1] ? 3 : 0
  }
}

class A_28200 {
  foo(...p: [Object, Error]): int {
    return p[0] != p[1] ? 3 : 0
  }
}
class A_28500 {
  foo(...p: [double, double]): double {
    return p[0] + p[1]
  }
}
class A_28600 {
  static foo(...p: [string, int]): int {
    return p[1]
  }
}
class A_28700 {
  foo(...p: [int, int]): int {
    return p[0] + p[1]
  }
}
class A_29100 {
  foo(...p: [int, int]): string {
    return "" + p[0] + p[1]
  }
}
class A_27800 {
  foo(...p: [number, boolean]): [number, number, boolean, boolean] {
    return [p[0], p[0], p[1], p[1]]
  }
}
export default function ExpressionsSpreadTwoTest(): void {
  describe("ExpressionsSpreadTwoTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_0100
     * @tc.name      testExpressionsSpreadTwo0001
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: number[][] = [[1.0, 2.0], [3.0, 4.0]]
      let a2: number[][] = [[5.0, 6.0], []]
      expect(bar_spex_lmbd_24(...[
        ...((...p: number[][]): number[] => {
          let res: number[] = []
          for (let el of p) res = [...res, ...el]
          return res
        })(...a1),
        ...((...p: number[][]): number[] => {
          let res: number[] = []
          for (let el of p) res = [...res, ...el]
          return res
        })(...a2)
      ])).assertEqual(21.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_0200
     * @tc.name      testExpressionsSpreadTwo0002
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Double[] = [1, 2, 3], a2: Short[] = [4, 5], a3: Byte[] = [6]
      let ar = [-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]
      expect(((...p: (Double|Short|Byte)[]): double => {
        let res = 0.0
        for (let el of p) res += (el as Numeric).toDouble()
        return res
      })(...ar)).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_0300
     * @tc.name      testExpressionsSpreadTwo0003
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: (Int|Number|String|undefined)[] = [new Int(), new Int(), undefined, "Z", 42.0]
      expect(((...p: (Int|Number|String|undefined)[]): int => p.length)(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_0400
     * @tc.name      testExpressionsSpreadTwo0004
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((...p: string[]): string => String.join(p, ""))(...((): string[] => a1_spex_lmbd_28_29)())).assertEqual("123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_0500
     * @tc.name      testExpressionsSpreadTwo0005
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((...p: string[]): string => String.join(p, ""))(...((p: string[], q: string[]): string[] => [...p, ...q])(a1_spex_lmbd_28_29, a1_spex_lmbd_28_29))).assertEqual("123123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_0600
     * @tc.name      testExpressionsSpreadTwo0006
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1: [number, boolean] = [1.0, true]
      let r: [boolean, number] = ((...p: [number, boolean]): [boolean, number] => [p[1], p[0]])(...t1)
      expect(r[0] && r[1] == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_0700
     * @tc.name      testExpressionsSpreadTwo0007
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [number, number, boolean, boolean] = ((...p: [number, boolean]): [number, number, boolean, boolean] => [p[0], p[0], p[1], p[1]])(...[1.0, true])
      expect(r[0] == 1.0 && r[1] == 1.0 && r[2] && r[3]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_0800
     * @tc.name      testExpressionsSpreadTwo0008
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [byte, short, int, long, float, double, boolean, char, string] =
        [1 as byte, 2 as short, 3, 4 as long, 5.0f, 6.0, true, c'Z', "X"]
      expect(((...p: [byte, short, int, long, float, double, boolean, char, string]):
        [byte, short, int, long, float, double, boolean, char, string, int] =>
      [...p, 42])(...r)[9]).assertEqual(42)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_0900
     * @tc.name      testExpressionsSpreadTwo0009
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((...p: [Object, Error]): int => p[0] != p[1] ? 3 : 0)(...a1_spex_lmbd_33!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_1000
     * @tc.name      testExpressionsSpreadTwo0010
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((...p: [Object, Error]): int => p[0] != p[1] ? 3 : 0)(...(a1_spex_lmbd_35 ?? a2_spex_lmbd_35)!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_1100
     * @tc.name      testExpressionsSpreadTwo0011
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [string, number] = ((...p: [number, string]): [string, number] => [p[1], p[0]])(...foo_spex_lmbd_37())
      expect(r[0] == "X" && r[1] == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_1200
     * @tc.name      testExpressionsSpreadTwo0012
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [[double, double], [char, char]] = [[2.0, 3.0], [c'Z', c'X']]
      expect(((...p: [double, double]): double => p[0] + p[1])(...a[0])).assertEqual(5.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_1300
     * @tc.name      testExpressionsSpreadTwo0013
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: [string, int] = ["1", 10]
      let a2: [string, int] = ["2", 20]
      expect(((...p: [string, int]): int => p[1])(...(a1 = a2))).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_1400
     * @tc.name      testExpressionsSpreadTwo0014
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ((...p: [int, int]): int => p[0] + p[1])(...(a1_spex_lmbd_40[0] > a2_spex_lmbd_40[0] ? a1_spex_lmbd_40 : a2_spex_lmbd_40))
      expect(r).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_1500
     * @tc.name      testExpressionsSpreadTwo0015
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_lmbd_41 = new A_spex_lmbd_41(1, c'Z')
      expect(a.meth()).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_1600
     * @tc.name      testExpressionsSpreadTwo0016
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_lmbd_42 = new B_spex_lmbd_42(1, c'Z')
      expect(b.meth()[0]).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_1700
     * @tc.name      testExpressionsSpreadTwo0017
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ((...p: [int, int]): string => "" + p[0] + p[1])(...((p: [int, int]): [int, int] => [p[1], p[0]])(a2_spex_lmbd_43))
      expect(r).assertEqual("56")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_1800
     * @tc.name      testExpressionsSpreadTwo0018
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Object[] = [], a2: Error[] = []
      expect(new A_24700().foo(...[...a1, ...a2, new Object(), ...a1])).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_1900
     * @tc.name      testExpressionsSpreadTwo0019
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char[] = [c'b', c'c']
      expect(new A_24800().foo(...a)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_2000
     * @tc.name      testExpressionsSpreadTwo0020
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte[] = [1 as byte, 2 as byte, 3 as byte]
      expect(A_24900.foo(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_2100
     * @tc.name      testExpressionsSpreadTwo0021
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short[] = [1 as short, 2 as short, 3 as short]
      expect(new A_25000().foo(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_2200
     * @tc.name      testExpressionsSpreadTwo0022
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long[] = [1 as long, 2 as long, 3 as long]
      expect(A_25100.foo(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_2300
     * @tc.name      testExpressionsSpreadTwo0023
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float[] = [1.0f, 2.0f, 3.0f]
      expect(new A_25200().foo(42.0f, ...a)).assertEqual(48.0f)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_2400
     * @tc.name      testExpressionsSpreadTwo0024
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [1.0, 2.0, 3.0]
      expect(A_25300.foo(42, ...a)).assertEqual(48.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_2500
     * @tc.name      testExpressionsSpreadTwo0025
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: F_spex_meth_7[] = [(p: number) => p * 2, (p: number) => p * 3]
      let b: F_spex_meth_7[] = [(p: number) => p * 4, (p: number) => p * 5]
      let obj = new A_25400()
      expect(obj.foo(1.0, ...[...a, ...b])).assertEqual(360.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_2600
     * @tc.name      testExpressionsSpreadTwo0026
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Color_spex_meth_8[] = [Color_spex_meth_8.Red, Color_spex_meth_8.Blue, Color_spex_meth_8.Green]
      let obj = new A_25500()
      expect(obj.foo(...a)).assertEqual(Color_spex_meth_8.Green)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_2700
     * @tc.name      testExpressionsSpreadTwo0027
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_25600.foo(...([1.0, 2.0]))).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_2800
     * @tc.name      testExpressionsSpreadTwo0028
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new B_25700()
      expect(obj.foo(5, ...a1_spex_meth_10_12_13!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_2900
     * @tc.name      testExpressionsSpreadTwo0029
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_25900().foo(5, ...(a1_spex_meth_12 ?? a2_spex_meth_12)!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_3000
     * @tc.name      testExpressionsSpreadTwo0030
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new A_26000()
      expect(obj.bar(...obj.foo())).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_3100
     * @tc.name      testExpressionsSpreadTwo0031
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new A_26100()
      let s = ["h", "", "el", "", "", "l", "", "o"]
      expect(obj.foo(...((s: string[]): string[] => {
        let res: string[] = []
        for (let el of s) if (el.length > 0) res = [...res, el]
        return res
      })(s))).assertEqual("hello")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_3200
     * @tc.name      testExpressionsSpreadTwo0032
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((new A_26200()).foo(...[256])).assertEqual(256)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_3300
     * @tc.name      testExpressionsSpreadTwo0033
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double[][] = [[2.0, 3.0], []]
      expect(A_26300.foo(...a[0])).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_3400
     * @tc.name      testExpressionsSpreadTwo0034
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [string, double[], string] = ["X", [2.0, 3.0, 4.0], "Z"]
      let obj = new A_26400()
      expect(obj.foo(...a[1])).assertEqual(9)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_3500
     * @tc.name      testExpressionsSpreadTwo0035
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = ["1", "2", "3"]
      let a2 = ["a", "b"]
      let obj = new B_26500()
      expect((obj).foo(...(a1 = a2))).assertEqual("a-b")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_3600
     * @tc.name      testExpressionsSpreadTwo0036
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_26600().foo(...(a1_spex_meth_19.length > a2_spex_meth_19.length ? a1_spex_meth_19 : a2_spex_meth_19))).assertEqual("1-2-3")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_3700
     * @tc.name      testExpressionsSpreadTwo0037
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_meth_20 = new A_spex_meth_20([false, false], [true, true])
      expect(a.meth()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_3800
     * @tc.name      testExpressionsSpreadTwo0038
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_meth_21 = new B_spex_meth_21([false, false], [true, true], new C_spex_meth_21())
      expect(b.bar()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_3900
     * @tc.name      testExpressionsSpreadTwo0039
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: number[][] = [[1.0, 2.0], [], [3.0, 4.0], [5.0]]
      expect((new A_26900()).foo(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_4000
     * @tc.name      testExpressionsSpreadTwo0040
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: number[][] = [[1.0, 2.0], [3.0, 4.0]]
      let a2: number[][] = [[5.0, 6.0], []]
      let obj = new A_27000()
      expect(obj.bar(...[...obj.foo(...a1), ...obj.foo(...a2)])).assertEqual(21.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_4100
     * @tc.name      testExpressionsSpreadTwo0041
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Double[] = [1, 2, 3]
      let a2: Short[] = [4, 5]
      let a3: Byte[] = [6]
      let ar = [-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]
      let obj = new A_spex_meth_24_25()
      expect(obj.foo(...ar)).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_4200
     * @tc.name      testExpressionsSpreadTwo0042
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Double[] = [1, 2, 3]
      let a2: Short[] = [4, 5]
      let a3: Byte[] = [6]
      let ar = [-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]
      let obj = new A_spex_meth_24_25()
      expect(obj.foo(...ar)).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_4300
     * @tc.name      testExpressionsSpreadTwo0043
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: (Int|Number|String|undefined)[] = [new Int(), new Int(), undefined, "Z", 42.0]
      expect(new A_spex_meth_26().foo(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_4400
     * @tc.name      testExpressionsSpreadTwo0044
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: (A_spex_meth_27<String>|B_spex_meth_27<Long>|C_spex_meth_27<Error>|null)[] = [new A_spex_meth_27<String>(), new B_spex_meth_27<Long>(), new C_spex_meth_27<Error>()]
      let obj = new Z_spex_meth_27<String, Long, Error>()
      expect(obj.foo(...a1)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_4500
     * @tc.name      testExpressionsSpreadTwo0045
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_spex_meth_28_29().foo(...((): string[] => a1_spex_meth_28_29)())).assertEqual("123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_4600
     * @tc.name      testExpressionsSpreadTwo0046
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_spex_meth_28_29().foo(...((p: string[], q: string[]): string[] => [...p, ...q])(a1_spex_meth_28_29, a1_spex_meth_28_29))).assertEqual("123123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_4700
     * @tc.name      testExpressionsSpreadTwo0047
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new A_27700()
      let t1: [number, boolean] = [1.0, true]
      let r: [boolean, number] = obj.foo(...t1)
      expect(r[0] && r[1] == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_4800
     * @tc.name      testExpressionsSpreadTwo0048
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new A_27800()
      let r: [number, number, boolean, boolean] = obj.foo(...[1.0, true])
      expect(r[0] == 1.0 && r[1] == 1.0 && r[2] && r[3]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_4900
     * @tc.name      testExpressionsSpreadTwo0049
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [byte, short, int, long, float, double, boolean, char, string] =
        [1 as byte, 2 as short, 3, 4 as long, 5.0f, 6.0, true, c'Z', "X"]
      expect(new A_27900().foo(...r)[9]).assertEqual(42)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_5000
     * @tc.name      testExpressionsSpreadTwo0050
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: [Object, Error]|null = [new Object, new Error]
      expect(A_28000.foo(...a1!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_5100
     * @tc.name      testExpressionsSpreadTwo0051
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: [Object, Error]|null = null
      let a2: [Object, Error]|null = [new Object, new Error]
      let obj = new A_28200()
      expect(obj.foo(...(a1 ?? a2)!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_5200
     * @tc.name      testExpressionsSpreadTwo0052
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new A_spex_meth_37()
      let r: [string, number] = obj.bar(...obj.foo())
      expect(r[0] == "X" && r[1] == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_5300
     * @tc.name      testExpressionsSpreadTwo0053
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [[double, double], [char, char]] = [[2.0, 3.0], [c'Z', c'X']]
      let obj = new A_28500()
      expect(obj.foo(...a[0])).assertEqual(5.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_5400
     * @tc.name      testExpressionsSpreadTwo0054
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: [string, int] = ["1", 10]
      let a2: [string, int] = ["2", 20]
      expect(A_28600.foo(...(a1 = a2))).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_5500
     * @tc.name      testExpressionsSpreadTwo0055
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new A_28700().foo(...(a1_spex_meth_40[0] > a2_spex_meth_40[0] ? a1_spex_meth_40 : a2_spex_meth_40))
      expect(r).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_5600
     * @tc.name      testExpressionsSpreadTwo0056
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_meth_41 = new A_spex_meth_41(1, c'Z', new Z_spex_meth_41())
      expect(a.meth()).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_5700
     * @tc.name      testExpressionsSpreadTwo0057
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_meth_42 = new B_spex_meth_42(1, c'Z')
      expect(b.meth()[0]).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_5800
     * @tc.name      testExpressionsSpreadTwo0058
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Z_spex_meth_43<Long, Error>()
      let a1: [A_spex_meth_43<Long>, B_spex_meth_43<Error>] = [new A_spex_meth_43<Long>(), new B_spex_meth_43<Error>()]
      expect(obj.foo(...a1)).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_5900
     * @tc.name      testExpressionsSpreadTwo0059
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new A_29100().foo(...((p: [int, int]): [int, int] => [p[1], p[0]])(a2_spex_meth_44))
      expect(r).assertEqual("56")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_6000
     * @tc.name      testExpressionsSpreadTwo0060
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: readonly int[] = [1, 2, 3]
      let rw: int[] = [...a]
      rw[1] = 4
      expect(rw[1]).assertEqual(4)
      expect(a[1]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_6100
     * @tc.name      testExpressionsSpreadTwo0061
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: readonly number[] = [1.0, 2.0, 3.0]
      let rw = [0.0, ...a, 4.0]
      rw[0] = 5.0
      rw[3] = 6.0
      expect(rw[0]).assertEqual(5.0)
      expect(rw[3]).assertEqual(6.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_6200
     * @tc.name      testExpressionsSpreadTwo0062
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: readonly byte[] = [1 as byte, 2 as byte, 3 as byte]
      let rw: byte[] = [...a]
      rw[0] = 11 as byte
      expect(rw[0]).assertEqual(11)
      expect(a[0]).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_6300
     * @tc.name      testExpressionsSpreadTwo0063
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: readonly char[] = [c'a', c'b', c'c']
      let rw: char[] = [...a]
      rw[0] = c'Z'
      expect(rw[0]).assertEqual(c'Z')
      expect(a[0]).assertEqual(c'a')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_6400
     * @tc.name      testExpressionsSpreadTwo0064
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: readonly string[] = ["a", "b", "c"]
      let ro: readonly string[] = [...a]
      expect(ro[0]).assertEqual("a")
      expect(ro.length).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_6500
     * @tc.name      testExpressionsSpreadTwo0065
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readonly_arr: readonly number[] = [1.0, 2.0]
      let mutable_arr: number[] = [3.0, 4.0]
      let result: readonly number[] = [...readonly_arr, ...mutable_arr]
      expect(result.length).assertEqual(4)
      expect(result[2]).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_6600
     * @tc.name      testExpressionsSpreadTwo0066
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: int[] = [1, 2, 3]
      let ro: readonly int[] = [...b]
      expect(ro[0]).assertEqual(1)
      expect(ro[1]).assertEqual(2)
      expect(ro[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_6700
     * @tc.name      testExpressionsSpreadTwo0067
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: number[] = [1.0, 2.0]
      let ro: readonly number[] = [0.0, ...b, 3.0]
      expect(ro.length).assertEqual(4)
      expect(ro[2]).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_6800
     * @tc.name      testExpressionsSpreadTwo0068
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: int[] = [1, 2, 3]
      fooReadonlyRestParam_spex_to_readonly(...b)
      expect(b[0]).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_6900
     * @tc.name      testExpressionsSpreadTwo0069
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: FixedArray<int> = [1, 2, 3]
      let ro: readonly int[] = [...b]
      expect(ro[0]).assertEqual(1)
      expect(ro.length).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_7000
     * @tc.name      testExpressionsSpreadTwo0070
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: [int, int] = [1, 2]
      let ro: readonly int[] = [...b]
      expect(ro[0]).assertEqual(1)
      expect(ro[1]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TWO_7100
     * @tc.name      testExpressionsSpreadTwo0071
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadTwo0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: readonly [int, int, int] = [1, 2, 3]
      let rw: int[] = [...a]
      rw[1] = 11
      expect(rw[1]).assertEqual(11)
      expect(a[1]).assertEqual(2)
    });
  });
}
