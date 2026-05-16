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
export default function IntegerBitwiseOperatorsThreeTest() {
  describe("IntegerBitwiseOperatorsThreeTest", () => {
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
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_0100
     * @tc.name      testIntegerBitwiseOperatorsThree0001
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -16;
      let dest: byte = -1;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_0200
     * @tc.name      testIntegerBitwiseOperatorsThree0002
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 51;
      let dest: byte = 60;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_0300
     * @tc.name      testIntegerBitwiseOperatorsThree0003
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -52;
      let dest: byte = -61;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_0400
     * @tc.name      testIntegerBitwiseOperatorsThree0004
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -127;
      let dest: byte = -114;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_0500
     * @tc.name      testIntegerBitwiseOperatorsThree0005
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -103;
      let dest: byte = -106;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_0600
     * @tc.name      testIntegerBitwiseOperatorsThree0006
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 102;
      let dest: byte = 105;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_0700
     * @tc.name      testIntegerBitwiseOperatorsThree0007
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 0;
      let dest: byte = -16;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_0800
     * @tc.name      testIntegerBitwiseOperatorsThree0008
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 85;
      let dest: byte = -91;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_0900
     * @tc.name      testIntegerBitwiseOperatorsThree0009
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -86;
      let dest: byte = 90;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_1000
     * @tc.name      testIntegerBitwiseOperatorsThree0010
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 15;
      let dest: byte = -1;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_1100
     * @tc.name      testIntegerBitwiseOperatorsThree0011
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -16;
      let dest: byte = 0;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_1200
     * @tc.name      testIntegerBitwiseOperatorsThree0012
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 51;
      let dest: byte = -61;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_1300
     * @tc.name      testIntegerBitwiseOperatorsThree0013
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -52;
      let dest: byte = 60;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_1400
     * @tc.name      testIntegerBitwiseOperatorsThree0014
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -127;
      let dest: byte = 113;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_1500
     * @tc.name      testIntegerBitwiseOperatorsThree0015
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -103;
      let dest: byte = 105;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_1600
     * @tc.name      testIntegerBitwiseOperatorsThree0016
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 102;
      let dest: byte = -106;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_1700
     * @tc.name      testIntegerBitwiseOperatorsThree0017
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 0;
      let dest: byte = 51;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_1800
     * @tc.name      testIntegerBitwiseOperatorsThree0018
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 85;
      let dest: byte = 102;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_1900
     * @tc.name      testIntegerBitwiseOperatorsThree0019
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -86;
      let dest: byte = -103;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_2000
     * @tc.name      testIntegerBitwiseOperatorsThree0020
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 15;
      let dest: byte = 60;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_2100
     * @tc.name      testIntegerBitwiseOperatorsThree0021
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -16;
      let dest: byte = -61;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_2200
     * @tc.name      testIntegerBitwiseOperatorsThree0022
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 51;
      let dest: byte = 0;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_2300
     * @tc.name      testIntegerBitwiseOperatorsThree0023
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -52;
      let dest: byte = -1;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_2400
     * @tc.name      testIntegerBitwiseOperatorsThree0024
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -127;
      let dest: byte = -78;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_2500
     * @tc.name      testIntegerBitwiseOperatorsThree0025
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -103;
      let dest: byte = -86;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_2600
     * @tc.name      testIntegerBitwiseOperatorsThree0026
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 102;
      let dest: byte = 85;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_2700
     * @tc.name      testIntegerBitwiseOperatorsThree0027
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 0;
      let dest: byte = -52;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_2800
     * @tc.name      testIntegerBitwiseOperatorsThree0028
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 85;
      let dest: byte = -103;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_2900
     * @tc.name      testIntegerBitwiseOperatorsThree0029
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -86;
      let dest: byte = 102;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_3000
     * @tc.name      testIntegerBitwiseOperatorsThree0030
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 15;
      let dest: byte = -61;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_3100
     * @tc.name      testIntegerBitwiseOperatorsThree0031
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -16;
      let dest: byte = 60;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_3200
     * @tc.name      testIntegerBitwiseOperatorsThree0032
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 51;
      let dest: byte = -1;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_3300
     * @tc.name      testIntegerBitwiseOperatorsThree0033
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -52;
      let dest: byte = 0;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_3400
     * @tc.name      testIntegerBitwiseOperatorsThree0034
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -127;
      let dest: byte = 77;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_3500
     * @tc.name      testIntegerBitwiseOperatorsThree0035
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -103;
      let dest: byte = 85;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_3600
     * @tc.name      testIntegerBitwiseOperatorsThree0036
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 102;
      let dest: byte = -86;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_3700
     * @tc.name      testIntegerBitwiseOperatorsThree0037
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 0;
      let dest: byte = -127;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_3800
     * @tc.name      testIntegerBitwiseOperatorsThree0038
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 85;
      let dest: byte = -44;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_3900
     * @tc.name      testIntegerBitwiseOperatorsThree0039
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -86;
      let dest: byte = 43;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_4000
     * @tc.name      testIntegerBitwiseOperatorsThree0040
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 15;
      let dest: byte = -114;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_4100
     * @tc.name      testIntegerBitwiseOperatorsThree0041
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -16;
      let dest: byte = 113;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_4200
     * @tc.name      testIntegerBitwiseOperatorsThree0042
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 51;
      let dest: byte = -78;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_4300
     * @tc.name      testIntegerBitwiseOperatorsThree0043
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -52;
      let dest: byte = 77;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_4400
     * @tc.name      testIntegerBitwiseOperatorsThree0044
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -127;
      let dest: byte = 0;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_4500
     * @tc.name      testIntegerBitwiseOperatorsThree0045
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -103;
      let dest: byte = 24;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_4600
     * @tc.name      testIntegerBitwiseOperatorsThree0046
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 102;
      let dest: byte = -25;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_4700
     * @tc.name      testIntegerBitwiseOperatorsThree0047
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 0;
      let dest: byte = -103;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_4800
     * @tc.name      testIntegerBitwiseOperatorsThree0048
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 85;
      let dest: byte = -52;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_4900
     * @tc.name      testIntegerBitwiseOperatorsThree0049
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -86;
      let dest: byte = 51;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_5000
     * @tc.name      testIntegerBitwiseOperatorsThree0050
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 15;
      let dest: byte = -106;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_5100
     * @tc.name      testIntegerBitwiseOperatorsThree0051
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -16;
      let dest: byte = 105;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_5200
     * @tc.name      testIntegerBitwiseOperatorsThree0052
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 51;
      let dest: byte = -86;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_5300
     * @tc.name      testIntegerBitwiseOperatorsThree0053
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -52;
      let dest: byte = 85;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_5400
     * @tc.name      testIntegerBitwiseOperatorsThree0054
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -127;
      let dest: byte = 24;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_5500
     * @tc.name      testIntegerBitwiseOperatorsThree0055
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -103;
      let dest: byte = 0;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_5600
     * @tc.name      testIntegerBitwiseOperatorsThree0056
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 102;
      let dest: byte = -1;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_5700
     * @tc.name      testIntegerBitwiseOperatorsThree0057
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 0;
      let dest: byte = 102;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_5800
     * @tc.name      testIntegerBitwiseOperatorsThree0058
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 85;
      let dest: byte = 51;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_5900
     * @tc.name      testIntegerBitwiseOperatorsThree0059
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -86;
      let dest: byte = -52;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_6000
     * @tc.name      testIntegerBitwiseOperatorsThree0060
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 15;
      let dest: byte = 105;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_6100
     * @tc.name      testIntegerBitwiseOperatorsThree0061
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -16;
      let dest: byte = -106;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_6200
     * @tc.name      testIntegerBitwiseOperatorsThree0062
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 51;
      let dest: byte = 85;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_6300
     * @tc.name      testIntegerBitwiseOperatorsThree0063
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -52;
      let dest: byte = -86;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_6400
     * @tc.name      testIntegerBitwiseOperatorsThree0064
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -127;
      let dest: byte = -25;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_6500
     * @tc.name      testIntegerBitwiseOperatorsThree0065
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -103;
      let dest: byte = -1;
      expect((x ^ y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_THREE_6600
     * @tc.name      testIntegerBitwiseOperatorsThree0066
     * @tc.desc      Integer 'xor' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsThree0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 102;
      let dest: byte = 0;
      expect((x ^ y)).assertEqual(dest);
    })
  })
}