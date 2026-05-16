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

type F_spex_8 = (p: number) => number

enum Color_spex_9 { Red, Green, Blue }

enum Color_spex_10 { Red, Green, Blue }

let a1_spex_14: Object[]|null = null
let a2_spex_14: Object[]|null = [new Object, new Object]

function foo_spex_15(): number[] {
    return [1.0, 2.0]
}

function str_filter_spex_16(s: string[], f: (p: string) => boolean): string[] {
    let res: string[] = []
    for (let el of s) if (f(el)) res = [...res, el]
    return res
}

let a1_spex_21 = ["1", "2", "3"]
let a2_spex_21 = ["a", "b"]

class A_spex_22 {
    fld: boolean[]
    constructor(p: boolean[], q: boolean[]) {
        this.fld = [...p, ...q]
    }
    meth(): boolean[] {
        return [true, true, false, ...this.fld]
    }
}

abstract class A_spex_23 {
    fld: boolean[] = []
    constructor(p: boolean[]) {
        this.fld = p
    }
    meth(): boolean[] {
      return [true, true, false, ...this.fld]
    }
}
class B_spex_23 extends A_spex_23 {
    constructor(p: boolean[], q: boolean[]) {
        super([...p, ...q])
    }
    meth(): boolean[] {
        return [...super.meth(), true]
    }
}

interface I_spex_29 {}
interface J_spex_29 {}
class A_spex_30<T> {}
class B_spex_30<T> {}
class C_spex_30<T> {}

let a1_spex_31_32: string[] = ["1", "2", "3"]

let a1_spex_36: [Object, Error]|null = [new Object, new Error]
let a1_spex_38: [Object, Error]|null = null
let a2_spex_38: [Object, Error]|null = [new Object, new Error]

function foo_spex_40(): [number, string] {
  return [1.0, "X"]
}

let a1_spex_42: [int, int] = [1, 2]
let a2_spex_42: [int, int] = [5, 6]

class A_spex_43 {
  fld: [int, char]
  constructor(p: int, q: char) {
    this.fld = [p, q]
  }
  meth(): [int, int, char] {
    return [0, ...this.fld]
  }
}

abstract class A_spex_44 {
  fld: [int, char]
  constructor(p: [int, char]) {
    this.fld = p
  }
  meth(): [int, int, char] {
    return [0, ...this.fld]
  }
}
class B_spex_44 extends A_spex_44 {
  constructor(p: int, q: char) {
    super([p, q])
  }
  meth(): [int, int, char] {
    return [...super.meth()]
  }
}

class A_spex_45<T> {}
class B_spex_45<T> {}

let a2_spex_46: [int, int] = [6, 5]

let a_spex_52: [string, string] = ['1', '2']
let a_spex_56: [string, string] = ['1', '2']
let a_spex_57: [string, string] = ['1', '2']

let a_spex_53: string[] = ['1', '2']

let a_spex_54: FixedArray<string> = ['1', '2']

let a_spex_55: Array<string> = ['1', '2']
class C_spex_48 {
  x: int = 13
}
class A_spex_const_0 {
  fld: number
  constructor(...p: Object[]) {
    this.fld = p.length
  }
}

class A_spex_const_1 {
  fld: number
  constructor(...p: char[]) {
    this.fld = p.length
  }
}

class A_spex_const_2 {
  fld: int
  constructor(a: int, ...p: byte[]) {
    this.fld = a + p.reduce((prev: int, next: byte) => prev + next, 0)
  }
}

class A_spex_const_3 {
  fld: int
  constructor(a: int, ...p: short[]) {
    this.fld = a + p.reduce((prev: int, next: short) => prev + next, 0)
  }
}

class A_spex_const_4 {
  fld: long
  constructor(a: long, ...p: long[]) {
    this.fld = a + p.reduce((prev: long, next: long) => prev + next, 0 as long)
  }
}

class A_spex_const_5 {
  fld: float
  constructor(a: float, ...p: float[]) {
    this.fld = a + p.reduce((prev: float, next: float) => prev + next, 0.0f)
  }
}

class A_spex_const_6 {
  fld: number
  constructor(a: number, ...p: number[]) {
    this.fld = a + p.reduce((prev: number, next: number) => prev + next, 0.0)
  }
}

type F_spex_const_7 = (p: number) => number
class A_spex_const_7 {
  fld: number
  constructor(a: number, ...p: F_spex_const_7[]) {
    let res = a
    for (let el of p) res += el(res)
    this.fld = res
  }
}

