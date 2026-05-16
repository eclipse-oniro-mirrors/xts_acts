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

let a_0: boolean[] = [true, true, true, true, true, true];
let a_1: number[] = [];
let a_2: number[][] = [];
let a_3: number[] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
let a_4: boolean[] = [];
let a_5: number[] = [];
let a_6: number[] = [];
let a_7: number[][] = [];
let a_8: string[] = [];
let a_9: string[] = ['','','','','','','','','','','','','','',''];
let a_11: string[][] = [];
let a_12: bigint[] = [];
let a_13: bigint[][] = [];
let a_15: A_15<number>[] = [];
let a_17: Color_18[] = [];
let a_18: Color_18[][] = [];
let a_19: F_19[] = [];
let a_20: F_20[][] = [];
let a_21: (null|undefined|Object)[] = [];
let a_22: number[] = [0];
let a_23: (boolean|number|string|null)[] = [];
let a_24: (boolean|number|string|null)[][] = [];
let a_27: number[]|string[]|boolean[]|null = null;
let a_28: number[]|string[]|boolean[]|null = null;
let a_29: number[]|string[]|boolean[]|null = null;
let a_30: (Color_18|Size_30)[] = [];
let u_21: undefined = undefined;
let o_21: Object = {};

class A_15<T> {}
let v_15 = new A_15<number>();
let q_15 = new A_15<number>();

enum Color_18 { Red, Green, Blue }
enum Size_30 { S, M, L, XL }

type F_19 = (p: Color_18) => number;
type F_20 = (p: Color_18) => number;

function sum_22(p: number[]): number {
  let s: number = 0;
  for (let v of p)
    s += v;
  return s;
}

let arr3_a_0: boolean[] = [true, true, true, true, true, true];
let arr3_a_1: number[] = [];
let arr3_a_2: number[][] = [];
let arr3_a_3: number[] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,];
let arr3_a_4: boolean[] = [];
let arr3_a_5: number[] = [];
let arr3_a_6: number[] = [];
let arr3_a_7: number[][] = [];
let arr3_a_8: string[] = [];
let arr3_a_9: string[] = ['','','','','','','','','','','','','','','',];
let arr3_a_11: string[][] = [];
let arr3_a_12: bigint[] = [];
let arr3_a_31: number[]|string[]|boolean[]|null = null;

function arr3_sum_23(p: number[]): number {
  let s: number = 0;
  for (let v of p)
    s += v;
  return s;
}

function arr3_sum_24(p: number[]): number {
  let s: number = 0;
  for (let v of p) {
    expect(typeof v === 'number').assertTrue();
    s += v;
  }
  return s;
}

function arr3_sum_25(p: number[]): number {
  let s: number = 0;
  for (let v of p)
    s += v;
  return s;
}

function foo_0(a: boolean[]): void {
  expect(a[0]).assertFalse();
  expect(a[1]).assertTrue();
  expect(a[2]).assertTrue();
  expect(a.length).assertEqual(3);
}

function foo_3(a: number[]): void {
  expect(Number.isNaN(a[0])).assertTrue();
  expect(a[3]).assertEqual(1.7976931348623157e+308);
  expect(a.length).assertEqual(4);
}

function foo_6(a: number[]): void {
  expect(a[3]).assertEqual(-9223372036854775808);
  expect(a.length).assertEqual(4);
}

function foo_7(a: string[]): void {
  expect(a[3]).assertEqual('-9223372036854775808');
  expect(a.length).assertEqual(4);
}

function foo_8(a: string[]): void {
  expect(a[0]).assertEqual('x');
  expect(a[1]).assertEqual('x1');
  expect(a[2]).assertEqual('x2');
  expect(a[3]).assertEqual('x3');
  expect(a.length).assertEqual(4);
}

function foo_11(a: bigint[]): void {
  expect(a[1]).assertEqual(2n);
  expect(a[2]).assertEqual(33333333333333333333333333333333333333333333333333n);
  expect(a.length).assertEqual(3);
}

class A_13 {}
function foo_13(a: A_13[]): void {
  expect(a[0] instanceof A_13).assertTrue();
  expect(a.length).assertEqual(1);
}

class A_14<T> {}
let v_14 = new A_14<number>();
let q_14 = new A_14<number>();
function foo_14<T>(a: A_14<T>[]): void {
  expect(a[0]).assertEqual(v_14);
  expect(a[1]).assertEqual(q_14);
  expect(a.length).assertEqual(2);
}

