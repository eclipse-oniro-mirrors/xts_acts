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

class abrupt_completion_A {
    private _i: int = 42;
    get i(): int {
        if (this._i == 13) {
            throw new Error()
        }
        return this._i
    }
    set i(v: int) { this._i = v }
    get_i(): int { // bypass getter
        return this._i;
    }
}

class bigint_A {
    bi: bigint = 13n
}

class class_fields_A {
    n: number
    d: double
    f: float
    l: long
    i: int
    s: short
    b: byte
}
class class_fields_B {
    private _n: number = 1.0;
    get n(): number { return this._n }
    set n(v: number) { this._n = v }

    private _d: double = 2.0;
    get d(): double { return this._d }
    set d(v: double) { this._d = v }

    private _f: float = 3.0f;
    get f(): float { return this._f }
    set f(v: float) { this._f = v }

    private _l: long = 4;
    get l(): long { return this._l }
    set l(v: long) { this._l = v }

    private _i: int = 5;
    get i(): int { return this._i }
    set i(v: int) { this._i = v }

    private _s: short = 6;
    get s(): short { return this._s }
    set s(v: short) { this._s = v }

    private _b: byte = 7;
    get b(): byte { return this._b }
    set b(v: byte) { this._b = v }
}
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsUnaryPostfix(): void {
  describe("ExpressionsUnaryPostfix", () => {
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
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_0100
     * @tc.name      testExpressionUnaryPostfix0001
     * @tc.desc      Otherwise, the postfix increment expression completes abruptly, and no incrementation
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new abrupt_completion_A
      let check: int = -100
      a.i = 13
      try {
        check = a.i++
      } catch (e) {
        expect(a.get_i()).assertEqual(13)
      }
      expect(a.get_i()).assertEqual(13)
      expect(check).assertEqual(-100)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_0200
     * @tc.name      testExpressionUnaryPostfix0002
     * @tc.desc      The value 1 is added to the value of the variable by using necessary conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = 13n
      let a = new bigint_A
      let ar: bigint[] = [-1n, 1n]

      expect(x++).assertEqual(13n)
      expect(x).assertEqual(14n)

      expect(a.bi++).assertEqual(13n)
      expect(a.bi).assertEqual(14n)

      expect(ar[0]++).assertEqual(-1n)
      expect(ar[0]).assertEqual(0n)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_0300
     * @tc.name      testExpressionUnaryPostfix0003
     * @tc.desc      Postfix increment expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new class_fields_A
      expect(a.n++).assertEqual(0.0)
      expect(a.n).assertEqual(1.0)

      expect(a.d++).assertEqual(0.0)
      expect(a.d).assertEqual(1.0)

      expect(a.f++).assertEqual(0.0f)
      expect(a.f).assertEqual(1.0f)

      expect(a.l++).assertEqual(0)
      expect(a.l).assertEqual(1)

      expect(a.i++).assertEqual(0)
      expect(a.i).assertEqual(1)

      expect(a.s++).assertEqual(0)
      expect(a.s).assertEqual(1)

      expect(a.b++).assertEqual(0)
      expect(a.b).assertEqual(1)
  
      // class field via get/set
      let b = new class_fields_B
      expect(b.n++).assertEqual(1.0)
      expect(b.n).assertEqual(2.0)

      expect(b.d++).assertEqual(2.0)
      expect(b.d).assertEqual(3.0)

      expect(b.f++).assertEqual(3.0f)
      expect(b.f).assertEqual(4.0f)

      expect(b.l++).assertEqual(4)
      expect(b.l).assertEqual(5)

      expect(b.i++).assertEqual(5)
      expect(b.i).assertEqual(6)

      expect(b.s++).assertEqual(6)
      expect(b.s).assertEqual(7)

      expect(b.b++).assertEqual(7)
      expect(b.b).assertEqual(8)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_0400
     * @tc.name      testExpressionUnaryPostfix0004
     * @tc.desc      Postfix increment operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = -3.3;
      expect(n++).assertEqual(-3.3)
      expect(n).assertEqual(-2.3)

      // special values
      n = NaN
      expect(Number.isNaN(n++)).assertTrue()
      expect(Number.isNaN(n)).assertTrue()

      n = +Infinity
      expect(n++).assertEqual(+Infinity)
      expect(n).assertEqual(+Infinity)

      let maxByte: byte = 127
      expect(maxByte++).assertEqual(127)
      expect(maxByte).assertEqual(-128)

      let maxShort: short = 32767
      expect(maxShort++).assertEqual(32767)
      expect(maxShort).assertEqual(-32768)

      let maxInt: int = 2147483647
      expect(maxInt++).assertEqual(2147483647)
      expect(maxInt).assertEqual(-2147483648)

      let maxLong: long = 9223372036854775807
      expect(maxLong++).assertEqual(9223372036854775807)
      expect(maxLong).assertEqual(-9223372036854775808)

      // operator precedence
      let l: long = -13;
      expect(l++).assertEqual(-13)
      expect(l).assertEqual(-12)
      expect(-l++).assertEqual(12)
      expect(+l++).assertEqual(-11)
      expect(l+++l).assertEqual(-10-9)

      let an: number[] = [-1.5, 3.14]
      expect(an[0]++).assertEqual(-1.5)
      expect(an[0]).assertEqual(-0.5)

      let ad: double[] = [-1.5, 3.14]
      expect(ad[0]++).assertEqual(-1.5)
      expect(ad[0]).assertEqual(-0.5)

      let af: float[] = [-1.5f, 3.14f]
      expect(af[0]++).assertEqual(-1.5)
      expect(af[0]).assertEqual(-0.5)

      let al: long[] = [13, -42]
      expect(al[1]++).assertEqual(-42)
      expect(al[1]).assertEqual(-41)

      let ai: int[] = [13, -42]
      expect(ai[1]++).assertEqual(-42)
      expect(ai[1]).assertEqual(-41)

      let sa: short[] = [13, -42]
      expect(sa[1]++).assertEqual(-42)
      expect(sa[1]).assertEqual(-41)

      let ab: byte[] = [13, -42]
      expect(ab[1]++).assertEqual(-42)
      expect(ab[1]).assertEqual(-41)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_0500
     * @tc.name      testExpressionUnaryPostfix0005
     * @tc.desc      Type of a postfix increment expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = 1;
      expect((v++) instanceof byte).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_0600
     * @tc.name      testExpressionUnaryPostfix0006
     * @tc.desc      Type of a postfix increment expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = 654;
      expect((v++) instanceof short).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_0700
     * @tc.name      testExpressionUnaryPostfix0007
     * @tc.desc      Type of a postfix increment expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = -3267;
      expect((v++) instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_0800
     * @tc.name      testExpressionUnaryPostfix0008
     * @tc.desc      Type of a postfix increment expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = 234217;
      expect((v++) instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_0900
     * @tc.name      testExpressionUnaryPostfix0009
     * @tc.desc      Type of a postfix increment expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: float = 1896.2f;
      expect((v++) instanceof float).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_1000
     * @tc.name      testExpressionUnaryPostfix0010
     * @tc.desc      Type of a postfix increment expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: double = -24.5;
      expect((v++) instanceof double).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_POSTFIX_1100
     * @tc.name      testExpressionUnaryPostfix0011
     * @tc.desc      Type of a postfix increment expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionUnaryPostfix0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = 17n;
      expect((v++) instanceof bigint).assertTrue();
    });
  });
}