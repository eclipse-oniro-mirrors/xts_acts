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

class A5 {}

let cnt: number = 0
let cnt1: number = 0
let cnt2: number = 0
function foo_8(): number {
  return cnt++
}
function bar_8(): number {
  return ++cnt1
}
function baz_8(): number {
  return cnt2--
}

class B_21 extends A5 {}
class C_21 extends B_21 {}

interface I_24 {}
interface J_24 {}
class A_24 implements I_24 {}
class B_24 implements J_24 {}

let a: byte = 1
let b: short = 2
let c: int = 3
let d: long = 4
let e: float = 5
let f: double = 6
let a2: Byte = 1
let b2: Short = 2
let c2: Int = 3
let d2: Long = 4
let e2: Float = 5
let f2: Double = 6
let g: bigint = 7n
let g2: BigInt = new BigInt(7)
const b_const: short = 2
const d_const: long = 4
const f_const: double = 6
const a_const: byte = 1
const c_const: int = 3
const e_const: float = 5
const a2_const: Byte = 1
const c2_const: Int = 3
const e2_const: Float = 5
const g_const: bigint = 7n
const g2_const: BigInt = new BigInt(7)
type my_type_number = number
type my_type_Numeric = Numeric
type my_type_byte = byte
type my_type_short = short
type my_type_int = int
type my_type_long = long
type my_type_float = float
type my_type_BigInt = BigInt
type my_type_Numeric_BigInt = Numeric | BigInt
type my_type_Object = Object

let aa: Object = new Object
const bb: Object = new Object
let a5: Error = new Error
const b5: Error = new Error
let c5: Error = b5
let a8: string = 'a'
let b8: string = 'b'
const c8: string = 'c'
const a9: string = 'a'
let b9: string = 'b'
let c9: string = 'c'
let a10: string = 'a'
let b10: string = 'b'
const c10: string = 'c'
const a11: string = 'a'
let b11: string = 'b'
let c11: string = 'c'
function foo(p: string): string {
  return p + p
}
class A {}
let a14: A = new A
const b14: A = new A
let c14: A = b14
interface I {}
class A16 implements I {}
let a16: A16 = new A16
enum Color { Red, Green, Blue }
type F20 = (p: number) => number
function foo20(p: number): number {
  return p + p
}
function foo22(p: number): number {
  return p + p
}
type F26 = (p: string) => string
let a26: F26 = (p: string): string => p + p
let b26: F26 = (p: string): string => p + p + p
let c26: F26 = (p: string): string => p + p + p + p
type T = [number, string]
let a28: T = [1, '1']
let b28: T = [2, '1']

let aaa: T = [1, '1']
let bbb: T = [2, '1']

let a32: boolean = false
const b32: boolean = true
let a34: Boolean = new Boolean(false)
const b34: Boolean = new Boolean(true)

let a36: Error|undefined
let b36: Error|undefined = new Error

let a41: char = c'a'
const b41: char = c'b'
let c41: char = b41
let a43: Char = new Char(c'a')
const b43: Char = new Char(c'b')
let c43: Char = b43

