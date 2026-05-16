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


type someUnion_0 = number|string;

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionEvaluationTypeTest() {
  describe("ExpressionEvaluationTypeTest", () => {
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
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_0100
     * @tc.name      testExpressionEvaluationType0001
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '42' to 'number'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 42;
      expect(typeof a).assertEqual("number");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_0200
     * @tc.name      testExpressionEvaluationType0002
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '"String"' to 'string'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = "String";
      expect(typeof a).assertEqual("string");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_0300
     * @tc.name      testExpressionEvaluationType0003
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from 'true' to 'boolean'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true;
      expect(typeof a).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_0400
     * @tc.name      testExpressionEvaluationType0004
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from 'null' to 'null'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: null = null;
      expect(typeof a).assertEqual("object");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_0500
     * @tc.name      testExpressionEvaluationType0005
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from 'undefined' to 'undefined'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: undefined = undefined;
      expect(typeof a).assertEqual("undefined");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_0600
     * @tc.name      testExpressionEvaluationType0006
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '{ "x":1, "y":2 }' to 'Record<string,number>'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<string, number> = { "x": 1, "y": 2 };
      expect(typeof a).assertEqual("object");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_0700
     * @tc.name      testExpressionEvaluationType0007
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '[1, 2, 3]' to 'number[]'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [1, 2, 3];
      expect(typeof a).assertEqual("object");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_0800
     * @tc.name      testExpressionEvaluationType0008
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '[1, "two"]' to '[number, string]'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: [number, string] = [1, "two"];
      expect(typeof a).assertEqual("object");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_0900
     * @tc.name      testExpressionEvaluationType0009
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '(x:number) => x + 1' to '(x:number) => number'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: (x: number) => number = (x: number) => x + 1;
      expect(typeof a).assertEqual("function");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_1000
     * @tc.name      testExpressionEvaluationType0010
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '()=> {console.log("void")}' to '() => void'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: () => void = () => { console.log("void"); };
      expect(typeof a).assertEqual("function");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_1100
     * @tc.name      testExpressionEvaluationType0011
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '1' to 'someUnion'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: someUnion_0 = 1;
      expect(typeof a).assertEqual("number");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_1200
     * @tc.name      testExpressionEvaluationType0012
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '(42).toString()' to 'string'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = (42).toString();
      expect(typeof a).assertEqual("string");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_1300
     * @tc.name      testExpressionEvaluationType0013
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '100n' to 'bigint'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 100n;
      expect(typeof a).assertEqual("bigint");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_1400
     * @tc.name      testExpressionEvaluationType0014
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from 'NaN' to 'number'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = NaN;
      expect(typeof a).assertEqual("number");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_1500
     * @tc.name      testExpressionEvaluationType0015
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from 'Array<number>(3)' to 'number[]'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = new Array<number>(3);
      expect(typeof a).assertEqual("object");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_1600
     * @tc.name      testExpressionEvaluationType0016
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '[1] instanceof Array' to 'boolean'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = [1] instanceof Array;
      expect(typeof a).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_1700
     * @tc.name      testExpressionEvaluationType0017
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '(typeof x == "string") ? x:""' to 'string'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = ' ';
      let a: string = (typeof x == "string") ? x : "";
      expect(typeof a).assertEqual("string");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_1800
     * @tc.name      testExpressionEvaluationType0018
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from 'true && false' to 'boolean'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true && false;
      expect(typeof a).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_1900
     * @tc.name      testExpressionEvaluationType0019
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '10 + 5' to 'number'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 10 + 5;
      expect(typeof a).assertEqual("number");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_2000
     * @tc.name      testExpressionEvaluationType0020
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from '(1 > 2)' to 'boolean'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = (1 > 2);
      expect(typeof a).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_2100
     * @tc.name      testExpressionEvaluationType0021
     * @tc.desc      There are two ways to facilitate the compatibility of a non-standalone expression
     *               with its surrounding context. Assignment from 'x ? 1:0' to 'number'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = ' ';
      let a: number = x ? 1 : 0; // x 是 ' ' (非空字符串)，条件为真
      expect(typeof a).assertEqual("number");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_2200
     * @tc.name      testExpressionEvaluationType0022
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '42'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 42;
      expect(typeof a).assertEqual("int");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_2300
     * @tc.name      testExpressionEvaluationType0023
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '"String"'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = "String";
      expect(typeof a).assertEqual("string");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_2400
     * @tc.name      testExpressionEvaluationType0024
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from 'true'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = true;
      expect(typeof a).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_2500
     * @tc.name      testExpressionEvaluationType0025
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from 'null'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = null;
      expect(typeof a).assertEqual("object");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_2600
     * @tc.name      testExpressionEvaluationType0026
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from 'undefined'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = undefined;
      expect(typeof a).assertEqual("undefined");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_2700
     * @tc.name      testExpressionEvaluationType0027
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '[1, 2, 3]'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, 2, 3];
      expect(typeof a).assertEqual("object");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_2800
     * @tc.name      testExpressionEvaluationType0028
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '[1, "two"]'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, "two"];
      expect(typeof a).assertEqual("object");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_2900
     * @tc.name      testExpressionEvaluationType0029
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '(x:number) => x + 1'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = (x:number) => x + 1;
      expect(typeof a).assertEqual("function");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_3000
     * @tc.name      testExpressionEvaluationType0030
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '()=> {console.log("void")}'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = ()=> {console.log("void")};
      expect(typeof a).assertEqual("function");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_3100
     * @tc.name      testExpressionEvaluationType0031
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '(42).toString()'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = (42).toString();
      expect(typeof a).assertEqual("string");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_3200
     * @tc.name      testExpressionEvaluationType0032
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '100n'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 100n;
      expect(typeof a).assertEqual("bigint");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_3300
     * @tc.name      testExpressionEvaluationType0033
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from 'NaN'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = NaN;
      expect(typeof a).assertEqual("number");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_3400
     * @tc.name      testExpressionEvaluationType0034
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from 'Array<number>(3)'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Array<number>(3);
      expect(typeof a).assertEqual("object");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_3500
     * @tc.name      testExpressionEvaluationType0035
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '[1] instanceof Array'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1] instanceof Array;
      expect(typeof a).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_3600
     * @tc.name      testExpressionEvaluationType0036
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '(typeof x == "string") ? x:""'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = ' ';
      let a = (typeof x == "string") ? x:"";
      expect(typeof a).assertEqual("string");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_3700
     * @tc.name      testExpressionEvaluationType0037
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from 'true && false'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = true && false;
      expect(typeof a).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_3800
     * @tc.name      testExpressionEvaluationType0038
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '10 + 5'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 10 + 5;
      expect(typeof a).assertEqual("int");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_3900
     * @tc.name      testExpressionEvaluationType0039
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from '(1 > 2)'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = (1 > 2);
      expect(typeof a).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_EXPRESSION_EVALUATION_TYPE_4000
     * @tc.name      testExpressionEvaluationType0040
     * @tc.desc      No target type is expected in the context, then the expression is called a standalone
     *               expression. Assignment from 'x ? 1:0'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionEvaluationType0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = ' ';
      let a = x ? 1:0;
      expect(typeof a).assertEqual("int");
    })
  });
}