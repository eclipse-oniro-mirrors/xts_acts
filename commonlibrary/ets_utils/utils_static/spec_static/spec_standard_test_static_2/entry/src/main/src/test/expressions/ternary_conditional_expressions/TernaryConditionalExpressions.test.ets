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

interface IEcho {
  echo(): string;
}

final class A {}
final class B {}

class ABase {}
class BExt extends ABase {}
class CExt extends ABase {}
class DExt extends BExt {}
class BA extends ABase {}
class CBA extends BA {}
class DA extends ABase {}

final class Menu {}
final class MenuProvider {
  menuList?: Array<Menu>;
}

final class View {
  menu: Array<Menu>;
  constructor(mp: MenuProvider) {
    this.menu = mp.menuList == undefined ? [] : mp.menuList!;
  }
}

class Order {
  order: number = 0;
}

function f1(): number { return 1; }
function f2(): number { return 2; }
function f3(): number { return 3; }

function foo(p: ABase|BA|Object): number {
  if (p instanceof BA) return 3;
  if (p instanceof ABase) return 2;
  return 1;
}

function op1(order: Order): void { order.order++; }
function op2(order: Order): void { order.order++; }

function build(isEmpty: boolean = true): MenuProvider {
  let mp = new MenuProvider();
  if (isEmpty) return mp;
  mp.menuList = [new Menu(), new Menu()];
  return mp;
}

function check(): boolean { return true; }

final class EchoA implements IEcho {
  echo(): string { return "Hello World"; }
}

final class EchoB implements IEcho {
  echo(): string { return "Hello World"; }
}

final class C {
  static echo(): IEcho { return new EchoB(); }
}

type BRF = (input: boolean) => boolean;
type LF = (flag: boolean, order: Order) => boolean;