export default function ExpressionsElementsInferenceTest() {
  describe("ExpressionsElementsInferenceTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_0100
     * @tc.name      testExpressionsElementsInference0001
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [new Object, new Boolean(true)]
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Object).assertTrue()
      expect(a[1] instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_0200
     * @tc.name      testExpressionsElementsInference0002
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = ["a", "b" + "c"]
      expect(b instanceof Array).assertTrue()
      expect(typeof b[0] === 'string').assertTrue()
      expect(typeof b[1] === 'string').assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_0300
     * @tc.name      testExpressionsElementsInference0003
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = ["a", 1, 3.14]
      let f = (p: (String|Int|Double)[]) => p
      let d = f(x)
      expect(d instanceof Array).assertTrue()
      expect(d[0] instanceof (String|Int|Double)).assertTrue()
      expect(d[1] instanceof (String|Int|Double)).assertTrue()
      expect(d[2] instanceof (String|Int|Double)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_0400
     * @tc.name      testExpressionsElementsInference0004
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = ["a" + "", 1, 3.14]
      let f = (p: (String|Int|Double)[]) => p
      let d = f(x)
      expect(d instanceof Array).assertTrue()
      expect(d[0] instanceof (String|Int|Double)).assertTrue()
      expect(d[1] instanceof (String|Int|Double)).assertTrue()
      expect(d[2] instanceof (String|Int|Double)).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_0500
     * @tc.name      testExpressionsElementsInference0005
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = [(): void => {}, new A5()]
      expect(e instanceof Array).assertTrue()
      expect(typeof e[0] === 'function' || e[0] instanceof A5).assertTrue()
      expect(typeof e[1] === 'function' || e[1] instanceof A5).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_0600
     * @tc.name      testExpressionsElementsInference0006
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: Array<(() => number) | null> = [bar_8, null, baz_8, foo_8];
      let f = (p: Array<(() => number) | null>) => p;
      let x = f(y);
      expect(x instanceof Array).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(typeof x[idx] === 'function' || x[idx] === null).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_0700
     * @tc.name      testExpressionsElementsInference0007
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: (number | string)[] = [0, "0", 0, 1];
      let f = (p: (number | string)[]) => p;
      let x = f(y);
      expect(x instanceof Array).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(typeof x[idx] === 'number' || typeof x[idx] === 'string').assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_0800
     * @tc.name      testExpressionsElementsInference0008
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Object(), null, new Error(), null]
      expect(x instanceof Array).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof Object || x[idx] === null).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_0900
     * @tc.name      testExpressionsElementsInference0009
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = ["aa", "bb", null, "cc", null]
      expect(x instanceof Array).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(typeof x[idx] === 'string' || x[idx] === null).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_1000
     * @tc.name      testExpressionsElementsInference0010
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [null, null, null]
      expect(x instanceof Array).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] === null).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_1100
     * @tc.name      testExpressionsElementsInference0011
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [undefined, undefined]
      expect(x instanceof Array).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] === undefined).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_1200
     * @tc.name      testExpressionsElementsInference0012
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [null, undefined]
      expect(x instanceof Array).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] === null || x[idx] === undefined).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_1300
     * @tc.name      testExpressionsElementsInference0013
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x0 = (p: string) => { return p.length; }
      let x = [x0]
      expect(x instanceof Array).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(typeof x[idx] === 'function').assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_1400
     * @tc.name      testExpressionsElementsInference0014
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let globalArray = [true, "a", 42.0]
      expect(globalArray instanceof Array).assertTrue()
      for(let idx = 0; idx < globalArray.length; idx++) {
        expect(typeof globalArray[idx] === 'boolean' || typeof globalArray[idx] === 'string' || typeof globalArray[idx] === 'number').assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_1500
     * @tc.name      testExpressionsElementsInference0015
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let globalArray = [new A5(), new A5(), new A5(), new A5(), new A5(), new A5()]
      expect(globalArray instanceof Array).assertTrue()
      for(let idx = 0; idx < globalArray.length; idx++) {
        expect(globalArray[idx] instanceof A5 || globalArray[idx] instanceof A5 || globalArray[idx] instanceof A5).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_1600
     * @tc.name      testExpressionsElementsInference0016
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let globalArray = [new A5(), new B_21(), new C_21(), new A5(), new B_21(), new C_21()]
      expect(globalArray instanceof Array).assertTrue()
      for(let idx = 0; idx < globalArray.length; idx++) {
        expect(globalArray[idx] instanceof A5).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_1700
     * @tc.name      testExpressionsElementsInference0017
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let globalArray = ["a", "b", "c", "s"]
      expect(globalArray instanceof Array).assertTrue()
      for(let idx = 0; idx < globalArray.length; idx++) {
        expect(typeof globalArray[idx] === 'string').assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_1800
     * @tc.name      testExpressionsElementsInference0018
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "s"
      let globalArray = ["a", "b", "c", s]
      expect(globalArray instanceof Array).assertTrue()
      for(let idx = 0; idx < globalArray.length; idx++) {
        expect(typeof globalArray[idx] === 'string').assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_1900
     * @tc.name      testExpressionsElementsInference0019
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_24 = new A_24()
      let b: J_24 = new B_24()
      let x = [a, b, "a", "b", a, b, "a", "b"]
      expect(x instanceof Array).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] === a || x[idx] === b || typeof x[idx] === 'string').assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_2000
     * @tc.name      testExpressionsElementsInference0020
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = '1'
      let x = [a, '2', '1', '2']
      expect(x instanceof Array).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(typeof x[idx] === 'string').assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_2100
     * @tc.name      testExpressionsElementsInference0021
     * @tc.desc      If the type of an array literal [ expr1, ... , exprN ] cannot be inferred from
     *               the context, then it is inferred from the initialization expressions by using the
     *               following algorithm.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: number = 0
      let c: string = "0"
      let d: [number, Error] = [1.0, new Error()]
      let x = [b, c, d, "1"]
      expect(x instanceof Array).assertTrue()
      expect(typeof x[0] === 'number').assertTrue()
      expect(typeof x[1] === 'string').assertTrue()
      expect(x[2] instanceof Array || typeof x[2] === 'object').assertTrue()
      expect(typeof x[3] === 'string').assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_2200
     * @tc.name      testExpressionsElementsInference0022
     * @tc.desc      Verify array literal type inference when elements are integer literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0, 0, 0, 0, 0]
      expect( x instanceof Array ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_2300
     * @tc.name      testExpressionsElementsInference0023
     * @tc.desc      Verify array literal type inference when elements are floating-point literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0.0, 1.0, 2.0, 3.0, 4.0]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_number).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_2400
     * @tc.name      testExpressionsElementsInference0024
     * @tc.desc      Verify array literal type inference with mixed integer and floating-point literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0, 1.0, 0, 2.0, 0]
      expect( x instanceof Array ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_2500
     * @tc.name      testExpressionsElementsInference0025
     * @tc.desc      Verify array literal type inference when element is float literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0.0f]
      expect( x instanceof Array ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_2600
     * @tc.name      testExpressionsElementsInference0026
     * @tc.desc      Verify array literal type inference with mixed float and integer literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0.0f, 1]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_2700
     * @tc.name      testExpressionsElementsInference0027
     * @tc.desc      Verify array literal type inference with mixed float and double literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0.0f, 2.0]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_2800
     * @tc.name      testExpressionsElementsInference0028
     * @tc.desc      Verify array literal type inference when elements are byte type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0b01.toByte(), 0b10.toByte(), 0b11.toByte(), 0b01.toByte(), 0b10.toByte(), ]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_byte).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_2900
     * @tc.name      testExpressionsElementsInference0029
     * @tc.desc      Verify array literal type inference when element is short type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0xF.toShort()]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_short).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_3000
     * @tc.name      testExpressionsElementsInference0030
     * @tc.desc      Verify array literal type inference when elements are int type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0o7.toInt(), 0o6.toInt(), 0o5.toInt(), ]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_int).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_3100
     * @tc.name      testExpressionsElementsInference0031
     * @tc.desc      Verify array literal type inference when element is long type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Long(-9223372036854775807)]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_long).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_3200
     * @tc.name      testExpressionsElementsInference0032
     * @tc.desc      Verify array literal type inference when elements are float type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [111e11.toFloat(), 222e11.toFloat(), 333e11.toFloat(), ]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_float).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_3300
     * @tc.name      testExpressionsElementsInference0033
     * @tc.desc      Verify array literal type inference when element is double type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [222e22.toDouble()]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_number).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_3400
     * @tc.name      testExpressionsElementsInference0034
     * @tc.desc      Verify array literal type inference when element is bigint literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [11111111111n]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_BigInt).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_3500
     * @tc.name      testExpressionsElementsInference0035
     * @tc.desc      Verify array literal type inference when element is Byte instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Byte]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_byte).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_3600
     * @tc.name      testExpressionsElementsInference0036
     * @tc.desc      Verify array literal type inference when element is Short instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Short]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_short).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_3700
     * @tc.name      testExpressionsElementsInference0037
     * @tc.desc      Verify array literal type inference when element is Int instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Int]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_int).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_3800
     * @tc.name      testExpressionsElementsInference0038
     * @tc.desc      Verify array literal type inference when element is Long instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Long]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_long).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_3900
     * @tc.name      testExpressionsElementsInference0039
     * @tc.desc      Verify array literal type inference when element is Float instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Float]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_float).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_4000
     * @tc.name      testExpressionsElementsInference0040
     * @tc.desc      Verify array literal type inference when element is Double instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Double]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_number).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_4100
     * @tc.name      testExpressionsElementsInference0041
     * @tc.desc      Verify array literal type inference when element is BigInt instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new BigInt(5)]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_BigInt).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_4200
     * @tc.name      testExpressionsElementsInference0042
     * @tc.desc      Verify array literal type inference with mixed numeric literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0b1, 0xF, 0o7, 1e1, 3.0f, 9223372036854775807]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_4300
     * @tc.name      testExpressionsElementsInference0043
     * @tc.desc      Verify array literal type inference with mixed numeric wrapper instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Byte(), new Short(), new Int(), new Long(), new Float(), new Double()]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_4400
     * @tc.name      testExpressionsElementsInference0044
     * @tc.desc      Verify array literal type inference with mixed numeric types and BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Byte(1), new Short(2), new Int(3), new Long(4), new Float(5), new Double(6), 7n]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric_BigInt).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_4500
     * @tc.name      testExpressionsElementsInference0045
     * @tc.desc      Verify array literal type inference with mixed zero value numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0n, 0, new Byte(0), new Short(0), new Int(0), new Long(0), new Float(0), new Double(0)]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric_BigInt).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_4600
     * @tc.name      testExpressionsElementsInference0046
     * @tc.desc      Verify array literal type inference with mixed numeric instances and BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [new Byte, new Short(2), new Int(3), new Long(4), new Float(5.0f), new Double(6), 7n]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric_BigInt).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_4700
     * @tc.name      testExpressionsElementsInference0047
     * @tc.desc      Verify array literal type inference with numeric variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [a, b, c, d, e, f,]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_4800
     * @tc.name      testExpressionsElementsInference0048
     * @tc.desc      Verify array literal type inference with numeric variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [a2, b2, c2, d2, e2, f2,]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_4900
     * @tc.name      testExpressionsElementsInference0049
     * @tc.desc      Verify array literal type inference with mixed numeric and object types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [a, b2, c, d2, e, f2, g]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Object).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_5000
     * @tc.name      testExpressionsElementsInference0050
     * @tc.desc      Verify array literal type inference with mixed numeric and object types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [a2, b, c2, d, e2, f, g2]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Object).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_5100
     * @tc.name      testExpressionsElementsInference0051
     * @tc.desc      Verify array literal type inference with mixed literals and numeric variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [0, a, b_const, c, d_const, e, f_const,]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_5200
     * @tc.name      testExpressionsElementsInference0052
     * @tc.desc      Verify array literal type inference with mixed literals and numeric variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [a2_const, 0, b2, c2_const, d2, e2_const, f2,]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Numeric).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_5300
     * @tc.name      testExpressionsElementsInference0053
     * @tc.desc      Verify array literal type inference with mixed literals, variables and object types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [a_const, b2, 0, c_const, d2, e_const, f2, g_const]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Object).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_5400
     * @tc.name      testExpressionsElementsInference0054
     * @tc.desc      Verify array literal type inference with mixed literals, variables and object types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [a2_const, b, c2_const, 0, d, e2_const, f, g2_const]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        expect(x[idx] instanceof my_type_Object).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_5500
     * @tc.name      testExpressionsElementsInference0055
     * @tc.desc      Verify 2D array literal type inference with integer elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_5600
     * @tc.name      testExpressionsElementsInference0056
     * @tc.desc      Verify 2D array literal type inference with double elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0.0, 1.0], [2.0, 3.0], [4.0]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_number).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_5700
     * @tc.name      testExpressionsElementsInference0057
     * @tc.desc      Verify 2D array literal type inference with mixed integer and double elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0, 1.0], [0, 2.0]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_5800
     * @tc.name      testExpressionsElementsInference0058
     * @tc.desc      Verify 2D array literal type inference with float elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0.0f]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_float).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_5900
     * @tc.name      testExpressionsElementsInference0059
     * @tc.desc      Verify 2D array literal type inference with mixed float and integer elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0.0f, 1]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_6000
     * @tc.name      testExpressionsElementsInference0060
     * @tc.desc      Verify 2D array literal type inference with mixed float and double elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0.0f, 2.0]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_6100
     * @tc.name      testExpressionsElementsInference0061
     * @tc.desc      Verify 2D array literal type inference with byte elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0b1 as byte]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_byte).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_6200
     * @tc.name      testExpressionsElementsInference0062
     * @tc.desc      Verify 2D array literal type inference with short elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0xF as short]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_short).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_6300
     * @tc.name      testExpressionsElementsInference0063
     * @tc.desc      Verify 2D array literal type inference with int elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0o7 as int]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_int).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_6400
     * @tc.name      testExpressionsElementsInference0064
     * @tc.desc      Verify 2D array literal type inference with long elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[-9223372036854775807 as long]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_long).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_6500
     * @tc.name      testExpressionsElementsInference0065
     * @tc.desc      Verify 2D array literal type inference with float elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[(111e11).toFloat()]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_float).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_6600
     * @tc.name      testExpressionsElementsInference0066
     * @tc.desc      Verify 2D array literal type inference with double elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[222e22 as double]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_number).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_6700
     * @tc.name      testExpressionsElementsInference0067
     * @tc.desc      Verify 2D array literal type inference with bigint elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[11111111111n]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_BigInt).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_6800
     * @tc.name      testExpressionsElementsInference0068
     * @tc.desc      Verify 2D array literal type inference with Byte instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[new Byte]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_byte).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_6900
     * @tc.name      testExpressionsElementsInference0069
     * @tc.desc      Verify 2D array literal type inference with Short instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x = [[new Short]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_short).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_7000
     * @tc.name      testExpressionsElementsInference0070
     * @tc.desc      Verify 2D array literal type inference with Int instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[new Int]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_int).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_7100
     * @tc.name      testExpressionsElementsInference0071
     * @tc.desc      Verify 2D array literal type inference with Long instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[new Long]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_long).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_7200
     * @tc.name      testExpressionsElementsInference0072
     * @tc.desc      Verify 2D array literal type inference with Float instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[new Float]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_float).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_7300
     * @tc.name      testExpressionsElementsInference0073
     * @tc.desc      Verify 2D array literal type inference with Double instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[new Double]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_number).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_7400
     * @tc.name      testExpressionsElementsInference0074
     * @tc.desc      Verify 2D array literal type inference with BigInt instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[new BigInt(5)]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_BigInt).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_7500
     * @tc.name      testExpressionsElementsInference0075
     * @tc.desc      Verify 2D array literal type inference with mixed numeric literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0b1, 0xF, 0o7, 1e1, 3.0f, 9223372036854775807]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_7600
     * @tc.name      testExpressionsElementsInference0076
     * @tc.desc      Verify 2D array literal type inference with mixed numeric wrapper instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[new Byte(), new Short(), new Int(), new Long(), new Float(), new Double()]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_7700
     * @tc.name      testExpressionsElementsInference0077
     * @tc.desc      Verify 2D array literal type inference with mixed numeric types and BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[new Byte(1), new Short(2), new Int(3), new Long(4), new Float(5), new Double(6), 7n]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric_BigInt).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_7800
     * @tc.name      testExpressionsElementsInference0078
     * @tc.desc      Verify 2D array literal type inference with mixed zero value numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0n, 0, new Byte(0), new Short(0), new Int(0), new Long(0), new Float(0), new Double(0)]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric_BigInt).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_7900
     * @tc.name      testExpressionsElementsInference0079
     * @tc.desc      Verify 2D array literal type inference with mixed numeric instances and BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[new Byte, new Short(2), new Int(3), new Long(4), new Float(5.0f), new Double(6), 7n]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric_BigInt).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_8000
     * @tc.name      testExpressionsElementsInference0080
     * @tc.desc      Verify 2D array literal type inference with numeric variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[a, b, c, d, e, f,]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_8100
     * @tc.name      testExpressionsElementsInference0081
     * @tc.desc      Verify 2D array literal type inference with numeric variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[a2, b2, c2, d2, e2, f2,]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_8200
     * @tc.name      testExpressionsElementsInference0082
     * @tc.desc      Verify 2D array literal type inference with mixed numeric and object types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[a, b2, c, d2, e, f2, g]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Object).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_8300
     * @tc.name      testExpressionsElementsInference0083
     * @tc.desc      Verify 2D array literal type inference with mixed numeric and object types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[a2, b, c2, d, e2, f, g2]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Object).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_8400
     * @tc.name      testExpressionsElementsInference0084
     * @tc.desc      Verify 2D array literal type inference with explicitly typed numeric arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = [[0, a] as Numeric[], [b_const, c, d_const] as Numeric[], [e, f_const,] as Numeric[]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_8500
     * @tc.name      testExpressionsElementsInference0085
     * @tc.desc      Verify 2D array literal type inference with mixed numeric constants and variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Byte = 1
      let b: Short = 2
      const c: Int = 3
      let d: Long = 4
      const e: Float = 5
      let f: Double = 6
      let x = [[a, 0, b, c] as Numeric[], [d, e, f,] as Numeric[]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Numeric).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_8600
     * @tc.name      testExpressionsElementsInference0086
     * @tc.desc      Verify 2D array literal type inference with mixed numeric types and Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1
      let b: Short = 2
      const c: int = 3
      let d: Long = 4
      const e: float = 5
      let f: Double = 6
      const g: bigint = 7n
      let x = [[a, b] as Object[], [0, c] as Object[], [d, e] as Object[], [f, g] as Object[]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Object).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_8700
     * @tc.name      testExpressionsElementsInference0087
     * @tc.desc      Verify 2D array literal type inference with mixed numeric types, literals and BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Byte = 1
      let b: short = 2
      const c: Int = 3
      let d: long = 4
      const e: Float = 5
      let f: double = 6
      const g: BigInt = new BigInt(7)
      let x = [[a, b] as Object[], [c, 0] as Object[], [d, e] as Object[], [f, g] as Object[]]
      expect( x instanceof Array ).assertTrue()
      for(let idx = 0; idx < x.length; idx++) {
        let y = x[idx]
        expect( y instanceof Array ).assertTrue()
        for(let idx1 = 0; idx1 < y.length; idx1++) {
          expect(y[idx1] instanceof my_type_Object).assertTrue()
        }
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_8800
     * @tc.name      testExpressionsElementsInference0088
     * @tc.desc      If all initialization expressions are of the same type T, then the type of the
     *               array literal is T[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( [new Object, new Object] instanceof Array ).assertTrue()
      expect( [[new Object], [new Object]] instanceof Array ).assertTrue()
      expect( [aa, bb,] instanceof Array ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_8900
     * @tc.name      testExpressionsElementsInference0089
     * @tc.desc      If all initialization expressions are of the same type T, then the type of the
     *               array literal is T[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a3 = [new Object]
      const b3 = new Object
      expect( [a3, [new Object], [b3]] instanceof Array ).assertTrue()
      expect( [new Error, new Error, new Error] instanceof Array ).assertTrue()
      expect( [[c5], [b5], [new Error], [a5], [new Error],] instanceof Array ).assertTrue()
      expect( ['a', 'b', 'c'] instanceof Array ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_9000
     * @tc.name      testExpressionsElementsInference0090
     * @tc.desc      If all initialization expressions are of the same type T, then the type of the
     *               array literal is T[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( [['a'], ['b'], ['c']] instanceof Array ).assertTrue()
      expect( [a8, b8, c8] instanceof Array ).assertTrue()
      expect( [[a9], [b9], [c9]] instanceof Array ).assertTrue()
      expect( [a10, b10, c10, 'd', 'e',] instanceof Array ).assertTrue()
      expect( [['1'], ['2'], [a11], [b11], [c11]] instanceof Array ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_9100
     * @tc.name      testExpressionsElementsInference0091
     * @tc.desc      If all initialization expressions are of the same type T, then the type of the
     *               array literal is T[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( [foo('a'), foo('b'), foo('c')] instanceof Array ).assertTrue()
      expect( [[foo('a')], [foo('b')], [foo('c')]] instanceof Array ).assertTrue()
      expect( [{} as A, a14, new A, b14, c14,] instanceof Array ).assertTrue()
      expect( [[c14], [{} as A], [a14], [new A], [b14]] instanceof Array ).assertTrue()
      expect( [{} as A16, a16, new A16] instanceof Array ).assertTrue()
      expect( [[{} as A16], [a16], [new A16]] instanceof Array ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_9200
     * @tc.name      testExpressionsElementsInference0092
     * @tc.desc      If all initialization expressions are of the same type T, then the type of the
     *               array literal is T[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( [Color.Red, Color.Green] instanceof Array ).assertTrue()
      expect( [[Color.Red], [Color.Green]] instanceof Array ).assertTrue()
      expect( [foo20, foo20, foo20] instanceof Array ).assertTrue()
      expect( [foo22, foo22, (p: number): number => 0] instanceof Array ).assertTrue()
      expect( [[(p: number): number => 0], [foo22], [foo22]] instanceof Array ).assertTrue()
      expect( [() => {}, () => {}] instanceof Array ).assertTrue()
      expect( [[() => {}], [() => {}]] instanceof Array ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_9300
     * @tc.name      testExpressionsElementsInference0093
     * @tc.desc      If all initialization expressions are of the same type T, then the type of the
     *               array literal is T[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( [a26, b26, c26] instanceof Array ).assertTrue()
      expect( [[a26], [b26], [c26]] instanceof Array ).assertTrue()
      expect( [a28, b28, a28, [3, '3'] as T] instanceof Array ).assertTrue()
      expect( [[a28], [b28], [a28], [[3, '3'] as T]] instanceof Array ).assertTrue()
      expect( [aaa, bbb, aaa] instanceof Array ).assertTrue()
      expect( [[aaa], [bbb], [aaa]] instanceof Array ).assertTrue()
      expect( [a32, true, true, b32, false,] instanceof Array ).assertTrue()
      expect( [[true], [true], [a32], [false], [b32]] instanceof Array ).assertTrue()
      expect( [new Boolean(), a34, new Boolean(), new Boolean(), b34, ] instanceof Array ).assertTrue()
      expect( [[b34,], [new Boolean(),], [a34,], [new Boolean(),], [new Boolean(),], ] instanceof Array ).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ELEMENTS_INFERENCE_9400
     * @tc.name      testExpressionsElementsInference0094
     * @tc.desc      If all initialization expressions are of the same type T, then the type of the
     *               array literal is T[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsElementsInference0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( [a36, b36] instanceof Array ).assertTrue()
      expect( [[a36], [b36]] instanceof Array ).assertTrue()
      expect( [a36, b36] instanceof Array ).assertTrue()
      expect( [[a36], [b36]] instanceof Array ).assertTrue()
      expect( [c'1', c'2'] instanceof Array ).assertTrue()
      expect( [c41, b41, a41] instanceof Array ).assertTrue()
      expect( [c'd', c41, c'e', b41, a41] instanceof Array ).assertTrue()
      expect( [c43, b43, a43,] instanceof Array ).assertTrue()
    });
  });
}
