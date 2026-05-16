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

let elem: Any = null
let a: Any[] = [elem, elem]
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
class A2<T> {}
let elem17: A2<int> = new A2<int>
let a17: A2<int>[] = [elem17, elem17]
interface I1<T> {}
class A3<T> implements I1<T> {}
let elem18: I1<int> = new A3<int>
let a18: I1<int>[] = [elem18, elem18]
enum Color { Red, Green, Blue }
let a19: Color[] = [Color.Red, Color.Green]
type foo_type = (a: string) => string
let elem20: foo_type = (a: string) => a
let a20: foo_type[] = [elem20, elem20]
let elem21: Any = null
let a21 = [elem21, elem21]
let a22 = [undefined, undefined]
let a23 = [null, null]
let elem24: byte = 1
let a24 = [elem24, elem24]
let elem25: short = 1
let a25 = [elem25, elem25]
let a26 = [1, 1]
let a27 = [2147483648, 2147483648]
let a28 = [1.0f, 1.0f]
let a29 = [1.0, 1.0]
let a30 = [1n, 1n]
let a31 = [true, false]
let a32 = [c'a', c'a']
let a33 = ["string", "string"]
let elem34: Object = new Object()
let a34 = [elem34, elem34]
let a35 = ["aa", "aa"]
class A4 {}
let elem36: A4 = new A4
let a36 = [elem36, elem36]
interface I2 {}
class A5 implements I2 {}
let elem37: I2 = new A5
let a37 = [elem37, elem37]
class A6<T> {}
let elem38: A6<int> = new A6<int>
let a38 = [elem38, elem38]
interface I3<T> {}
class A7<T> implements I3<T> {}
let elem39: I3<int> = new A7<int>
let a39 = [elem39, elem39]
let a40 = [Color.Red, Color.Green]
let elem41: foo_type = (a: string) => a
let a41 = [elem41, elem41]

class A8 {}
let a42: FixedArray<A8> = []
let a43: FixedArray<double> = []
let a44: FixedArray<int> = []
let a45: FixedArray<string> = []
let a46: FixedArray<null> = []
let a47: FixedArray<undefined> = []

let a48: FixedArray<A8> = [new A8]
let a49: FixedArray<double> = [1.0]
let a50: FixedArray<int> = [1]
let a51: FixedArray<string> = ["string"]
let a52: FixedArray<null> = [null]
let a53: FixedArray<undefined> = [undefined]

let a54: Array<number> = [1.0, 2.0]
let a55: FixedArray<number> = [1.0, 2.0]

type TT = [int, string]
let a56: TT = [42, "abc"]

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
type my_type1 = Any[]
type my_type2 = Array<Any>
type my_type3 = undefined[]
type my_type4 = Array<undefined>
type my_type5 = null[]
type my_type6 = Array<null>
type my_type7 = byte[]
type my_type8 = Array<byte>
type my_type9 = short[]
type my_type10 = Array<short>
type my_type11 = int[]
type my_type12 = Array<int>
type my_type13 = long[]
type my_type14 = Array<long>
type my_type15 = float[]
type my_type16 = Array<float>
type my_type17 = double[]
type my_type18 = Array<double>
type my_type19 = bigint[]
type my_type20 = Array<bigint>
type my_type21 = boolean[]
type my_type22 = Array<boolean>
type my_type23 = char[]
type my_type24 = Array<char>
type my_type25 = string[]
type my_type26 = Array<string>
type my_type27 = Object[]
type my_type28 = Array<Object>
type my_type29 = [string, int][]
type my_type30 = Array<[string, int]>
type my_type31 = "aa"[]
type my_type32 = Array<"aa">
class A9 {}
type my_type33 = A9[]
type my_type34 = Array<A9>
interface I4 {}
class A10 implements I4 {}
type my_type35 = I4[]
type my_type36 = Array<I4>
class A11<T> {}
type my_type37 = A11<int>[]
type my_type38 = Array<A11<int>>
interface I5<T> {}
class A12<T> implements I5<T> {}
type my_type39 = I5<int>[]
type my_type40 = Array<I5<int>>
type my_type41 = Color[]
type my_type42 = Array<Color>
type foo_type1 = (a: string) => string
type my_type43 = foo_type1[]
type my_type44 = Array<foo_type1>

