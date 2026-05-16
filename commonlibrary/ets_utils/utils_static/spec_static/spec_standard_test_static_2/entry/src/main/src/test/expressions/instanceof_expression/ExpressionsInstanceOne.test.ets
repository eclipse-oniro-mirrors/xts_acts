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

enum Color { Red, Green, Blue }

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
type my_type52 = Array<byte>
type my_type53 = short[]
type my_type54 = Array<short>
type my_type55 = int[]
type my_type56 = Array<int>
type my_type57 = long[]
type my_type58 = Array<long>
type my_type59 = float[]
type my_type60 = Array<float>
type my_type61 = double[]
type my_type62 = Array<double>
type my_type63 = bigint[]
type my_type64 = Array<bigint>
type my_type65 = boolean[]
type my_type66 = Array<boolean>
type my_type67 = char[]
type my_type68 = Array<char>
type my_type69 = string[]
type my_type70 = Array<string>
type my_type71 = Object[]
type my_type72 = Array<Object>
type my_type73 = [string, int][]
type my_type74 = Array<[string, int]>
type my_type75 = "aa"[]
type my_type76 = Array<"aa">
class A13 {}
type my_type77 = A13[]
type my_type78 = Array<A13>
interface I6 {}
class A14 implements I6 {}
type my_type79 = I6[]
type my_type80 = Array<I6>
class A15<T> {}
type my_type81 = A15<int>[]
type my_type82 = Array<A15<int>>
interface I7<T> {}
class A16<T> implements I7<T> {}
type my_type83 = I7<int>[]
type my_type84 = Array<I7<int>>
type my_type85 = Color[]
type foo_type2 = (a: string) => string
type my_type87 = foo_type2[]
type my_type88 = Array<foo_type2>

interface I8<T> {}
interface J<T> {}
class A17<T> implements I8<T> {}
class B<T> extends A17<T> implements J<T> {}
class C<T> {}
class D<T> extends C<T> {}


let b: B<int>
let i: I8<int>
let j: J<int>
let c: C<int>
let d: D<int>
type FF5 = () => Any
type TT8 = Pass8
class Pass8 {
  static pass(input: TT8): TT8 { return input }
  dpass(input: TT8): TT8 { return input }
}

