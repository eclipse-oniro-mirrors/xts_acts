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

let u_21: undefined = undefined;
let n_21: null = null;
let o_21: Object = {};
let e_25 = new Error();

class A_15<T> {}
let v_15 = new A_15<number>();
let q_15 = new A_15<number>();

enum Color_18 { Red, Green, Blue }

type F_20 = (p: Color_18) => number;

let arr4_a_28: (boolean|number|string|null)[][] = [];
let arr4_a_30: ((boolean|number|string|null)[][]) = [];
let arr4_e_32 = new Error();
let arr4_a_32: ((number|Error|((p: string)=>string)|boolean)[][]) = [];
let arr4_a_36: (number[]|string[]|boolean[]|null) = null;
let arr4_s_40 = '4';
let arr4_a_42: (string[]|boolean[]|null) = null;
let arr4_a_43: (boolean[]|string|string[]|null) = null;

function arr4_foo_55(a: string[]|number[]): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('3');
  expect(x.length).assertEqual(3);
}

let arr4_decl_a0: number[][] = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []];

function test_arr4_inf_decl_0(): void {
  expect(arr4_decl_a0.length).assertEqual(4);
  expect(arr4_decl_a0[0][0]).assertEqual(-2147483647);
  expect(arr4_decl_a0[2][2]).assertEqual(2147483647);
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsContestInferenceOneTest() {
  describe("ExpressionsContestInferenceOneTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0100
     * @tc.name      testExpressionsContestInferenceOne0001
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_55(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0200
     * @tc.name      testExpressionsContestInferenceOne0002
     * @tc.desc      arr4_inf_decl test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      test_arr4_inf_decl_0();
      expect(arr4_decl_a0.length).assertEqual(4);
      expect(arr4_decl_a0[0][0]).assertEqual(-2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0300
     * @tc.name      testExpressionsContestInferenceOne0003
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [!true, true, true] as boolean[];
      expect(a[0]).assertFalse();
      expect(a[1]).assertTrue();
      expect(a[2]).assertTrue();
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0400
     * @tc.name      testExpressionsContestInferenceOne0004
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []] as number[][];
      expect(a.length).assertEqual(4);
      expect(a[0][0]).assertEqual(-2147483647);
      expect(a[2][2]).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0500
     * @tc.name      testExpressionsContestInferenceOne0005
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [false, true, true] as boolean[];
      expect(a[0]).assertFalse();
      expect(a[1]).assertTrue();
      expect(a[2]).assertTrue();
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0600
     * @tc.name      testExpressionsContestInferenceOne0006
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [Number.NaN, 0, 3.14, 1.7976931348623157e+308] as number[];
      expect(Number.isNaN(a[0])).assertTrue();
      expect(a[3]).assertEqual(1.7976931348623157e+308);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0700
     * @tc.name      testExpressionsContestInferenceOne0007
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[1.7976931348623157e+308, 2], [3], [4, 5, 6], []] as number[][];
      expect(a.length).assertEqual(4);
      expect(a[0][0]).assertEqual(1.7976931348623157e+308);
      expect(a[2][2]).assertEqual(6.0);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0800
     * @tc.name      testExpressionsContestInferenceOne0008
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = ['1', '2', '', '-9223372036854775808'] as string[];
      expect(a[3]).assertEqual('-9223372036854775808');
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0900
     * @tc.name      testExpressionsContestInferenceOne0009
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = ['x', 'x' + '1', 'x' + '2', 'x' + '3'] as string[];
      expect(a[0]).assertEqual('x');
      expect(a[1]).assertEqual('x1');
      expect(a[2]).assertEqual('x2');
      expect(a[3]).assertEqual('x3');
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1000
     * @tc.name      testExpressionsContestInferenceOne0010
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = '1';
      let a = [[s, s + s], ['', '-9223372036854775808']] as string[][];
      expect(a[0][0]).assertEqual('1');
      expect(a[0][1]).assertEqual('11');
      expect(a[1][0]).assertEqual('');
      expect(a[1][1]).assertEqual('-9223372036854775808');
      expect(a.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1100
     * @tc.name      testExpressionsContestInferenceOne0011
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1n, 2n, 33333333333333333333333333333333333333333333333333n] as bigint[];
      expect(a[1]).assertEqual(2n);
      expect(a[2]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1200
     * @tc.name      testExpressionsContestInferenceOne0012
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[11111111111111111111111111111111111111111111111n], [2n], [33333333333333333333333333333333333333333333333333n]] as bigint[][];
      expect(a[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(a[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1300
     * @tc.name      testExpressionsContestInferenceOne0013
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [v_15, q_15] as A_15<number>[];
      expect(a[0]).assertEqual(v_15);
      expect(a[1]).assertEqual(q_15);
      expect(a.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1400
     * @tc.name      testExpressionsContestInferenceOne0014
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<Array<string | number | boolean | bigint>> = [["a", 1, true, 2n]];
      expect(a[0][0] as string).assertEqual("a");
      expect(a[0][1] as number).assertEqual(1);
      expect(a[0][2] as boolean).assertTrue();
      expect(a[0][3] as bigint).assertEqual(2n);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1500
     * @tc.name      testExpressionsContestInferenceOne0015
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [Color_18.Red, Color_18.Blue] as Color_18[];
      expect(a[0]).assertEqual(Color_18.Red);
      expect(a[1]).assertEqual(Color_18.Blue);
      expect(a.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1600
     * @tc.name      testExpressionsContestInferenceOne0016
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[Color_18.Red, Color_18.Blue]] as Color_18[][];
      expect(a[0][0]).assertEqual(Color_18.Red);
      expect(a[0][1]).assertEqual(Color_18.Blue);
      expect(a.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1700
     * @tc.name      testExpressionsContestInferenceOne0017
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [(p: Color_18): number => p.valueOf(), (p: Color_18): number => p.valueOf() + 1, (p: Color_18): number => p.valueOf() + 2] as F_20[];
      expect(a[0](Color_18.Red)).assertEqual(0);
      expect(a[1](Color_18.Red)).assertEqual(1);
      expect(a[2](Color_18.Blue)).assertEqual(4);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1800
     * @tc.name      testExpressionsContestInferenceOne0018
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[(p: Color_18): number => p.valueOf()], [(p: Color_18): number => p.valueOf() + 1], [(p: Color_18): number => p.valueOf() + 2]] as F_20[][];
      expect(a[0][0](Color_18.Red)).assertEqual(0);
      expect(a[1][0](Color_18.Red)).assertEqual(1);
      expect(a[2][0](Color_18.Blue)).assertEqual(4);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1900
     * @tc.name      testExpressionsContestInferenceOne0019
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [n_21, o_21, o_21, u_21] as (null|undefined|Object)[];
      expect(a[0]).assertEqual(null);
      expect(a[1] as Object).assertEqual(o_21);
      expect(a[2] as Object).assertEqual(o_21);
      expect(a[3]).assertEqual(undefined);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2000
     * @tc.name      testExpressionsContestInferenceOne0020
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [true, 1, 'a', null] as (boolean|number|string|null)[];
      expect(a[0] as boolean).assertTrue();
      expect(a[1] as number).assertEqual(1);
      expect(a[2] as string).assertEqual('a');
      expect(a[3]).assertEqual(null);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2100
     * @tc.name      testExpressionsContestInferenceOne0021
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[true, 1, 'a', null]] as (boolean|number|string|null)[][];
      expect(a[0][0] as boolean).assertTrue();
      expect(a[0][1] as number).assertEqual(1);
      expect(a[0][2] as string).assertEqual('a');
      expect(a[0][3]).assertEqual(null);
      expect(a.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2200
     * @tc.name      testExpressionsContestInferenceOne0022
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[e_25], [false], [(p: string): string => p + p], [42]] as (number|Error|((p: string)=>string)|boolean)[][];
      expect(a[0][0] as Error).assertEqual(e_25);
      expect(a[1][0] as boolean).assertFalse();
      expect((a[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(a[3][0] as number).assertEqual(42);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2300
     * @tc.name      testExpressionsContestInferenceOne0023
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<boolean> = [false, true, false];
      expect(a[0]).assertFalse();
      expect(a[1]).assertTrue();
      expect(a[2]).assertFalse();
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2400
     * @tc.name      testExpressionsContestInferenceOne0024
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 43];
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(2);
      expect(a[2]).assertEqual(43);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2500
     * @tc.name      testExpressionsContestInferenceOne0025
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<string> = ['1', '2', '43'];
      expect(a[0]).assertEqual('1');
      expect(a[1]).assertEqual('2');
      expect(a[2]).assertEqual('43');
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2600
     * @tc.name      testExpressionsContestInferenceOne0026
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_0: Array<Array<number>> = [
        [-2147483647, 2],
        [3],
        [2 + 2, 5, 2147483646 + 1],
        [],
      ];
      expect(arr4_a_0.length).assertEqual(4);
      expect(arr4_a_0[0][0]).assertEqual(-2147483647);
      expect(arr4_a_0[2][2]).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2700
     * @tc.name      testExpressionsContestInferenceOne0027
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_4: Array<Array<number>> = [
        [1.7976931348623157e+308, 2],
        [3],
        [4, 5, 6],
        [],
      ];
      expect(arr4_a_4.length).assertEqual(4);
      expect(arr4_a_4[0][0]).assertEqual(1.7976931348623157e+308);
      expect(arr4_a_4[2][2]).assertEqual(6.0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2800
     * @tc.name      testExpressionsContestInferenceOne0028
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = '1';
      const arr4_a_8: Array<Array<string>> = [
        [s, s + s],
        ['', '-9223372036854775808'],
      ];
      expect(arr4_a_8[0][0]).assertEqual('1');
      expect(arr4_a_8[0][1]).assertEqual('11');
      expect(arr4_a_8[1][0]).assertEqual('');
      expect(arr4_a_8[1][1]).assertEqual('-9223372036854775808');
      expect(arr4_a_8.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2900
     * @tc.name      testExpressionsContestInferenceOne0029
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_12: Array<Array<bigint>> = [
        [11111111111111111111111111111111111111111111111n],
        [2n],
        [33333333333333333333333333333333333333333333333333n],
      ];
      expect(arr4_a_12[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(arr4_a_12[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(arr4_a_12.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3000
     * @tc.name      testExpressionsContestInferenceOne0030
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_16: Array<Array<string | number | boolean | bigint | null | undefined>> = [
        ["a", 1, true, 2n, null, undefined],
      ];
      expect(arr4_a_16[0][0] as string).assertEqual("a");
      expect(arr4_a_16[0][1] as number).assertEqual(1);
      expect(arr4_a_16[0][2] as boolean).assertTrue();
      expect(arr4_a_16[0][3] as bigint).assertEqual(2n);
      expect(arr4_a_16[0][4]).assertEqual(null);
      expect(arr4_a_16[0][5]).assertEqual(undefined);
      expect(arr4_a_16.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3100
     * @tc.name      testExpressionsContestInferenceOne0031
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_20: Array<Array<Color_18>> = [[Color_18.Red, Color_18.Blue]];
      expect(arr4_a_20[0][0]).assertEqual(Color_18.Red);
      expect(arr4_a_20[0][1]).assertEqual(Color_18.Blue);
      expect(arr4_a_20.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3200
     * @tc.name      testExpressionsContestInferenceOne0032
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_24: Array<Array<(p: Color_18) => number>> = [
        [(p: Color_18) => p],
        [(p: Color_18) => p + 1],
        [(p: Color_18) => p + 2],
      ];
      expect(arr4_a_24[0][0](Color_18.Red)).assertEqual(0);
      expect(arr4_a_24[1][0](Color_18.Red)).assertEqual(1);
      expect(arr4_a_24[2][0](Color_18.Blue)).assertEqual(4);
      expect(arr4_a_24.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3300
     * @tc.name      testExpressionsContestInferenceOne0033
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_28 = [[true, 1, 'a', null]];
      expect(arr4_a_28[0][0] as boolean).assertTrue();
      expect(arr4_a_28[0][1] as number).assertEqual(1);
      expect(arr4_a_28[0][2] as string).assertEqual('a');
      expect(arr4_a_28[0][3]).assertEqual(null);
      expect(arr4_a_28.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3400
     * @tc.name      testExpressionsContestInferenceOne0034
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_32 = [[arr4_e_32], [false], [(p: string) => p + p], [42]];
      expect(arr4_a_32[0][0] as Error).assertEqual(arr4_e_32);
      expect(arr4_a_32[1][0] as boolean).assertFalse();
      expect((arr4_a_32[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(arr4_a_32[3][0] as number).assertEqual(42);
      expect(arr4_a_32.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3500
     * @tc.name      testExpressionsContestInferenceOne0035
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_36 = [false, true, false];
      expect((arr4_a_36 as boolean[])[0]).assertFalse();
      expect((arr4_a_36 as boolean[])[1]).assertTrue();
      expect((arr4_a_36 as boolean[])[2]).assertFalse();
      expect((arr4_a_36 as boolean[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3600
     * @tc.name      testExpressionsContestInferenceOne0036
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_36 = [1, 2, 43];
      expect((arr4_a_36 as number[])[0]).assertEqual(1);
      expect((arr4_a_36 as number[])[1]).assertEqual(2);
      expect((arr4_a_36 as number[])[2]).assertEqual(43);
      expect((arr4_a_36 as number[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3700
     * @tc.name      testExpressionsContestInferenceOne0037
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_36 = ['1', '2', arr4_s_40 + '3'];
      expect((arr4_a_36 as string[])[0]).assertEqual('1');
      expect((arr4_a_36 as string[])[1]).assertEqual('2');
      expect((arr4_a_36 as string[])[2]).assertEqual('43');
      expect((arr4_a_36 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3800
     * @tc.name      testExpressionsContestInferenceOne0038
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_43 = ['1', '2', '43'];
      expect((arr4_a_43 as string[])[0]).assertEqual('1');
      expect((arr4_a_43 as string[])[1]).assertEqual('2');
      expect((arr4_a_43 as string[])[2]).assertEqual('43');
      expect((arr4_a_43 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3900
     * @tc.name      testExpressionsContestInferenceOne0039
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_55: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_55) && typeof arr4_a_55[0] === 'number') {
        expect(arr4_a_55[0]).assertEqual(1);
        expect(arr4_a_55[1]).assertEqual(2);
        expect(arr4_a_55[2]).assertEqual(3);
        expect(arr4_a_55.length).assertEqual(3);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4000
     * @tc.name      testExpressionsContestInferenceOne0040
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_56: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_56) && typeof arr4_a_56[0] === 'string') {
        expect(arr4_a_56[0]).assertEqual('1');
        expect(arr4_a_56[1]).assertEqual('2');
        expect(arr4_a_56[2]).assertEqual('3');
        expect(arr4_a_56.length).assertEqual(3);
      } else {
        expect().assertFail();
      }
    });
  })
}