enum Color_spex_const_8 { Red, Green, Blue }
class A_spex_const_8 {
  fld: Color_spex_const_8
  constructor(...p: Color_spex_const_8[]) {
    this.fld = p.length ? p[p.length - 1] : Color_spex_const_8.Red
  }
}

class A_spex_const_9 {
  fld: number
  constructor(...p: number[]) {
    this.fld = p.length ? p[p.length - 1] : -1.0
  }
}

class A_spex_const_10 {
  fld: number
  constructor(a: int, ...p: Object[]) {
    this.fld = a + p.length
  }
}
class B_spex_const_10 extends A_spex_const_10 {
  constructor(a: int, ...p: Object[]) {
    super(a, ...p)
  }
}

let a1_spex_const_12: Object[]|null = null
let a2_spex_const_12: Object[]|null = [new Object, new Object]
class A_spex_const_12 {
  fld: number
  constructor(a: int, ...p: Object[]) {
    this.fld = a + p.length
  }
}

class A_spex_const_13 {
  foo(): number[] {
    return [1.0, 2.0]
  }
}
class B_spex_const_13 {
  fld: number
  constructor(...p: number[]) {
    this.fld = p.reduce((prev: number, next: number) => prev + next, 0.0)
  }
}

class A_spex_const_14 {
  fld: string
  constructor(...p: string[]) {
    this.fld = String.join(p, "")
  }
}

class A_spex_const_15 {
  fld: number
  constructor(...p: number[]) {
    this.fld = p.length ? p[p.length - 1] : -1
  }
}

class A_spex_const_16 {
  fld: double
  constructor(...p: double[]) {
    this.fld = p[0] + p[1]
  }
}

class A_spex_const_17 {
  fld: double
  constructor(...p: double[]) {
    this.fld = p[0] + p[1] + p[2]
  }
}

class A_spex_const_18 {
  fld: string
  constructor(...p: string[]) {
    this.fld = String.join(p, "-")
  }
}

let a1_spex_const_19 = ["1", "2", "3"]
let a2_spex_const_19 = ["a", "b"]
class A_spex_const_19 {
  fld: string
  constructor(...p: string[]) {
    this.fld = String.join(p, "-")
  }
}

class A_spex_const_20 {
  fld: boolean[]
  constructor(p: boolean[], q: boolean[]) {
    this.fld = [...p, ...q]
  }
  meth(): number {
    return new B_spex_const_20(42, ...this.fld).fld
  }
}
class B_spex_const_20 {
  fld: number
  constructor(a: int, ...p: boolean[]) {
    this.fld = a + p.length
  }
}

abstract class A_spex_const_21 {
  fld: boolean[]
  constructor(p: boolean[]) {
    this.fld = p
  }
  meth(): boolean[] {
    return this.fld
  }
}
class B_spex_const_21 extends A_spex_const_21 {
  constructor(p: boolean[], q: boolean[]) {
    super([...p, ...q])
  }
  bar(): number {
    return new C_spex_const_21(42, ...super.meth()).fld
  }
}
class C_spex_const_21 {
  fld: number
  constructor(a: int, ...p: boolean[]) {
    this.fld = a + p.length
  }
}

class A_spex_const_22 {
  fld: number
  constructor(...p: number[][]) {
    let res = 0
    for (let el of p) res += el.length
    this.fld = res
  }
}
let a1_spex_const_22: number[][] = [[1.0, 2.0], [], [3.0, 4.0], [5.0]]

class A_spex_const_23 {
  fld: number[]
  constructor(...p: number[][]) {
    let res: number[] = []
    for (let el of p) res = [...res, ...el]
    this.fld = res
  }
}
class B_spex_const_23 {
  fld: number
  constructor(...p: number[]) {
    let res = 0.0
    for (let el of p) res += el
    this.fld = res
  }
}
let a1_spex_const_23: number[][] = [[1.0, 2.0], [3.0, 4.0]]
let a2_spex_const_23: number[][] = [[5.0, 6.0], []]

class A_spex_const_24_25 {
  fld: double
  constructor(...p: (Double|Short|Byte)[]) {
    let res = 0.0
    for (let el of p) res += (el as Numeric).toDouble()
    this.fld = res
  }
}

class A_spex_const_26 {
  fld: number
  constructor(...p: (Int|Number|String|undefined)[]) {
    this.fld = p.length
  }
}

class A_spex_const_27<T> {}
class B_spex_const_27<T> {}
class C_spex_const_27<T> {}
class Z_spex_const_27<T, U, V> {
  fld: number
  constructor(...p: (A_spex_const_27<T>|B_spex_const_27<U>|C_spex_const_27<V>|null)[]) {
    this.fld = p.length
  }
}

