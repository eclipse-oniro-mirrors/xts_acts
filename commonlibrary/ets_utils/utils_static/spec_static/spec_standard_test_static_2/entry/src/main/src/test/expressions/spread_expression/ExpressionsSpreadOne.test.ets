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

let a2_spex_const_44: [int, int] = [6, 5]
class A_spex_const_44 {
  fld: string
  constructor(...p: [int, int]) {
    this.fld = "" + p[0] + p[1]
  }
}
function foo_spex_copy_values_0(...p: int[]) {
  p[1] = 4
}

function foo_spex_copy_values_1(...p: number[]) {
  p[0] = 99.0
  p[2] = 88.0
}

function foo_spex_copy_values_2(...p: string[]) {
  p[1] = "modified"
  return p
}

function foo_spex_copy_values_5(...p: byte[]) {
  p[0] = 99 as byte
}

function foo_spex_copy_values_6(...p: long[]) {
  p[1] = 777 as long
}

function foo_spex_copy_values_7(...p: char[]) {
  p[0] = c'Z'
}

function foo_spex_copy_values_8(...p: FixedArray<int>) {
  p[0] = 999
}

function foo_spex_copy_values_10(...p: [int, int][]) {
  p[0][0] = 999
}

function foo_spex_copy_values_11(...p: int[]) {
  p.push(999)
}

function foo_spex_copy_values_13(...p: int[]) {
  for (let i = 0; i < p.length; i++) {
    p[i] = p[i] * 10
  }
}
class A_spex_func_20 {
  fld: boolean[]
  constructor(p: boolean[], q: boolean[]) {
    this.fld = [...p, ...q]
  }
  meth(): number {
    return foo_spex_func_20(42, ...this.fld)
  }
}
function foo_spex_func_20(a: int, ...p: boolean[]): number {
  return a + p.length
}

abstract class A_spex_func_21 {
  fld: boolean[] = []
  constructor(p: boolean[]) {
    this.fld = p
  }
  meth(): boolean[] {
    return this.fld
  }
}
class B_spex_func_21 extends A_spex_func_21 {
  constructor(p: boolean[], q: boolean[]) {
    super([...p, ...q])
  }
  bar(): number {
    return foo_spex_func_21(42, ...super.meth())
  }
}
function foo_spex_func_21(a: int, ...p: boolean[]): number {
  return a + p.length
}

type F_spex_func_7 = (p: number) => number

enum Color_spex_func_8 { Red, Green, Blue }

function foo_spex_func_13(): number[] {
  return [1.0, 2.0]
}
function bar_spex_func_13(...p: number[]): number {
  return p.reduce((prev: number, next: number) => prev + next, 0.0)
}

function foo_spex_func_14(...p: string[]): string {
  return String.join(p, '')
}

function foo_spex_func_18_19(...p: string[]): string {
  return String.join(p, '-')
}
let a1_spex_func_19 = ['1', '2', '3']
let a2_spex_func_19 = ['a', 'b']

function foo_spex_func_22(...p: number[][]): number {
  let res = 0
  for (let el of p) res += el.length
  return res
}

function foo_spex_func_23(...p: number[][]): number[] {
  let res: number[] = []
  for (let el of p) res = [...res, ...el]
  return res
}
function bar_spex_func_23(...p: number[]): number {
  return p.reduce((prev: number, next: number) => prev + next, 0.0)
}

function foo_spex_func_26(...p: (Int|Number|String|undefined)[]): number {
  return p.length
}

class A_spex_func_27<T> {}
class B_spex_func_27<T> {}
class C_spex_func_27<T> {}
function foo_spex_func_27<T, U, V>(...p: (A_spex_func_27<T>|B_spex_func_27<U>|C_spex_func_27<V>|null)[]): number {
  return p.length
}

let a1_spex_func_28_29 = ['1', '2', '3']
function foo_spex_func_28_29(...p: string[]): string {
  return String.join(p, '')
}
function foo_12400(...p: Object[]): number {
  return p.length
}

