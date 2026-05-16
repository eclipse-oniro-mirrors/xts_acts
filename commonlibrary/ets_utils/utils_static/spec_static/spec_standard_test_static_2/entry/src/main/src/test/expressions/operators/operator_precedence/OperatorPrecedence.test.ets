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

// 类、接口、函数定义
interface Foo_7 {
  foo (x: int): int
}
class Bar_7 implements Foo_7 {
  intVal?: number
  bar?: Bar_7
  row?: Bar_7[]
  foo(x: int): int {
    return x
  }
  self(): Bar_7 {
    return this;
  }
}
class More_7 extends Bar_7 {}

async function fetchBool_1(val: boolean): Promise<boolean> {
  return val;
}
async function fetchInt_1(i: int): Promise<int> {
  const results = await Promise.all(new Array<int>());
  if (0 == results.length) return i;
  return 100500;
}
class PromiseValue_1 {
  x: number = 42;
}
class PromiseHolder_1 {
  async fetchValue(): Promise<PromiseValue_1> {
    const results = await Promise.all(new Array<PromiseValue_1>());
    if (0 == results.length) return new PromiseValue_1();
    return new PromiseValue_1();
  }
}
interface I_12 {}
class A_12 implements I_12 {}
class B_12 {}
interface I_15 {}
class A_15 implements I_15 {}
class B_15 {}
class IntKeepper_11 {
  x: int = 2;
  y: int = 3;
}
let res = "";
function t1(): boolean { res += "1"; return true; }
function t2(): boolean { res += "2"; return false; }
function t3(): boolean { res += "3"; return true; }
function t4(): boolean { res += "4"; return false; }

