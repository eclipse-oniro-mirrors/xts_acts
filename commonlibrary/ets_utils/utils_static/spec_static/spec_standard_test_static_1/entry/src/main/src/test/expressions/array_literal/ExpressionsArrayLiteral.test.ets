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

let arr: int[] = [0, 0, 0, 0]
function foo_abrupt_0(cnt: int): int  {
    return arr[cnt]
}

function foo_abrupt_1(p: boolean): boolean {
    if (p) {
        throw new Error()
    }
    return p
}

let expected: int[] = [101, 203, -298, 304, 602,]
function foo_expr_0(cnt: int): int  {
    return 100 * cnt
}

function foo_expr_1(length: int): int[] {
  const resultArray: int[] = [];
  for (let i = 0; i < length; i++) {
    resultArray.push(i * 10);
  }
  return resultArray;
}

class A {}

function foo_nest_4(): A[] {
    return [{}, {}] as A[]
}

function foo_nest_5(p: int[][]): int {
    let sum = 0
    for (let i=0; i < p.length; i++) {
        for (let j=0; j < p[i].length; j++) {
            sum += p[i][j]
        }
    }
    return sum
}

function foo_nest_2(arr: Object[]): Object[] {
    return [arr]
}
function bar_nest_2(arr: Object): Object[] {
    return arr as Object[]
}

interface MyInterface {}
class MyClass {}

function instantiateEmptyArray_byte(): byte[] {
  return [] as byte[]
}
function instantiateArrayWithValues_byte(): byte[] {
  return [0, 5, 7, 10] as byte[]
}
function instantiateEmptyArray_short(): short[] {
  return [] as short[]
}
function instantiateArrayWithValues_short(): short[] {
  return [9, 15, 13] as short[]
}
function instantiateEmptyArray_int(): int[] {
  return [] as int[]
}
function instantiateArrayWithValues_int(): int[] {
  return [9, 13, 123, 17, 10] as int[]
}
function instantiateEmptyArray_number(): number[] {
  return [] as number[]
}
function instantiateArrayWithValues_number(): number[] {
  return [9, 13, 1, 5.7, 10, 12.4] as number[]
}
function instantiateEmptyArray_double(): double[] {
  return [] as double[]
}
function instantiateArrayWithValues_double(): double[] {
  return [9, 13, 1, 5.7, 10, 12.4] as double[]
}
function instantiateEmptyArray_long(): long[] {
  return [] as long[]
}
function instantiateArrayWithValues_long(): long[] {
  return [9, 13, 9223372036854775807, 5, 10, 12] as long[]
}
function instantiateEmptyArray_float(): float[] {
  return [] as float[]
}
function instantiateArrayWithValues_float(): float[] {
  return [9, 13, 1, 5.7f, 10, 12.4f] as float[]
}
function instantiateEmptyArray_boolean(): boolean[] {
  return [] as boolean[]
}
function instantiateArrayWithValues_boolean(): boolean[] {
  return [true, false, false, true, false, true] as boolean[]
}
function instantiateEmptyArray_char(): char[] {
  return [] as char[]
}
function instantiateArrayWithValues_char(): char[] {
  return [c'\u2028', c'\u005c', c'\u0027', c'x', c'Z'] as char[]
}
function instantiateEmptyArray_String(): String[] {
  return [] as String[]
}
function instantiateArrayWithValues_String(): String[] {
  return ["ab", "cd", "efg"] as String[]
}
function instantiateEmptyArray_object(): object[] {
  return [] as object[]
}
function instantiateArrayWithValues_object(): object[] {
  return [new Object, new Object, new Object] as object[]
}
function instantiateEmptyArray_Number(): Number[] {
  return [] as Number[]
}
function instantiateArrayWithValues_Number(): Number[] {
  return [9, 13, 1, 5.7, 10, 12.4] as Number[]
}
function instantiateEmptyArray_Boolean(): Boolean[] {
  return [] as Boolean[]
}
function instantiateArrayWithValues_Boolean(): Boolean[] {
  return [true, false, false, true, false, true] as Boolean[]
}
function instantiateEmptyArray_MyClass(): MyClass[] {
  return [] as MyClass[]
}
function instantiateArrayWithValues_MyClass(): MyClass[] {
  return [new MyClass, new MyClass, new MyClass] as MyClass[]
}
function instantiateEmptyArray_MyInterface(): MyInterface[] {
  return [] as MyInterface[]
}
function instantiateArrayWithValues_MyInterface(): MyInterface[] {
  return [{}, {}, {}] as MyInterface[]
}