let a1_spex_const_28_29 = ["1", "2", "3"]
class A_spex_const_28_29 {
  fld: string
  constructor(...p: string[]) {
    this.fld = String.join(p, "")
  }
}
class A_spex_const_30 {
  fld: [boolean, number]
  constructor(...p: [number, boolean]) {
    this.fld = [p[1], p[0]]
  }
}

class A_spex_const_31 {
  fld: [number, number, boolean, boolean]
  constructor(...p: [number, boolean]) {
    this.fld = [p[0], p[0], p[1], p[1]]
  }
}

class A_spex_const_32 {
  fld: [byte, short, int, long, float, double, boolean, char, string, int]
  constructor(...p: [byte, short, int, long, float, double, boolean, char, string]) {
    this.fld = [...p, 42]
  }
}

class A_spex_const_33 {
  fld: int
  constructor(...p: [Object, Error]) {
    this.fld = p[0] != p[1] ? 3 : 0
  }
}
let a1_spex_const_33: [Object, Error]|null = [new Object, new Error]

class A_spex_const_35 {
  fld: int
  constructor(...p: [Object, Error]) {
    this.fld = p[0] != p[1] ? 3 : 0
  }
}
let a1_spex_const_35: [Object, Error]|null = null
let a2_spex_const_35: [Object, Error]|null = [new Object, new Error]

class A_spex_const_37 {
  fld: [string, number]
  constructor(...p: [number, string]) {
    this.fld = [p[1], p[0]]
  }
  static foo(): [number, string] {
    return [1.0, "X"]
  }
}

class A_spex_const_38 {
  fld: double
  constructor(...p: [double, double]) {
    this.fld = p[0] + p[1]
  }
}

class A_spex_const_39 {
  fld: int
  constructor(...p: [string, int]) {
    this.fld = p[1]
  }
}

class A_spex_const_40 {
  fld: int
  constructor(...p: [int, int]) {
    this.fld = p[0] + p[1]
  }
}
let a1_spex_const_40: [int, int] = [1, 2]
let a2_spex_const_40: [int, int] = [5, 6]

class A_spex_const_41 {
  fld: [int, char]
  constructor(p: int, q: char) {
    this.fld = [p, q]
  }
  meth(): int {
    return 10 + new Z_spex_const_41(...this.fld).fld
  }
}
class Z_spex_const_41 {
  fld: int
  constructor(...p: [int, char]) {
    this.fld = 100 + p[0]
  }
}

abstract class A_spex_const_42 {
  fld: [int, char]
  constructor(p: [int, char]) {
    this.fld = p
  }
  meth(): [int, char] {
    return this.fld
  }
}
class B_spex_const_42 extends A_spex_const_42 {
  constructor(p: int, q: char) {
    super([p, q])
  }
  meth(): [int, char] {
    this.fld[0] = 10 + new Z_spex_const_42(...super.meth()).fld
    return this.fld
  }
}
class Z_spex_const_42 {
  fld: int
  constructor(...p: [int, char]) {
    this.fld = 100 + p[0]
  }
}

class A_spex_const_43<T> {}
class B_spex_const_43<T> {}
class Z_spex_const_43<T, U> {
  fld: boolean
  constructor(...p: [A_spex_const_43<T>, B_spex_const_43<U>]) {
    this.fld = p[0] == p[1]
  }
}

