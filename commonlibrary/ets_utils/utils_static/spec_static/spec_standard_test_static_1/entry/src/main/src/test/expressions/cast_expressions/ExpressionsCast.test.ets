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

let s1 = 42
let s2 = 42
let s3 = Float.MAX_VALUE
let s4 = "string"
let s5 = 42.0
let s6: byte = 0x40 as byte
interface I1 {}
class B1 implements I1 {}
let s7 = new B1()
class A1 {
    fld: string = "a"
}
class B2 extends A1 {}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsCastTest() {
  describe("ExpressionsCastTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_CAST_TEST_0100
     * @tc.name      testExpressionsCast0001
     * @tc.desc      The cast operator converts the value V of one type (as denoted by the expression)
     *               at runtime to a value of another type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsCast0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = Int.toDouble(s1)
      expect(t).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CAST_TEST_0200
     * @tc.name      testExpressionsCast0002
     * @tc.desc      The cast operator converts the value V of one type (as denoted by the expression)
     *               at runtime to a value of another type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsCast0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = Int.toDouble(s2)
      expect(t instanceof Number).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CAST_TEST_0300
     * @tc.name      testExpressionsCast0003
     * @tc.desc      The cast operator converts the value V of one type (as denoted by the expression)
     *               at runtime to a value of another type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsCast0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = s3.toFloat()
      expect(t instanceof Float && t == Float.MAX_VALUE).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CAST_TEST_0400
     * @tc.name      testExpressionsCast0004
     * @tc.desc      The cast operator converts the value V of one type (as denoted by the expression)
     *               at runtime to a value of another type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsCast0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = s4 as Object
      expect(t instanceof Object && (t as string) == "string").assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CAST_TEST_0500
     * @tc.name      testExpressionsCast0005
     * @tc.desc      The cast operator converts the value V of one type (as denoted by the expression)
     *               at runtime to a value of another type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsCast0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = Double.toInt(s5)
      expect(t).assertEqual(42)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CAST_TEST_0600
     * @tc.name      testExpressionsCast0006
     * @tc.desc      The cast operator converts the value V of one type (as denoted by the expression)
     *               at runtime to a value of another type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsCast0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = Byte.toChar(s6)
      expect(t).assertEqual(c'@')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CAST_TEST_0700
     * @tc.name      testExpressionsCast0007
     * @tc.desc      The cast operator converts the value V of one type (as denoted by the expression)
     *               at runtime to a value of another type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsCast0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = s7 as I1
      expect(t instanceof I1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CAST_TEST_0800
     * @tc.name      testExpressionsCast0008
     * @tc.desc      The cast operator converts the value V of one type (as denoted by the expression)
     *               at runtime to a value of another type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsCast0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B2 = new B2()
      b.fld = "b"

      let a = b as A1
      expect(a instanceof A1).assertTrue()
      expect(a instanceof B2).assertTrue()
      expect(a.fld == "b").assertTrue()

      let o = a as Object
      expect(o instanceof A1).assertTrue()
      expect(o instanceof B2).assertTrue()
      expect(o instanceof Object).assertTrue()

      let a2 = o as A1
      expect(a2 instanceof A1).assertTrue()
      expect(a2 instanceof B2).assertTrue()
      expect(a2.fld == "b").assertTrue()

      let b2 = o as B2
      expect(b2 instanceof A1).assertTrue()
      expect(b2 instanceof B2).assertTrue()
      expect(b2.fld == "b").assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CAST_TEST_0900
     * @tc.name      testExpressionsCast0009
     * @tc.desc      nullable Cast T | null -> T. not-null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsCast0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int | null = new Int(1)
      let b: Int = a as Int
      expect(b).assertEqual(1)
    });
  });
}