class A_array_create_from_lit2_6 {
  v: int = 0
  constructor(v: int = 0){
    this.v = v
  }
}
class B_array_create_from_lit2_6 extends A_array_create_from_lit2_6 {
  constructor(v: int = 0){
    super(-v)
  }
}

class Animal_array_create_from_lit2_7 {}
class Dog_array_create_from_lit2_7 extends Animal_array_create_from_lit2_7 {
  name: string = ""
  bark(): string {
    return this.name
  }
}
class Cat_array_create_from_lit2_7 extends Animal_array_create_from_lit2_7 {}

class A_array_create_from_lit2_8 {
  v: int
  constructor(v: int = 0) {
    this.v = v
  }
}
class B_array_create_from_lit2_8 extends A_array_create_from_lit2_8 {
  constructor(v: int = 0) {
    super(-v)
  }
  f(): int {
    return 13
  }
}
type HandlerBInt = (a: B_array_create_from_lit2_8, b: int) => A_array_create_from_lit2_8
type HandlerAInt = (a: A_array_create_from_lit2_8, b: int) => B_array_create_from_lit2_8
const handlerAInt: HandlerAInt = (a: A_array_create_from_lit2_8, b: int): B_array_create_from_lit2_8 => {
  if (a instanceof B_array_create_from_lit2_8){
    return new B_array_create_from_lit2_8(a.f() + b)
  } else {
    return new B_array_create_from_lit2_8(b)
  }
}
type HandlerA = (a: A_array_create_from_lit2_8) => A_array_create_from_lit2_8
const handlerA: HandlerA = (a: A_array_create_from_lit2_8): A_array_create_from_lit2_8 => {
  if (a instanceof B_array_create_from_lit2_8){
    return new A_array_create_from_lit2_8(a.f())
  } else {
    return new A_array_create_from_lit2_8()
  }
}
type HandlerNothing = () => B_array_create_from_lit2_8
const handlerNothing: HandlerNothing = (): B_array_create_from_lit2_8 => {
  return new B_array_create_from_lit2_8(567)
}

let x_array_literal_0: number[] = []

let x_array_literal_1: int[] = [1, 2, 3]

let x_array_literal_2: Double[] = [new Double(3.1415926)]

let x_array_literal_3: string[] = ["aaa", "bbb"]

let x_array_literal_4: Object[] = ["aaa", "bbb", "aaa", [true, false], [[1, 2, 3], [4, 5, 6]], new Long(), new Short(), new Number(), new Error(), "ccc",]

type FUNC = (p: int) => int
let x_array_literal_5: FUNC[] = [(p:int):int => {return p+1}, (p:int):int => {return p+2}]

function foo_array_literal_6() {}
let x_array_literal_6: (() => void)[] = [foo_array_literal_6, foo_array_literal_6, foo_array_literal_6]

let x_array_literal_7: Number[][] = [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0], [7.0, 8.0, 9.0]]

let x_array_literal_8: [boolean, Error][] = [[false, new Error()], [true, new Error()]]

let x_array_literal_9: (Number|null|undefined|String)[] = [3.0, null, "X"]