const bo: BRF = (input: boolean) => input;

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function TernaryConditionalExpressions(): void {
  describe("TernaryConditionalExpressions", () => {
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
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_0100
     * @tc.name      testTernaryConditionalExpressions0001
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_1 = true ? 0 : 1;
      expect(a_1).assertEqual(0);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_0200
     * @tc.name      testTernaryConditionalExpressions0002
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_2 = Boolean(true) ? 0 : 1;
      expect(a_2).assertEqual(0);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_0300
     * @tc.name      testTernaryConditionalExpressions0003
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y_3: number[] = [0, 1, 2];
      let z_3: number[] = [0, 2, 4];
      let x_3: number[] = true ? y_3 : z_3;
      expect(x_3).assertEqual(y_3);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_0400
     * @tc.name      testTernaryConditionalExpressions0004
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond_4 = false;
      let a_4 = cond_4 ? f1() : cond_4 ? f2() : cond_4 ? f3() : 0;
      expect(a_4).assertEqual(0);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_0500
     * @tc.name      testTernaryConditionalExpressions0005
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(false ? 1 : 2).assertEqual(2);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_0600
     * @tc.name      testTernaryConditionalExpressions0006
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bf: BRF = (input: boolean) => input;
      let a_6: number = 5;
      let x_6 = bf(true) ? a_6 : new B();
      expect(x_6).assertEqual(a_6);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_0700
     * @tc.name      testTernaryConditionalExpressions0007
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_7: ABase = new ABase();
      let b_7: BExt = new BExt();
      let x_7 = true ? a_7 : b_7;
      expect(x_7 instanceof ABase).assertTrue();
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_0800
     * @tc.name      testTernaryConditionalExpressions0008
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_8: ABase = new ABase();
      let b_8: BExt = new BExt();
      let x_8 = bo(false) ? a_8 : b_8;
      expect(x_8 instanceof ABase).assertTrue();
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_0900
     * @tc.name      testTernaryConditionalExpressions0009
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c_9: CExt = new CExt();
      let b_9: BExt = new BExt();
      let x_9 = false ? b_9 : c_9;
      expect(x_9 instanceof ABase).assertTrue();
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_1000
     * @tc.name      testTernaryConditionalExpressions0010
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_10: ABase = new ABase();
      let d_10: DExt = new DExt();
      let x_10 = bo(false) ? a_10 : d_10;
      expect(x_10 instanceof ABase).assertTrue();
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_1100
     * @tc.name      testTernaryConditionalExpressions0011
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_11: ABase = new ABase();
      let d_11: DExt = new DExt();
      let x_11 = false ? a_11 : d_11;
      expect(x_11 instanceof ABase).assertTrue();
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_1200
     * @tc.name      testTernaryConditionalExpressions0012
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_12: ABase = new ABase();
      let b_12: ABase = new ABase();
      let c_12 = bo(true) ? a_12 : b_12;
      expect(foo(c_12)).assertEqual(2);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_1300
     * @tc.name      testTernaryConditionalExpressions0013
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_13: ABase = new ABase();
      let b_13: number = 2;
      let c_13 = bo(true) ? a_13 : b_13;
      expect(foo(c_13)).assertEqual(2);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_1400
     * @tc.name      testTernaryConditionalExpressions0014
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: CBA = new CBA();
      let b: DA = new DA();
      let d: ABase = new ABase();
      let f: BA = new BA();

      let c_14 = check() ? a : b;
      let e_14 = check() ? a : d;
      let g_14 = check() ? a : f;
      expect(foo(c_14)).assertEqual(3);
      expect(foo(e_14)).assertEqual(3);
      expect(foo(g_14)).assertEqual(3);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_1500
     * @tc.name      testTernaryConditionalExpressions0015
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x_15 = bo(true) ? new EchoA() : bo(false) ? C.echo() : new EchoB();
      expect(x_15 instanceof EchoA).assertTrue();
      expect(x_15.echo()).assertEqual('Hello World');
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_1600
     * @tc.name      testTernaryConditionalExpressions0016
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond_16 = false;
      let a_16 = cond_16 ? 1 : cond_16 ? 2 : cond_16 ? 3 : 0;
      let b_16 = cond_16 ? 1 : (cond_16 ? 2 : (cond_16 ? 3 : 0));
      expect(a_16).assertEqual(b_16);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_1700
     * @tc.name      testTernaryConditionalExpressions0017
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o0_17 = new Order();
      let o1_17 = new Order();
      let o2_17 = new Order();
      const op0: LF = (flag: boolean, order: Order) => { order.order++; return flag; };

      op0(false, o0_17) ? op1(o1_17) : op2(o2_17);
      expect(o0_17.order).assertEqual(1);
      expect(o1_17.order).assertEqual(0);
      expect(o2_17.order).assertEqual(1);

      o0_17 = new Order();
      o1_17 = new Order();
      o2_17 = new Order();
      op0(true, o0_17) ? op1(o1_17) : op2(o2_17);
      expect(o0_17.order).assertEqual(1);
      expect(o1_17.order).assertEqual(1);
      expect(o2_17.order).assertEqual(0);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_1800
     * @tc.name      testTernaryConditionalExpressions0018
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x_18: string = true ? "Hello" : "World";
      expect(x_18).assertEqual("Hello");
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_1900
     * @tc.name      testTernaryConditionalExpressions0019
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: View = new View(build());
      expect(view.menu.length).assertEqual(0);
      view = new View(build(false));
      expect(view.menu.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_2000
     * @tc.name      testTernaryConditionalExpressions0020
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x_20: number = true ? 10 : 20;
      expect(x_20).assertEqual(10);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_2100
     * @tc.name      testTernaryConditionalExpressions0021
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x_21: number = false ? 10 : 20;
      expect(x_21).assertEqual(20);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_2200
     * @tc.name      testTernaryConditionalExpressions0022
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x_22 = true ? 10 : 20;
      expect(x_22).assertEqual(10);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_2300
     * @tc.name      testTernaryConditionalExpressions0023
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x_23 = true ? 10 : 20;
      expect(x_23).assertEqual(10);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_2400
     * @tc.name      testTernaryConditionalExpressions0024
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x_24 = true ? 10 : 5;
      expect(x_24 + 5).assertEqual(15);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_2500
     * @tc.name      testTernaryConditionalExpressions0025
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x_25 = true ? 10 : 5;
      expect(x_25).assertEqual(10);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_2600
     * @tc.name      testTernaryConditionalExpressions0026
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x_26 = true ? 10 : 5;
      expect(x_26).assertEqual(10);
    })

    /**
     * @tc.number    SUB_TERNARY_CONDITIONAL_EXPRESSIONS_2700
     * @tc.name      testTernaryConditionalExpressions0027
     * @tc.desc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTernaryConditionalExpressions0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x_27 = true ? 10 : 20;
      expect(x_27).assertEqual(10);
    })
  })
}