export default function ExpressionsSpreadTest(): void {
  describe("ExpressionsSpreadTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_0100
     * @tc.name      testExpressionsSpread0001
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Object[] = [], a2: Error[] = []
      expect( [...a1, ...a2, new Object(), ...a1].length ).assertEqual( 1 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_0200
     * @tc.name      testExpressionsSpread0002
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char[] = [c'b', c'c']
      let r = [c'a', ...a, c'd']
      expect( r.length ).assertEqual( 4 )
      expect( new String(r) ).assertEqual( "a,b,c,d" )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_0300
     * @tc.name      testExpressionsSpread0003
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [2 as byte, 3 as byte]
      let r = [1 as byte, ...a, 4 as byte]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
      expect( r[2] ).assertEqual( 3 )
      expect( r[3] ).assertEqual( 4 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_0400
     * @tc.name      testExpressionsSpread0004
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [2 as short, 3 as short]
      let r = [1 as short, ...a, 4 as short]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
      expect( r[2] ).assertEqual( 3 )
      expect( r[3] ).assertEqual( 4 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_0500
     * @tc.name      testExpressionsSpread0005
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [2, 3]
      let r = [1, ...a, 4]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
      expect( r[2] ).assertEqual( 3 )
      expect( r[3] ).assertEqual( 4 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_0600
     * @tc.name      testExpressionsSpread0006
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long[] = [2 as long, 3 as long]
      let r = [1 as long, ...a, 4 as long]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
      expect( r[2] ).assertEqual( 3 )
      expect( r[3] ).assertEqual( 4 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_0700
     * @tc.name      testExpressionsSpread0007
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float[] = [2.0f, 3.0f]
      let r = [1.0f, ...a, 4.0f]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1.0 )
      expect( r[1] ).assertEqual( 2.0 )
      expect( r[2] ).assertEqual( 3.0 )
      expect( r[3] ).assertEqual( 4.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_0800
     * @tc.name      testExpressionsSpread0008
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [2.0, 3.0]
      let r = [1.0, ...a, 4.0]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1.0 )
      expect( r[1] ).assertEqual( 2.0 )
      expect( r[2] ).assertEqual( 3.0 )
      expect( r[3] ).assertEqual( 4.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_0900
     * @tc.name      testExpressionsSpread0009
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: F_spex_8[] = [(p: number) => p * 2, (p: number) => p * 3]
      let b: F_spex_8[] = [(p: number) => p * 4, (p: number) => p * 5]
      let res = 1.0
      for (let el of [...a, ...b]) res += el(res)
      expect( res ).assertEqual( 360.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_1000
     * @tc.name      testExpressionsSpread0010
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Color_spex_9[] = [Color_spex_9.Red, Color_spex_9.Green]
      let b: Color_spex_9[] = [Color_spex_9.Blue]
      let r = [...a, ...b]
      expect( r.length ).assertEqual( 3 )
      expect( r[0] ).assertEqual( Color_spex_9.Red )
      expect( r[1] ).assertEqual( Color_spex_9.Green )
      expect( r[2] ).assertEqual( Color_spex_9.Blue )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_1100
     * @tc.name      testExpressionsSpread0011
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Color_spex_10[] = [Color_spex_10.Red, Color_spex_10.Green]
      let b: Color_spex_10[] = [Color_spex_10.Blue]
      let r = [...a, ...b]
      expect( r.length ).assertEqual( 3 )
      expect( r[0] ).assertEqual( 0 )
      expect( r[1] ).assertEqual( 1 )
      expect( r[2] ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_1200
     * @tc.name      testExpressionsSpread0012
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Number[] = [1.0, 2.0]
      let r = [...(a1)]
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_1300
     * @tc.name      testExpressionsSpread0013
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Object[]|null = [new Object]
      expect( [...a1!, new Object].length ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_1400
     * @tc.name      testExpressionsSpread0014
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( [...(a1_spex_14 ?? a2_spex_14)!, new Object].length ).assertEqual( 3 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_1500
     * @tc.name      testExpressionsSpread0015
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = [...foo_spex_15()]
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_1600
     * @tc.name      testExpressionsSpread0016
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = ["h", "", "el", "", "", "l", "", "o"]
      let r = [...str_filter_spex_16(s, (item: string) => item.length > 0), "!"]
      expect( r.length ).assertEqual( 5 )
      expect( String.join(r, "") ).assertEqual( "hello!" )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_1700
     * @tc.name      testExpressionsSpread0017
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = [...[256]]
      expect( r.length ).assertEqual( 1 )
      expect( r[0] ).assertEqual( 256 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_1800
     * @tc.name      testExpressionsSpread0018
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double[][] = [[2.0, 3.0], []]
      let r = [1.0, ...a[0], ...a[1], 4.0]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
      expect( r[2] ).assertEqual( 3 )
      expect( r[3] ).assertEqual( 4 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_1900
     * @tc.name      testExpressionsSpread0019
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [double[], string] = [[2.0, 3.0, 4.0], "X"]
      let r = [0.0, 1.0, ...a[0]]
      expect( r.reduce((sum: double, item: double) => sum + item, 0.0) ).assertEqual( 10.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_2000
     * @tc.name      testExpressionsSpread0020
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = ["1", "2", "3"]
      let a2 = ["a", "b"]
      let r = [...a1, ...(a1 = a2), ...a1]
      expect( "".concat(...r) ).assertEqual( "123abab" )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_2100
     * @tc.name      testExpressionsSpread0021
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = [...(a1_spex_21.length > a2_spex_21.length ? a1_spex_21 : a2_spex_21), "!"]
      expect( String.join(r, "") ).assertEqual( "123!" )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_2200
     * @tc.name      testExpressionsSpread0022
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_22 = new A_spex_22([false, false], [true, true])
      expect( a.meth().length ).assertEqual( 7 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_2300
     * @tc.name      testExpressionsSpread0023
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_23 = new B_spex_23([false, false], [true, true])
      expect( b.meth().length ).assertEqual( 8 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_2400
     * @tc.name      testExpressionsSpread0024
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: number[][] = [[1.0, 2.0], [3.0, 4.0]]
      let a2: number[][] = [[5.0, 6.0], []]
      let r: number[][] = [...a1, [], ...a2]
      expect( r.length ).assertEqual( 5 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_2500
     * @tc.name      testExpressionsSpread0025
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: number[][] = [[1.0, 2.0], [3.0, 4.0]]
      let a2: number[][] = [[5.0, 6.0], []]
      let res: number[] = []
      for (let el of [...a1, ...a2, [7.0]]) res = [...res, ...el]
      expect( res.length ).assertEqual( 7 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_2600
     * @tc.name      testExpressionsSpread0026
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Double[] = [1, 2, 3], a2: Short[] = [4, 5], a3: Byte[] = [6]
      let ar = [-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]
      let res = 0.0
      for (let el of ar) res += (el as Numeric).toDouble()
      expect( res ).assertEqual( 42.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_2700
     * @tc.name      testExpressionsSpread0027
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: (Object|undefined)[] = [new Int(), new Int(), undefined]
      let a2: (Number|undefined)[] = [42.0, 42.0, undefined]
      let r = [...a1, ...a2, 42.0]
      expect( r[0] ).assertEqual( 0 )
      expect( r[1] ).assertEqual( 0 )
      expect( r[2] ).assertEqual( undefined )
      expect( r[3] ).assertEqual( 42 )
      expect( r[4] ).assertEqual( 42 )
      expect( r[5] ).assertEqual( undefined )
      expect( r[6] ).assertEqual( 42 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_2800
     * @tc.name      testExpressionsSpread0028
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Array<I_spex_29|null> = [{}, {}, null]
      let a2: Array<J_spex_29|null> = [null, {}, {}]
      let r = [...a1, ...a2, 42.0]
      expect( r[0] instanceof I_spex_29 ).assertTrue()
      expect( r[1] instanceof I_spex_29 ).assertTrue()
      expect( r[2] ).assertEqual( null )
      expect( r[3] ).assertEqual( null )
      expect( r[4] instanceof J_spex_29 ).assertTrue()
      expect( r[5] instanceof J_spex_29 ).assertTrue()
      expect( r[6] ).assertEqual( 42 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_2900
     * @tc.name      testExpressionsSpread0029
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: (null|undefined|never|byte|int|long|double)[] = [1, 2, 3, 4.0]
      let a2: (A_spex_30<String>|B_spex_30<Long>|C_spex_30<Error>|int)[] = [5, new A_spex_30<String>, new B_spex_30<Long>, new C_spex_30<Error>]
      let r = [...a1, null, ...a2]
      expect(r.length).assertEqual(9)
      expect(r[0]).assertEqual(1)
      expect(r[8] instanceof C_spex_30).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_3000
     * @tc.name      testExpressionsSpread0030
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = [...((): string[] => a1_spex_31_32)(), "!"]
      expect(String.join(r, "")).assertEqual("123!")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_3100
     * @tc.name      testExpressionsSpread0031
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = [...((p: string[], q: string[]): string[] => [...p, ...q])(a1_spex_31_32, a1_spex_31_32), "!"]
      expect(String.join(r, "")).assertEqual("123123!")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_3200
     * @tc.name      testExpressionsSpread0032
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1: [number, boolean] = [1.0, true]
      let r: [number, boolean] = [...t1]
      expect(r[0]).assertEqual(1.0)
      expect(r[1]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_3300
     * @tc.name      testExpressionsSpread0033
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1: [number] = [1.0]
      let t2: [boolean] = [true]
      let r: [number, number, boolean, boolean] = [...t1, ...t1, ...t2, ...t2]
      expect(r[0]).assertEqual(1.0)
      expect(r[1]).assertEqual(1.0)
      expect(r[2] && r[3]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_3400
     * @tc.name      testExpressionsSpread0034
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1: [byte, short] = [1 as byte, 2 as short]
      let t2: [int, long] = [3, 4 as long]
      let t3: [float, double, boolean] = [5.0f, 6.0, true]
      let t4: [char, string] = [c'Z', "X"]
      let r: [byte, short, int, long, float, double, boolean, char, string] = [...t1, ...t2, ...t3, ...t4]
      expect(r[0]).assertEqual(1)
      expect(r[1]).assertEqual(2)
      expect(r[2]).assertEqual(3)
      expect(r[3]).assertEqual(4)
      expect(r[4]).assertEqual(5.0f)
      expect(r[5]).assertEqual(6.0)
      expect(r[6]).assertEqual(true)
      expect(r[7]).assertEqual(c'Z')
      expect(r[8]).assertEqual("X")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_3500
     * @tc.name      testExpressionsSpread0035
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect([...a1_spex_36!, new Object].length).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_3600
     * @tc.name      testExpressionsSpread0036
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect([...(a1_spex_38 ?? a2_spex_38)!, new Object].length).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_3700
     * @tc.name      testExpressionsSpread0037
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [number, string] = [...foo_spex_40()]
      expect(r[0]).assertEqual(1)
      expect(r[1]).assertEqual("X")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_3800
     * @tc.name      testExpressionsSpread0038
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: [string, int] = ["1", 10]
      let a2: [string, int] = ["2", 20]
      let r: [string, int, string, int, string, int] = [...a1, ...(a1 = a2), ...a1]
      expect(r[0]).assertEqual("1")
      expect(r[1]).assertEqual(10)
      expect(r[2]).assertEqual("2")
      expect(r[3]).assertEqual(20)
      expect(r[4]).assertEqual("2")
      expect(r[5]).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_3900
     * @tc.name      testExpressionsSpread0039
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [int, int] = [...(a1_spex_42[0] > a2_spex_42[0] ? a1_spex_42 : a2_spex_42)]
      expect(r[0]).assertEqual(5)
      expect(r[1]).assertEqual(6)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_4000
     * @tc.name      testExpressionsSpread0040
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_43 = new A_spex_43(1, c'Z')
      let r = a.meth()
      expect(r[0]).assertEqual(0)
      expect(r[1]).assertEqual(1)
      expect(r[2]).assertEqual(c'Z')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_4100
     * @tc.name      testExpressionsSpread0041
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_44 = new B_spex_44(1, c'Z')
      let r = b.meth()
      expect(r[0]).assertEqual(0)
      expect(r[1]).assertEqual(1)
      expect(r[2]).assertEqual(c'Z')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_4200
     * @tc.name      testExpressionsSpread0042
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: [int|A_spex_45<String>, double|B_spex_45<Long>] = [1, new B_spex_45<Long>]
      let a2: [int|A_spex_45<Long>, double|B_spex_45<String>] = [new A_spex_45<Long>, new B_spex_45<String>]
      let r: [A_spex_45<String>|int, B_spex_45<Long>|double, A_spex_45<Long>|int, B_spex_45<String>|double] = [...a1, ...a2]
      expect(r[0] == 1 && r[1] instanceof B_spex_45 && r[2] instanceof A_spex_45 && r[3] instanceof B_spex_45).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_4300
     * @tc.name      testExpressionsSpread0043
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [int, int] = [...((p: [int, int]): [int, int] => [p[1], p[0]])(a2_spex_46)]
      expect(r[0]).assertEqual(5)
      expect(r[1]).assertEqual(6)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_4400
     * @tc.name      testExpressionsSpread0044
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa1: FixedArray<int> = [1]
      let a2: int[] = [2, 3, 4]
      let fa3: FixedArray<int> = [...fa1, ...a2]
      expect(fa3.length).assertEqual(4)
      expect(fa3[0]).assertEqual(1)
      expect(fa3[3]).assertEqual(4)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_4500
     * @tc.name      testExpressionsSpread0045
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FixedArray<C_spex_48> = [new C_spex_48]
      let c = [...a]
      expect(c.length).assertEqual(1)
      expect(c[0].x).assertEqual(13)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_4600
     * @tc.name      testExpressionsSpread0046
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [100, 101]
      let fa: FixedArray<int> = [
        ...((p: int[]): int[] => [p[1], p[0]])(a),
        10, 11,
        ...a]
      expect(fa.length).assertEqual(6)
      expect(fa[0]).assertEqual(101)
      expect(fa[2]).assertEqual(10)
      expect(fa[4]).assertEqual(100)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_4700
     * @tc.name      testExpressionsSpread0047
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [Object, Object] = [...a_spex_52]
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_4800
     * @tc.name      testExpressionsSpread0048
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Array<Object> = [...a_spex_53]
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_4900
     * @tc.name      testExpressionsSpread0049
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Array<Object> = [...a_spex_54]
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_5000
     * @tc.name      testExpressionsSpread0050
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: FixedArray<Object> = [...a_spex_55]
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_5100
     * @tc.name      testExpressionsSpread0051
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string[] = [...a_spex_56]
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_5200
     * @tc.name      testExpressionsSpread0052
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: FixedArray<string> = [...a_spex_57]
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_5300
     * @tc.name      testExpressionsSpread0053
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Object[] = [], a2: Error[] = []
      expect(new A_spex_const_0(...[...a1, ...a2, new Object(), ...a1]).fld).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_5400
     * @tc.name      testExpressionsSpread0054
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char[] = [c'b', c'c']
      expect(new A_spex_const_1(...a).fld).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_5500
     * @tc.name      testExpressionsSpread0055
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte[] = [1 as byte, 2 as byte, 3 as byte]
      expect(new A_spex_const_2(42, ...a).fld).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_5600
     * @tc.name      testExpressionsSpread0056
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short[] = [1 as short, 2 as short, 3 as short]
      expect(new A_spex_const_3(42, ...a).fld).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_5700
     * @tc.name      testExpressionsSpread0057
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long[] = [1 as long, 2 as long, 3 as long]
      expect(new A_spex_const_4(42, ...a).fld).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_5800
     * @tc.name      testExpressionsSpread0058
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float[] = [1.0f, 2.0f, 3.0f]
      expect(new A_spex_const_5(42.0f, ...a).fld).assertEqual(48.0f)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_5900
     * @tc.name      testExpressionsSpread0059
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [1.0, 2.0, 3.0]
      expect(new A_spex_const_6(42, ...a).fld).assertEqual(48.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_6000
     * @tc.name      testExpressionsSpread0060
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: F_spex_const_7[] = [(p: number) => p * 2, (p: number) => p * 3]
      let b: F_spex_const_7[] = [(p: number) => p * 4, (p: number) => p * 5]
      let obj = new A_spex_const_7(1.0, ...[...a, ...b])
      expect(obj.fld).assertEqual(360.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_6100
     * @tc.name      testExpressionsSpread0061
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Color_spex_const_8[] = [Color_spex_const_8.Red, Color_spex_const_8.Blue, Color_spex_const_8.Green]
      let obj = new A_spex_const_8(...a)
      expect(obj.fld).assertEqual(Color_spex_const_8.Green)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_6200
     * @tc.name      testExpressionsSpread0062
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_spex_const_9(...([1.0, 2.0])).fld).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_6300
     * @tc.name      testExpressionsSpread0063
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Object[]|null = [new Object, new Object]
      let obj = new B_spex_const_10(5, ...a1!)
      expect(obj.fld).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_6400
     * @tc.name      testExpressionsSpread0064
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_spex_const_12(5, ...(a1_spex_const_12 ?? a2_spex_const_12)!).fld).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_6500
     * @tc.name      testExpressionsSpread0065
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A_spex_const_13()
      let b = new B_spex_const_13(...a.foo())
      expect(b.fld).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_6600
     * @tc.name      testExpressionsSpread0066
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = ["h", "", "el", "", "", "l", "", "o"]
      expect(new A_spex_const_14(...((s: string[]): string[] => {
        let res: string[] = []
        for (let el of s) if (el.length > 0) res = [...res, el]
        return res
      })(s)).fld).assertEqual("hello")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_6700
     * @tc.name      testExpressionsSpread0067
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_spex_const_15(...[256]).fld).assertEqual(256)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_6800
     * @tc.name      testExpressionsSpread0068
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double[][] = [[2.0, 3.0], []]
      expect(new A_spex_const_16(...a[0]).fld).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_6900
     * @tc.name      testExpressionsSpread0069
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [string, double[], string] = ["X", [2.0, 3.0, 4.0], "Z"]
      let obj = new A_spex_const_17(...a[1])
      expect(obj.fld).assertEqual(9)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_7000
     * @tc.name      testExpressionsSpread0070
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = ["1", "2", "3"]
      let a2 = ["a", "b"]
      let obj = new A_spex_const_18(...(a1 = a2))
      expect((obj).fld).assertEqual("a-b")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_7100
     * @tc.name      testExpressionsSpread0071
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_spex_const_19(...(a1_spex_const_19.length > a2_spex_const_19.length ? a1_spex_const_19 : a2_spex_const_19)).fld).assertEqual("1-2-3")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_7200
     * @tc.name      testExpressionsSpread0072
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_const_20 = new A_spex_const_20([false, false], [true, true])
      expect(a.meth()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_7300
     * @tc.name      testExpressionsSpread0073
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_const_21 = new B_spex_const_21([false, false], [true, true])
      expect(b.bar()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_7400
     * @tc.name      testExpressionsSpread0074
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_spex_const_22(...a1_spex_const_22).fld).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_7500
     * @tc.name      testExpressionsSpread0075
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new B_spex_const_23(...[...new A_spex_const_23(...a1_spex_const_23).fld, ...new A_spex_const_23(...a2_spex_const_23).fld]).fld).assertEqual(21.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_7600
     * @tc.name      testExpressionsSpread0076
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Double[] = [1, 2, 3], a2: Short[] = [4, 5], a3: Byte[] = [6]
      expect(new A_spex_const_24_25(...[-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]).fld).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_7700
     * @tc.name      testExpressionsSpread0077
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Double[] = [1, 2, 3], a2: Short[] = [4, 5], a3: Byte[] = [6]
      expect(new A_spex_const_24_25(...[-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]).fld).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_7800
     * @tc.name      testExpressionsSpread0078
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: (Int|Number|String|undefined)[] = [new Int(), new Int(), undefined, "Z", 42.0]
      expect(new A_spex_const_26(...a1).fld).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_7900
     * @tc.name      testExpressionsSpread0079
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: (A_spex_const_27<String>|B_spex_const_27<Long>|C_spex_const_27<Error>|null)[] = [new A_spex_const_27<String>, new B_spex_const_27<Long>, new C_spex_const_27<Error>]
      let obj = new Z_spex_const_27<String, Long, Error>(...a1)
      expect(obj.fld).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_8000
     * @tc.name      testExpressionsSpread0080
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_spex_const_28_29(...((): string[] => a1_spex_const_28_29)()).fld).assertEqual("123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_8100
     * @tc.name      testExpressionsSpread0081
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_spex_const_28_29(...((p: string[], q: string[]): string[] => [...p, ...q])(a1_spex_const_28_29, a1_spex_const_28_29)).fld).assertEqual("123123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_8200
     * @tc.name      testExpressionsSpread0082
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1: [number, boolean] = [1.0, true]
      let r: [boolean, number] = new A_spex_const_30(...t1).fld
      expect(r[0] && r[1] == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_8300
     * @tc.name      testExpressionsSpread0083
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: [number, boolean] = [1.0, true]
      let r: [number, number, boolean, boolean] = new A_spex_const_31(...t).fld
      expect(r[0] == 1.0 && r[1] == 1.0 && r[2] && r[3]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_8400
     * @tc.name      testExpressionsSpread0084
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [byte, short, int, long, float, double, boolean, char, string] =
        [1 as byte, 2 as short, 3, 4 as long, 5.0f, 6.0, true, c'Z', "X"]
      expect(new A_spex_const_32(...r).fld[9]).assertEqual(42)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_8500
     * @tc.name      testExpressionsSpread0085
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new A_spex_const_33(...a1_spex_const_33!).fld).assertEqual(3)
      let obj = new A_spex_const_35(...(a1_spex_const_35 ?? a2_spex_const_35)!)
      expect(obj.fld).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_8600
     * @tc.name      testExpressionsSpread0086
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [string, number] = new A_spex_const_37(...A_spex_const_37.foo()).fld
      expect(r[0] == "X" && r[1] == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_8700
     * @tc.name      testExpressionsSpread0087
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [[double, double], [char, char]] = [[2.0, 3.0], [c'Z', c'X']]
      let obj = new A_spex_const_38(...a[0])
      expect(obj.fld).assertEqual(5.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_8800
     * @tc.name      testExpressionsSpread0088
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: [string, int] = ["1", 10]
      let a2: [string, int] = ["2", 20]
      expect(new A_spex_const_39(...(a1 = a2)).fld).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_8900
     * @tc.name      testExpressionsSpread0089
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new A_spex_const_40(...(a1_spex_const_40[0] > a2_spex_const_40[0] ? a1_spex_const_40 : a2_spex_const_40)).fld
      expect(r).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_9000
     * @tc.name      testExpressionsSpread0090
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_spex_const_41 = new A_spex_const_41(1, c'Z')
      expect(a.meth()).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_9100
     * @tc.name      testExpressionsSpread0091
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_spex_const_42 = new B_spex_const_42(1, c'Z')
      expect(b.meth()[0]).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_TEST_9200
     * @tc.name      testExpressionsSpread0092
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: [A_spex_const_43<Long>, B_spex_const_43<Error>] = [new A_spex_const_43<Long>, new B_spex_const_43<Error>]
      expect(new Z_spex_const_43<Long, Error>(...a1).fld).assertFalse()
    });
  });
}
