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
} from '../../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}


enum IntEnum { Zero, One, Two }
enum IntEnum2 { Zero, Five = 5, Seven = 7 }
enum IntEnum3 { Three = 3, Five = 5, Six }
enum IntEnum4 { Zero, One, Two }
enum IntEnum5 { MinusOne = -1, Zero, One, Two }

export default function ExpressionsAdditiveOperatorsTest() {
  describe("ExpressionsAdditiveOperatorsTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0100
     * @tc.name      testExpressionsAdditiveOperators0001
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = 1 + 2 - 1 + 4;
      expect(result).assertEqual(6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0200
     * @tc.name      testExpressionsAdditiveOperators0002
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = (7 - 2) + 4;
      expect(result).assertEqual(9);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0300
     * @tc.name      testExpressionsAdditiveOperators0003
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = 7 - (2 - 1);
      expect(result).assertEqual(6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0400
     * @tc.name      testExpressionsAdditiveOperators0004
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = (11 - 7) - (34 - 41);
      expect(result).assertEqual(11);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0500
     * @tc.name      testExpressionsAdditiveOperators0005
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 9223372036854775807n;
      let y: bigint = 3n;
      let z = x + y;
      expect(z).assertEqual(9223372036854775810n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0600
     * @tc.name      testExpressionsAdditiveOperators0006
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 9223372036854775810n;
      let y: bigint = 1n;
      let z = x - y;
      expect(z).assertEqual(9223372036854775809n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0700
     * @tc.name      testExpressionsAdditiveOperators0007
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = -9223372036854775807n;
      let y: bigint = 244553n;
      let z = x - y;
      expect(z).assertEqual(-9223372036855020360n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0800
     * @tc.name      testExpressionsAdditiveOperators0008
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 9223372036854775807n;
      let y: bigint = 0n;
      let z = x + y;
      expect(z).assertEqual(9223372036854775807n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0900
     * @tc.name      testExpressionsAdditiveOperators0009
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 9223372036854775807n;
      let y: bigint = 0n;
      let z = x - y;
      expect(z).assertEqual(9223372036854775807n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1000
     * @tc.name      testExpressionsAdditiveOperators0010
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 0n;
      let y: bigint = 0n;
      let z = x + y;
      expect(z).assertEqual(0n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1100
     * @tc.name      testExpressionsAdditiveOperators0011
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 0n;
      let y: bigint = 0n;
      let z = x - y;
      expect(z).assertEqual(0n)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1200
     * @tc.name      testExpressionsAdditiveOperators0012
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(IntEnum.One + IntEnum.Two).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1300
     * @tc.name      testExpressionsAdditiveOperators0013
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(IntEnum2.Seven - IntEnum2.Five).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1400
     * @tc.name      testExpressionsAdditiveOperators0014
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(IntEnum3.Three - IntEnum3.Six).assertEqual(-3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1500
     * @tc.name      testExpressionsAdditiveOperators0015
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(IntEnum4.One + 54).assertEqual(55);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1600
     * @tc.name      testExpressionsAdditiveOperators0016
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(IntEnum5.MinusOne + IntEnum5.One).assertEqual(0);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1700
     * @tc.name      testExpressionsAdditiveOperators0017
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f;
      let y: float = -0.0f;
      expect( (x + y)).assertEqual(0.0f )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1800
     * @tc.name      testExpressionsAdditiveOperators0018
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = -0.0f;
      let y: float = 0.0f;
      expect( (x + y)).assertEqual(0.0f )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1900
     * @tc.name      testExpressionsAdditiveOperators0019
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = -0.0f;
      let y: float = -0.0f;
      expect( (x + y)).assertEqual(-0.0f )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2000
     * @tc.name      testExpressionsAdditiveOperators0020
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f;
      let y: float = 0.0f;
      expect( (x + y)).assertEqual(0.0f )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2100
     * @tc.name      testExpressionsAdditiveOperators0021
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f;
      let y: float = 1.0f;
      expect( (x + y)).assertEqual(1.0f )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2200
     * @tc.name      testExpressionsAdditiveOperators0022
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 1.0f;
      let y: float = 0.0f;
      expect( (x + y)).assertEqual(1.0f )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2300
     * @tc.name      testExpressionsAdditiveOperators0023
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 1.0f;
      let y: float = -1.0f;
      expect( (x + y)).assertEqual(0.0f )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2400
     * @tc.name      testExpressionsAdditiveOperators0024
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0;
      let y: double = -0.0;
      expect( (x + y)).assertEqual(0.0 )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2500
     * @tc.name      testExpressionsAdditiveOperators0025
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -0.0;
      let y: double = 0.0;
      expect( (x + y)).assertEqual(0.0 )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2600
     * @tc.name      testExpressionsAdditiveOperators0026
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -0.0;
      let y: double = -0.0;
      expect( (x + y)).assertEqual(-0.0 )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2700
     * @tc.name      testExpressionsAdditiveOperators0027
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0;
      let y: double = 0.0;
      expect( (x + y)).assertEqual(0.0 )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2800
     * @tc.name      testExpressionsAdditiveOperators0028
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0;
      let y: double = 1.0;
      expect( (x + y)).assertEqual(1.0 )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2900
     * @tc.name      testExpressionsAdditiveOperators0029
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0;
      let y: double = 0.0;
      expect( (x + y)).assertEqual(1.0 )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3000
     * @tc.name      testExpressionsAdditiveOperators0030
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0;
      let y: double = -1.0;
      expect( (x + y)).assertEqual(0.0 )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3100
     * @tc.name      testExpressionsAdditiveOperators0031
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 56.2f;
      let y: byte = 4;
      let z = x - y;
      expect(z instanceof float).assertTrue();
      expect(Math.abs(z - 52.2f)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3200
     * @tc.name      testExpressionsAdditiveOperators0032
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 12;
      let y: double = 3564.2;
      let z = x + y;
      expect(z instanceof double).assertTrue();
      expect(Math.abs(z - 3576.2)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3300
     * @tc.name      testExpressionsAdditiveOperators0033
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 36.3f;
      let y: short = 11;
      let z = x + y;
      expect(z instanceof float).assertTrue();
      expect(Math.abs(z - 47.3f)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3400
     * @tc.name      testExpressionsAdditiveOperators0034
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 32.8;
      let y: short = 1;
      let z = x - y;
      expect(z instanceof double).assertTrue();
      expect(Math.abs(z - 31.8)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3500
     * @tc.name      testExpressionsAdditiveOperators0035
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 14;
      let y: float = 10.0f;
      let z = x - y;
      expect(z instanceof float).assertTrue();
      expect(Math.abs(z - 4.0f)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3600
     * @tc.name      testExpressionsAdditiveOperators0036
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 28;
      let y: double = 1.9;
      let z = x + y;
      expect(z instanceof double).assertTrue();
      expect(Math.abs(z - 29.9)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3700
     * @tc.name      testExpressionsAdditiveOperators0037
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 103.6f;
      let z = x - y;
      expect(z instanceof float).assertTrue();
      expect(Math.abs(z - -102.6f)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3800
     * @tc.name      testExpressionsAdditiveOperators0038
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 8589934593;
      let y: double = 1.0;
      let z = x + y;
      expect(z instanceof double).assertTrue();
      expect(Math.abs(z - 8589934594.0)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3900
     * @tc.name      testExpressionsAdditiveOperators0039
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 13.0f;
      let y: float = 10.6f;
      let z = x + y;
      expect(z instanceof float).assertTrue();
      expect(Math.abs(z - 23.6f)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4000
     * @tc.name      testExpressionsAdditiveOperators0040
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.3;
      let y: float = 10.6f;
      let z = x - y;
      expect(z instanceof double).assertTrue();
      expect(Math.abs(z - -9.3)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4100
     * @tc.name      testExpressionsAdditiveOperators0041
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1986.3;
      let y: double = 130.6;
      let z = x + y;
      expect(z instanceof double).assertTrue();
      expect(Math.abs(z - 2116.9)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4200
     * @tc.name      testExpressionsAdditiveOperators0042
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0;
      let y: double = Double.POSITIVE_INFINITY;
      expect( (x + y)).assertEqual(Double.POSITIVE_INFINITY )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4300
     * @tc.name      testExpressionsAdditiveOperators0043
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.POSITIVE_INFINITY;
      let y: double = 1.0;
      expect( (x + y)).assertEqual(Double.POSITIVE_INFINITY )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4400
     * @tc.name      testExpressionsAdditiveOperators0044
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.POSITIVE_INFINITY;
      let y: double = Double.POSITIVE_INFINITY;
      expect( (x + y)).assertEqual(Double.POSITIVE_INFINITY )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4500
     * @tc.name      testExpressionsAdditiveOperators0045
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0;
      let y: double = Double.NEGATIVE_INFINITY;
      expect( (x + y)).assertEqual(Double.NEGATIVE_INFINITY )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4600
     * @tc.name      testExpressionsAdditiveOperators0046
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NEGATIVE_INFINITY;
      let y: double = 1.0;
      expect( (x + y)).assertEqual(Double.NEGATIVE_INFINITY )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4700
     * @tc.name      testExpressionsAdditiveOperators0047
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NEGATIVE_INFINITY;
      let y: double = Double.NEGATIVE_INFINITY;
      expect( (x + y)).assertEqual(Double.NEGATIVE_INFINITY )
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4800
     * @tc.name      testExpressionsAdditiveOperators0048
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 0;
      expect( (x + y) === 0 ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4900
     * @tc.name      testExpressionsAdditiveOperators0049
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 0;
      let y: short = 1;
      expect( (x + y) === 1 ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5000
     * @tc.name      testExpressionsAdditiveOperators0050
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: int = 0;
      expect( (x + y) === 1 ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5100
     * @tc.name      testExpressionsAdditiveOperators0051
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: long = -1;
      expect( (x + y) === 0 ).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5200
     * @tc.name      testExpressionsAdditiveOperators0052
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 5;
      let y: byte = 3;
      let z = x + y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(8)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5300
     * @tc.name      testExpressionsAdditiveOperators0053
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 6;
      let y: short = 1;
      let z = x - y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5400
     * @tc.name      testExpressionsAdditiveOperators0054
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 5;
      let y: byte = -3;
      let z = x + y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5500
     * @tc.name      testExpressionsAdditiveOperators0055
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 11;
      let y: long = 122;
      let z = x + y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(133)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5600
     * @tc.name      testExpressionsAdditiveOperators0056
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 44;
      let y: short = 73;
      let z = x - y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(-29)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5700
     * @tc.name      testExpressionsAdditiveOperators0057
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = -34;
      let y: int = 4;
      let z = x - y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(-38)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5800
     * @tc.name      testExpressionsAdditiveOperators0058
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 41;
      let y: short = 42;
      let z = x + y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(83)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5900
     * @tc.name      testExpressionsAdditiveOperators0059
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 44932;
      let y: int = 7345;
      let z = x - y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(37587)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6000
     * @tc.name      testExpressionsAdditiveOperators0060
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 492;
      let y: long = 75;
      let z = x + y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(567)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6100
     * @tc.name      testExpressionsAdditiveOperators0061
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 9209732;
      let y: long = 759376;
      let z = x - y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(8450356)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6200
     * @tc.name      testExpressionsAdditiveOperators0062
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483646;
      let y: int = 1;
      let z = x + y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(2147483647)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6300
     * @tc.name      testExpressionsAdditiveOperators0063
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483647;
      let y: int = 0;
      let z = x + y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(2147483647)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6400
     * @tc.name      testExpressionsAdditiveOperators0064
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483647;
      let y: int = 1;
      let z = x + y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(-2147483648)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6500
     * @tc.name      testExpressionsAdditiveOperators0065
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -2147483647;
      let y: int = -1;
      let z = x + y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(-2147483648)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6600
     * @tc.name      testExpressionsAdditiveOperators0066
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -2147483648;
      let y: int = 0;
      let z = x - y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(-2147483648)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6700
     * @tc.name      testExpressionsAdditiveOperators0067
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -2147483648;
      let y: int = 1;
      let z = x - y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(2147483647)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6800
     * @tc.name      testExpressionsAdditiveOperators0068
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 9223372036854775806;
      let y: long = 1;
      let z = x + y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(9223372036854775807)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6900
     * @tc.name      testExpressionsAdditiveOperators0069
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 9223372036854775807;
      let y: long = 0;
      let z = x + y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(9223372036854775807)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7000
     * @tc.name      testExpressionsAdditiveOperators0070
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 9223372036854775807;
      let y: long = 1;
      let z = x + y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(-9223372036854775808)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7100
     * @tc.name      testExpressionsAdditiveOperators0071
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = -9223372036854775807;
      let y: long = 1;
      let z = x - y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(-9223372036854775808)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7200
     * @tc.name      testExpressionsAdditiveOperators0072
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = -9223372036854775808;
      let y: long = 0;
      let z = x - y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(-9223372036854775808)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7300
     * @tc.name      testExpressionsAdditiveOperators0073
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = -9223372036854775808;
      let y: long = 1;
      let z = x - y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(9223372036854775807)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7400
     * @tc.name      testExpressionsAdditiveOperators0074
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NaN;
      let y: double = Double.NaN;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7500
     * @tc.name      testExpressionsAdditiveOperators0075
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0;
      let y: double = Double.NaN;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7600
     * @tc.name      testExpressionsAdditiveOperators0076
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NaN;
      let y: double = 1.0;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7700
     * @tc.name      testExpressionsAdditiveOperators0077
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NEGATIVE_INFINITY;
      let y: double = Double.POSITIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7800
     * @tc.name      testExpressionsAdditiveOperators0078
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.POSITIVE_INFINITY;
      let y: double = Double.NEGATIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7900
     * @tc.name      testExpressionsAdditiveOperators0079
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NaN;
      let y: double = Double.NEGATIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_8000
     * @tc.name      testExpressionsAdditiveOperators0080
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NEGATIVE_INFINITY;
      let y: double = Double.NaN;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_8100
     * @tc.name      testExpressionsAdditiveOperators0081
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NaN;
      let y: double = Double.POSITIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_8200
     * @tc.name      testExpressionsAdditiveOperators0082
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.POSITIVE_INFINITY;
      let y: double = Double.NaN;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_8300
     * @tc.name      testExpressionsAdditiveOperators0083
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NEGATIVE_INFINITY;
      let y: double = Double.POSITIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_8400
     * @tc.name      testExpressionsAdditiveOperators0084
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperators0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.POSITIVE_INFINITY;
      let y: double = Double.NEGATIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })    
  })
}