function foo_16(a: Array<[string, number, boolean, bigint]>): void {
  expect(a[0][0]).assertEqual("a");
  expect(a[0][1]).assertEqual(1);
  expect(a[0][2]).assertTrue();
  expect(a[0][3]).assertEqual(2n);
  expect(a.length).assertEqual(1);
}

class A_18 {
  foo(p: Object[]): number {
    let s = p.length;
    for (let v of p) {
      s += v instanceof A_18 ? 1 : 0;
    }
    return s;
  }
}

function foo_19(a: Color_18[]): void {
  expect(a[0]).assertEqual(Color_18.Red);
  expect(a[1]).assertEqual(Color_18.Blue);
  expect(a.length).assertEqual(2);
}

function foo_20(a: Color_18[][]): void {
  expect(a[0][0]).assertEqual(Color_18.Red);
  expect(a[0][1]).assertEqual(Color_18.Blue);
  expect(a.length).assertEqual(1);
}
let u_23: undefined = undefined;
let o_23: Object = {};
function foo_23(a: (null|undefined|Object)[]): void {
  expect(a[0]).assertEqual(null);
  expect(a[1] as Object).assertEqual(o_23);
  expect(a[2] as Object).assertEqual(o_23);
  expect(a[3]).assertEqual(undefined);
  expect(a.length).assertEqual(4);
}

function foo_28(a: number[]|string[]|boolean[]): void {
  expect((a as boolean[])[0]).assertFalse();
  expect((a as boolean[])[1]).assertTrue();
  expect((a as boolean[])[2]).assertFalse();
  expect((a as boolean[]).length).assertEqual(3);
}

function foo_30(a: number[]|string[]|boolean[]): void {
  expect((a as string[])[0]).assertEqual('1');
  expect((a as string[])[1]).assertEqual('2');
  expect((a as string[])[2]).assertEqual('43');
  expect((a as string[]).length).assertEqual(3);
}

enum Color_31 { Red, Green, Blue }
enum Size_31 { S, M, L, XL }
function foo_31(a: (Color_31|Size_31)[]): void {
  expect(a[0] as Color_31).assertEqual(Color_31.Red);
  expect(a[1] as Color_31).assertEqual(Color_31.Green);
  expect(a[2] as Size_31).assertEqual(Size_31.XL);
  expect(a.length).assertEqual(3);
}

type arr4_F_24 = (p: Color_31) => number;
type arr4_F_25 = (p: Color_31) => number;
type arr4_F_26 = (p: Color_31) => number;
type arr4_F_27 = (p: Color_31) => number;

function arr4_foo_8(a: string[][]): void {
  expect(a[0][0]).assertEqual('1');
  expect(a[0][1]).assertEqual('11');
  expect(a[1][0]).assertEqual('');
  expect(a[1][1]).assertEqual('-9223372036854775808');
  expect(a.length).assertEqual(2);
}


