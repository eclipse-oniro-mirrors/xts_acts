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

function checkEq_1(c1: char, c2: char): boolean {
  return c1 == c2
}

function checkEqStrict_1(c1: char, c2: char): boolean {
  return c1 === c2
}

function checkNeq_1(c1: char, c2: char): boolean {
  return c1 != c2
}

function checkNotEq_1(c1: char, c2: char): boolean {
  return !(c1 == c2)
}

function checkNeqStrict_1(c1: char, c2: char): boolean {
  return c1 !== c2
}

function checkNotEqStrict_1(c1: char, c2: char): boolean {
  return !(c1 === c2)
}

export default function NumericalEqualityOperatorsTest() {
  describe("NumericalEqualityOperatorsTest", () => {
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
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_0100
     * @tc.name      testNumericalEqualityOperators0001
     * @tc.desc      Verify equality and inequality operators for char type values with same and different Unicode code points
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = c'a';
      let c2 = c'a';
      let c3 = c'b';

      expect(checkEq_1(c1, c2)).assertTrue()
      expect(checkEqStrict_1(c1, c2)).assertTrue()

      expect(checkNeq_1(c1, c3)).assertTrue()
      expect(checkNotEq_1(c1, c3)).assertTrue()
      expect(checkNeqStrict_1(c1, c3)).assertTrue()
      expect(checkNotEqStrict_1(c1, c3)).assertTrue()
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_0200
     * @tc.name      testNumericalEqualityOperators0002
     * @tc.desc      Verify equality of two identical byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 11
      let right: byte = 11
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_0300
     * @tc.name      testNumericalEqualityOperators0003
     * @tc.desc      Verify inequality of byte and short values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 23
      let right: short = 45
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_0400
     * @tc.name      testNumericalEqualityOperators0004
     * @tc.desc      Verify inequality of byte and int values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 55
      let right: int = 12
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_0500
     * @tc.name      testNumericalEqualityOperators0005
     * @tc.desc      Verify inequality of byte and long values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 13
      let right: long = 24
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_0600
     * @tc.name      testNumericalEqualityOperators0006
     * @tc.desc      Verify equality of byte and float values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 33
      let right: float = 33.0f
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_0700
     * @tc.name      testNumericalEqualityOperators0007
     * @tc.desc      Verify equality of byte and double values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 21
      let right: double = 21.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_0800
     * @tc.name      testNumericalEqualityOperators0008
     * @tc.desc      Verify equality of byte and bigint values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 127
      let right: bigint = 127n
      expect(left.toString()).assertEqual(right.toString());
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_0900
     * @tc.name      testNumericalEqualityOperators0009
     * @tc.desc      Verify equality of negative short and byte values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: short = -3
      let right: byte = -3
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_1000
     * @tc.name      testNumericalEqualityOperators0010
     * @tc.desc      Verify inequality of negative and positive short values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: short = -1
      let right: short = 1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_1100
     * @tc.name      testNumericalEqualityOperators0011
     * @tc.desc      Verify inequality of short and int values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: short = 127
      let right: int = 128
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_1200
     * @tc.name      testNumericalEqualityOperators0012
     * @tc.desc      Verify inequality of negative short and long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: short = -128
      let right: long = -122
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_1300
     * @tc.name      testNumericalEqualityOperators0013
     * @tc.desc      Verify equality of short and float values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: short = 1
      let right: float = 1.0f
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_1400
     * @tc.name      testNumericalEqualityOperators0014
     * @tc.desc      Verify equality of short and double values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: short = 32767
      let right: double = 32767.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_1500
     * @tc.name      testNumericalEqualityOperators0015
     * @tc.desc      Verify equality of negative short and bigint values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: short = -32768
      let right: bigint = -32768n
      expect(left.toString()).assertEqual(right.toString());
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_1600
     * @tc.name      testNumericalEqualityOperators0016
     * @tc.desc      Verify equality of int and byte values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: int = 13
      let right: byte = 13
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_1700
     * @tc.name      testNumericalEqualityOperators0017
     * @tc.desc      Verify inequality of int and short values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: int = 127
      let right: short = 145
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_1800
     * @tc.name      testNumericalEqualityOperators0018
     * @tc.desc      Verify inequality of negative and positive int values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: int = -1
      let right: int = 1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_1900
     * @tc.name      testNumericalEqualityOperators0019
     * @tc.desc      Verify inequality of int and long values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: int = 897
      let right: long = 789
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_2000
     * @tc.name      testNumericalEqualityOperators0020
     * @tc.desc      Verify equality of int and float values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: int = 1342
      let right: float = 1342.0f
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_2100
     * @tc.name      testNumericalEqualityOperators0021
     * @tc.desc      Verify equality of negative int and double values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: int = -9
      let right: double = -9.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_2200
     * @tc.name      testNumericalEqualityOperators0022
     * @tc.desc      Verify equality of int and bigint values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: int = 40000
      let right: bigint = 40000n
      expect(left.toString()).assertEqual(right.toString());
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_2300
     * @tc.name      testNumericalEqualityOperators0023
     * @tc.desc      Verify equality of long and byte values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: long = 1
      let right: byte = 1
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_2400
     * @tc.name      testNumericalEqualityOperators0024
     * @tc.desc      Verify inequality of long and short values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: long = 32768
      let right: short = -32768
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_2500
     * @tc.name      testNumericalEqualityOperators0025
     * @tc.desc      Verify inequality of long and int values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: long = 2341
      let right: int = 12311
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_2600
     * @tc.name      testNumericalEqualityOperators0026
     * @tc.desc      Verify inequality of positive and negative long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: long = 2
      let right: long = -2
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_2700
     * @tc.name      testNumericalEqualityOperators0027
     * @tc.desc      Verify equality of long and float values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: long = 231
      let right: float = 231.0f
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_2800
     * @tc.name      testNumericalEqualityOperators0028
     * @tc.desc      Verify equality of negative long and double values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: long = -1
      let right: double = -1.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_2900
     * @tc.name      testNumericalEqualityOperators0029
     * @tc.desc      Verify equality of long and bigint values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: long = 213
      let right: bigint = 213n
      expect(left.toString()).assertEqual(right.toString());
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_3000
     * @tc.name      testNumericalEqualityOperators0030
     * @tc.desc      Verify equality of float and byte values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: float = 33.0f
      let right: byte = 33
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_3100
     * @tc.name      testNumericalEqualityOperators0031
     * @tc.desc      Verify inequality of float and short values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: float = 32766.9f
      let right: short = 32767
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_3200
     * @tc.name      testNumericalEqualityOperators0032
     * @tc.desc      Verify inequality of float and int values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: float = 11.9f
      let right: int = 12
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_3300
     * @tc.name      testNumericalEqualityOperators0033
     * @tc.desc      Verify inequality of negative float and long values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: float = -0.1f
      let right: long = 0
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_3400
     * @tc.name      testNumericalEqualityOperators0034
     * @tc.desc      Verify equality of two identical float values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: float = 3.14159f
      let right: float = 3.14159f
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_3500
     * @tc.name      testNumericalEqualityOperators0035
     * @tc.desc      Verify equality of negative float and double values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: float = -3.0f
      let right: double = -3.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_3600
     * @tc.name      testNumericalEqualityOperators0036
     * @tc.desc      Verify equality of float and bigint values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: float = 14678.0f
      let right: bigint = 14678n
      expect(left.toString()).assertEqual(right.toString());
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_3700
     * @tc.name      testNumericalEqualityOperators0037
     * @tc.desc      Verify equality of double and byte values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 127.0
      let right: byte = 127
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_3800
     * @tc.name      testNumericalEqualityOperators0038
     * @tc.desc      Verify inequality of double and short values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 7.1
      let right: short = 7
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_3900
     * @tc.name      testNumericalEqualityOperators0039
     * @tc.desc      Verify inequality of double and int values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 12321.1
      let right: int = 12321
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_4000
     * @tc.name      testNumericalEqualityOperators0040
     * @tc.desc      Verify inequality of double and long values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 9863.0
      let right: long = 4
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_4100
     * @tc.name      testNumericalEqualityOperators0041
     * @tc.desc      Verify equality of double and float values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 11.0
      let right: float = 11.0f
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_4200
     * @tc.name      testNumericalEqualityOperators0042
     * @tc.desc      Verify equality of two identical double values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 387.321
      let right: double = 387.321
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_4300
     * @tc.name      testNumericalEqualityOperators0043
     * @tc.desc      Verify equality of double and bigint values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 90.0
      let right: bigint = 90n
      expect(left.toString()).assertEqual(right.toString());
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_4400
     * @tc.name      testNumericalEqualityOperators0044
     * @tc.desc      Verify equality of binary literal byte and bigint values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: bigint = 1n
      let right: byte = 0b1
      expect(left.toString()).assertEqual(right.toString());
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_4500
     * @tc.name      testNumericalEqualityOperators0045
     * @tc.desc      Verify inequality of bigint and short values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: bigint = 1111n
      let right: short = 1112
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_4700
     * @tc.name      testNumericalEqualityOperators0047
     * @tc.desc      Verify equality of negative bigint and int values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: bigint = -2147483648n
      let right: int = -2147483648
      expect(left.toString()).assertEqual(right.toString());
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_4800
     * @tc.name      testNumericalEqualityOperators0048
     * @tc.desc      Verify equality of bigint and long values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: bigint = 2n
      let right: long = 2
      expect(left.toString()).assertEqual(right.toString());
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_4900
     * @tc.name      testNumericalEqualityOperators0049
     * @tc.desc      Verify inequality of bigint and float values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: bigint = 36n
      let right: float = 35.0f
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_5000
     * @tc.name      testNumericalEqualityOperators0050
     * @tc.desc      Verify inequality of bigint and double values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: bigint = 24n
      let right: double = 24.1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_5100
     * @tc.name      testNumericalEqualityOperators0051
     * @tc.desc      Verify inequality of two different bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: bigint = 121n
      let right: bigint = 212n
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_5200
     * @tc.name      testNumericalEqualityOperators0052
     * @tc.desc      Verify inequality of two different byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 2
      let right: byte = 1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_5300
     * @tc.name      testNumericalEqualityOperators0053
     * @tc.desc      Verify inequality of two different byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 1
      let right: byte = 2
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_5400
     * @tc.name      testNumericalEqualityOperators0054
     * @tc.desc      Verify inequality of two different negative byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = -2
      let right: byte = -1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_5500
     * @tc.name      testNumericalEqualityOperators0055
     * @tc.desc      Verify equality of negative byte and short values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = -34
      let right: short = -34
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_5600
     * @tc.name      testNumericalEqualityOperators0056
     * @tc.desc      Verify equality of byte and short values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 3
      let right: short = 3
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_5700
     * @tc.name      testNumericalEqualityOperators0057
     * @tc.desc      Verify equality of byte and short values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 11
      let right: short = 11
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_5800
     * @tc.name      testNumericalEqualityOperators0058
     * @tc.desc      Verify equality of binary literal byte and int values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 0b1000011
      let right: int = 67
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_5900
     * @tc.name      testNumericalEqualityOperators0059
     * @tc.desc      Verify inequality of byte and int values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 2
      let right: int = 1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_6000
     * @tc.name      testNumericalEqualityOperators0060
     * @tc.desc      Verify inequality of byte and int values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 88
      let right: int = 99
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_6100
     * @tc.name      testNumericalEqualityOperators0061
     * @tc.desc      Verify equality of byte and long values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 2
      let right: long = 2
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_6200
     * @tc.name      testNumericalEqualityOperators0062
     * @tc.desc      Verify equality of byte and long values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 4
      let right: long = 4
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_6300
     * @tc.name      testNumericalEqualityOperators0063
     * @tc.desc      Verify inequality of byte and long values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 100
      let right: long = 1000
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_6400
     * @tc.name      testNumericalEqualityOperators0064
     * @tc.desc      Verify inequality of byte and float values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 22
      let right: float = 23.0f
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_6500
     * @tc.name      testNumericalEqualityOperators0065
     * @tc.desc      Verify inequality of byte and negative float values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 33
      let right: float = -33.0f
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_6600
     * @tc.name      testNumericalEqualityOperators0066
     * @tc.desc      Verify inequality of byte and double values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 1
      let right: double = 1.2
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_6700
     * @tc.name      testNumericalEqualityOperators0067
     * @tc.desc      Verify inequality of byte and double values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 24
      let right: double = 789.2
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_6800
     * @tc.name      testNumericalEqualityOperators0068
     * @tc.desc      Verify inequality of byte and bigint values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 1
      let right: bigint = 2n
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_6900
     * @tc.name      testNumericalEqualityOperators0069
     * @tc.desc      Verify inequality of byte and bigint values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: byte = 1
      let right: bigint = 2n
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_7000
     * @tc.name      testNumericalEqualityOperators0070
     * @tc.desc      Verify inequality between normal float and NaN values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0.1;
      let b = sqrt(-1);
      expect(a == b).assertFalse()
      expect(b == a).assertFalse()
      expect(a === b).assertFalse()
      expect(b === a).assertFalse()
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_7100
     * @tc.name      testNumericalEqualityOperators0071
     * @tc.desc      Verify that NaN is not equal to itself
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = sqrt(-1);
      expect(a == a).assertFalse()
      expect(a === a).assertFalse()
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_7200
     * @tc.name      testNumericalEqualityOperators0072
     * @tc.desc      Verify equality between positive zero and negative zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = +0.0;
      let b = -0.0;

      expect(a == b).assertTrue()
      expect(a === b).assertTrue()
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_7300
     * @tc.name      testNumericalEqualityOperators0073
     * @tc.desc      Verify inequality of two different double values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0.1;
      let b = 0.0;

      expect(a == b).assertFalse()
      expect(b == a).assertFalse()
      expect(a === b).assertFalse()
      expect(b === a).assertFalse()
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_7400
     * @tc.name      testNumericalEqualityOperators0074
     * @tc.desc      Verify inequality between normal double and infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0.1;
      let b = -log(0);
      let c = log(0);
      expect(a == b).assertFalse()
      expect(b == a).assertFalse()
      expect(a == c).assertFalse()
      expect(c == a).assertFalse()
      expect(a === b).assertFalse()
      expect(b === a).assertFalse()
      expect(a === c).assertFalse()
      expect(c === a).assertFalse()
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_7500
     * @tc.name      testNumericalEqualityOperators0075
     * @tc.desc      Verify equality of two identical integer values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 5
      let right = 5
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_7600
     * @tc.name      testNumericalEqualityOperators0076
     * @tc.desc      Verify inequality of two different integer values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 10
      let right = 5
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_7900
     * @tc.name      testNumericalEqualityOperators0079
     * @tc.desc      Verify equality of integer and double values with equivalent numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 1
      let right = 1.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_8000
     * @tc.name      testNumericalEqualityOperators0080
     * @tc.desc      Verify inequality of integer and double values with different values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0
      let right = 0.5
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_8100
     * @tc.name      testNumericalEqualityOperators0081
     * @tc.desc      Verify equality between zero and negative zero values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0
      let right = -0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_8900
     * @tc.name      testNumericalEqualityOperators0089
     * @tc.desc      Verify inequality between double and positive infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.1
      let right = Double.POSITIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_9000
     * @tc.name      testNumericalEqualityOperators0090
     * @tc.desc      Verify inequality between double and positive infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.1
      let right = Double.POSITIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_9100
     * @tc.name      testNumericalEqualityOperators0091
     * @tc.desc      Verify inequality between positive infinity and double values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.POSITIVE_INFINITY
      let right = 0.1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_9200
     * @tc.name      testNumericalEqualityOperators0092
     * @tc.desc      Verify inequality between positive infinity and double values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.POSITIVE_INFINITY
      let right = 0.1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_9300
     * @tc.name      testNumericalEqualityOperators0093
     * @tc.desc      Verify inequality between negative infinity and double values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NEGATIVE_INFINITY
      let right = 0.1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_9400
     * @tc.name      testNumericalEqualityOperators0094
     * @tc.desc      Verify inequality between negative infinity and double values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NEGATIVE_INFINITY
      let right = 0.1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_9500
     * @tc.name      testNumericalEqualityOperators0095
     * @tc.desc      Verify inequality between double and negative infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.1
      let right = Double.NEGATIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_9600
     * @tc.name      testNumericalEqualityOperators0096
     * @tc.desc      Verify inequality between double and negative infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.1
      let right = Double.NEGATIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_9700
     * @tc.name      testNumericalEqualityOperators0097
     * @tc.desc      Verify inequality between double and positive infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.3
      let right = Double.POSITIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_9800
     * @tc.name      testNumericalEqualityOperators0098
     * @tc.desc      Verify inequality between double and positive infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.3
      let right = Double.POSITIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_9900
     * @tc.name      testNumericalEqualityOperators0099
     * @tc.desc      Verify inequality between positive infinity and double values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperators0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.POSITIVE_INFINITY
      let right = 0.3
      expect(left).not().assertEqual(right);
    })

  })
}
