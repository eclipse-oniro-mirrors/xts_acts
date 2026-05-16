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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function EqualityExpressionsTest() {
  describe("EqualityExpressionsTest", () => {
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
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_0100
     * @tc.name      testEqualityExpressions0001
     * @tc.desc      Verify equality and inequality operations for decimal literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1153 == 1153).assertTrue();
      expect(1153 === 1153).assertTrue();
      expect(1153 != 2153).assertTrue();
      expect(1153 !== 2153).assertTrue();
      expect(2153 == 2153).assertTrue();
      expect(2153 === 2153).assertTrue();
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_0200
     * @tc.name      testEqualityExpressions0002
     * @tc.desc      Verify equality and inequality operations for hexadecimal literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(765234 == 765234).assertTrue();
      expect(765234 === 765234).assertTrue();
      expect(765234 != 0xBAD321).assertTrue();
      expect(765234 !== 0xBAD321).assertTrue();
      expect(0xBAD321 == 12243745).assertTrue();
      expect(0xBAD321 === 12243745).assertTrue();
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_0300
     * @tc.name      testEqualityExpressions0003
     * @tc.desc      Verify equality and inequality operations for octal literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0o777 == 511).assertTrue();
      expect(0o777 === 511).assertTrue();
      expect(0o777 != 0o7771).assertTrue();
      expect(0o777 !== 0o7771).assertTrue();
      expect(0o7771 == 4089).assertTrue();
      expect(0o7771 === 4089).assertTrue();
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_0400
     * @tc.name      testEqualityExpressions0004
     * @tc.desc      Verify equality and inequality operations for binary literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 == 5).assertTrue();
      expect(5 === 5).assertTrue();
      expect(5 != 0b1011).assertTrue();
      expect(5 !== 0b1011).assertTrue();
      expect(0b1011 == 11).assertTrue();
      expect(0b1011 === 11).assertTrue();
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_0500
     * @tc.name      testEqualityExpressions0005
     * @tc.desc      Verify equality comparison between null values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = null;
      let b = null;
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_0600
     * @tc.name      testEqualityExpressions0006
     * @tc.desc      Verify reference equality for arrays containing null values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: (null | undefined)[] = [null, null];
      let b: (null | undefined)[] = [null, null];
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_0700
     * @tc.name      testEqualityExpressions0007
     * @tc.desc      Verify equality comparison between undefined values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = undefined;
      let b = undefined;
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_0800
     * @tc.name      testEqualityExpressions0008
     * @tc.desc      Verify equality comparison for floating-point number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 3.14;
      let b = 3.14;
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_0900
     * @tc.name      testEqualityExpressions0009
     * @tc.desc      Verify reference equality for arrays containing floating-point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [3.14];
      let b: number[] = [3.14];
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_1000
     * @tc.name      testEqualityExpressions0010
     * @tc.desc      Verify inequality comparison between different boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = true;
      let b = false;
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_1100
     * @tc.name      testEqualityExpressions0011
     * @tc.desc      Verify reference equality for arrays containing different booleans
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean[] = [true];
      let b: boolean[] = [false];
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_1200
     * @tc.name      testEqualityExpressions0012
     * @tc.desc      Verify inequality comparison between different single characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 'A';
      let b = 'B';
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_1300
     * @tc.name      testEqualityExpressions0013
     * @tc.desc      Verify reference equality for arrays containing different single characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string[] = ['A'];
      let b: string[] = ['B'];
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_1400
     * @tc.name      testEqualityExpressions0014
     * @tc.desc      Verify equality comparison for identical string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = "A";
      let b = "A";
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_1500
     * @tc.name      testEqualityExpressions0015
     * @tc.desc      Verify reference equality for arrays containing identical strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string[] = ["A"];
      let b: string[] = ["A"];
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_1600
     * @tc.name      testEqualityExpressions0016
     * @tc.desc      Verify inequality comparison between different integer values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0;
      let b = 1;
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_1700
     * @tc.name      testEqualityExpressions0017
     * @tc.desc      Verify reference equality for arrays containing different integers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [0];
      let b: number[] = [1];
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_1800
     * @tc.name      testEqualityExpressions0018
     * @tc.desc      Verify reference equality for empty Object arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object[] = new Array<Object>(1);
      let b: Object[] = new Array<Object>(1);
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_1900
     * @tc.name      testEqualityExpressions0019
     * @tc.desc      Verify reference equality for identical function expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = (p: number): number => { return p * p; };
      let b = (p: number): number => { return p * p; };
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_2000
     * @tc.name      testEqualityExpressions0020
     * @tc.desc      Verify reference equality for arrays containing identical functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Function[] = [(p: number): number => { return p * p; }];
      let b: Function[] = [(p: number): number => { return p * p; }];
      expect(a == b).assertEqual(a === b);
      expect(a != b).assertEqual(a !== b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_2100
     * @tc.name      testEqualityExpressions0021
     * @tc.desc      Verify logical operation results combined with equality expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0;
      let b = 0;
      let c = 1;
      let cmp1: boolean = (a == b) == (b != c);
      let cmp2: boolean = (a == b) && (b != c);
      expect(cmp1).assertEqual(cmp2);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_2200
     * @tc.name      testEqualityExpressions0022
     * @tc.desc      Verify equality of relational operation results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0;
      let b = 0;
      let c = 1;
      expect(a < c == b < c).assertTrue();
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_2300
     * @tc.name      testEqualityExpressions0023
     * @tc.desc      Verify equivalence of inequality and negated equality operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0;
      let b = 1;
      let cmp1 = a != b;
      let cmp2 = !(a == b);
      expect(cmp1).assertEqual(cmp2);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_2400
     * @tc.name      testEqualityExpressions0024
     * @tc.desc      Verify direct equality assertion for identical boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true;
      let b: boolean = true;
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_2500
     * @tc.name      testEqualityExpressions0025
     * @tc.desc      Verify direct equality assertion for identical integer values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 12;
      let b = 12;
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_2600
     * @tc.name      testEqualityExpressions0026
     * @tc.desc      Verify direct equality assertion for identical character values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 'c';
      let b = 'c';
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_TEST_2700
     * @tc.name      testEqualityExpressions0027
     * @tc.desc      Verify direct equality assertion for identical floating-point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 234.0;
      let b = 234.0;
      expect(a).assertEqual(b);
    });

  });
}