function foo_12500(...p: char[]): number {
  return p.length
}
function foo_12600(a: int, ...p: byte[]): int {
  return a + p.reduce((prev: int, next: byte) => prev + next, 0)
}
function foo_12700(a: int, ...p: short[]): int {
  return a + p.reduce((prev: int, next: short) => prev + next, 0)
}
function foo_12800(a: long, ...p: long[]): long {
  return a + p.reduce((prev: long, next: long) => prev + next, 0 as long)
}
function foo_12900(a: float, ...p: float[]): float {
  return a + p.reduce((prev: float, next: float) => prev + next, 0.0f)
}
function foo_13000(a: number, ...p: number[]): number {
  return a + p.reduce((prev: number, next: number) => prev + next, 0.0)
}
function foo_13100(a: number, ...p: F_spex_func_7[]): number {
  let res = a
  for (let el of p) res += el(res)
  return res
}
function foo_13200(...p: Color_spex_func_8[]): Color_spex_func_8 {
  return p.length ? p[p.length - 1] : Color_spex_func_8.Red
}
function foo_13300(...p: number[]): number {
  return p.length ? p[p.length - 1] : -1.0
}
function foo_13400(a: int, ...p: Object[]): number {
  return a + p.length
}
function foo_13600(a: int, ...p: Any[]): number {
  return a + p.length
}
function foo_13900(...p: number[]): number {
  return p.length ? p[p.length - 1] : -1
}
function foo_14000(...p: double[]): double {
  return p[0] + p[1]
}
function foo_14100(...p: double[]): double {
  return p[0] + p[1] + p[2]
}
class A_spex_func_41 {
  fld: [int, char]
  constructor(p: int, q: char) {
    this.fld = [p, q]
  }
  meth(): int {
    return 10 + foo_spex_func_41(...this.fld)
  }
}
function foo_spex_func_41(...p: [int, char]): int {
  return 100 + p[0]
}

abstract class A_spex_func_42 {
  fld: [int, char]
  constructor(p: [int, char]) {
    this.fld = p
  }
  meth(): [int, char] {
    return this.fld
  }
}
class B_spex_func_42 extends A_spex_func_42 {
  constructor(p: int, q: char) {
    super([p, q])
  }
  meth(): [int, char] {
    this.fld[0] = 10 + foo_spex_func_42(...super.meth())
    return this.fld
  }
}
function foo_spex_func_42(...p: [int, char]): int {
  return 100 + p[0]
}

class A_spex_func_43<T> {}
class B_spex_func_43<T> {}
function foo_spex_func_43<T, U>(...p: [A_spex_func_43<T>, B_spex_func_43<U>]): boolean {
  return p[0] == p[1]
}

type F_spex_func_54 = (p: number) => number

enum Color_spex_func_55 { Red, Green, Blue }

let r1_spex_func_45: Record<int, string> = {1: '1', 3: '3'}
let r2_spex_func_45: Record<int, string> = {2: '2'}

let a1_spex_func_40: [int, int] = [1, 2]
let a2_spex_func_40: [int, int] = [5, 6]

let a1_spex_func_33_35: [Object, Error]|null = [new Object, new Error]
let a1_spex_func_35: [Object, Error]|null = null
let a2_spex_func_35: [Object, Error]|null = [new Object, new Error]

let a2_spex_func_44: [int, int] = [6, 5]

let a1_spex_func_57: FixedArray<Object>|null = [new Object, new Object]
let a1_spex_func_59: FixedArray<Object>|null = null
let a2_spex_func_59: FixedArray<Object>|null = [new Object, new Object]

function reduce<T, R>(arr: Array<T>, callback: (prev: R, next: T) => R, initialValue: R): R {
  let result = initialValue
  for (let i = 0; i < arr.length; i++) {
    result = callback(result, arr[i])
  }
  return result
}