function ff(): boolean {
  res += "F";
  return false;
}
function ft(): boolean {
  res += "T";
  return true;
}
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function OperatorPrecedenceTest(): void {
  describe("OperatorPrecedenceTest", () => {
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
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_0100
     * @tc.name      testOperatorPrecedence0001
     * @tc.desc      additive operator with other lower precedence operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: int, t2 = 2, t3 = 3, t4 = 4, t8 = 8, t255  = 255
      // cast
      res = (t2 + t255).toByte()
      expect(res).assertEqual(1)
      res = t255.toByte() + t3
      expect(res).assertEqual(2)
      // shifts
      res = t4 << t3 + t2
      expect(res).assertEqual(128)
      res = - t255 >> t2 + t3
      expect(res).assertEqual(-8)
      res = - t255 >>> t2 + t3
      expect(res).assertEqual(134217720)
      expect(t8 < t4 + t4).assertFalse()
      expect(t255 <= t8 + t4).assertFalse()
      expect(t2 > t2 + t4).assertFalse()
      expect(t4 >= t2 + t4).assertFalse()
      expect(t2 == t2 + t4).assertFalse()
      expect(t8 != t4 + t4).assertFalse()
      // bitwise
      res = t255 & t4 + t8
      expect(res).assertEqual(12)
      res = t3 | t4 + t2
      expect(res).assertEqual(7)
      res = t255 ^ t8 + t2
      expect(res).assertEqual(245)
      res = t3 <= t4 ? t4 : t3 + t4
      expect(res).assertEqual(4)
      res = t4 + t2 > t4 ? t4 : t3
      expect(res).assertEqual(4)
      res = t2 += t4 + t3
      expect(res).assertEqual(9)
      t2 = 2
      res = t2 -= t4 + t3
      expect(res).assertEqual(-5) 
      t2 = 2
      res = t8 *= t2 + t3
      expect(res).assertEqual(40) 
      t8 = 8
      res = t8 /= t2 + t3
      expect(res).assertEqual(1) 
      t8 = 8
      res = t8 %= t2 + t3
      expect(res).assertEqual(3) 
      t8 = 8
      res = t255 &= t2 + t3
      expect(res).assertEqual(5) 
      t255 = 255
      res = t2 |= t3 + t4
      expect(res).assertEqual(7) 
      t2 = 2
      res = t255 ^= t4 + t8
      expect(res).assertEqual(243) 
      t255 = 255
      res = t4 <<= t3 + t2
      expect(res).assertEqual(128) 
      t4 = 4
      res = t255 >>= t2 + t3
      expect(res).assertEqual(7) 
      t255 = 255
      res = t255 >>>= t3 + t2
      expect(res).assertEqual(7) 
      t255 = 255
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_0200
     * @tc.name      testOperatorPrecedence0002
     * @tc.desc      bitwise operators with other operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: int, t2 = 2, t3 = 3, t4 = 4, t7 = 7, t8 = 8, t255 = 255
      // bitwise
      res = t3 | t4 & t8
      expect(res).assertEqual(3)
      res = t3 ^ t4 & t2
      expect(res).assertEqual(3)
      res = t3 | t4 ^ t2
      expect(res).assertEqual(7)
      res = t3 <= t4 ? t7 : t2 & t3
      expect(res).assertEqual(7)
      res = t3 <= t4 ? t7 : t2 ^ t3
      expect(res).assertEqual(7)
      res = t3 <= t4 ? t7 : t2 | t255
      expect(res).assertEqual(7)
      res = t2 += t7 & t3
      expect(res).assertEqual(5)
      t2 = 2
      res = t2 += t7 ^ t3
      expect(res).assertEqual(6)
      t2 = 2
      res = t2 += t7 | t3
      expect(res).assertEqual(9)
      t2 = 2
      res = t2 -= t7 & t3
      expect(res).assertEqual(-1)
      t2 = 2
      res = t2 -= t7 ^ t3
      expect(res).assertEqual(-2)
      t2 = 2
      res = t2 -= t7 | t255
      expect(res).assertEqual(-253)
      t2 = 2
      res = t2 *= t7 & t3
      expect(res).assertEqual(6)
      t2 = 2
      res = t2 *= t7 ^ t3
      expect(res).assertEqual(8)
      t2 = 2
      res = t2 *= t7 | t255
      expect(res).assertEqual(510)
      t2 = 2
      res = t255 /= t7 & t3
      expect(res).assertEqual(85)
      t255 = 255
      res = t255 /= t7 ^ t3
      expect(res).assertEqual(63)
      t255 = 255
      res = t255 /= t7 | t255
      expect(res).assertEqual(1)
      t255 = 255
      res = t255 %= t7 & t3
      expect(res).assertEqual(0)
      t255 = 255
      res = t255 %= t7 ^ t3
      expect(res).assertEqual(3)
      t255 = 255
      res = t255 %= t7 | t255
      expect(res).assertEqual(0)
      t255 = 255
      res = t255 &= t7 & t3
      expect(res).assertEqual(3)
      t255 = 255
      res = t255 &= t7 ^ t255
      expect(res).assertEqual(248)
      t255 = 255
      res = t255 &= t7 | t255
      expect(res).assertEqual(255)
      t255 = 255
      res = t255 ^= t7 & t3
      expect(res).assertEqual(252)
      t255 = 255
      res = t255 ^= t7 ^ t255
      expect(res).assertEqual(7)
      t255 = 255
      res = t255 ^= t7 | t255
      expect(res).assertEqual(0)
      t255 = 255
      res = t255 |= t7 & t3
      expect(res).assertEqual(255)
      t255 = 255
      res = t255 |= t7 ^ t255
      expect(res).assertEqual(255)
      t255 = 255
      res = t255 |= t7 | t255
      expect(res).assertEqual(255)
      t255 = 255
      res = t255 <<= t7 & t3
      expect(res).assertEqual(2040)
      t255 = 255
      res = t255 <<= t7 ^ t255
      expect(res).assertEqual(-16777216)
      t255 = 255
      res = t255 <<= t7 | t255
      expect(res).assertEqual(-2147483648)
      t255 = 255
      res = t255 >>= t7 & t3
      expect(res).assertEqual(31)
      t255 = 255
      res = t255 >>= t2 ^ t7
      expect(res).assertEqual(7)
      t255 = 255
      res = t255 >>= t7 | t7
      expect(res).assertEqual(1)
      t255 = 255
      res = t255 >>>= t7 & t3
      expect(res).assertEqual(31)
      t255 = 255
      res = t255 >>>= t2 ^ t7
      expect(res).assertEqual(7)
      t255 = 255
      res = t255 >>>= t7 | t7
      expect(res).assertEqual(1)
      t255 = 255
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_0300
     * @tc.name      testOperatorPrecedence0003
     * @tc.desc      operators on boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = false, vt = true, vf = false
      // & |
      v = vt | vf & vf
      expect(v).assertTrue()
      v = vt | vt & vf
      expect(v).assertTrue()
      // & ^
      v = vt ^ vf & vf
      expect(v).assertTrue()
      v = vt ^ vt & vf
      expect(v).assertTrue()
      // ^ |
      v = vt | vf ^ vt
      expect(v).assertTrue()
      v = vt | vt ^ vt
      expect(v).assertTrue()
      // & ==
      v = vf & vf == vf
      expect(v).assertFalse()
      v = vf & vt == vf
      expect(v).assertFalse()
      // & !=
      v = vf & vf != vt
      expect(v).assertFalse()
      v = vf & vt != vt
      expect(v).assertFalse()
      // | ==
      v = vt | vf == vf
      expect(v).assertTrue()
      v = vt | vt == vf
      expect(v).assertTrue()
      // | !=
      v = vt | vf != vt
      expect(v).assertTrue()
      v = vt | vt != vt
      expect(v).assertTrue()
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_0400
     * @tc.name      testOperatorPrecedence0004
     * @tc.desc      conditional && and || operators on boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res = ""
      expect(t1() && t2() || t3()).assertTrue()  // TFT
      expect(res).assertEqual("123")
      res = ""
      expect(t1() || t2() && t3()).assertTrue()  // TFT
      expect(res).assertEqual("1")
      res = ""
      expect(t2() || t3() && t4()).assertFalse()  // FTF
      expect(res).assertEqual("234")
      res = ""
      expect(t2() && t3() || t4()).assertFalse()  // FTF
      expect(res).assertEqual("24")
      res = ""
      expect(!t1() && t2() || t3()).assertTrue()  // FFT
      expect(res).assertEqual("13")
      res = ""
      expect(!t1() || t2() && t3()).assertFalse()  // FFT
      expect(res).assertEqual("12")
      res = ""
      expect(!t2() || t3() && t4()).assertTrue()  // TTF
      expect(res).assertEqual("2")
      res = ""
      expect(!t2() && t3() || t4()).assertTrue()  // TTF
      expect(res).assertEqual("23")
      res = ""
      expect(t1() && !t2() || t3()).assertTrue()  // TTT
      expect(res).assertEqual("12")
      res = ""
      expect(t1() || !t2() && t3()).assertTrue()  // TTT
      expect(res).assertEqual("1")
      res = ""
      expect(t2() || !t3() && t4()).assertFalse()  // FFF
      expect(res).assertEqual("23")
      res = ""
      expect(t2() && !t3() || t4()).assertFalse()  // FFF
      expect(res).assertEqual("24")
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_0500
     * @tc.name      testOperatorPrecedence0005
     * @tc.desc      ternary operator on boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = false, vt = true, vf = false
      res = "";
      v = ft() ? ff() ? vt: ft() ? ff() ? vt : ff() ? vt : vf : vf : vf;
      expect(v || res != "TFTFF").assertFalse();
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_0600
     * @tc.name      testOperatorPrecedence0006
     * @tc.desc      cast operator with other lower precedence operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: int, t1 = 1, t2 = 2, t3 = 3, t4 = 4, t255 = 255, t257 = 257, t258 = 258
      // shifts
      res = t255 << t257.toByte()
      expect(res).assertEqual(510)
      res = t257 >> t257.toByte()
      expect(res).assertEqual(128)
      res = - t255 >>> t257.toByte()
      expect(res).assertEqual(2147483520)
      expect(t2 < t258.toByte()).assertFalse()
      expect(t3 <= t258.toByte()).assertFalse()
      expect(t2 > t258.toByte()).assertFalse()
      expect(t1 >= t258.toByte()).assertFalse()
      expect(t1 == t258.toByte()).assertFalse()
      expect(t2 != t258.toByte()).assertFalse()
      // bitwise
      res = t255 & t258.toByte()
      expect(res).assertEqual(2)
      res = t3 | t258.toByte()
      expect(res).assertEqual(3)
      res = t255 ^ t258.toByte()
      expect(res).assertEqual(253)
      res = t3 <= t4 ? t257 : t258.toByte()
      expect(res).assertEqual(257)
      res = t258 += t257.toByte()
      expect(res).assertEqual(259)
      t258 = 258
      res = t258 -= t257.toByte()
      expect(res).assertEqual(257)
      t258 = 258
      res = t258 *= t257.toByte()
      expect(res).assertEqual(258)
      t258 = 258
      res = t258 /= t257.toByte()
      expect(res).assertEqual(258)
      t258 = 258
      res = t255 %= t258.toByte()
      expect(res).assertEqual(1)
      t255 = 255
      res = t255 &= t258.toByte()
      expect(res).assertEqual(2)
      t255 = 255
      res = t3 |= t258.toByte()
      expect(res).assertEqual(3)
      t3 = 3
      res = t255 ^= t258.toByte()
      expect(res).assertEqual(253)
      t255 = 255
      res = t255 <<= t257.toByte()
      expect(res).assertEqual(510)
      t255 = 255
      res = t257 >>= t257.toByte()
      expect(res).assertEqual(128)
      t257 = 257
      res = t255 >>>= t257.toByte()
      expect(res).assertEqual(127)
      t255 = 255
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_0700
     * @tc.name      testOperatorPrecedence0007
     * @tc.desc      chaining operator with other operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Bar_7 = new Bar_7();
      // grouping; member access
      expect(x?.foo(1)).assertEqual(1)
      expect((new Bar_7())?.foo(2)).assertEqual(2)
      expect(x?.self()?.foo(3)).assertEqual(3)
      expect(x.self()?.foo(4)).assertEqual(4)
      expect(x?.self().foo(5)).assertEqual(5)
      expect(x?.intVal).assertEqual(undefined)
      expect(x?.intVal?.toString()).assertEqual(undefined)
      expect(x.self().self().bar?.bar?.foo(1)).assertEqual(undefined)
      expect(x
        ?.self()
        ?.
        self()
        .bar
        ?.bar
        ?.foo(1)).assertEqual(undefined)
      // access - lower precedence
      expect(x?.row?.[0]).assertEqual(undefined)
      expect(x.row?.[0]?.foo(1)).assertEqual(undefined)
      // null coalescing
      expect((x?.bar??null)).assertEqual(null)
      expect((x?.bar??x?.foo(1))).assertEqual(1)
      expect((new Bar_7()?.foo(1)==x?.foo(1))).assertTrue()
      expect((x?.foo(1)!=new Bar_7()?.foo(1))).assertFalse()
      expect((x ?. intVal == new Bar_7() ?. intVal)).assertTrue()
      // cast
      let raised = false;
      try {
        let m = new More_7();
        expect((m ?. bar as Bar_7) instanceof Bar_7).assertFalse()
      } catch (e) {
        expect(e instanceof TypeError).assertFalse()
        raised = true;
      }
      expect(raised).assertTrue()
      // typeof
      expect((typeof x ?. bar)).assertEqual('undefined')
      expect((typeof x ?. self())).assertEqual('object')
      // instanceof
      // 原测试是 x ?. intVal instanceof undefined，修正为检查是否为undefined
      expect(x?.intVal === undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_0800
     * @tc.name      testOperatorPrecedence0008
     * @tc.desc      combined multiple operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = 1, t2 = 2, t3 = 1, t4 = 2, t5 = 1, t6 = 2;
      expect(++t1 + t2++ > t3 % t1 * t6 + t4 | ++t2 / t6-- + ~t1 > t3-- | t3 <= t5 && t3 << t6 / t4 > -t1).assertTrue()
      expect(t6 + t5 + t4 * ~t3 % ++t1 - t6 != t1).assertTrue()
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_0900
     * @tc.name      testOperatorPrecedence0009
     * @tc.desc      division operator with other operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: int, t2 = 2, t3 = 3, t4 = 4, t7 = 7, t8 = 8, t255 = 255, t510 = 510;
      // multiplication
      res = t8 * t3 / t2
      expect(res).assertEqual(12)
      res = t8 % t3 / t2
      expect(res).assertEqual(1)
      res = t2 + t4 / t2
      expect(res).assertEqual(4)
      res = t2 - t8 / t4
      expect(res).assertEqual(0)
      // cast
      res = (t510 / t255).toByte()
      expect(res).assertEqual(2)
      res = t510.toByte() / t255
      expect(res).assertEqual(0)
      // shifts
      res = t4 << t4 / t2
      expect(res).assertEqual(16)
      res = t255 >> t4 / t2
      expect(res).assertEqual(63)
      res = - t255 >>> t8 / t2
      expect(res).assertEqual(268435440)
      expect(t255 < t510 / t2).assertFalse()
      expect(t255 <= t510 / t255).assertFalse()
      expect(t2 > t8 / t4).assertFalse()
      expect(t4 >= t510 / t4).assertFalse()
      expect(t2 == t8 / t2).assertFalse()
      expect(t4 != t8 / t2).assertFalse()
      // bitwise
      res = t3 & t7 / t2
      expect(res).assertEqual(3)
      res = t255 | t7 / t2
      expect(res).assertEqual(255)
      res = t255 ^ t8 / t2
      expect(res).assertEqual(251)
      res = t8 > t2 ? t4 : t8 / t4
      expect(res).assertEqual(4)
      res = t8 / t4 > t2 ? t4 : t8
      expect(res).assertEqual(8)
      res = t2 += t8 / t2
      expect(res).assertEqual(6)
      t2 = 2
      res = t2 -= t4 / t2
      expect(res).assertEqual(0)
      t2 = 2
      res = t8 *= t7 / t2
      expect(res).assertEqual(24)
      t8 = 8
      res = t8 %= t7 / t2
      expect(res).assertEqual(2)
      t8 = 8
      res = t7 &= t255 / t2
      expect(res).assertEqual(7)
      t7 = 7
      res = t2 |= t7 / t4
      expect(res).assertEqual(3)
      t2 = 2
      res = t255 ^= t8 / t4
      expect(res).assertEqual(253)
      t255 = 255
      res = t4 <<= t3 / t2
      expect(res).assertEqual(8)
      t4 = 4
      res = t255 >>= t3 / t2
      expect(res).assertEqual(127)
      t255 = 255
      res = t255 >>>= t3 / t2
      expect(res).assertEqual(127)
      t255 = 255
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_1000
     * @tc.name      testOperatorPrecedence0010
     * @tc.desc      exponentiation operator with other operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0;
      let a: int[] = [2, 3];
      // grouping
      x = (1 + 2)**(2 + 1);
      expect(x).assertEqual(27)
      // member access
      let v = new IntKeepper_11();
      x = v.x ** v.y;
      expect(x).assertEqual(8)
      // index
      x = a[1] ** a[0];
      expect(x).assertEqual(9)
      // pre/post-fix increment and decrement
      x = 1;
      x = ++x ** ++x;
      expect(x).assertEqual(8)
      x = 3;
      x = x-- ** x--;
      expect(x).assertEqual(9)
      // unary -/+
      x = -3;
      x = x ** -x;
      expect(x).assertEqual(-27)
      // ** associativity: right-to-left (4**(3**2))
      x = 4 ** 3 ** 2;
      expect(x).assertEqual(262144)
      // multiplication has lower precedence
      x = 2 * 3**2;
      expect(x).assertEqual(18)
      x = 11+3**2-19;
      expect(x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_1100
     * @tc.name      testOperatorPrecedence0011
     * @tc.desc      instanceof operator with other lower precedence operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_12 = new A_12();
      let b: B_12 = new B_12();
      let i: I_12 = a;
      let an: A_12|null = null;
      let res: boolean = a instanceof A_12 == i instanceof A_12
      expect(res).assertTrue()
      res = a instanceof A_12 != b instanceof A_12
      expect(res).assertTrue()
      res = i instanceof A_12 ? b instanceof A_12 : b instanceof B_12
      expect(res).assertFalse()
      res = i instanceof B_12 ? b instanceof A_12 : b instanceof B_12
      expect(res).assertTrue()
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_1200
     * @tc.name      testOperatorPrecedence0012
     * @tc.desc      remainder operator with other operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: int, t2 = 2, t3 = 3, t4 = 4, t7 = 7, t8 = 8, t255 = 255, t518 = 518;
      // multiplication
      res = t3 * t7 % t3
      expect(res).assertEqual(0)
      res = t8 / t3 % t2
      expect(res).assertEqual(0)
      res = t2 + t7 % t2
      expect(res).assertEqual(3)
      res = t8 - t7 % t4
      expect(res).assertEqual(5)
      res = (t518 % t255).toByte()
      expect(res).assertEqual(8)
      // cast
      res = t518.toByte() % t255
      expect(res).assertEqual(6)
      // shifts
      res = t4 << t3 % t2
      expect(res).assertEqual(8)
      res = t255 >> t3 % t2
      expect(res).assertEqual(127)
      res = - t255 >>> t7 % t4
      expect(res).assertEqual(536870880)
      expect(t8 < t518 % t255).assertFalse()
      expect(t255 <= t518 % t255).assertFalse()
      expect(t3 > t7 % t4).assertFalse()
      expect(t2 >= t7 % t4).assertFalse()
      expect(t4 == t8 % t3).assertFalse()
      expect(t2 != t8 % t3).assertFalse()
      // bitwise
      res = t7 & t255 % t7
      expect(res).assertEqual(3)
      res = t8 | t3 % t2
      expect(res).assertEqual(9)
      res = t255 ^ t7 % t2
      expect(res).assertEqual(254)
      res = t8 > t2 ? t4 : t8 % t4
      expect(res).assertEqual(4)
      res = t7 % t4 > t2 ? t2 : t8
      expect(res).assertEqual(2)
      res = t2 += t7 % t3
      expect(res).assertEqual(3)
      t2 = 2
      res = t2 -= t7 % t3
      expect(res).assertEqual(1)
      t2 = 2
      res = t8 *= t7 % t3
      expect(res).assertEqual(8)
      t8 = 8
      res = t8 /= t7 % t2
      expect(res).assertEqual(8)
      t8 = 8
      res = t3 &= t7 % t3
      expect(res).assertEqual(1)
      t3 = 3
      res = t2 |= t7 % t3
      expect(res).assertEqual(3)
      t2 = 2
      res = t255 ^= t7 % t4
      expect(res).assertEqual(252)
      t255 = 255
      res = t4 <<= t3 % t2
      expect(res).assertEqual(8)
      t4 = 4
      res = t255 >>= t3 % t2
      expect(res).assertEqual(127)
      t255 = 255
      res = t255 >>>= t3 % t2
      expect(res).assertEqual(127)
      t255 = 255
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_1300
     * @tc.name      testOperatorPrecedence0013
     * @tc.desc      multiplicative operator with other operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: int, t2 = 2, t3 = 3, t4 = 4, t8 = 8, t255 = 255
      res = t8 / t3 * t2
      expect(res).assertEqual(4)
      res = t8 % t3 * t2
      expect(res).assertEqual(4)
      res = t2 + t4 * t3
      expect(res).assertEqual(14)
      res = t2 - t3 * t4
      expect(res).assertEqual(-10)
      // cast
      res = t2 * t255.toByte()
      expect(res).assertEqual(-2)
      res = t255.toByte() * t3
      expect(res).assertEqual(-3)
      // shifts
      res = t4 << t3 * t2
      expect(res).assertEqual(256)
      res = - t255 >> t2 * t3
      expect(res).assertEqual(-4)
      res = - t255 >>> t2 * t3
      expect(res).assertEqual(67108860)
      expect(t255 < t8 * t8).assertFalse()
      expect(t255 <= t2 * t8).assertFalse()
      expect(t2 > t8 * t4).assertFalse()
      expect(t4 >= t8 * t4).assertFalse()
      expect(t2 == t2 * t4).assertFalse()
      expect(t8 != t4 * t2).assertFalse()
      // bitwise
      res = t255 & t4 * t8
      expect(res).assertEqual(32)
      res = t3 | t4 * t2
      expect(res).assertEqual(11)
      res = t255 ^ t8 * t2
      expect(res).assertEqual(239)
      res = t3 <= t4 ? t4 : t3 * t4
      expect(res).assertEqual(4)
      res = t4 * t2 > t4 ? t4 : t3
      expect(res).assertEqual(4)
      res = t2 += t4 * t3
      expect(res).assertEqual(14)
      t2 = 2
      res = t2 -= t4 * t3
      expect(res).assertEqual(-10)
      t2 = 2
      res = t8 /= t2 * t3
      expect(res).assertEqual(1)
      t8 = 8
      res = t8 %= t2 * t3
      expect(res).assertEqual(2)
      t8 = 8
      res = t255 &= t2 * t3
      expect(res).assertEqual(6)
      t255 = 255
      res = t2 |= t3 * t4
      expect(res).assertEqual(14)
      t2 = 2
      res = t255 ^= t4 * t8
      expect(res).assertEqual(223)
      t255 = 255
      res = t4 <<= t3 * t2
      expect(res).assertEqual(256)
      t4 = 4
      res = t255 >>= t2 * t3
      expect(res).assertEqual(3)
      t255 = 255
      res = t255 >>>= t3 * t2
      expect(res).assertEqual(3)
      t255 = 255
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_1400
     * @tc.name      testOperatorPrecedence0014
     * @tc.desc      null-coalescing operator with other lower precedence operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_15 = new A_15();
      let b: B_15 = new B_15();
      let i: I_15 = a;
      let an: A_15|null = null;
      let bn: B_15|null = null;
      let res: boolean = ((an ?? a) instanceof I_15 ? bn ?? b : an ?? a) === b
      expect(res).assertTrue()
      res = ((a ?? an) instanceof B_15 ? an ?? a : bn ?? b) === b
      expect(res).assertTrue()
      let x: Object = bn ?? a
      expect(x).assertEqual(a)
      let y: Object = an ?? b
      expect(y).assertEqual(b)
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_1500
     * @tc.name      testOperatorPrecedence0015
     * @tc.desc      postfix operators with other lower precedence operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: int, t2 = 2, t3 = 3, t4 = 4, t8 = 8, t255 = 255
      res = + t2++
      expect(res).assertEqual(2)
      expect(t2).assertEqual(3)
      t2 = 2
      res = + t2--
      expect(res).assertEqual(2)
      expect(t2).assertEqual(1)
      t2 = 2
      res = - t2++
      expect(res).assertEqual(-2)
      expect(t2).assertEqual(3)
      t2 = 2
      res = - t2--
      expect(res).assertEqual(-2)
      expect(t2).assertEqual(1)
      t2 = 2
      res = ~ t2++
      expect(res).assertEqual(-3)
      expect(t2).assertEqual(3)
      t2 = 2
      res = ~ t2--
      expect(res).assertEqual(-3)
      expect(t2).assertEqual(1)
      t2 = 2
      res = t4-- * t2++
      expect(res).assertEqual(8)
      expect(t2).assertEqual(3)
      expect(t4).assertEqual(3)
      t2 = 2
      t4 = 4
      res = t4++ * t2--
      expect(res).assertEqual(8)
      expect(t2).assertEqual(1)
      expect(t4).assertEqual(5)
      t2 = 2
      t4 = 4
      res = t4-- / t2++
      expect(res).assertEqual(2)
      expect(t2).assertEqual(3)
      expect(t4).assertEqual(3)
      t2 = 2
      t4 = 4
      res = t4++ / t2--
      expect(res).assertEqual(2)
      expect(t2).assertEqual(1)
      expect(t4).assertEqual(5)
      t2 = 2
      t4 = 4
      res = t255-- % t4++
      expect(res).assertEqual(3)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255++ % t4--
      expect(res).assertEqual(3)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255-- + t4++
      expect(res).assertEqual(259)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255++ + t4--
      expect(res).assertEqual(259)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255-- - t4++
      expect(res).assertEqual(251)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255++ - t4--
      expect(res).assertEqual(251)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = (t255--).toByte() - (t4++).toByte()
      expect(res).assertEqual(-5)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = (t255++).toByte() - (t4--).toByte()
      expect(res).assertEqual(-5)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255-- << t4++
      expect(res).assertEqual(4080)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255++ << t4--
      expect(res).assertEqual(4080)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255-- >> t4++
      expect(res).assertEqual(15)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255++ >> t4--
      expect(res).assertEqual(15)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = - t255-- >>> t4++
      expect(res).assertEqual(268435440)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = - t255++ >>> t4--
      expect(res).assertEqual(268435440)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      expect(t3-- < t2++).assertFalse()
      t3 = 3
      t2 = 2
      expect(t8-- <= t4++).assertFalse()
      t8 = 8
      t4 = 4
      expect(t2++ > t3--).assertFalse()
      t3 = 3
      t2 = 2
      expect(t4++ >= t8--).assertFalse()
      t8 = 8
      t4 = 4
      expect(t3-- == t2).assertFalse()
      t3 = 3
      expect(t3++ == t4).assertFalse()
      t3 = 3
      expect(t3-- != 3).assertFalse()
      t3 = 3
      expect(t3++ != 3).assertFalse()
      t3 = 3
      res = t255-- & t4++
      expect(res).assertEqual(4)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255++ & t4--
      expect(res).assertEqual(4)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255-- | t4++
      expect(res).assertEqual(255)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255++ | t4--
      expect(res).assertEqual(255)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255-- ^ t4++
      expect(res).assertEqual(251)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255++ ^ t4--
      expect(res).assertEqual(251)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t8 > t4 ? t255-- : t4++
      expect(res).assertEqual(255)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(4)
      t255 = 255
      res = t8 > t4 ? t4-- : t255++
      expect(res).assertEqual(4)
      expect(t255).assertEqual(255)
      expect(t4).assertEqual(3)
      t4 = 4
      res = t255 = t3--
      expect(res).assertEqual(3)
      expect(t255).assertEqual(3)
      expect(t3).assertEqual(2)
      t255 = 255
      t3 = 3
      res = t255 = t3++
      expect(res).assertEqual(3)
      expect(t255).assertEqual(3)
      expect(t3).assertEqual(4)
      t255 = 255
      t3 = 3
      res = t255 += t3--
      expect(res).assertEqual(258)
      expect(t255).assertEqual(258)
      expect(t3).assertEqual(2)
      t255 = 255
      t3 = 3
      res = t255 += t3++
      expect(res).assertEqual(258)
      expect(t255).assertEqual(258)
      expect(t3).assertEqual(4)
      t255 = 255
      t3 = 3
      res = t255 -= t3--
      expect(res).assertEqual(252)
      expect(t255).assertEqual(252)
      expect(t3).assertEqual(2)
      t255 = 255
      t3 = 3
      res = t255 -= t3++
      expect(res).assertEqual(252)
      expect(t255).assertEqual(252)
      expect(t3).assertEqual(4)
      t255 = 255
      t3 = 3
      res = t255 *= t3--
      expect(res).assertEqual(765)
      expect(t255).assertEqual(765)
      expect(t3).assertEqual(2)
      t255 = 255
      t3 = 3
      res = t255 *= t3++
      expect(res).assertEqual(765)
      expect(t255).assertEqual(765)
      expect(t3).assertEqual(4)
      t255 = 255
      t3 = 3
      res = t255 /= t3--
      expect(res).assertEqual(85)
      expect(t255).assertEqual(85)
      expect(t3).assertEqual(2)
      t255 = 255
      t3 = 3
      res = t255 /= t3++
      expect(res).assertEqual(85)
      expect(t255).assertEqual(85)
      expect(t3).assertEqual(4)
      t255 = 255
      t3 = 3
      res = t255 %= t4--
      expect(res).assertEqual(3)
      expect(t255).assertEqual(3)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 %= t4++
      expect(res).assertEqual(3)
      expect(t255).assertEqual(3)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255 <<= t4--
      expect(res).assertEqual(4080)
      expect(t255).assertEqual(4080)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 <<= t4++
      expect(res).assertEqual(4080)
      expect(t255).assertEqual(4080)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255 >>= t4--
      expect(res).assertEqual(15)
      expect(t255).assertEqual(15)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 >>= t4++
      expect(res).assertEqual(15)
      expect(t255).assertEqual(15)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255 >>>= t4--
      expect(res).assertEqual(15)
      expect(t255).assertEqual(15)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 >>>= t4++
      expect(res).assertEqual(15)
      expect(t255).assertEqual(15)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255 &= t4--
      expect(res).assertEqual(4)
      expect(t255).assertEqual(4)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 &= t4++
      expect(res).assertEqual(4)
      expect(t255).assertEqual(4)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255 |= t4--
      expect(res).assertEqual(255)
      expect(t255).assertEqual(255)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 |= t4++
      expect(res).assertEqual(255)
      expect(t255).assertEqual(255)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255 ^= t4--
      expect(res).assertEqual(251)
      expect(t255).assertEqual(251)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 ^= t4++
      expect(res).assertEqual(251)
      expect(t255).assertEqual(251)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
    })

    /**
     * @tc.number    SUB_OPERATOR_PRECEDENCE_TEST_1600
     * @tc.name      testOperatorPrecedence0016
     * @tc.desc      prefix operators with other lower precedence operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOperatorPrecedence0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: int, t2 = 2, t3 = 3, t4 = 4, t8 = 8, t255 = 255
      res = + ++t2
      expect(res).assertEqual(3)
      expect(t2).assertEqual(3)
      t2 = 2
      res = + --t2
      expect(res).assertEqual(1)
      expect(t2).assertEqual(1)
      t2 = 2
      res = - ++t2
      expect(res).assertEqual(-3)
      expect(t2).assertEqual(3)
      t2 = 2
      res = - --t2
      expect(res).assertEqual(-1)
      expect(t2).assertEqual(1)
      t2 = 2
      res = ~ ++t2
      expect(res).assertEqual(-4)
      expect(t2).assertEqual(3)
      t2 = 2
      res = ~ --t2
      expect(res).assertEqual(-2)
      expect(t2).assertEqual(1)
      t2 = 2
      res = --t4 * ++t2
      expect(res).assertEqual(9)
      expect(t2).assertEqual(3)
      expect(t4).assertEqual(3)
      t2 = 2
      t4 = 4
      res = ++t4 * --t2
      expect(res).assertEqual(5)
      expect(t2).assertEqual(1)
      expect(t4).assertEqual(5)
      t2 = 2
      t4 = 4
      res = --t4 / ++t2
      expect(res).assertEqual(1)
      expect(t2).assertEqual(3)
      expect(t4).assertEqual(3)
      t2 = 2
      t4 = 4
      res = ++t4 / --t2
      expect(res).assertEqual(5)
      expect(t2).assertEqual(1)
      expect(t4).assertEqual(5)
      t2 = 2
      t4 = 4
      res = --t255 % ++t4
      expect(res).assertEqual(4)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = ++t255 % --t4
      expect(res).assertEqual(1)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = --t255 + ++t4
      expect(res).assertEqual(259)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = ++t255 + --t4
      expect(res).assertEqual(259)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = --t255 - ++t4
      expect(res).assertEqual(249)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = ++t255 - --t4
      expect(res).assertEqual(253)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = (--t255).toByte() - (++t4).toByte()
      expect(res).assertEqual(-7)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = (++t255).toByte() - (--t4).toByte()
      expect(res).assertEqual(-3)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = --t255 << ++t4
      expect(res).assertEqual(8128)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = ++t255 << --t4
      expect(res).assertEqual(2048)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = --t255 >> ++t4
      expect(res).assertEqual(7)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = ++t255 >> --t4
      expect(res).assertEqual(32)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = - --t255 >>> ++t4
      expect(res).assertEqual(134217720)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = - ++t255 >>> --t4
      expect(res).assertEqual(536870880)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      expect(--t4 < ++t2).assertFalse()
      t4 = 4
      t2 = 2
      expect(--t8 <= ++t4).assertFalse()
      t8 = 8
      t4 = 4
      expect(++t2 > --t4).assertFalse()
      t4 = 4
      t2 = 2
      expect(++t4 >= --t8).assertFalse()
      t8 = 8
      t4 = 4
      expect(--t3 == 3).assertFalse()
      t3 = 3
      expect(++t3 == 3).assertFalse()
      t3 = 3
      expect(--t3 == 2).assertTrue()
      t3 = 3
      expect(++t3 == 4).assertTrue()
      t3 = 3
      res = --t255 & ++t4
      expect(res).assertEqual(4)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = ++t255 & --t8
      expect(res).assertEqual(0)
      expect(t255).assertEqual(256)
      expect(t8).assertEqual(7)
      t255 = 255
      t8 = 8
      res = --t255 | ++t4
      expect(res).assertEqual(255)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = ++t255 | --t4
      expect(res).assertEqual(259)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = --t255 ^ ++t4
      expect(res).assertEqual(251)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = ++t255 ^ --t4
      expect(res).assertEqual(259)
      expect(t255).assertEqual(256)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t8 > t4 ? --t255 : ++t4
      expect(res).assertEqual(254)
      expect(t255).assertEqual(254)
      expect(t4).assertEqual(4)
      t255 = 255
      res = t8 > t4 ? --t4 : ++t255
      expect(res).assertEqual(3)
      expect(t255).assertEqual(255)
      expect(t4).assertEqual(3)
      t4 = 4
      res = t255 = --t3
      expect(res).assertEqual(2)
      expect(t255).assertEqual(2)
      expect(t3).assertEqual(2)
      t255 = 255
      t3 = 3
      res = t255 = ++t3
      expect(res).assertEqual(4)
      expect(t255).assertEqual(4)
      expect(t3).assertEqual(4)
      t255 = 255
      t3 = 3
      res = t255 += --t3
      expect(res).assertEqual(257)
      expect(t255).assertEqual(257)
      expect(t3).assertEqual(2)
      t255 = 255
      t3 = 3
      res = t255 += ++t3
      expect(res).assertEqual(259)
      expect(t255).assertEqual(259)
      expect(t3).assertEqual(4)
      t255 = 255
      t3 = 3
      res = t255 -= --t3
      expect(res).assertEqual(253)
      expect(t255).assertEqual(253)
      expect(t3).assertEqual(2)
      t255 = 255
      t3 = 3
      res = t255 -= ++t3
      expect(res).assertEqual(251)
      expect(t255).assertEqual(251)
      expect(t3).assertEqual(4)
      t255 = 255
      t3 = 3
      res = t255 *= --t3
      expect(res).assertEqual(510)
      expect(t255).assertEqual(510)
      expect(t3).assertEqual(2)
      t255 = 255
      t3 = 3
      res = t255 *= ++t3
      expect(res).assertEqual(1020)
      expect(t255).assertEqual(1020)
      expect(t3).assertEqual(4)
      t255 = 255
      t3 = 3
      res = t255 /= --t3
      expect(res).assertEqual(127)
      expect(t255).assertEqual(127)
      expect(t3).assertEqual(2)
      t255 = 255
      t3 = 3
      res = t255 /= ++t3
      expect(res).assertEqual(63)
      expect(t255).assertEqual(63)
      expect(t3).assertEqual(4)
      t255 = 255
      t3 = 3
      res = t255 %= --t4
      expect(res).assertEqual(0)
      expect(t255).assertEqual(0)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 %= ++t8
      expect(res).assertEqual(3)
      expect(t255).assertEqual(3)
      expect(t8).assertEqual(9)
      t255 = 255
      t8 = 8
      res = t255 <<= --t4
      expect(res).assertEqual(2040)
      expect(t255).assertEqual(2040)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 <<= ++t4
      expect(res).assertEqual(8160)
      expect(t255).assertEqual(8160)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255 >>= --t4
      expect(res).assertEqual(31)
      expect(t255).assertEqual(31)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 >>= ++t4
      expect(res).assertEqual(7)
      expect(t255).assertEqual(7)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255 >>>= --t4
      expect(res).assertEqual(31)
      expect(t255).assertEqual(31)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 >>>= ++t4
      expect(res).assertEqual(7)
      expect(t255).assertEqual(7)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255 &= --t4
      expect(res).assertEqual(3)
      expect(t255).assertEqual(3)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 &= ++t4
      expect(res).assertEqual(5)
      expect(t255).assertEqual(5)
      expect(t4).assertEqual(5)
      t255 = 255
      t4 = 4
      res = t255 |= --t4
      expect(res).assertEqual(255)
      expect(t255).assertEqual(255)
      expect(t4).assertEqual(3)
      t255 = 255
      t4 = 4
      res = t255 |= ++t4
      expect(res).assertEqual(255)
      expect(t255).assertEqual(255)
      expect(t4).assertEqual(5)
    });
  })
}