export default function ExpressionsInstanceOneTest(): void {
  describe("ExpressionsInstanceOneTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_0100
     * @tc.name      testExpressionsInstanceOne0001
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: byte = 1
      let v: my_type52 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_0200
     * @tc.name      testExpressionsInstanceOne0002
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: short = 1
      let v: my_type53 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_0300
     * @tc.name      testExpressionsInstanceOne0003
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: short = 1
      let v: my_type54 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_0400
     * @tc.name      testExpressionsInstanceOne0004
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type55 = [1, 1]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_0500
     * @tc.name      testExpressionsInstanceOne0005
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type56 = [1, 1]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_0600
     * @tc.name      testExpressionsInstanceOne0006
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type57 = [2147483648, 2147483648]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_0700
     * @tc.name      testExpressionsInstanceOne0007
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type58 = [2147483648, 2147483648]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_0800
     * @tc.name      testExpressionsInstanceOne0008
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type59 = [1.0f, 1.0f]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_0900
     * @tc.name      testExpressionsInstanceOne0009
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type60 = [1.0f, 1.0f]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_1000
     * @tc.name      testExpressionsInstanceOne0010
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type61 = [1.0, 1.0]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_1100
     * @tc.name      testExpressionsInstanceOne0011
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type62 = [1.0, 1.0]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_1200
     * @tc.name      testExpressionsInstanceOne0012
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type63 = [1n, 1n]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_1300
     * @tc.name      testExpressionsInstanceOne0013
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type64 = [1n, 1n]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_1400
     * @tc.name      testExpressionsInstanceOne0014
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type65 = [true, false]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_1500
     * @tc.name      testExpressionsInstanceOne0015
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type66 = [true, false]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_1600
     * @tc.name      testExpressionsInstanceOne0016
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type67 = [c'a', c'a']
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_1700
     * @tc.name      testExpressionsInstanceOne0017
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type68 = [c'a', c'a']
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_1800
     * @tc.name      testExpressionsInstanceOne0018
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type69 = ["string", "string"]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_1900
     * @tc.name      testExpressionsInstanceOne0019
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type70 = ["string", "string"]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_2000
     * @tc.name      testExpressionsInstanceOne0020
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: Object = new Object()
      let v: my_type71 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_2100
     * @tc.name      testExpressionsInstanceOne0021
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: Object = new Object()
      let v: my_type72 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_2200
     * @tc.name      testExpressionsInstanceOne0022
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: [string, int] = ["string", 1]
      let v: my_type73 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_2300
     * @tc.name      testExpressionsInstanceOne0023
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: [string, int] = ["string", 1]
      let v: my_type74 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    // 娴嬭瘯鐢ㄤ緥 123-137 (generic_array_type_params_30.js 鍒?generic_classes_interfaces.js)
    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_2400
     * @tc.name      testExpressionsInstanceOne0024
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type75 = ["aa", "aa"]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_2500
     * @tc.name      testExpressionsInstanceOne0025
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type76 = ["aa", "aa"]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_2600
     * @tc.name      testExpressionsInstanceOne0026
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: A13 = new A13
      let v: my_type77 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_2700
     * @tc.name      testExpressionsInstanceOne0027
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: A13 = new A13
      let v: my_type78 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_2800
     * @tc.name      testExpressionsInstanceOne0028
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: I6 = new A14()
      let v: my_type79 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_2900
     * @tc.name      testExpressionsInstanceOne0029
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: I6 = new A14()
      let v: my_type80 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_3000
     * @tc.name      testExpressionsInstanceOne0030
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: A15<int> = new A15<int>
      let v: my_type81 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_3100
     * @tc.name      testExpressionsInstanceOne0031
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: A15<int> = new A15<int>
      let v: my_type82 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_3200
     * @tc.name      testExpressionsInstanceOne0032
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: I7<int> = new A16<int>()
      let v: my_type83 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_3300
     * @tc.name      testExpressionsInstanceOne0033
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: I7<int> = new A16<int>()
      let v: my_type84 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_3400
     * @tc.name      testExpressionsInstanceOne0034
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: my_type85 = [Color.Red, Color.Green]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_3500
     * @tc.name      testExpressionsInstanceOne0035
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: foo_type2 = (a: string) => a
      let v: my_type87 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_3600
     * @tc.name      testExpressionsInstanceOne0036
     * @tc.desc      T[] and Array<T> are identical types. In instanceof checks,
     *               generic type parameters are ignored, and only the type name is evaluated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let elem: foo_type2 = (a: string) => a
      let v: my_type88 = [elem, elem]
      expect(v instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_3700
     * @tc.name      testExpressionsInstanceOne0037
     * @tc.desc      Generic type in the form of type name can be used as T operand of an instanceof
     *               expression. In this case, the check is performed against the type name, and type
     *               parameters are ignored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A17<int> = new A17<int>()
      expect(a instanceof A17).assertTrue()
      expect(a instanceof I8).assertTrue()
      expect(a instanceof B).assertFalse()
      expect(a instanceof J).assertFalse()

      a = new B<int>()
      expect(a instanceof A17).assertTrue()
      expect(a instanceof I8).assertTrue()
      expect(a instanceof B).assertTrue()
      expect(a instanceof J).assertTrue()

      i = new A17<int>()
      expect(i instanceof A17).assertTrue()
      expect(i instanceof I8).assertTrue()
      expect(i instanceof B).assertFalse()
      expect(i instanceof J).assertFalse()

      i = new B<int>()
      expect(i instanceof A17).assertTrue()
      expect(i instanceof I8).assertTrue()
      expect(i instanceof B).assertTrue()
      expect(i instanceof J).assertTrue()

      b = new B<int>()
      expect(b instanceof A17).assertTrue()
      expect(b instanceof I8).assertTrue()
      expect(b instanceof B).assertTrue()
      expect(b instanceof J).assertTrue()

      j = new B<int>()
      expect(j instanceof A17).assertTrue()
      expect(j instanceof I8).assertTrue()
      expect(j instanceof B).assertTrue()
      expect(j instanceof J).assertTrue()

      c = new C<int>()
      d = new D<int>()
      expect(c instanceof C).assertTrue()
      expect(d instanceof D).assertTrue()
      expect(d instanceof C).assertTrue()
      expect(c instanceof D).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_3800
     * @tc.name      testExpressionsInstanceOne0038
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = null instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(null instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_3900
     * @tc.name      testExpressionsInstanceOne0039
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = null instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(null instanceof null)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_4000
     * @tc.name      testExpressionsInstanceOne0040
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = null instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(null instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_4100
     * @tc.name      testExpressionsInstanceOne0041
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = null instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(null instanceof Object)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_4200
     * @tc.name      testExpressionsInstanceOne0042
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = null instanceof never
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(null instanceof never)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_4300
     * @tc.name      testExpressionsInstanceOne0043
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = undefined instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(undefined instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_4400
     * @tc.name      testExpressionsInstanceOne0044
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = undefined instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(undefined instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_4500
     * @tc.name      testExpressionsInstanceOne0045
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = undefined instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(undefined instanceof undefined)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_4600
     * @tc.name      testExpressionsInstanceOne0046
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = undefined instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(undefined instanceof Object)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_4700
     * @tc.name      testExpressionsInstanceOne0047
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = undefined instanceof never
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(undefined instanceof never)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_4800
     * @tc.name      testExpressionsInstanceOne0048
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => null)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => null)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_4900
     * @tc.name      testExpressionsInstanceOne0049
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => null)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => null)() instanceof null)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_5000
     * @tc.name      testExpressionsInstanceOne0050
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => null)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => null)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_5100
     * @tc.name      testExpressionsInstanceOne0051
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => null)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => null)() instanceof Object)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_5200
     * @tc.name      testExpressionsInstanceOne0052
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => null)() instanceof never
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => null)() instanceof never)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_5300
     * @tc.name      testExpressionsInstanceOne0053
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => undefined)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => undefined)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_5400
     * @tc.name      testExpressionsInstanceOne0054
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => undefined)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => undefined)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_5500
     * @tc.name      testExpressionsInstanceOne0055
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => undefined)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => undefined)() instanceof undefined)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_5600
     * @tc.name      testExpressionsInstanceOne0056
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => undefined)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => undefined)() instanceof Object)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_5700
     * @tc.name      testExpressionsInstanceOne0057
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => undefined)() instanceof never
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => undefined)() instanceof never)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_5800
     * @tc.name      testExpressionsInstanceOne0058
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => new Object)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => new Object)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_5900
     * @tc.name      testExpressionsInstanceOne0059
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => new Object)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => new Object)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_6000
     * @tc.name      testExpressionsInstanceOne0060
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => new Object)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => new Object)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_6100
     * @tc.name      testExpressionsInstanceOne0061
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => new Object)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => new Object)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_6200
     * @tc.name      testExpressionsInstanceOne0062
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => new Object)() instanceof never
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => new Object)() instanceof never)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_6300
     * @tc.name      testExpressionsInstanceOne0063
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc") instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc") instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_6400
     * @tc.name      testExpressionsInstanceOne0064
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc") instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc") instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_6500
     * @tc.name      testExpressionsInstanceOne0065
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc") instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc") instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_6600
     * @tc.name      testExpressionsInstanceOne0066
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc") instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc") instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_6700
     * @tc.name      testExpressionsInstanceOne0067
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc") instanceof never
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc") instanceof never)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_6800
     * @tc.name      testExpressionsInstanceOne0068
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc") instanceof FF5
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc") instanceof FF5)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_6900
     * @tc.name      testExpressionsInstanceOne0069
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc") instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc") instanceof string)
      expect(v2).assertEqual(0)
    });
    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_7000
     * @tc.name      testExpressionsInstanceOne0070
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc")() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc")() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_7100
     * @tc.name      testExpressionsInstanceOne0071
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc")() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc")() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_7200
     * @tc.name      testExpressionsInstanceOne0072
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc")() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc")() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_7300
     * @tc.name      testExpressionsInstanceOne0073
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc")() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc")() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_7400
     * @tc.name      testExpressionsInstanceOne0074
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => "abc")() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => "abc")() instanceof string)
      expect(v2).assertEqual(1)
    });
    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_7500
     * @tc.name      testExpressionsInstanceOne0075
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_7600
     * @tc.name      testExpressionsInstanceOne0076
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof null)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_7700
     * @tc.name      testExpressionsInstanceOne0077
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof undefined
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof undefined)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_7800
     * @tc.name      testExpressionsInstanceOne0078
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof Object
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof Object)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_7900
     * @tc.name      testExpressionsInstanceOne0079
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof string
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof string)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_8000
     * @tc.name      testExpressionsInstanceOne0080
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof byte
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof byte)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_8100
     * @tc.name      testExpressionsInstanceOne0081
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof short
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof short)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_8200
     * @tc.name      testExpressionsInstanceOne0082
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof int
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof int)
      expect(v2).assertEqual(1)
    });
    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_8300
     * @tc.name      testExpressionsInstanceOne0083
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof long
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof long)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_8400
     * @tc.name      testExpressionsInstanceOne0084
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof float
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof float)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_8500
     * @tc.name      testExpressionsInstanceOne0085
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0)() instanceof double
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0)() instanceof double)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_8600
     * @tc.name      testExpressionsInstanceOne0086
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0.5)() instanceof byte
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0.5)() instanceof byte)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_8700
     * @tc.name      testExpressionsInstanceOne0087
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0.5)() instanceof short
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0.5)() instanceof short)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_8800
     * @tc.name      testExpressionsInstanceOne0088
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0.5)() instanceof int
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0.5)() instanceof int)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_8900
     * @tc.name      testExpressionsInstanceOne0089
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0.5)() instanceof long
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0.5)() instanceof long)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_9000
     * @tc.name      testExpressionsInstanceOne0090
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0.5)() instanceof float
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0.5)() instanceof float)
      expect(v2).assertEqual(0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_9100
     * @tc.name      testExpressionsInstanceOne0091
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0.5)() instanceof double
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0.5)() instanceof double)
      expect(v2).assertEqual(1)
    });
    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_9200
     * @tc.name      testExpressionsInstanceOne0092
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => 0.5)() instanceof number
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => 0.5)() instanceof number)
      expect(v2).assertEqual(1)
    });
    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_9300
     * @tc.name      testExpressionsInstanceOne0093
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => true)() instanceof Any
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(1)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => true)() instanceof Any)
      expect(v2).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_INSTANCE_ONE_9400
     * @tc.name      testExpressionsInstanceOne0094
     * @tc.desc      Any instanceof expression in the form 'expr instanceof T' is of type boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsInstanceOne0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = ((): Any => true)() instanceof null
      expect(v1 instanceof boolean).assertTrue()
      expect(v1 ? 1 : 0).assertEqual(0)
      let v2 = ((p: boolean) => p ? 1 : 0)(((): Any => true)() instanceof null)
      expect(v2).assertEqual(0)
    });

  });
}