class A_array_literal_10<T> {}
let x_array_literal_10: A_array_literal_10<String>[] = [new A_array_literal_10<String>(), new A_array_literal_10<String>(), new A_array_literal_10<String>()]

enum Color_array_literal_11 { Red, Green, Blue }
let x_array_literal_11: Color_array_literal_11[] = [Color_array_literal_11.Red, Color_array_literal_11.Green, Color_array_literal_11.Blue]

let x_array_literal_12: (Long|undefined)[] = [new Long(1 as long), undefined, new Long(2 as long), undefined, new Long(3 as long)]

type TT = [string, boolean]
let x_array_literal_13: (TT|null)[] = [null, null, ["a", true] as TT, ["b", false] as TT, null]

class A_array_literal_14 {
  fld: number
}
let x_array_literal_14: A_array_literal_14[] = [{fld: 1.0}, {fld: 1.0}, {fld: 1.0}, {fld: 1.0}]

export default function ExpressionsArrayLiteralTestSuite() {
  describe("ExpressionsArrayLiteralTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_0100
     * @tc.name      testExpressionsArrayLiteral0001
     * @tc.desc      Initializer expressions are executed from left to right. The n'th expression
     *               specifies the value of the n-1'th element of the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0
      let a: int[] = [ 42 ]
      try {
        a = [foo_abrupt_0(cnt++), foo_abrupt_0(cnt++), foo_abrupt_0(cnt++), foo_abrupt_0(cnt++), foo_abrupt_0(cnt++)]
      } catch (e) {
        expect( a.length == 1 && a[0] == 42 ).assertTrue()
        return
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_0200
     * @tc.name      testExpressionsArrayLiteral0002
     * @tc.desc      Initializer expressions are executed from left to right. The n'th expression
     *               specifies the value of the n-1'th element of the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean[] = []
      try {
        a = [foo_abrupt_1(false), foo_abrupt_1(false), foo_abrupt_1(true), foo_abrupt_1(false), foo_abrupt_1(false)]
      } catch (e) {
        expect( a.length == 0 ).assertTrue()
        return
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_0300
     * @tc.name      testExpressionsArrayLiteral0003
     * @tc.desc      "Initializer expressions are executed from left to right. The n\u2019th expression
     *               specifies the value of the n-1\u2019th element of the array."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0
      let a: int[] = [foo_expr_0(++cnt) + cnt++, ++cnt + foo_expr_0(--cnt), cnt++ - foo_expr_0(cnt--), foo_expr_0(++cnt) + ++cnt, 2 * foo_expr_0(--cnt) + --cnt,]
      for (let i = 0; i < a.length; i++) {
        expect( expected[i] == a[i] ).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_0400
     * @tc.name      testExpressionsArrayLiteral0004
     * @tc.desc      "Initializer expressions are executed from left to right. The n\u2019th expression
     *               specifies the value of the n-1\u2019th element of the array."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[][] = [];
      for (let i = 0; i < 5; i++) {
        a.push(foo_expr_1(i));
      }
      for (let i = 0; i < a.length; i++) {
        expect(i).assertEqual(a[i].length);
        for (let j = 0; j < a[i].length; j++) {
          expect(a[i][j]).assertEqual(j * 10);
        }
      }
      expect(foo_expr_1(0).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_0500
     * @tc.name      testExpressionsArrayLiteral0005
     * @tc.desc      Array literals can be nested, i.e., the initializer expression that specifies
     *               an array element can be an array literal if that element is of an array type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string[][][][] = [[[["a"]]]]
      expect( a[0][0][0][0] ).assertEqual( "a" )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_0600
     * @tc.name      testExpressionsArrayLiteral0006
     * @tc.desc      Array literals can be nested, i.e., the initializer expression that specifies
     *               an array element can be an array literal if that element is of an array type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object[] = [new Number(42.0)]
      a = [a]
      expect( (a[0] as Object[])[0] as Number ).assertEqual( 42.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_0700
     * @tc.name      testExpressionsArrayLiteral0007
     * @tc.desc      Array literals can be nested, i.e., the initializer expression that specifies
     *               an array element can be an array literal if that element is of an array type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object[] = [new Number(42.0)]
      a = foo_nest_2([a])
      a = foo_nest_2([a])
      expect( bar_nest_2(bar_nest_2(bar_nest_2(bar_nest_2(a[0])[0])[0])[0])[0] as Number ).assertEqual( 42.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_0800
     * @tc.name      testExpressionsArrayLiteral0008
     * @tc.desc      Array literals can be nested, i.e., the initializer expression that specifies
     *               an array element can be an array literal if that element is of an array type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A[][] = [[{}, {}], [{}, {}], [{}, {}]]
      expect( a[1][1] instanceof A ).assertTrue()
      expect( a.length ).assertEqual( 3 )
      expect( a[1].length ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_0900
     * @tc.name      testExpressionsArrayLiteral0009
     * @tc.desc      Array literals can be nested, i.e., the initializer expression that specifies
     *               an array element can be an array literal if that element is of an array type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A[][] = [foo_nest_4(), foo_nest_4(), foo_nest_4()]
      expect( a[1][1] instanceof A ).assertTrue()
      expect( a.length ).assertEqual( 3 )
      expect( a[1].length ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_1000
     * @tc.name      testExpressionsArrayLiteral0010
     * @tc.desc      Array literals can be nested, i.e., the initializer expression that specifies
     *               an array element can be an array literal if that element is of an array type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_nest_5([[1, 11], [2, 22], [3, 33], [4, 44]] as int[][]) ).assertEqual( 120 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_1100
     * @tc.name      testExpressionsArrayLiteral0011
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte[] = instantiateEmptyArray_byte()
      expect(a.length).assertEqual(0)

      let b: byte[] = instantiateArrayWithValues_byte()
      expect(b.length).assertEqual(4)
      expect(b[0] instanceof byte).assertTrue()
      expect(b[0]).assertEqual(0)
      expect(b[1]).assertEqual(5)
      expect(b[2]).assertEqual(7)
      expect(b[3]).assertEqual(10)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_1200
     * @tc.name      testExpressionsArrayLiteral0012
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short[] = instantiateEmptyArray_short()
      expect(a.length).assertEqual(0)

      let b: short[] = instantiateArrayWithValues_short()
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof short).assertTrue()
      expect(b[0]).assertEqual(9)
      expect(b[1]).assertEqual(15)
      expect(b[2]).assertEqual(13)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_1300
     * @tc.name      testExpressionsArrayLiteral0013
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = instantiateEmptyArray_int()
      expect(a.length).assertEqual(0)

      let b: int[] = instantiateArrayWithValues_int()
      expect(b.length).assertEqual(5)
      expect(b[0] instanceof int).assertTrue()
      expect(b[0]).assertEqual(9)
      expect(b[1]).assertEqual(13)
      expect(b[2]).assertEqual(123)
      expect(b[3]).assertEqual(17)
      expect(b[4]).assertEqual(10)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_1400
     * @tc.name      testExpressionsArrayLiteral0014
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = instantiateEmptyArray_number()
      expect(a.length).assertEqual(0)

      let b: number[] = instantiateArrayWithValues_number()
      expect(b.length).assertEqual(6)
      expect(b[0] instanceof number).assertTrue()
      expect(b[0]).assertEqual(9)
      expect(b[1]).assertEqual(13)
      expect(b[2]).assertEqual(1)
      expect(b[3]).assertEqual(5.7)
      expect(b[4]).assertEqual(10)
      expect(b[5]).assertEqual(12.4)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_1500
     * @tc.name      testExpressionsArrayLiteral0015
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double[] = instantiateEmptyArray_double()
      expect(a.length).assertEqual(0)

      let b: double[] = instantiateArrayWithValues_double()
      expect(b.length).assertEqual(6)
      expect(b[0] instanceof double).assertTrue()
      expect(b[0]).assertEqual(9)
      expect(b[1]).assertEqual(13)
      expect(b[2]).assertEqual(1)
      expect(b[3]).assertEqual(5.7)
      expect(b[4]).assertEqual(10)
      expect(b[5]).assertEqual(12.4)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_1600
     * @tc.name      testExpressionsArrayLiteral0016
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long[] = instantiateEmptyArray_long()
      expect(a.length).assertEqual(0)

      let b: long[] = instantiateArrayWithValues_long()
      expect(b.length).assertEqual(6)
      expect(b[0] instanceof long).assertTrue()
      expect(b[0]).assertEqual(9)
      expect(b[1]).assertEqual(13)
      expect(b[2]).assertEqual(9223372036854775807)
      expect(b[3]).assertEqual(5)
      expect(b[4]).assertEqual(10)
      expect(b[5]).assertEqual(12)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_1700
     * @tc.name      testExpressionsArrayLiteral0017
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float[] = instantiateEmptyArray_float()
      expect(a.length).assertEqual(0)

      let b: float[] = instantiateArrayWithValues_float()
      expect(b.length).assertEqual(6)
      expect(b[0] instanceof float).assertTrue()
      expect(b[0]).assertEqual(9)
      expect(b[1]).assertEqual(13)
      expect(b[2]).assertEqual(1)
      expect(b[3]).assertEqual(5.7f)
      expect(b[4]).assertEqual(10)
      expect(b[5]).assertEqual(12.4f)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_1800
     * @tc.name      testExpressionsArrayLiteral0018
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean[] = instantiateEmptyArray_boolean()
      expect(a.length).assertEqual(0)

      let b: boolean[] = instantiateArrayWithValues_boolean()
      expect(b.length).assertEqual(6)
      expect(b[0] instanceof boolean).assertTrue()
      expect(b[0]).assertEqual(true)
      expect(b[1]).assertEqual(false)
      expect(b[2]).assertEqual(false)
      expect(b[3]).assertEqual(true)
      expect(b[4]).assertEqual(false)
      expect(b[5]).assertEqual(true)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_1900
     * @tc.name      testExpressionsArrayLiteral0019
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char[] = instantiateEmptyArray_char()
      expect(a.length).assertEqual(0)

      let b: char[] = instantiateArrayWithValues_char()
      expect(b.length).assertEqual(5)
      expect(b[0] instanceof char).assertTrue()
      expect(b[0]).assertEqual(c'\u2028')
      expect(b[1]).assertEqual(c'\u005c')
      expect(b[2]).assertEqual(c'\u0027')
      expect(b[3]).assertEqual(c'x')
      expect(b[4]).assertEqual(c'Z')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_2000
     * @tc.name      testExpressionsArrayLiteral0020
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: String[] = instantiateEmptyArray_String()
      expect(a.length).assertEqual(0)

      let b: String[] = instantiateArrayWithValues_String()
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof String).assertTrue()
      expect(b[0]).assertEqual("ab")
      expect(b[1]).assertEqual("cd")
      expect(b[2]).assertEqual("efg")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_2100
     * @tc.name      testExpressionsArrayLiteral0021
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: object[] = instantiateEmptyArray_object()
      expect(a.length).assertEqual(0)

      let b: object[] = instantiateArrayWithValues_object()
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof object).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_2200
     * @tc.name      testExpressionsArrayLiteral0022
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Number[] = instantiateEmptyArray_Number()
      expect(a.length).assertEqual(0)

      let b: Number[] = instantiateArrayWithValues_Number()
      expect(b.length).assertEqual(6)
      expect(b[0] instanceof Number).assertTrue()
      expect(b[0]).assertEqual(9)
      expect(b[1]).assertEqual(13)
      expect(b[2]).assertEqual(1)
      expect(b[3]).assertEqual(5.7)
      expect(b[4]).assertEqual(10)
      expect(b[5]).assertEqual(12.4)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_2300
     * @tc.name      testExpressionsArrayLiteral0023
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Boolean[] = instantiateEmptyArray_Boolean()
      expect(a.length).assertEqual(0)

      let b: Boolean[] = instantiateArrayWithValues_Boolean()
      expect(b.length).assertEqual(6)
      expect(b[0] instanceof Boolean).assertTrue()
      expect(b[0]).assertEqual(true)
      expect(b[1]).assertEqual(false)
      expect(b[2]).assertEqual(false)
      expect(b[3]).assertEqual(true)
      expect(b[4]).assertEqual(false)
      expect(b[5]).assertEqual(true)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_2400
     * @tc.name      testExpressionsArrayLiteral0024
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: MyClass[] = instantiateEmptyArray_MyClass()
      expect(a.length).assertEqual(0)

      let b: MyClass[] = instantiateArrayWithValues_MyClass()
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof MyClass).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_2500
     * @tc.name      testExpressionsArrayLiteral0025
     * @tc.desc      Issue 14597 array type cannot resolve from literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: MyInterface[] = instantiateEmptyArray_MyInterface()
      expect(a.length).assertEqual(0)

      let b: MyInterface[] = instantiateArrayWithValues_MyInterface()
      expect(b.length).assertEqual(3)
      expect(b[0] instanceof MyInterface).assertTrue()
    });
    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_2600
     * @tc.name      testExpressionsArrayLiteral0026
     * @tc.desc      Create empty 1D Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = []
      expect(a.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_2700
     * @tc.name      testExpressionsArrayLiteral0027
     * @tc.desc      Create 1D Array with the data type int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [5, 3, 7, 9]
      expect(a.length).assertEqual(4)
      expect(a[0] instanceof int).assertTrue()
      expect(a[0]).assertEqual(5)
      expect(a[1]).assertEqual(3)
      expect(a[2]).assertEqual(7)
      expect(a[3]).assertEqual(9)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_2800
     * @tc.name      testExpressionsArrayLiteral0028
     * @tc.desc      Create a 2D Array with the data type number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : number[][] = [[5, 3.7], [7, 8.5], [3, 4]]
      expect(a.length).assertEqual(3)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[2].length).assertEqual(2)
      expect(a[0][0] instanceof number).assertTrue()
      expect(a[0][0]).assertEqual(5)
      expect(a[0][1]).assertEqual(3.7)
      expect(a[1][0]).assertEqual(7)
      expect(a[1][1]).assertEqual(8.5)
      expect(a[2][0]).assertEqual(3)
      expect(a[2][1]).assertEqual(4)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_2900
     * @tc.name      testExpressionsArrayLiteral0029
     * @tc.desc      Create a 3D Array with the data type string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : string[][][] = [
        [["_a", "_b"], ["_c", "_d"]],
        [["_e", "_f"], ["_g", "_h"]],
        [["_i", "_j"], ["_k", "_l"]]
      ]
      expect(a.length).assertEqual(3)
      expect(a[0].length).assertEqual(2)
      expect(a[0][0].length).assertEqual(2)
      expect(a[0][1].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[1][0].length).assertEqual(2)
      expect(a[1][1].length).assertEqual(2)
      expect(a[2].length).assertEqual(2)
      expect(a[2][0].length).assertEqual(2)
      expect(a[2][1].length).assertEqual(2)
      expect(a[0][0][0] instanceof string).assertTrue()
      expect(a[0][0][0]).assertEqual("_a")
      expect(a[0][0][1]).assertEqual("_b")
      expect(a[0][1][0]).assertEqual("_c")
      expect(a[0][1][1]).assertEqual("_d")
      expect(a[1][0][0]).assertEqual("_e")
      expect(a[1][0][1]).assertEqual("_f")
      expect(a[1][1][0]).assertEqual("_g")
      expect(a[1][1][1]).assertEqual("_h")
      expect(a[2][0][0]).assertEqual("_i")
      expect(a[2][0][1]).assertEqual("_j")
      expect(a[2][1][0]).assertEqual("_k")
      expect(a[2][1][1]).assertEqual("_l")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_3000
     * @tc.name      testExpressionsArrayLiteral0030
     * @tc.desc      Create 1D Array by shallow copy with spread operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2]
      let f: FixedArray<int> = [3, 4]
      let ea: int[] = []
      let ef: FixedArray<int> = []
      let t: int[] = [
        ...ea, ...a, ...ef,
        ...f, ...ea, ...a, ...ef
      ]
      t[0] = 7
      t[3] = 9
      t[4] = 5
      expect(a.length).assertEqual(2)
      expect(f.length).assertEqual(2)
      expect(ea.length).assertEqual(0)
      expect(ef.length).assertEqual(0)
      expect(t.length).assertEqual(6)
      expect(t[0] instanceof int).assertTrue()
      expect(a[0]).assertEqual(1)
      expect(a[1]).assertEqual(2)
      expect(f[0]).assertEqual(3)
      expect(f[1]).assertEqual(4)
      expect(t[0]).assertEqual(7)
      expect(t[1]).assertEqual(2)
      expect(t[2]).assertEqual(3)
      expect(t[3]).assertEqual(9)
      expect(t[4]).assertEqual(5)
      expect(t[5]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_3100
     * @tc.name      testExpressionsArrayLiteral0031
     * @tc.desc      Create 2D Array by shallow copy with spread operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [4, 2]
      let f: FixedArray<number> = [7, 8]
      let ea: number[] = []
      let ef: FixedArray<number> = []
      let t: number[][] = [
        [...ea, ...a, ...ef, ...f, ...ea],
        [...ef, ...f, ...ea, ...a, ...ef],
      ]
      t[0][3] = 9
      t[1][2] = 5
      expect(a.length).assertEqual(2)
      expect(f.length).assertEqual(2)
      expect(ea.length).assertEqual(0)
      expect(ef.length).assertEqual(0)
      expect(t.length).assertEqual(2)
      expect(t[0].length).assertEqual(4)
      expect(t[1].length).assertEqual(4)
      expect(t[0][0] instanceof number).assertTrue()
      expect(a[0]).assertEqual(4)
      expect(a[1]).assertEqual(2)
      expect(f[0]).assertEqual(7)
      expect(f[1]).assertEqual(8)
      expect(t[0][0]).assertEqual(4)
      expect(t[0][1]).assertEqual(2)
      expect(t[0][2]).assertEqual(7)
      expect(t[0][3]).assertEqual(9)
      expect(t[1][0]).assertEqual(7)
      expect(t[1][1]).assertEqual(8)
      expect(t[1][2]).assertEqual(5)
      expect(t[1][3]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_3200
     * @tc.name      testExpressionsArrayLiteral0032
     * @tc.desc      Create 1D Array by shallow copy with spread operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aA: A_array_create_from_lit2_6[] = [new A_array_create_from_lit2_6(2), new A_array_create_from_lit2_6(4), new B_array_create_from_lit2_6(7)]
      let fB: FixedArray<B_array_create_from_lit2_6> = [new B_array_create_from_lit2_6(5), new B_array_create_from_lit2_6(9)]
      let fA: FixedArray<A_array_create_from_lit2_6> = [new B_array_create_from_lit2_6(13), new A_array_create_from_lit2_6(10)]
      let eaA: A_array_create_from_lit2_6[] = []
      let efB: FixedArray<B_array_create_from_lit2_6> = []
      let t: A_array_create_from_lit2_6[] = [
        ...eaA, ...fB, ...efB,
        ...aA, ...eaA, ...fA, ...efB
      ]
      t[0] = new A_array_create_from_lit2_6(8)
      t[3] = new A_array_create_from_lit2_6(15)
      t[6] = new B_array_create_from_lit2_6(5)
      expect(aA.length).assertEqual(3)
      expect(fB.length).assertEqual(2)
      expect(fA.length).assertEqual(2)
      expect(eaA.length).assertEqual(0)
      expect(efB.length).assertEqual(0)
      expect(t.length).assertEqual(7)
      expect(t[0] instanceof A_array_create_from_lit2_6).assertTrue()
      expect(aA[0].v).assertEqual(2)
      expect(aA[1].v).assertEqual(4)
      expect(aA[2].v).assertEqual(-7)
      expect(fB[0].v).assertEqual(-5)
      expect(fB[1].v).assertEqual(-9)
      expect(fA[0].v).assertEqual(-13)
      expect(fA[1].v).assertEqual(10)
      expect(t[0].v).assertEqual(8)
      expect(t[1] instanceof B_array_create_from_lit2_6).assertTrue()
      expect(t[1].v).assertEqual(-9)
      expect(t[2].v).assertEqual(2)
      expect(t[3].v).assertEqual(15)
      expect(t[4].v).assertEqual(-7)
      expect(t[5] instanceof B_array_create_from_lit2_6).assertTrue()
      expect(t[5].v).assertEqual(-13)
      expect(t[6].v).assertEqual(-5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_3300
     * @tc.name      testExpressionsArrayLiteral0033
     * @tc.desc      Create 1D Array with covariant subtypes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let animals: Animal_array_create_from_lit2_7[] = [new Animal_array_create_from_lit2_7(), {name: "dog"} as Dog_array_create_from_lit2_7, new Cat_array_create_from_lit2_7]
      expect(animals[0] instanceof Animal_array_create_from_lit2_7).assertTrue()
      expect(animals[1] instanceof Dog_array_create_from_lit2_7).assertTrue()
      expect((animals[1] as Dog_array_create_from_lit2_7).bark()).assertEqual("dog")
      expect(animals[2] instanceof Cat_array_create_from_lit2_7).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_3400
     * @tc.name      testExpressionsArrayLiteral0034
     * @tc.desc      Create 1D Array with covariant function subtypes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: HandlerBInt[] = [handlerAInt, handlerA, handlerNothing]
      expect(a[0](new B_array_create_from_lit2_8(), 7).v).assertEqual(-20)
      expect(a[1](new B_array_create_from_lit2_8(), 7).v).assertEqual(13)
      expect(a[2](new B_array_create_from_lit2_8(), 7).v).assertEqual(-567)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_ARRAY_LITERAL_3500
     * @tc.name      testExpressionsArrayLiteral0035
     * @tc.desc      The number of initializer expressions enclosed in braces of the array initializer
     *               determines the length of the array to be constructed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsArrayLiteral0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( x_array_literal_0.length ).assertEqual( 0 )
      expect( x_array_literal_1.length ).assertEqual( 3 )
      expect( x_array_literal_2.length ).assertEqual( 1 )
      expect( x_array_literal_3.length ).assertEqual( 2 )
      expect( x_array_literal_4.length ).assertEqual( 10 )
      expect( x_array_literal_5.length ).assertEqual( 2 )
      expect( x_array_literal_6.length ).assertEqual( 3 )
      expect( x_array_literal_7.length ).assertEqual( 3 )
      expect( x_array_literal_8.length ).assertEqual( 2 )
      expect( x_array_literal_9.length ).assertEqual( 3 )
      expect( x_array_literal_10.length ).assertEqual( 3 )
      expect( x_array_literal_11.length ).assertEqual( 3 )
      expect( x_array_literal_12.length ).assertEqual( 5 )
      expect( x_array_literal_13.length ).assertEqual( 5 )
      expect( x_array_literal_14.length ).assertEqual( 4 )
    });
  });
}