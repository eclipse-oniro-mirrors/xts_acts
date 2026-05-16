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

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function IntegerBitwiseOperatorsTwoTest() {
  describe("IntegerBitwiseOperatorsTwoTest", () => {
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
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_0100
     * @tc.name      testIntegerBitwiseOperatorsTwo0001
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 51;
      let dest: byte = 63;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_0200
     * @tc.name      testIntegerBitwiseOperatorsTwo0002
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -52;
      let dest: byte = -49;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_0300
     * @tc.name      testIntegerBitwiseOperatorsTwo0003
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -127;
      let dest: byte = -113;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_0400
     * @tc.name      testIntegerBitwiseOperatorsTwo0004
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -103;
      let dest: byte = -97;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_0500
     * @tc.name      testIntegerBitwiseOperatorsTwo0005
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 102;
      let dest: byte = 111;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_0600
     * @tc.name      testIntegerBitwiseOperatorsTwo0006
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 0;
      let dest: byte = -16;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_0700
     * @tc.name      testIntegerBitwiseOperatorsTwo0007
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 85;
      let dest: byte = -11;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_0800
     * @tc.name      testIntegerBitwiseOperatorsTwo0008
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -86;
      let dest: byte = -6;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_0900
     * @tc.name      testIntegerBitwiseOperatorsTwo0009
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 15;
      let dest: byte = -1;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_1000
     * @tc.name      testIntegerBitwiseOperatorsTwo0010
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -16;
      let dest: byte = -16;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_1100
     * @tc.name      testIntegerBitwiseOperatorsTwo0011
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 51;
      let dest: byte = -13;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_1200
     * @tc.name      testIntegerBitwiseOperatorsTwo0012
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -52;
      let dest: byte = -4;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_1300
     * @tc.name      testIntegerBitwiseOperatorsTwo0013
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -127;
      let dest: byte = -15;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_1400
     * @tc.name      testIntegerBitwiseOperatorsTwo0014
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -103;
      let dest: byte = -7;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_1500
     * @tc.name      testIntegerBitwiseOperatorsTwo0015
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 102;
      let dest: byte = -10;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_1600
     * @tc.name      testIntegerBitwiseOperatorsTwo0016
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 0;
      let dest: byte = 51;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_1700
     * @tc.name      testIntegerBitwiseOperatorsTwo0017
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 85;
      let dest: byte = 119;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_1800
     * @tc.name      testIntegerBitwiseOperatorsTwo0018
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -86;
      let dest: byte = -69;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_1900
     * @tc.name      testIntegerBitwiseOperatorsTwo0019
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 15;
      let dest: byte = 63;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_2000
     * @tc.name      testIntegerBitwiseOperatorsTwo0020
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -16;
      let dest: byte = -13;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_2100
     * @tc.name      testIntegerBitwiseOperatorsTwo0021
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 51;
      let dest: byte = 51;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_2200
     * @tc.name      testIntegerBitwiseOperatorsTwo0022
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -52;
      let dest: byte = -1;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_2300
     * @tc.name      testIntegerBitwiseOperatorsTwo0023
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -127;
      let dest: byte = -77;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_2400
     * @tc.name      testIntegerBitwiseOperatorsTwo0024
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -103;
      let dest: byte = -69;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_2500
     * @tc.name      testIntegerBitwiseOperatorsTwo0025
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 102;
      let dest: byte = 119;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_2600
     * @tc.name      testIntegerBitwiseOperatorsTwo0026
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 0;
      let dest: byte = -52;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_2700
     * @tc.name      testIntegerBitwiseOperatorsTwo0027
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 85;
      let dest: byte = -35;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_2800
     * @tc.name      testIntegerBitwiseOperatorsTwo0028
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -86;
      let dest: byte = -18;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_2900
     * @tc.name      testIntegerBitwiseOperatorsTwo0029
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 15;
      let dest: byte = -49;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_3000
     * @tc.name      testIntegerBitwiseOperatorsTwo0030
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -16;
      let dest: byte = -4;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_3100
     * @tc.name      testIntegerBitwiseOperatorsTwo0031
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 51;
      let dest: byte = -1;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_3200
     * @tc.name      testIntegerBitwiseOperatorsTwo0032
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -52;
      let dest: byte = -52;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_3300
     * @tc.name      testIntegerBitwiseOperatorsTwo0033
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -127;
      let dest: byte = -51;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_3400
     * @tc.name      testIntegerBitwiseOperatorsTwo0034
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -103;
      let dest: byte = -35;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_3500
     * @tc.name      testIntegerBitwiseOperatorsTwo0035
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 102;
      let dest: byte = -18;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_3600
     * @tc.name      testIntegerBitwiseOperatorsTwo0036
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 0;
      let dest: byte = -127;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_3700
     * @tc.name      testIntegerBitwiseOperatorsTwo0037
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 85;
      let dest: byte = -43;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_3800
     * @tc.name      testIntegerBitwiseOperatorsTwo0038
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -86;
      let dest: byte = -85;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_3900
     * @tc.name      testIntegerBitwiseOperatorsTwo0039
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 15;
      let dest: byte = -113;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_4000
     * @tc.name      testIntegerBitwiseOperatorsTwo0040
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -16;
      let dest: byte = -15;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_4100
     * @tc.name      testIntegerBitwiseOperatorsTwo0041
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 51;
      let dest: byte = -77;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_4200
     * @tc.name      testIntegerBitwiseOperatorsTwo0042
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -52;
      let dest: byte = -51;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_4300
     * @tc.name      testIntegerBitwiseOperatorsTwo0043
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -127;
      let dest: byte = -127;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_4400
     * @tc.name      testIntegerBitwiseOperatorsTwo0044
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -103;
      let dest: byte = -103;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_4500
     * @tc.name      testIntegerBitwiseOperatorsTwo0045
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 102;
      let dest: byte = -25;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_4600
     * @tc.name      testIntegerBitwiseOperatorsTwo0046
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 0;
      let dest: byte = -103;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_4700
     * @tc.name      testIntegerBitwiseOperatorsTwo0047
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 85;
      let dest: byte = -35;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_4800
     * @tc.name      testIntegerBitwiseOperatorsTwo0048
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -86;
      let dest: byte = -69;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_4900
     * @tc.name      testIntegerBitwiseOperatorsTwo0049
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 15;
      let dest: byte = -97;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_5000
     * @tc.name      testIntegerBitwiseOperatorsTwo0050
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -16;
      let dest: byte = -7;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_5100
     * @tc.name      testIntegerBitwiseOperatorsTwo0051
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 51;
      let dest: byte = -69;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_5200
     * @tc.name      testIntegerBitwiseOperatorsTwo0052
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -52;
      let dest: byte = -35;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_5300
     * @tc.name      testIntegerBitwiseOperatorsTwo0053
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -127;
      let dest: byte = -103;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_5400
     * @tc.name      testIntegerBitwiseOperatorsTwo0054
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -103;
      let dest: byte = -103;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_5500
     * @tc.name      testIntegerBitwiseOperatorsTwo0055
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 102;
      let dest: byte = -1;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_5600
     * @tc.name      testIntegerBitwiseOperatorsTwo0056
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 0;
      let dest: byte = 102;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_5700
     * @tc.name      testIntegerBitwiseOperatorsTwo0057
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 85;
      let dest: byte = 119;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_5800
     * @tc.name      testIntegerBitwiseOperatorsTwo0058
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -86;
      let dest: byte = -18;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_5900
     * @tc.name      testIntegerBitwiseOperatorsTwo0059
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 15;
      let dest: byte = 111;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_6000
     * @tc.name      testIntegerBitwiseOperatorsTwo0060
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -16;
      let dest: byte = -10;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_6100
     * @tc.name      testIntegerBitwiseOperatorsTwo0061
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 51;
      let dest: byte = 119;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_6200
     * @tc.name      testIntegerBitwiseOperatorsTwo0062
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -52;
      let dest: byte = -18;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_6300
     * @tc.name      testIntegerBitwiseOperatorsTwo0063
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -127;
      let dest: byte = -25;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_6400
     * @tc.name      testIntegerBitwiseOperatorsTwo0064
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -103;
      let dest: byte = -1;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_6500
     * @tc.name      testIntegerBitwiseOperatorsTwo0065
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 102;
      let dest: byte = 102;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_6600
     * @tc.name      testIntegerBitwiseOperatorsTwo0066
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 0;
      let dest: byte = 0;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_6700
     * @tc.name      testIntegerBitwiseOperatorsTwo0067
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 85;
      let dest: byte = 85;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_6800
     * @tc.name      testIntegerBitwiseOperatorsTwo0068
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -86;
      let dest: byte = -86;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_6900
     * @tc.name      testIntegerBitwiseOperatorsTwo0069
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 15;
      let dest: byte = 15;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_7000
     * @tc.name      testIntegerBitwiseOperatorsTwo0070
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -16;
      let dest: byte = -16;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_7100
     * @tc.name      testIntegerBitwiseOperatorsTwo0071
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 51;
      let dest: byte = 51;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_7200
     * @tc.name      testIntegerBitwiseOperatorsTwo0072
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -52;
      let dest: byte = -52;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_7300
     * @tc.name      testIntegerBitwiseOperatorsTwo0073
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -127;
      let dest: byte = -127;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_7400
     * @tc.name      testIntegerBitwiseOperatorsTwo0074
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -103;
      let dest: byte = -103;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_7500
     * @tc.name      testIntegerBitwiseOperatorsTwo0075
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 102;
      let dest: byte = 102;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_7600
     * @tc.name      testIntegerBitwiseOperatorsTwo0076
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 0;
      let dest: byte = 85;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_7700
     * @tc.name      testIntegerBitwiseOperatorsTwo0077
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 85;
      let dest: byte = 0;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_7800
     * @tc.name      testIntegerBitwiseOperatorsTwo0078
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -86;
      let dest: byte = -1;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_7900
     * @tc.name      testIntegerBitwiseOperatorsTwo0079
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 15;
      let dest: byte = 90;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_8000
     * @tc.name      testIntegerBitwiseOperatorsTwo0080
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -16;
      let dest: byte = -91;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_8100
     * @tc.name      testIntegerBitwiseOperatorsTwo0081
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 51;
      let dest: byte = 102;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_8200
     * @tc.name      testIntegerBitwiseOperatorsTwo0082
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -52;
      let dest: byte = -103;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_8300
     * @tc.name      testIntegerBitwiseOperatorsTwo0083
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -127;
      let dest: byte = -44;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_8400
     * @tc.name      testIntegerBitwiseOperatorsTwo0084
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -103;
      let dest: byte = -52;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_8500
     * @tc.name      testIntegerBitwiseOperatorsTwo0085
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 102;
      let dest: byte = 51;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_8600
     * @tc.name      testIntegerBitwiseOperatorsTwo0086
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 0;
      let dest: byte = -86;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_8700
     * @tc.name      testIntegerBitwiseOperatorsTwo0087
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 85;
      let dest: byte = -1;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_8800
     * @tc.name      testIntegerBitwiseOperatorsTwo0088
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -86;
      let dest: byte = 0;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_8900
     * @tc.name      testIntegerBitwiseOperatorsTwo0089
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 15;
      let dest: byte = -91;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_9000
     * @tc.name      testIntegerBitwiseOperatorsTwo0090
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -16;
      let dest: byte = 90;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_9100
     * @tc.name      testIntegerBitwiseOperatorsTwo0091
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 51;
      let dest: byte = -103;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_9200
     * @tc.name      testIntegerBitwiseOperatorsTwo0092
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -52;
      let dest: byte = 102;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_9300
     * @tc.name      testIntegerBitwiseOperatorsTwo0093
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -127;
      let dest: byte = 43;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_9400
     * @tc.name      testIntegerBitwiseOperatorsTwo0094
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -103;
      let dest: byte = 51;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_9500
     * @tc.name      testIntegerBitwiseOperatorsTwo0095
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 102;
      let dest: byte = -52;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_9600
     * @tc.name      testIntegerBitwiseOperatorsTwo0096
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 0;
      let dest: byte = 15;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_9700
     * @tc.name      testIntegerBitwiseOperatorsTwo0097
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 85;
      let dest: byte = 90;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_9800
     * @tc.name      testIntegerBitwiseOperatorsTwo0098
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -86;
      let dest: byte = -91;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_TWO_9900
     * @tc.name      testIntegerBitwiseOperatorsTwo0099
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsTwo0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 15;
      let dest: byte = 0;
      expect((x ^ y)).assertEqual(dest);
    })
  })
}