function foo_15400(...p: [number, boolean]): [boolean, number] {
  return [p[1], p[0]]
}
function foo_15500(...p: [number, boolean]): [number, number, boolean, boolean] {
  return [p[0], p[0], p[1], p[1]]
}
function foo_15700(...p: [Object, Error]): int {
  return p[0] != p[1] ? 3 : 0
}
function foo_15900(...p: [Object, Error]): int {
  return p[0] != p[1] ? 3 : 0
}
function foo_16100(): [number, string] {
  return [1.0, 'X']
}
function bar_16100(...p: [number, string]): [string, number] {
  return [p[1], p[0]]
}
function foo_16200(...p: [double, double]): double {
  return p[0] + p[1]
}
function foo_16300(...p: [string, int]): int {
  return p[1]
}
function foo_16400(...p: [int, int]): int {
  return p[0] + p[1]
}
function foo_16800(...p: [int, int]): string {
  return '' + p[0] + p[1]
}
function foo_16900(...p: Record<int, string>[]): number {
  expect(p[0][1]).assertEqual('1')
  return p.length
}
function foo_17100(...p: Array<Object>): number {
  return p.length
}
function foo_17200(...p: FixedArray<char>): number {
  return p.length
}
function foo_17300(a: int, ...p: Array<byte>): int {
  return a + reduce(p, (prev: int, next: byte) => prev + next, 0)
}
function foo_17700(a: number, ...p: number[]): number {
  return a + reduce(p, (prev: number, next: number) => prev + next, 0.0)
}
function foo_17800(a: number, ...p: FixedArray<F_spex_func_54>): number {
  let res = a
  for (let el of p) res += el(res)
  return res
}
function foo_17900(...p: Color_spex_func_55[]): Color_spex_func_55 {
  return p.length ? p[p.length - 1] : Color_spex_func_55.Red
}
function foo_18000(...p: FixedArray<Object>): number {
  return (p.length ? p[p.length - 1] : -1.0) as number
}
function foo_18100(a: int, ...p: FixedArray<Object>): int {
  return a + p.length
}
function foo_18300(a: int, ...p: FixedArray<Object>): int {
  return a + p.length
}
function foo_spex_func_64(...p: Array<double>): double {
  return p[0] + p[1] + p[2]
}
class A_spex_func_67 {
  fld: FixedArray<boolean>
  constructor(p: FixedArray<boolean>, q: FixedArray<boolean>) {
    this.fld = [...p, ...q]
  }
  meth(): number {
    return foo_spex_func_67(42, ...this.fld)
  }
}
function foo_spex_func_67(a: int, ...p: FixedArray<boolean>): number {
  return a + p.length
}

abstract class A_spex_func_68 {
  fld: FixedArray<boolean> = []
  constructor(p: FixedArray<boolean>) {
    this.fld = p
  }
  meth(): FixedArray<boolean> {
    return this.fld
  }
}
class B_spex_func_68 extends A_spex_func_68 {
  constructor(p: FixedArray<boolean>, q: FixedArray<boolean>) {
    super([...p, ...q])
  }
  bar(): number {
    return foo_spex_func_68(42, ...super.meth())
  }
}
function foo_spex_func_68(a: int, ...p: FixedArray<boolean>): number {
  return a + p.length
}

function foo_spex_func_69(...p: FixedArray<FixedArray<number>>): number {
  let res = 0
  for (let el of p) res += el.length
  return res
}

function foo_spex_func_70(...p: FixedArray<FixedArray<number>>): FixedArray<number> {
  let res: FixedArray<number> = []
  for (let el of p) res = [...res, ...el]
  return res
}
function bar_spex_func_70(...p: FixedArray<number>): number {
  let res = 0.0
  for (let el of p) res += el
  return res
}

function foo_spex_func_71(...p: Array<Double|Short|Byte>): double {
  let res = 0.0
  for (let el of p) res += (el as Numeric).toDouble()
  return res
}
class A_spex_func_74<T> {}
class B_spex_func_74<T> {}
class C_spex_func_74<T> {}
function foo_spex_func_74<T, U, V>(...p: FixedArray<A_spex_func_74<T>|B_spex_func_74<U>|C_spex_func_74<V>|null>): number {
  return p.length
}

type F_spex_lmbd_7 = (p: number) => number

enum Color_spex_lmbd_8 { Red, Green, Blue }

let a1_spex_lmbd_10_12_13: Object[]|null = [new Object, new Object]
let a1_spex_lmbd_13: Object[]|null = null
let a2_spex_lmbd_13: Object[]|null = [new Object, new Object]

function foo_spex_lmbd_14(): number[] {
  return [1.0, 2.0]
}

let a1_spex_lmbd_20 = ["1", "2", "3"]
let a2_spex_lmbd_20 = ["a", "b"]

class A_spex_lmbd_21 {
  fld: boolean[]
  constructor(p: boolean[], q: boolean[]) {
    this.fld = [...p, ...q]
  }
  meth(): int {
    return ((a: int, ...p: boolean[]): int => a + p.length)(42, ...this.fld)
  }
}

abstract class A_spex_lmbd_22 {
  fld: boolean[]
  constructor(p: boolean[]) {
    this.fld = p
  }
  meth(): boolean[] {
    return this.fld
  }
}
class B_spex_lmbd_22 extends A_spex_lmbd_22 {
  constructor(p: boolean[], q: boolean[]) {
    super([...p, ...q])
  }
  bar(): int {
    return ((a: int, ...p: boolean[]): int => a + p.length)(42, ...super.meth())
  }
}