type my_type45 = Any[]
type my_type46 = Array<Any>
type my_type47 = undefined[]
type my_type48 = Array<undefined>
type my_type49 = null[]
type my_type50 = Array<null>
type my_type51 = byte[]
interface I8<T> {}
interface J<T> {}
class A17<T> implements I8<T> {}
class B<T> extends A17<T> implements J<T> {}
class C<T> {}

let c: C<int>
enum Rating1: double { A = 1.0, B = 1.5 }
enum Rating2: double { A = 1.0, B = 1.5 }
enum Rating3: double { A = 1.0, B = 1.5 }

type TT28 = Char
let test28: TT28 = c''

export default function ExpressionsInstanceTest(): void {
  describe("ExpressionsInstanceTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_0100
     * @tc.name      testExpressionsInstance0001
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a)
      expect(v instanceof Array).assertTrue()
      expect(a[0] instanceof Any).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_0200
     * @tc.name      testExpressionsInstance0002
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a1)
      expect(v instanceof Array).assertTrue()
      expect(a1[0] instanceof undefined).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_0300
     * @tc.name      testExpressionsInstance0003
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a2)
      expect(v instanceof Array).assertTrue()
      expect(a2[0] instanceof null).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_0400
     * @tc.name      testExpressionsInstance0004
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a3)
      expect(v instanceof Array).assertTrue()
      expect(a3[0] instanceof byte).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_0500
     * @tc.name      testExpressionsInstance0005
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a4)
      expect(v instanceof Array).assertTrue()
      expect(a4[0] instanceof short).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_0600
     * @tc.name      testExpressionsInstance0006
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a5)
      expect(v instanceof Array).assertTrue()
      expect(a5[0] instanceof Numeric).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_0700
     * @tc.name      testExpressionsInstance0007
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a6)
      expect(v instanceof Array).assertTrue()
      expect(a6[0] instanceof Numeric).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_0800
     * @tc.name      testExpressionsInstance0008
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a7)
      expect(v instanceof Array).assertTrue()
      expect(a7[0] instanceof Numeric).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_0900
     * @tc.name      testExpressionsInstance0009
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a8)
      expect(v instanceof Array).assertTrue()
      expect(a8[0] instanceof double).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_1000
     * @tc.name      testExpressionsInstance0010
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a9)
      expect(v instanceof Array).assertTrue()
      expect(a9[0] instanceof bigint).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_1100
     * @tc.name      testExpressionsInstance0011
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a10)
      expect(v instanceof Array).assertTrue()
      expect(a10[0] instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_1200
     * @tc.name      testExpressionsInstance0012
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a11)
      expect(v instanceof Array).assertTrue()
      expect(a11[0] instanceof char).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_1300
     * @tc.name      testExpressionsInstance0013
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a12)
      expect(v instanceof Array).assertTrue()
      expect(a12[0] instanceof string).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_1400
     * @tc.name      testExpressionsInstance0014
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a13)
      expect(v instanceof Array).assertTrue()
      expect(a13[0] instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_1500
     * @tc.name      testExpressionsInstance0015
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a14)
      expect(v instanceof Array).assertTrue()
      expect(a14[0] instanceof string).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_1600
     * @tc.name      testExpressionsInstance0016
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a15)
      expect(v instanceof Array).assertTrue()
      expect(a15[0] instanceof A).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_1700
     * @tc.name      testExpressionsInstance0017
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a16)
      expect(v instanceof Array).assertTrue()
      expect(a16[0] instanceof I).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_1800
     * @tc.name      testExpressionsInstance0018
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a17)
      expect(v instanceof Array).assertTrue()
      expect(a17[0] instanceof A2).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_1900
     * @tc.name      testExpressionsInstance0019
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a18)
      expect(v instanceof Array).assertTrue()
      expect(a18[0] instanceof I1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_2000
     * @tc.name      testExpressionsInstance0020
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a19)
      expect(v instanceof Array).assertTrue()
      expect(a19[0] instanceof Color).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_2100
     * @tc.name      testExpressionsInstance0021
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a20)
      expect(v instanceof Array).assertTrue()
      expect(a20[0] instanceof foo_type).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_2200
     * @tc.name      testExpressionsInstance0022
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a21)
      expect(v instanceof Array).assertTrue()
      expect(a21[0] instanceof Any).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_2300
     * @tc.name      testExpressionsInstance0023
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a22)
      expect(v instanceof Array).assertTrue()
      expect(a22[0] instanceof undefined).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_2400
     * @tc.name      testExpressionsInstance0024
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a23)
      expect(v instanceof Array).assertTrue()
      expect(a23[0] instanceof null).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_2500
     * @tc.name      testExpressionsInstance0025
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a24)
      expect(v instanceof Array).assertTrue()
      expect(a24[0] instanceof byte).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_2600
     * @tc.name      testExpressionsInstance0026
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a25)
      expect(v instanceof Array).assertTrue()
      expect(a25[0] instanceof short).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_2700
     * @tc.name      testExpressionsInstance0027
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a26)
      expect(v instanceof Array).assertTrue()
      expect(a26[0] instanceof Numeric).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_2800
     * @tc.name      testExpressionsInstance0028
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a27)
      expect(v instanceof Array).assertTrue()
      expect(a27[0] instanceof Numeric).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_2900
     * @tc.name      testExpressionsInstance0029
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a28)
      expect(v instanceof Array).assertTrue()
      expect(a28[0] instanceof Numeric).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_3000
     * @tc.name      testExpressionsInstance0030
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a29)
      expect(v instanceof Array).assertTrue()
      expect(a29[0] instanceof double).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_3100
     * @tc.name      testExpressionsInstance0031
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a30)
      expect(v instanceof Array).assertTrue()
      expect(a30[0] instanceof bigint).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_3200
     * @tc.name      testExpressionsInstance0032
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a31)
      expect(v instanceof Array).assertTrue()
      expect(a31[0] instanceof boolean).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_3300
     * @tc.name      testExpressionsInstance0033
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a32)
      expect(v instanceof Array).assertTrue()
      expect(a32[0] instanceof char).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_3400
     * @tc.name      testExpressionsInstance0034
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a33)
      expect(v instanceof Array).assertTrue()
      expect(a33[0] instanceof string).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_3500
     * @tc.name      testExpressionsInstance0035
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a34)
      expect(v instanceof Array).assertTrue()
      expect(a34[0] instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_3600
     * @tc.name      testExpressionsInstance0036
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a35)
      expect(v instanceof Array).assertTrue()
      expect(a35[0] instanceof string).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_3700
     * @tc.name      testExpressionsInstance0037
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a36)
      expect(v instanceof Array).assertTrue()
      expect(a36[0] instanceof A4).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_3800
     * @tc.name      testExpressionsInstance0038
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a37)
      expect(v instanceof Array).assertTrue()
      expect(a37[0] instanceof I2).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_3900
     * @tc.name      testExpressionsInstance0039
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a38)
      expect(v instanceof Array).assertTrue()
      expect(a38[0] instanceof A6).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_4000
     * @tc.name      testExpressionsInstance0040
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a39)
      expect(v instanceof Array).assertTrue()
      expect(a39[0] instanceof I3).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_4100
     * @tc.name      testExpressionsInstance0041
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a40)
      expect(v instanceof Array).assertTrue()
      expect(a40[0] instanceof Color).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_4200
     * @tc.name      testExpressionsInstance0042
     * @tc.desc      The result of an instanceof expression is true if the evaluated expression's type is a
     *               subtype of T, otherwise false. Generic types can be used as T in instanceof,
     *               but only the type name is checked, ignoring type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = pass_through(a41)
      expect(v instanceof Array).assertTrue()
      expect(a41[0] instanceof foo_type).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_4300
     * @tc.name      testExpressionsInstance0043
     * @tc.desc      A compile-time error occurs if type T is not retained after type erasure.
     *               Generic types cannot be used with instanceof unless T is preserved.
     *               Fixed-size array types (FixedArray<T>) retain the effective type of the type argument T.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(a42 instanceof FixedArray<A8>).assertTrue()
      expect(a43 instanceof FixedArray<double>).assertTrue()
      expect(a44 instanceof FixedArray<int>).assertTrue()
      expect(a45 instanceof FixedArray<string>).assertTrue()
      expect(a46 instanceof FixedArray<null>).assertTrue()
      expect(a47 instanceof FixedArray<undefined>).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_4400
     * @tc.name      testExpressionsInstance0044
     * @tc.desc      A compile-time error occurs if type T is not retained after type erasure.
     *               Generic types cannot be used with instanceof unless T is preserved.
     *               Fixed-size array types (FixedArray<T>) retain the effective type of the type argument T.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(a48 instanceof FixedArray<A8>).assertTrue()
      expect(a48[0] instanceof A8).assertTrue()
      expect(a49 instanceof FixedArray<double>).assertTrue()
      expect(a49[0] instanceof double).assertTrue()
      expect(a50 instanceof FixedArray<int>).assertTrue()
      expect(a50[0] instanceof int).assertTrue()
      expect(a51 instanceof FixedArray<string>).assertTrue()
      expect(a51[0] instanceof string).assertTrue()
      expect(a52 instanceof FixedArray<null>).assertTrue()
      expect(a52[0] instanceof null).assertTrue()
      expect(a53 instanceof FixedArray<undefined>).assertTrue()
      expect(a53[0] instanceof undefined).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_4500
     * @tc.name      testExpressionsInstance0045
     * @tc.desc      A compile-time error occurs if type T is not retained after type erasure.
     *               Generic types cannot be used with instanceof unless T is preserved.
     *               Fixed-size array types (FixedArray<T>) retain the effective type of the type argument T.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = [1, 2] instanceof FixedArray<int>
      expect(v1 instanceof boolean).assertTrue()
      expect(!v1).assertTrue()
      let v2 = ((p: boolean) => p ? 1 : 0)([1, 2] instanceof FixedArray<int>)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_4600
     * @tc.name      testExpressionsInstance0046
     * @tc.desc      A compile-time error occurs if type T is not retained after type erasure.
     *               Generic types cannot be used with instanceof unless T is preserved.
     *               Fixed-size array types (FixedArray<T>) retain the effective type of the type argument T.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a54)() instanceof FixedArray<double>
      expect(v1 instanceof boolean).assertTrue()
      expect(!v1).assertTrue()
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a54)() instanceof FixedArray<double>)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_4700
     * @tc.name      testExpressionsInstance0047
     * @tc.desc      A compile-time error occurs if type T is not retained after type erasure.
     *               Generic types cannot be used with instanceof unless T is preserved.
     *               Fixed-size array types (FixedArray<T>) retain the effective type of the type argument T.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a55)() instanceof FixedArray<number>
      expect(v1 instanceof boolean).assertTrue()
      expect(v1).assertTrue()
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a55)() instanceof FixedArray<number>)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_4800
     * @tc.name      testExpressionsInstance0048
     * @tc.desc      A compile-time error occurs if type T is not retained after type erasure.
     *               Generic types cannot be used with instanceof unless T is preserved.
     *               Fixed-size array types (FixedArray<T>) retain the effective type of the type argument T.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => a56)() instanceof FixedArray<int>
      expect(v1 instanceof boolean).assertTrue()
      expect(!v1).assertTrue()
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => a56)() instanceof FixedArray<int>)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_4900
     * @tc.name      testExpressionsInstance0049
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: Any = null
      let v: my_type1 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_5000
     * @tc.name      testExpressionsInstance0050
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: Any = null
      let v: my_type2 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_5100
     * @tc.name      testExpressionsInstance0051
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type3 = [undefined, undefined]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_5200
     * @tc.name      testExpressionsInstance0052
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type4 = [undefined, undefined]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_5300
     * @tc.name      testExpressionsInstance0053
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type5 = [null, null]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_5400
     * @tc.name      testExpressionsInstance0054
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type6 = [null, null]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_5500
     * @tc.name      testExpressionsInstance0055
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: byte = 1
      let v: my_type7 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_5600
     * @tc.name      testExpressionsInstance0056
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: byte = 1
      let v: my_type8 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_5700
     * @tc.name      testExpressionsInstance0057
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: short = 1
      let v: my_type9 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_5800
     * @tc.name      testExpressionsInstance0058
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: short = 1
      let v: my_type10 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_5900
     * @tc.name      testExpressionsInstance0059
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type11 = [1, 1]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_6000
     * @tc.name      testExpressionsInstance0060
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type12 = [1, 1]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_6100
     * @tc.name      testExpressionsInstance0061
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type13 = [2147483648, 2147483648]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_6200
     * @tc.name      testExpressionsInstance0062
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type14 = [2147483648, 2147483648]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_6300
     * @tc.name      testExpressionsInstance0063
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type15 = [1.0f, 1.0f]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_6400
     * @tc.name      testExpressionsInstance0064
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type16 = [1.0f, 1.0f]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_6500
     * @tc.name      testExpressionsInstance0065
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type17 = [1.0, 1.0]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_6600
     * @tc.name      testExpressionsInstance0066
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type18 = [1.0, 1.0]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_6700
     * @tc.name      testExpressionsInstance0067
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type19 = [1n, 1n]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_6800
     * @tc.name      testExpressionsInstance0068
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type20 = [1n, 1n]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_6900
     * @tc.name      testExpressionsInstance0069
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type21 = [true, false]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_7000
     * @tc.name      testExpressionsInstance0070
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type22 = [true, false]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_7100
     * @tc.name      testExpressionsInstance0071
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type23 = [c'a', c'a']
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_7200
     * @tc.name      testExpressionsInstance0072
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type24 = [c'a', c'a']
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_7300
     * @tc.name      testExpressionsInstance0073
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type25 = ["string", "string"]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_7400
     * @tc.name      testExpressionsInstance0074
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type26 = ["string", "string"]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_7500
     * @tc.name      testExpressionsInstance0075
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: Object = new Object()
      let v: my_type27 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_7600
     * @tc.name      testExpressionsInstance0076
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: Object = new Object()
      let v: my_type28 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_7700
     * @tc.name      testExpressionsInstance0077
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: [string, int] = ["string", 1]
      let v: my_type29 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_7800
     * @tc.name      testExpressionsInstance0078
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: [string, int] = ["string", 1]
      let v: my_type30 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_7900
     * @tc.name      testExpressionsInstance0079
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type31 = ["aa", "aa"]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_8000
     * @tc.name      testExpressionsInstance0080
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type32 = ["aa", "aa"]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_8100
     * @tc.name      testExpressionsInstance0081
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: A9 = new A9
      let v: my_type33 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_8200
     * @tc.name      testExpressionsInstance0082
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: A9 = new A9
      let v: my_type34 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_8300
     * @tc.name      testExpressionsInstance0083
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: I4 = new A10()
      let v: my_type35 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_8400
     * @tc.name      testExpressionsInstance0084
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: I4 = new A10()
      let v: my_type36 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_8500
     * @tc.name      testExpressionsInstance0085
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: A11<int> = new A11<int>
      let v: my_type37 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_8600
     * @tc.name      testExpressionsInstance0086
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: A11<int> = new A11<int>
      let v: my_type38 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_8700
     * @tc.name      testExpressionsInstance0087
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: I5<int> = new A12<int>()
      let v: my_type39 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_8800
     * @tc.name      testExpressionsInstance0088
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: I5<int> = new A12<int>()
      let v: my_type40 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_8900
     * @tc.name      testExpressionsInstance0089
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type41 = [Color.Red, Color.Green]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_9000
     * @tc.name      testExpressionsInstance0090
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type42 = [Color.Red, Color.Green]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_9100
     * @tc.name      testExpressionsInstance0091
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: foo_type1 = (a: string) => a
      let v: my_type43 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_9200
     * @tc.name      testExpressionsInstance0092
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: foo_type1 = (a: string) => a
      let v: my_type44 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_9300
     * @tc.name      testExpressionsInstance0093
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: Any = null
      let v: my_type45 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_9400
     * @tc.name      testExpressionsInstance0094
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: Any = null
      let v: my_type46 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_9500
     * @tc.name      testExpressionsInstance0095
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type47 = [undefined, undefined]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_9600
     * @tc.name      testExpressionsInstance0096
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type48 = [undefined, undefined]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_9700
     * @tc.name      testExpressionsInstance0097
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type49 = [null, null]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_9800
     * @tc.name      testExpressionsInstance0098
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type50 = [null, null]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_TEST_9900
     * @tc.name      testExpressionsInstance0099
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstance0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: byte = 1
      let v: my_type51 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });
  });
}