function arr4_foo_12(a: bigint[][]): void {
  expect(a[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
  expect(a[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
  expect(a.length).assertEqual(3);
}

function arr4_foo_16(a: Array<[string, number, boolean, bigint, null, undefined]>): void {
  const innerArray = a[0];
  expect(innerArray[0]).assertEqual("a");
  expect(innerArray[1]).assertEqual(1);
  expect(innerArray[2]).assertTrue();
  expect(innerArray[3]).assertEqual(2n);
  expect(innerArray[4]).assertEqual(null);
  expect(innerArray[5]).assertEqual(undefined);
  expect(a.length).assertEqual(1);
}

enum arr4_foo_Color_23 { Red, Green, Blue }
function arr4_foo_23(a: arr4_foo_Color_23[][]): void {
  expect(a[0][0]).assertEqual(arr4_foo_Color_23.Red);
  expect(a[0][1]).assertEqual(arr4_foo_Color_23.Blue);
  expect(a.length).assertEqual(1);
}

enum arr4_foo_Color_27 { Red, Green, Blue }
type arr4_foo_F_27 = (p: arr4_foo_Color_27) => number;
function arr4_foo_27(a: arr4_foo_F_27[][]): void {
  expect(a[0][0](arr4_foo_Color_27.Red)).assertEqual(0);
  expect(a[1][0](arr4_foo_Color_27.Red)).assertEqual(1);
  expect(a[2][0](arr4_foo_Color_27.Blue)).assertEqual(4);
  expect(a.length).assertEqual(3);
}

function arr4_foo_31(a: (boolean|number|string|null)[][]): void {
  expect(a[0][0] as boolean).assertTrue();
  expect(a[0][1] as number).assertEqual(1);
  expect(a[0][2] as string).assertEqual('a');
  expect(a[0][3]).assertEqual(null);
  expect(a.length).assertEqual(1);
}

let arr4_foo_e_35 = new Error();
function arr4_foo_35(a: (number|Error|((p: string) => string)|boolean)[][]): void {
  expect(a[0][0] as Error).assertEqual(arr4_foo_e_35);
  expect(a[1][0] as boolean).assertFalse();
  expect((a[2][0] as (p: string) => string)('a')).assertEqual('aa');
  expect(a[3][0] as number).assertEqual(42);
  expect(a.length).assertEqual(4);
}

function arr4_foo_36(a: number[]|string[]|boolean[]|null): void {
  let x = a as boolean[];
  expect(x[0]).assertFalse();
  expect(x[1]).assertTrue();
  expect(x[2]).assertFalse();
  expect(x.length).assertEqual(3);
}

function arr4_foo_42(a: number[]|string[]|boolean[]|null): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('43');
  expect(x.length).assertEqual(3);
}

function arr4_foo_46(a: string[]|number[]): void {
  let x = a as number[];
  expect(x[0]).assertEqual(1);
  expect(x[1]).assertEqual(2);
  expect(x[2]).assertEqual(3);
  expect(x.length).assertEqual(3);
}

function arr4_foo_54(a: string[]|number[]): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('3');
  expect(x.length).assertEqual(3);
}


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsContestInferenceTest() {
  describe("ExpressionsContestInferenceTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0100
     * @tc.name      testExpressionsContestInference0001
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_0 = [!true, true, false];
      expect(a_0[0]).assertFalse();
      expect(a_0[1]).assertTrue();
      expect(a_0[2]).assertFalse();
      expect(a_0.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0200
     * @tc.name      testExpressionsContestInference0002
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_1 = [1, 2, 3, -9223372036854775808];
      expect(a_1[3]).assertEqual(-9223372036854775808);
      expect(a_1.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0300
     * @tc.name      testExpressionsContestInference0003
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_2 = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []];
      expect(a_2.length).assertEqual(4);
      expect(a_2[0][0]).assertEqual(-2147483647);
      expect(a_2[2][2]).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0400
     * @tc.name      testExpressionsContestInference0004
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_3 = [NaN, 1.0, -1.0, 1.7976931348623157e+308];
      expect(Number.isNaN(a_3[0])).assertTrue();
      expect(a_3[3]).assertEqual(1.7976931348623157e+308);
      expect(a_3.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0500
     * @tc.name      testExpressionsContestInference0005
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_4 = [!true, true, true];
      expect(a_4[0]).assertFalse();
      expect(a_4[1]).assertTrue();
      expect(a_4[2]).assertTrue();
      expect(a_4.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0600
     * @tc.name      testExpressionsContestInference0006
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_5 = [1, 2, 3, -9223372036854775808];
      expect(a_5[3]).assertEqual(-9223372036854775808);
      expect(a_5.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0700
     * @tc.name      testExpressionsContestInference0007
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_6 = [NaN, 1.0, -1.0, 1.7976931348623157e+308];
      expect(Number.isNaN(a_6[0])).assertTrue();
      expect(a_6[3]).assertEqual(1.7976931348623157e+308);
      expect(a_6.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0800
     * @tc.name      testExpressionsContestInference0008
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_7 = [[1.7976931348623157e+308, 2], [3], [4, 5, 6.0], []];
      expect(a_7.length).assertEqual(4);
      expect(a_7[0][0]).assertEqual(1.7976931348623157e+308);
      expect(a_7[2][2]).assertEqual(6.0);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0900
     * @tc.name      testExpressionsContestInference0009
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_8 = ['1', '2', '3', '-9223372036854775808'];
      expect(a_8[3]).assertEqual('-9223372036854775808');
      expect(a_8.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1000
     * @tc.name      testExpressionsContestInference0010
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_9 = ['x', 'x1', 'x2', 'x3'];
      expect(a_9[0]).assertEqual('x');
      expect(a_9[1]).assertEqual('x1');
      expect(a_9[2]).assertEqual('x2');
      expect(a_9[3]).assertEqual('x3');
      expect(a_9.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1100
     * @tc.name      testExpressionsContestInference0011
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_11 = [['1', '11'], ['', '-9223372036854775808']];
      expect(a_11[0][0]).assertEqual('1');
      expect(a_11[0][1]).assertEqual('11');
      expect(a_11[1][0]).assertEqual('');
      expect(a_11[1][1]).assertEqual('-9223372036854775808');
      expect(a_11.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1200
     * @tc.name      testExpressionsContestInference0012
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_12 = [1n, 2n, 33333333333333333333333333333333333333333333333333n];
      expect(a_12[1]).assertEqual(2n);
      expect(a_12[2]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(a_12.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1300
     * @tc.name      testExpressionsContestInference0013
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_13 = [
        [11111111111111111111111111111111111111111111111n],
        [22222222222222222222222222222222222222222222222n],
        [33333333333333333333333333333333333333333333333333n]
      ];
      expect(a_13[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(a_13[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(a_13.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1400
     * @tc.name      testExpressionsContestInference0014
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_15 = [v_15, q_15];
      expect(a_15[0]).assertEqual(v_15);
      expect(a_15[1]).assertEqual(q_15);
      expect(a_15.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1500
     * @tc.name      testExpressionsContestInference0015
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a_16: Array<[string, number, boolean, bigint]> = [["a", 1, true, 2n]];

      const element_0 = a_16[0];
      expect(element_0[0]).assertEqual("a");
      expect(element_0[1]).assertEqual(1);
      expect(element_0[2]).assertTrue();
      expect(element_0[3]).assertEqual(2n);
      expect(a_16.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1600
     * @tc.name      testExpressionsContestInference0016
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_17 = [Color_18.Red, Color_18.Blue];
      expect(a_17[0]).assertEqual(Color_18.Red);
      expect(a_17[1]).assertEqual(Color_18.Blue);
      expect(a_17.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1700
     * @tc.name      testExpressionsContestInference0017
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_18 = [[Color_18.Red, Color_18.Blue]];
      expect(a_18[0][0]).assertEqual(Color_18.Red);
      expect(a_18[0][1]).assertEqual(Color_18.Blue);
      expect(a_18.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1800
     * @tc.name      testExpressionsContestInference0018
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_19 = [(p: Color_18) => 0, (p: Color_18) => 1, (p: Color_18) => p === Color_18.Blue ? 4 : 0];
      expect(a_19[0](Color_18.Red)).assertEqual(0);
      expect(a_19[1](Color_18.Red)).assertEqual(1);
      expect(a_19[2](Color_18.Blue)).assertEqual(4);
      expect(a_19.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1900
     * @tc.name      testExpressionsContestInference0019
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_20 = [
        [(p: Color_18) => 0],
        [(p: Color_18) => 1],
        [(p: Color_18) => p === Color_18.Blue ? 4 : 0]
      ];
      expect(a_20[0][0](Color_18.Red)).assertEqual(0);
      expect(a_20[1][0](Color_18.Red)).assertEqual(1);
      expect(a_20[2][0](Color_18.Blue)).assertEqual(4);
      expect(a_20.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2000
     * @tc.name      testExpressionsContestInference0020
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_21 = [null, o_21, o_21, u_21];
      expect(a_21[0]).assertEqual(null);
      expect(a_21[1]).assertEqual(o_21);
      expect(a_21[2]).assertEqual(o_21);
      expect(a_21[3]).assertEqual(undefined);
      expect(a_21.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2100
     * @tc.name      testExpressionsContestInference0021
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_22 = [sum_22([1, 2, 3])];
      expect(a_22[0]).assertEqual(6);
      expect(a_22.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2200
     * @tc.name      testExpressionsContestInference0022
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_23 = [true, 1, 'a', null];
      expect(a_23[0]).assertTrue();
      expect(a_23[1]).assertEqual(1);
      expect(a_23[2]).assertEqual('a');
      expect(a_23[3]).assertNull();
      expect(a_23.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2300
     * @tc.name      testExpressionsContestInference0023
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_24 = [[true, 1, 'a', null]];
      expect(a_24[0][0]).assertTrue();
      expect(a_24[0][1]).assertEqual(1);
      expect(a_24[0][2]).assertEqual('a');
      expect(a_24[0][3]).assertNull();
      expect(a_24.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2400
     * @tc.name      testExpressionsContestInference0024
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_27 = [false, true, false];
      expect((a_27 as boolean[])[0]).assertFalse();
      expect((a_27 as boolean[])[1]).assertTrue();
      expect((a_27 as boolean[])[2]).assertFalse();
      expect((a_27 as boolean[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2500
     * @tc.name      testExpressionsContestInference0025
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_28 = [1, 2, 43];
      expect((a_28 as number[])[0]).assertEqual(1);
      expect((a_28 as number[])[1]).assertEqual(2);
      expect((a_28 as number[])[2]).assertEqual(43);
      expect((a_28 as number[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2600
     * @tc.name      testExpressionsContestInference0026
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_29 = ['1', '2', '43'];
      expect((a_29 as string[])[0]).assertEqual('1');
      expect((a_29 as string[])[1]).assertEqual('2');
      expect((a_29 as string[])[2]).assertEqual('43');
      expect((a_29 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2700
     * @tc.name      testExpressionsContestInference0027
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_30 = [Color_18.Red, Color_18.Green, Size_30.XL];
      expect(a_30[0]).assertEqual(Color_18.Red);
      expect(a_30[1]).assertEqual(Color_18.Green);
      expect(a_30[2]).assertEqual(Size_30.XL);
      expect(a_30.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2800
     * @tc.name      testExpressionsContestInference0028
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_0 = [!true, true, false];
      expect(arr3_a_0[0]).assertFalse();
      expect(arr3_a_0[1]).assertTrue();
      expect(arr3_a_0[2]).assertFalse();
      expect(arr3_a_0.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2900
     * @tc.name      testExpressionsContestInference0029
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_1 = [1, 2, 3, -9223372036854775808];
      expect(arr3_a_1[3]).assertEqual(-9223372036854775808);
      expect(arr3_a_1.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3000
     * @tc.name      testExpressionsContestInference0030
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_2 = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []];
      expect(arr3_a_2.length).assertEqual(4);
      expect(arr3_a_2[0][0]).assertEqual(-2147483647);
      expect(arr3_a_2[2][2]).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3100
     * @tc.name      testExpressionsContestInference0031
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_3 = [NaN, 1.0, -1.0, 1.7976931348623157e+308];
      expect(Number.isNaN(arr3_a_3[0])).assertTrue();
      expect(arr3_a_3[3]).assertEqual(1.7976931348623157e+308);
      expect(arr3_a_3.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3200
     * @tc.name      testExpressionsContestInference0032
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_4 = [!true, true, true];
      expect(arr3_a_4[0]).assertFalse();
      expect(arr3_a_4[1]).assertTrue();
      expect(arr3_a_4[2]).assertTrue();
      expect(arr3_a_4.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3300
     * @tc.name      testExpressionsContestInference0033
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_5 = [1, 2, 3, -9223372036854775808];
      expect(arr3_a_5[3]).assertEqual(-9223372036854775808);
      expect(arr3_a_5.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3400
     * @tc.name      testExpressionsContestInference0034
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_6 = [NaN, 1.0, -1.0, 1.7976931348623157e+308];
      expect(Number.isNaN(arr3_a_6[0])).assertTrue();
      expect(arr3_a_6[3]).assertEqual(1.7976931348623157e+308);
      expect(arr3_a_6.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3500
     * @tc.name      testExpressionsContestInference0035
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_7 = [[1.7976931348623157e+308, 2], [3], [4, 5, 6.0], []];
      expect(arr3_a_7.length).assertEqual(4);
      expect(arr3_a_7[0][0]).assertEqual(1.7976931348623157e+308);
      expect(arr3_a_7[2][2]).assertEqual(6.0);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3600
     * @tc.name      testExpressionsContestInference0036
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_8 = ['1', '2', '3', '-9223372036854775808'];
      expect(arr3_a_8[3]).assertEqual('-9223372036854775808');
      expect(arr3_a_8.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3700
     * @tc.name      testExpressionsContestInference0037
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_9 = ['x', 'x1', 'x2', 'x3'];
      expect(arr3_a_9[0]).assertEqual('x');
      expect(arr3_a_9[1]).assertEqual('x1');
      expect(arr3_a_9[2]).assertEqual('x2');
      expect(arr3_a_9[3]).assertEqual('x3');
      expect(arr3_a_9.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3800
     * @tc.name      testExpressionsContestInference0038
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_11 = [['1', '11'], ['', '-9223372036854775808']];
      expect(arr3_a_11[0][0]).assertEqual('1');
      expect(arr3_a_11[0][1]).assertEqual('11');
      expect(arr3_a_11[1][0]).assertEqual('');
      expect(arr3_a_11[1][1]).assertEqual('-9223372036854775808');
      expect(arr3_a_11.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3900
     * @tc.name      testExpressionsContestInference0039
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_12 = [1n, 2n, 33333333333333333333333333333333333333333333333333n];
      expect(arr3_a_12[1]).assertEqual(2n);
      expect(arr3_a_12[2]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(arr3_a_12.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4000
     * @tc.name      testExpressionsContestInference0040
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_13 = [
        [11111111111111111111111111111111111111111111111n],
        [22222222222222222222222222222222222222222222222n],
        [33333333333333333333333333333333333333333333333333n]
      ];
      const firstElement = arr3_a_13[0];
      const thirdElement = arr3_a_13[2];
      expect(firstElement[0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(thirdElement[0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(arr3_a_13.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4100
     * @tc.name      testExpressionsContestInference0041
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_16 = [["a", 1, true, 2n]];
      const element = arr3_a_16[0];
      expect(element[0]).assertEqual("a");
      expect(element[1]).assertEqual(1);
      expect(element[2]).assertTrue();
      expect(element[3]).assertEqual(2n);
      expect(arr3_a_16.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4200
     * @tc.name      testExpressionsContestInference0042
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_22: Array<number> = [arr3_sum_23([1, 2, 3])];
      expect(arr3_a_22[0]).assertEqual(6);
      expect(arr3_a_22.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4300
     * @tc.name      testExpressionsContestInference0043
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_23: Array<number> = [arr3_sum_24([1, 2, 3])];
      expect(arr3_a_23[0]).assertEqual(6);
      expect(arr3_a_23.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4400
     * @tc.name      testExpressionsContestInference0044
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_24: Array<number> = [arr3_sum_25([1, 2, 3])];
      expect(arr3_a_24[0]).assertEqual(6);
      expect(arr3_a_24.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4500
     * @tc.name      testExpressionsContestInference0045
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_25: Array<boolean | number | string | null> = [true, 1, 'a', null];
      expect(arr3_a_25[0]).assertTrue();
      expect(arr3_a_25[1]).assertEqual(1);
      expect(arr3_a_25[2]).assertEqual('a');
      expect(arr3_a_25[3]).assertNull();
      expect(arr3_a_25.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4600
     * @tc.name      testExpressionsContestInference0046
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_26: Array<Array<boolean | number | string | null>> = [
        [true, 1, 'a', null],
      ];
      expect(arr3_a_26[0][0]).assertTrue();
      expect(arr3_a_26[0][1]).assertEqual(1);
      expect(arr3_a_26[0][2]).assertEqual('a');
      expect(arr3_a_26[0][3]).assertNull();
      expect(arr3_a_26.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4700
     * @tc.name      testExpressionsContestInference0047
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_27: Array<Boolean | number | string | ((s: string) => string)> = [
        'arr3_e_28',
        false,
        (s: string): string => s + s,
        42
      ];
      expect(arr3_a_27[0]).assertEqual('arr3_e_28');
      expect(arr3_a_27[1]).assertFalse();
      expect((arr3_a_27[2] as (s: string) => string)('a')).assertEqual('aa');
      expect(arr3_a_27[3]).assertEqual(42);
      expect(arr3_a_27.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4800
     * @tc.name      testExpressionsContestInference0048
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_31 = ['1', '2', '43'];
      expect((arr3_a_31 as string[])[0]).assertEqual('1');
      expect((arr3_a_31 as string[])[1]).assertEqual('2');
      expect((arr3_a_31 as string[])[2]).assertEqual('43');
      expect((arr3_a_31 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4900
     * @tc.name      testExpressionsContestInference0049
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      foo_0([!true, true, true]);
      expect([!true, true, true][0]).assertFalse();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5000
     * @tc.name      testExpressionsContestInference0050
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      foo_3([NaN, 1.0, -1.0, 1.7976931348623157e+308]);
      expect([NaN, 1.0, -1.0, 1.7976931348623157e+308].length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5100
     * @tc.name      testExpressionsContestInference0051
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [1, 2, 3, -9223372036854775808];
      foo_6(a);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5200
     * @tc.name      testExpressionsContestInference0052
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3', '-9223372036854775808'];
      foo_7(a);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5300
     * @tc.name      testExpressionsContestInference0053
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['x', 'x1', 'x2', 'x3'];
      foo_8(a);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5400
     * @tc.name      testExpressionsContestInference0054
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [1n, 2n, 33333333333333333333333333333333333333333333333333n];
      foo_11(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5500
     * @tc.name      testExpressionsContestInference0055
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [new A_13()];
      foo_13(a);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5600
     * @tc.name      testExpressionsContestInference0056
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [v_14, q_14];
      foo_14(a);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5700
     * @tc.name      testExpressionsContestInference0057
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      foo_16([["a", 1, true, 2n]]);
      expect([["a", 1, true, 2n]][0][0]).assertEqual("a");
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5800
     * @tc.name      testExpressionsContestInference0058
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new A_18();
      const result = instance.foo([new A_18(), new A_18()]);
      expect(result).assertEqual(4); // 2 (array length) + 2 (instances of A_18)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5900
     * @tc.name      testExpressionsContestInference0059
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [Color_18.Red, Color_18.Blue];
      foo_19(a);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6000
     * @tc.name      testExpressionsContestInference0060
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [[Color_18.Red, Color_18.Blue]];
      foo_20(a);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6100
     * @tc.name      testExpressionsContestInference0061
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [null, o_23, o_23, u_23];
      foo_23(a);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6200
     * @tc.name      testExpressionsContestInference0062
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [false, true, false];
      foo_28(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6300
     * @tc.name      testExpressionsContestInference0063
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '43'];
      foo_30(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6400
     * @tc.name      testExpressionsContestInference0064
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [Color_31.Red, Color_31.Green, Size_31.XL];
      foo_31(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6500
     * @tc.name      testExpressionsContestInference0065
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [['1', '11'], ['', '-9223372036854775808']];
      arr4_foo_8(a);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6600
     * @tc.name      testExpressionsContestInference0066
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [
        [11111111111111111111111111111111111111111111111n],
        [22222222222222222222222222222222222222222222222n],
        [33333333333333333333333333333333333333333333333333n]
      ];
      arr4_foo_12(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6700
     * @tc.name      testExpressionsContestInference0067
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_16([["a", 1, true, 2n, null, undefined]]);
      expect([["a", 1, true, 2n, null, undefined]].length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6800
     * @tc.name      testExpressionsContestInference0068
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [[arr4_foo_Color_23.Red, arr4_foo_Color_23.Blue]];
      arr4_foo_23([[arr4_foo_Color_23.Red, arr4_foo_Color_23.Blue]]);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6900
     * @tc.name      testExpressionsContestInference0069
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [
        [(p: arr4_foo_Color_27) => 0],
        [(p: arr4_foo_Color_27) => 1],
        [(p: arr4_foo_Color_27) => p === arr4_foo_Color_27.Blue ? 4 : 0],
      ];
      arr4_foo_27([
        [(p: arr4_foo_Color_27) => 0],
        [(p: arr4_foo_Color_27) => 1],
        [(p: arr4_foo_Color_27) => p === arr4_foo_Color_27.Blue ? 4 : 0],
      ]);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7000
     * @tc.name      testExpressionsContestInference0070
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [[true, 1, 'a', null]];
      arr4_foo_31([[true, 1, 'a', null]]);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7100
     * @tc.name      testExpressionsContestInference0071
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [[arr4_foo_e_35], [false], [(s: string) => s + s], [42]];
      arr4_foo_35([[arr4_foo_e_35], [false], [(s: string) => s + s], [42]]);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7200
     * @tc.name      testExpressionsContestInference0072
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [false, true, false];
      arr4_foo_36(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7300
     * @tc.name      testExpressionsContestInference0073
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '43'];
      arr4_foo_42(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7400
     * @tc.name      testExpressionsContestInference0074
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_46([1, 2, 3]);
      expect([1, 2, 3].length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7500
     * @tc.name      testExpressionsContestInference0075
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_54(a);
      expect(a.length).assertEqual(3);
    });
  })
}