export default function ExpressionsSpreadOneTest(): void {
  describe("ExpressionsSpreadOneTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_0100
     * @tc.name      testExpressionsSpreadOne0001
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new A_spex_const_44(...((p: [int, int]): [int, int] => [p[1], p[0]])(a2_spex_const_44)).fld
      expect(r).assertEqual("56")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_0200
     * @tc.name      testExpressionsSpreadOne0002
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Callee modifies its copy, original array unchanged
      let a: int[] = [1, 2, 3]
      foo_spex_copy_values_0(...a)
      expect(a[0]).assertEqual(1)
      expect(a[1]).assertEqual(2)
      expect(a[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_0300
     * @tc.name      testExpressionsSpreadOne0003
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Multiple element modifications don't affect original
      let a: number[] = [1.0, 2.0, 3.0]
      foo_spex_copy_values_1(...a)
      expect(a[0]).assertEqual(1.0)
      expect(a[1]).assertEqual(2.0)
      expect(a[2]).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_0400
     * @tc.name      testExpressionsSpreadOne0004
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Function returns modified copy, original unchanged
      let a: string[] = ["a", "b", "c"]
      let result = foo_spex_copy_values_2(...a)
      expect(result[1]).assertEqual("modified")
      expect(a[1]).assertEqual("b")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_0500
     * @tc.name      testExpressionsSpreadOne0005
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Array literal spread creates new array
      let original: int[] = [1, 2, 3]
      let copy = [...original]
      copy[0] = 999
      expect(original[0]).assertEqual(1)
      expect(copy[0]).assertEqual(999)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_0600
     * @tc.name      testExpressionsSpreadOne0006
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Multiple spreads create independent arrays
      let a: int[] = [1, 2]
      let b = [...a]
      let c = [...a]
      b[0] = 10
      c[0] = 20
      expect(a[0]).assertEqual(1)
      expect(b[0]).assertEqual(10)
      expect(c[0]).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_0700
     * @tc.name      testExpressionsSpreadOne0007
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte[] = [1 as byte, 2 as byte, 3 as byte]
      foo_spex_copy_values_5(...a)
      expect(a[0]).assertEqual(1)
      expect(a[1]).assertEqual(2)
      expect(a[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_0800
     * @tc.name      testExpressionsSpreadOne0008
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long[] = [100 as long, 200 as long, 300 as long]
      foo_spex_copy_values_6(...a)
      expect(a[0]).assertEqual(100)
      expect(a[1]).assertEqual(200)
      expect(a[2]).assertEqual(300)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_0900
     * @tc.name      testExpressionsSpreadOne0009
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char[] = [c'a', c'b', c'c']
      foo_spex_copy_values_7(...a)
      expect(a[0]).assertEqual(c'a')
      expect(a[1]).assertEqual(c'b')
      expect(a[2]).assertEqual(c'c')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_1000
     * @tc.name      testExpressionsSpreadOne0010
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FixedArray<int> = [1, 2, 3]
      foo_spex_copy_values_8(...a)
      expect(a[0]).assertEqual(1)
      expect(a[1]).assertEqual(2)
      expect(a[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_1100
     * @tc.name      testExpressionsSpreadOne0011
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: FixedArray<number> = [1.0, 2.0, 3.0]
      let copy: number[] = [...original]
      copy[1] = 999.0
      expect(original[1]).assertEqual(2.0)
      expect(copy[1]).assertEqual(999.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_1200
     * @tc.name      testExpressionsSpreadOne0012
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [int, int][] = [[1, 2], [3, 4]]
      foo_spex_copy_values_10(...a)
      expect(a[0][0]).assertEqual(999)
      expect(a[0][1]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_1300
     * @tc.name      testExpressionsSpreadOne0013
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2, 3]
      foo_spex_copy_values_11(...a)
      expect(a.length).assertEqual(3)
      expect(a[0]).assertEqual(1)
      expect(a[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_1400
     * @tc.name      testExpressionsSpreadOne0014
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string[] = ["a", "b"]
      let copy = [...original]
      copy.push("c")
      expect(original.length).assertEqual(2)
      expect(copy.length).assertEqual(3)
      expect(copy[2]).assertEqual("c")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_1500
     * @tc.name      testExpressionsSpreadOne0015
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // All elements modified in copy, original unchanged
      let a: int[] = [1, 2, 3, 4, 5]
      foo_spex_copy_values_13(...a)
      expect(a[0]).assertEqual(1)
      expect(a[2]).assertEqual(3)
      expect(a[4]).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_1600
     * @tc.name      testExpressionsSpreadOne0016
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Object[] = [], a2: Error[] = []
      expect(foo_12400(...[...a1, ...a2, new Object(), ...a1])).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_1700
     * @tc.name      testExpressionsSpreadOne0017
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char[] = [c'b', c'c']
      expect(foo_12500(...a)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_1800
     * @tc.name      testExpressionsSpreadOne0018
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte[] = [1 as byte, 2 as byte, 3 as byte]
      expect(foo_12600(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_1900
     * @tc.name      testExpressionsSpreadOne0019
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short[] = [1 as short, 2 as short, 3 as short]
      expect(foo_12700(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_2000
     * @tc.name      testExpressionsSpreadOne0020
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long[] = [1 as long, 2 as long, 3 as long]
      expect(foo_12800(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_2100
     * @tc.name      testExpressionsSpreadOne0021
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float[] = [1.0f, 2.0f, 3.0f]
      expect(foo_12900(42.0f, ...a)).assertEqual(48.0f)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_2200
     * @tc.name      testExpressionsSpreadOne0022
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [1.0, 2.0, 3.0]
      expect(foo_13000(42, ...a)).assertEqual(48.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_2300
     * @tc.name      testExpressionsSpreadOne0023
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: F_spex_func_7[] = [(p: number) => p * 2, (p: number) => p * 3]
      let b: F_spex_func_7[] = [(p: number) => p * 4, (p: number) => p * 5]
      expect(foo_13100(1.0, ...[...a, ...b])).assertEqual(360.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_2400
     * @tc.name      testExpressionsSpreadOne0024
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Color_spex_func_8[] = [Color_spex_func_8.Red, Color_spex_func_8.Blue, Color_spex_func_8.Green]
      expect(foo_13200(...a)).assertEqual(Color_spex_func_8.Green)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_2500
     * @tc.name      testExpressionsSpreadOne0025
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_13300(...([1.0, 2.0]))).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_2600
     * @tc.name      testExpressionsSpreadOne0026
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Object[]|null = [new Object, new Object]
      expect(foo_13400(5, ...a1!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_2700
     * @tc.name      testExpressionsSpreadOne0027
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Object[]|null = null
      let a2: Object[]|null = [new Object, new Object]
      expect(foo_13600(5, ...(a1 ?? a2)!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_2800
     * @tc.name      testExpressionsSpreadOne0028
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(bar_spex_func_13(...foo_spex_func_13())).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_2900
     * @tc.name      testExpressionsSpreadOne0029
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = ['h', '', 'el', '', '', 'l', '', 'o']
      expect(foo_spex_func_14(...((s: string[]): string[] => {
        let res: string[] = []
        for (let el of s) if (el.length > 0) res = [...res, el]
        return res
      })(s))).assertEqual('hello')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_3000
     * @tc.name      testExpressionsSpreadOne0030
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_13900(...[256])).assertEqual(256)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_3100
     * @tc.name      testExpressionsSpreadOne0031
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double[][] = [[2.0, 3.0], []]
      expect(foo_14000(...a[0])).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_3200
     * @tc.name      testExpressionsSpreadOne0032
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [string, double[], string] = ['X', [2.0, 3.0, 4.0], 'Z']
      expect(foo_14100(...a[1])).assertEqual(9)
    });
	
    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_3300
     * @tc.name      testExpressionsSpreadOne0033
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = ['1', '2', '3']
      let a2 = ['a', 'b']
      expect(foo_spex_func_18_19(...(a1 = a2))).assertEqual('a-b')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_3400
     * @tc.name      testExpressionsSpreadOne0034
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_spex_func_18_19(...(a1_spex_func_19.length > a2_spex_func_19.length ? a1_spex_func_19 : a2_spex_func_19))).assertEqual('1-2-3')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_3500
     * @tc.name      testExpressionsSpreadOne0035
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_func_20 = new A_spex_func_20([false, false], [true, true])
      expect(a.meth()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_3600
     * @tc.name      testExpressionsSpreadOne0036
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_func_21 = new B_spex_func_21([false, false], [true, true])
      expect(b.bar()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_3700
     * @tc.name      testExpressionsSpreadOne0037
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: number[][] = [[1.0, 2.0], [], [3.0, 4.0], [5.0]]
      expect(foo_spex_func_22(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_3800
     * @tc.name      testExpressionsSpreadOne0038
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: number[][] = [[1.0, 2.0], [3.0, 4.0]]
      let a2: number[][] = [[5.0, 6.0], []]
      expect(bar_spex_func_23(...[...foo_spex_func_23(...a1), ...foo_spex_func_23(...a2)])).assertEqual(21.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_3900
     * @tc.name      testExpressionsSpreadOne0039
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: (Int|Number|String|undefined)[] = [new Int(), new Int(), undefined, 'Z', 42.0]
      expect(foo_spex_func_26(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_4000
     * @tc.name      testExpressionsSpreadOne0040
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: (A_spex_func_27<String>|B_spex_func_27<Long>|C_spex_func_27<Error>|null)[] = [new A_spex_func_27<String>, new B_spex_func_27<Long>, new C_spex_func_27<Error>]
      expect(foo_spex_func_27<String, Long, Error>(...a1)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_4100
     * @tc.name      testExpressionsSpreadOne0041
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_spex_func_28_29(...((): string[] => a1_spex_func_28_29)())).assertEqual('123')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_4200
     * @tc.name      testExpressionsSpreadOne0042
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_spex_func_28_29(...((p: string[], q: string[]): string[] => [...p, ...q])(a1_spex_func_28_29, a1_spex_func_28_29))).assertEqual('123123')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_4300
     * @tc.name      testExpressionsSpreadOne0043
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1: [number, boolean] = [1.0, true]
      let r: [boolean, number] = foo_15400(...t1)
      expect(r[0] && r[1] == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_4400
     * @tc.name      testExpressionsSpreadOne0044
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [number, number, boolean, boolean] = foo_15500(...[1.0, true])
      expect(r[0] == 1.0 && r[1] == 1.0 && r[2] && r[3]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_4500
     * @tc.name      testExpressionsSpreadOne0045
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_15700(...a1_spex_func_33_35!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_4600
     * @tc.name      testExpressionsSpreadOne0046
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_15900(...(a1_spex_func_35 ?? a2_spex_func_35)!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_4700
     * @tc.name      testExpressionsSpreadOne0047
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [string, number] = bar_16100(...foo_16100())
      expect(r[0] == 'X' && r[1] == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_4800
     * @tc.name      testExpressionsSpreadOne0048
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [[double, double], [char, char]] = [[2.0, 3.0], [c'Z', c'X']]
      expect(foo_16200(...a[0])).assertEqual(5.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_4900
     * @tc.name      testExpressionsSpreadOne0049
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: [string, int] = ['1', 10]
      let a2: [string, int] = ['2', 20]
      expect(foo_16300(...(a1 = a2))).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_5000
     * @tc.name      testExpressionsSpreadOne0050
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = foo_16400(...(a1_spex_func_40[0] > a2_spex_func_40[0] ? a1_spex_func_40 : a2_spex_func_40))
      expect(r).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_5100
     * @tc.name      testExpressionsSpreadOne0051
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_func_41 = new A_spex_func_41(1, c'Z')
      expect(a.meth()).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_5200
     * @tc.name      testExpressionsSpreadOne0052
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_func_42 = new B_spex_func_42(1, c'Z')
      expect(b.meth()[0]).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_5300
     * @tc.name      testExpressionsSpreadOne0053
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: [A_spex_func_43<Long>, B_spex_func_43<Error>] = [new A_spex_func_43<Long>, new B_spex_func_43<Error>]
      expect(foo_spex_func_43<Long, Error>(...a1)).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_5400
     * @tc.name      testExpressionsSpreadOne0054
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = foo_16800(...((p: [int, int]): [int, int] => [p[1], p[0]])(a2_spex_func_44))
      expect(r).assertEqual('56')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_5500
     * @tc.name      testExpressionsSpreadOne0055
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_16900(...[r1_spex_func_45, r2_spex_func_45])).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_5600
     * @tc.name      testExpressionsSpreadOne0056
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: FixedArray<Object> = [], a2: FixedArray<Error> = []
      expect(foo_17100(...[...a1, ...a2, new Object(), ...a1])).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_5700
     * @tc.name      testExpressionsSpreadOne0057
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FixedArray<char> = [c'b', c'c']
      expect(foo_17200(...a)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_5800
     * @tc.name      testExpressionsSpreadOne0058
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Array<byte> spread
      let a: FixedArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      expect(foo_17300(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_5900
     * @tc.name      testExpressionsSpreadOne0059
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FixedArray<number> = [1.0, 2.0, 3.0]
      expect(foo_17700(42, ...a)).assertEqual(48.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_6000
     * @tc.name      testExpressionsSpreadOne0060
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FixedArray<F_spex_func_54> = [(p: number) => p * 2, (p: number) => p * 3]
      let b: FixedArray<F_spex_func_54> = [(p: number) => p * 4, (p: number) => p * 5]
      expect(foo_17800(1.0, ...[...a, ...b])).assertEqual(360.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_6100
     * @tc.name      testExpressionsSpreadOne0061
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FixedArray<Color_spex_func_55> = [Color_spex_func_55.Red, Color_spex_func_55.Blue, Color_spex_func_55.Green]
      expect(foo_17900(...a)).assertEqual(Color_spex_func_55.Green)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_6200
     * @tc.name      testExpressionsSpreadOne0062
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_18000(...([1.0, 2.0]))).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_6300
     * @tc.name      testExpressionsSpreadOne0063
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_18100(5, ...a1_spex_func_57!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_6400
     * @tc.name      testExpressionsSpreadOne0064
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_18300(5, ...(a1_spex_func_59 ?? a2_spex_func_59)!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_6500
     * @tc.name      testExpressionsSpreadOne0065
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [string, FixedArray<double>, string] = ['X', [2.0, 3.0, 4.0], 'Z']
      expect(foo_spex_func_64(...a[1])).assertEqual(9.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_6600
     * @tc.name      testExpressionsSpreadOne0066
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_func_67 = new A_spex_func_67([false, false], [true, true])
      expect(a.meth()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_6700
     * @tc.name      testExpressionsSpreadOne0067
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_func_68 = new B_spex_func_68([false, false], [true, true])
      expect(b.bar()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_6800
     * @tc.name      testExpressionsSpreadOne0068
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: FixedArray<FixedArray<number>> = [[1.0, 2.0], [], [3.0, 4.0], [5.0]]
      expect(foo_spex_func_69(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_6900
     * @tc.name      testExpressionsSpreadOne0069
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: FixedArray<FixedArray<number>> = [[1.0, 2.0], [3.0, 4.0]]
      let a2: FixedArray<FixedArray<number>> = [[5.0, 6.0], []]
      expect(bar_spex_func_70(...[...foo_spex_func_70(...a1), ...foo_spex_func_70(...a2)])).assertEqual(21.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_7000
     * @tc.name      testExpressionsSpreadOne0070
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: FixedArray<Double> = [1, 2, 3]
      let a2: FixedArray<Short> = [4, 5]
      let a3: FixedArray<Byte> = [6]
      let ar = [-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]
      expect(foo_spex_func_71(...ar)).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_7100
     * @tc.name      testExpressionsSpreadOne0071
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: FixedArray<A_spex_func_74<String>|B_spex_func_74<Long>|C_spex_func_74<Error>|null> = [
        new A_spex_func_74<String>(),
        new B_spex_func_74<Long>(),
        new C_spex_func_74<Error>()
      ]
      expect(foo_spex_func_74<String, Long, Error>(...a1)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_7200
     * @tc.name      testExpressionsSpreadOne0072
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Object[] = [], a2: Error[] = []
      expect(((...p: Object[]): int => p.length)(...[...a1, ...a2, new Object(), ...a1])).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_7300
     * @tc.name      testExpressionsSpreadOne0073
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char[] = [c'b', c'c']
      expect(((...p: char[]): int => p.length)(...a)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_7400
     * @tc.name      testExpressionsSpreadOne0074
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte[] = [1 as byte, 2 as byte, 3 as byte]
      expect(((a: int, ...p: byte[]): int => a + reduce(p, (prev: int, next: byte) => prev + next, 0))(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_7500
     * @tc.name      testExpressionsSpreadOne0075
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short[] = [1 as short, 2 as short, 3 as short]
      expect(((a: int, ...p: short[]): int => a + reduce(p, (prev: int, next: short) => prev + next, 0))(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_7600
     * @tc.name      testExpressionsSpreadOne0076
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long[] = [1 as long, 2 as long, 3 as long]
      expect(((a: long, ...p: long[]): long => a + reduce(p, (prev: long, next: long) => prev + next, 0 as long))(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_7700
     * @tc.name      testExpressionsSpreadOne0077
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float[] = [1.0f, 2.0f, 3.0f]
      expect(((a: float, ...p: float[]): float => a + reduce(p, (prev: float, next: float) => prev + next, 0.0f))(42.0f, ...a)).assertEqual(48.0f)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_7800
     * @tc.name      testExpressionsSpreadOne0078
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [1.0, 2.0, 3.0]
      expect(((a: number, ...p: number[]): number => a + reduce(p, (prev: number, next: number) => prev + next, 0.0))(42, ...a)).assertEqual(48.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_7900
     * @tc.name      testExpressionsSpreadOne0079
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: F_spex_lmbd_7[] = [(p: number) => p * 2, (p: number) => p * 3]
      let b: F_spex_lmbd_7[] = [(p: number) => p * 4, (p: number) => p * 5]
      expect(((a: number, ...p: F_spex_lmbd_7[]): number => {
        let res = a
        for (let el of p) res += el(res)
        return res
      })(1.0, ...[...a, ...b])).assertEqual(360.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_8000
     * @tc.name      testExpressionsSpreadOne0080
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Color_spex_lmbd_8[] = [Color_spex_lmbd_8.Red, Color_spex_lmbd_8.Blue, Color_spex_lmbd_8.Green]
      expect(((...p: Color_spex_lmbd_8[]): Color_spex_lmbd_8 => p.length ? p[p.length - 1] : Color_spex_lmbd_8.Red)(...a)).assertEqual(Color_spex_lmbd_8.Green)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_8100
     * @tc.name      testExpressionsSpreadOne0081
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((...p: number[]): number => p.length ? p[p.length - 1] : -1.0)(...([1.0, 2.0]))).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_8200
     * @tc.name      testExpressionsSpreadOne0082
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((a: int, ...p: Object[]): int => a + p.length)(5, ...a1_spex_lmbd_10_12_13!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_8300
     * @tc.name      testExpressionsSpreadOne0083
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((a: int, ...p: Object[]): int => a + p.length)(5, ...a1_spex_lmbd_10_12_13!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_8400
     * @tc.name      testExpressionsSpreadOne0084
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((a: int, ...p: Object[]): int => a + p.length)(5, ...(a1_spex_lmbd_13 ?? a2_spex_lmbd_13)!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_8500
     * @tc.name      testExpressionsSpreadOne0085
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((...p: number[]): number => reduce(p, (prev: number, next: number) => prev + next, 0.0))(...foo_spex_lmbd_14())).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_8600
     * @tc.name      testExpressionsSpreadOne0086
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = ["h", "", "el", "", "", "l", "", "o"]
      expect(((...p: string[]): string => String.join(p, ""))(...((s: string[]): string[] => {
        let res: string[] = []
        for (let el of s) if (el.length > 0) res = [...res, el]
        return res
      })(s))).assertEqual("hello")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_8700
     * @tc.name      testExpressionsSpreadOne0087
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((...p: number[]): number =>  p.length ? p[p.length - 1] : -1)(...[256])).assertEqual(256);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_8800
     * @tc.name      testExpressionsSpreadOne0088
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double[][] = [[2.0, 3.0], []]
      expect(((...p: double[]): double => p[0] + p[1])(...a[0])).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_8900
     * @tc.name      testExpressionsSpreadOne0089
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [string, double[], string] = ["X", [2.0, 3.0, 4.0], "Z"]
      expect(((...p: double[]): double => p[0] + p[1] + p[2])(...a[1])).assertEqual(9)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_9000
     * @tc.name      testExpressionsSpreadOne0090
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = ["1", "2", "3"]
      let a2 = ["a", "b"]
      expect(((...p: string[]): string => String.join(p, "-"))(...(a1 = a2))).assertEqual("a-b")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_9100
     * @tc.name      testExpressionsSpreadOne0091
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((...p: string[]): string => String.join(p, "-"))(...(a1_spex_lmbd_20.length > a2_spex_lmbd_20.length ? a1_spex_lmbd_20 : a2_spex_lmbd_20))).assertEqual("1-2-3")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_9200
     * @tc.name      testExpressionsSpreadOne0092
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_lmbd_21 = new A_spex_lmbd_21([false, false], [true, true])
      expect(a.meth()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_9300
     * @tc.name      testExpressionsSpreadOne0093
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_lmbd_22 = new B_spex_lmbd_22([false, false], [true, true])
      expect(b.bar()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_ONE_9400
     * @tc.name      testExpressionsSpreadOne0094
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpreadOne0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: number[][] = [[1.0, 2.0], [], [3.0, 4.0], [5.0]]
      expect(((...p: number[][]): int => {
        let res = 0
        for (let el of p) res += el.length
        return res
      })(...a1)).assertEqual(5)
    });
  });
}