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
export default function IntegerBitwiseOperatorsOneTest() {
  describe("IntegerBitwiseOperatorsOneTest", () => {
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
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_0100
     * @tc.name      testIntegerBitwiseOperatorsOne0001
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -52;
      let dest: byte = 12;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_0200
     * @tc.name      testIntegerBitwiseOperatorsOne0002
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -127;
      let dest: byte = 1;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_0300
     * @tc.name      testIntegerBitwiseOperatorsOne0003
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -103;
      let dest: byte = 9;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_0400
     * @tc.name      testIntegerBitwiseOperatorsOne0004
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 102;
      let dest: byte = 6;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_0500
     * @tc.name      testIntegerBitwiseOperatorsOne0005
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 0;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_0600
     * @tc.name      testIntegerBitwiseOperatorsOne0006
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 85;
      let dest: byte = 80;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_0700
     * @tc.name      testIntegerBitwiseOperatorsOne0007
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -86;
      let dest: byte = -96;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_0800
     * @tc.name      testIntegerBitwiseOperatorsOne0008
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 15;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_0900
     * @tc.name      testIntegerBitwiseOperatorsOne0009
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -16;
      let dest: byte = -16;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_1000
     * @tc.name      testIntegerBitwiseOperatorsOne0010
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 51;
      let dest: byte = 48;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_1100
     * @tc.name      testIntegerBitwiseOperatorsOne0011
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -52;
      let dest: byte = -64;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_1200
     * @tc.name      testIntegerBitwiseOperatorsOne0012
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -127;
      let dest: byte = -128;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_1300
     * @tc.name      testIntegerBitwiseOperatorsOne0013
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = -103;
      let dest: byte = -112;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_1400
     * @tc.name      testIntegerBitwiseOperatorsOne0014
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -16;
      let y: byte = 102;
      let dest: byte = 96;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_1500
     * @tc.name      testIntegerBitwiseOperatorsOne0015
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 0;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_1600
     * @tc.name      testIntegerBitwiseOperatorsOne0016
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 85;
      let dest: byte = 17;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_1700
     * @tc.name      testIntegerBitwiseOperatorsOne0017
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -86;
      let dest: byte = 34;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_1800
     * @tc.name      testIntegerBitwiseOperatorsOne0018
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 15;
      let dest: byte = 3;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_1900
     * @tc.name      testIntegerBitwiseOperatorsOne0019
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -16;
      let dest: byte = 48;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_2000
     * @tc.name      testIntegerBitwiseOperatorsOne0020
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 51;
      let dest: byte = 51;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_2100
     * @tc.name      testIntegerBitwiseOperatorsOne0021
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -52;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_2200
     * @tc.name      testIntegerBitwiseOperatorsOne0022
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -127;
      let dest: byte = 1;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_2300
     * @tc.name      testIntegerBitwiseOperatorsOne0023
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = -103;
      let dest: byte = 17;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_2400
     * @tc.name      testIntegerBitwiseOperatorsOne0024
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 51;
      let y: byte = 102;
      let dest: byte = 34;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_2500
     * @tc.name      testIntegerBitwiseOperatorsOne0025
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 0;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_2600
     * @tc.name      testIntegerBitwiseOperatorsOne0026
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 85;
      let dest: byte = 68;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_2700
     * @tc.name      testIntegerBitwiseOperatorsOne0027
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -86;
      let dest: byte = -120;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_2800
     * @tc.name      testIntegerBitwiseOperatorsOne0028
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 15;
      let dest: byte = 12;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_2900
     * @tc.name      testIntegerBitwiseOperatorsOne0029
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -16;
      let dest: byte = -64;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_3000
     * @tc.name      testIntegerBitwiseOperatorsOne0030
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 51;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_3100
     * @tc.name      testIntegerBitwiseOperatorsOne0031
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -52;
      let dest: byte = -52;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_3200
     * @tc.name      testIntegerBitwiseOperatorsOne0032
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -127;
      let dest: byte = -128;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_3300
     * @tc.name      testIntegerBitwiseOperatorsOne0033
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = -103;
      let dest: byte = -120;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_3400
     * @tc.name      testIntegerBitwiseOperatorsOne0034
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -52;
      let y: byte = 102;
      let dest: byte = 68;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_3500
     * @tc.name      testIntegerBitwiseOperatorsOne0035
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 0;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_3600
     * @tc.name      testIntegerBitwiseOperatorsOne0036
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 85;
      let dest: byte = 1;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_3700
     * @tc.name      testIntegerBitwiseOperatorsOne0037
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -86;
      let dest: byte = -128;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_3800
     * @tc.name      testIntegerBitwiseOperatorsOne0038
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 15;
      let dest: byte = 1;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_3900
     * @tc.name      testIntegerBitwiseOperatorsOne0039
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -16;
      let dest: byte = -128;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_4000
     * @tc.name      testIntegerBitwiseOperatorsOne0040
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 51;
      let dest: byte = 1;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_4100
     * @tc.name      testIntegerBitwiseOperatorsOne0041
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -52;
      let dest: byte = -128;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_4200
     * @tc.name      testIntegerBitwiseOperatorsOne0042
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -127;
      let dest: byte = -127;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_4300
     * @tc.name      testIntegerBitwiseOperatorsOne0043
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = -103;
      let dest: byte = -127;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_4400
     * @tc.name      testIntegerBitwiseOperatorsOne0044
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -127;
      let y: byte = 102;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_4500
     * @tc.name      testIntegerBitwiseOperatorsOne0045
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 0;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_4600
     * @tc.name      testIntegerBitwiseOperatorsOne0046
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 85;
      let dest: byte = 17;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_4700
     * @tc.name      testIntegerBitwiseOperatorsOne0047
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -86;
      let dest: byte = -120;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_4800
     * @tc.name      testIntegerBitwiseOperatorsOne0048
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 15;
      let dest: byte = 9;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_4900
     * @tc.name      testIntegerBitwiseOperatorsOne0049
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -16;
      let dest: byte = -112;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_5000
     * @tc.name      testIntegerBitwiseOperatorsOne0050
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 51;
      let dest: byte = 17;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_5100
     * @tc.name      testIntegerBitwiseOperatorsOne0051
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -52;
      let dest: byte = -120;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_5200
     * @tc.name      testIntegerBitwiseOperatorsOne0052
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -127;
      let dest: byte = -127;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_5300
     * @tc.name      testIntegerBitwiseOperatorsOne0053
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = -103;
      let dest: byte = -103;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_5400
     * @tc.name      testIntegerBitwiseOperatorsOne0054
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -103;
      let y: byte = 102;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_5500
     * @tc.name      testIntegerBitwiseOperatorsOne0055
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 0;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_5600
     * @tc.name      testIntegerBitwiseOperatorsOne0056
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 85;
      let dest: byte = 68;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_5700
     * @tc.name      testIntegerBitwiseOperatorsOne0057
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -86;
      let dest: byte = 34;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_5800
     * @tc.name      testIntegerBitwiseOperatorsOne0058
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 15;
      let dest: byte = 6;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_5900
     * @tc.name      testIntegerBitwiseOperatorsOne0059
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -16;
      let dest: byte = 96;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_6000
     * @tc.name      testIntegerBitwiseOperatorsOne0060
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 51;
      let dest: byte = 34;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_6100
     * @tc.name      testIntegerBitwiseOperatorsOne0061
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -52;
      let dest: byte = 68;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_6200
     * @tc.name      testIntegerBitwiseOperatorsOne0062
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -127;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_6300
     * @tc.name      testIntegerBitwiseOperatorsOne0063
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = -103;
      let dest: byte = 0;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_6400
     * @tc.name      testIntegerBitwiseOperatorsOne0064
     * @tc.desc      Integer 'and' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 102;
      let y: byte = 102;
      let dest: byte = 102;
      expect((x & y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_6500
     * @tc.name      testIntegerBitwiseOperatorsOne0065
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 0;
      let dest: byte = 0;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_6600
     * @tc.name      testIntegerBitwiseOperatorsOne0066
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 85;
      let dest: byte = 85;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_6700
     * @tc.name      testIntegerBitwiseOperatorsOne0067
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -86;
      let dest: byte = -86;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_6800
     * @tc.name      testIntegerBitwiseOperatorsOne0068
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 15;
      let dest: byte = 15;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_6900
     * @tc.name      testIntegerBitwiseOperatorsOne0069
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -16;
      let dest: byte = -16;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_7000
     * @tc.name      testIntegerBitwiseOperatorsOne0070
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 51;
      let dest: byte = 51;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_7100
     * @tc.name      testIntegerBitwiseOperatorsOne0071
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -52;
      let dest: byte = -52;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_7200
     * @tc.name      testIntegerBitwiseOperatorsOne0072
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -127;
      let dest: byte = -127;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_7300
     * @tc.name      testIntegerBitwiseOperatorsOne0073
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = -103;
      let dest: byte = -103;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_7400
     * @tc.name      testIntegerBitwiseOperatorsOne0074
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let y: byte = 102;
      let dest: byte = 102;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_7500
     * @tc.name      testIntegerBitwiseOperatorsOne0075
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 0;
      let dest: byte = 85;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_7600
     * @tc.name      testIntegerBitwiseOperatorsOne0076
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 85;
      let dest: byte = 85;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_7700
     * @tc.name      testIntegerBitwiseOperatorsOne0077
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -86;
      let dest: byte = -1;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_7800
     * @tc.name      testIntegerBitwiseOperatorsOne0078
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 15;
      let dest: byte = 95;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_7900
     * @tc.name      testIntegerBitwiseOperatorsOne0079
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -16;
      let dest: byte = -11;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_8000
     * @tc.name      testIntegerBitwiseOperatorsOne0080
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 51;
      let dest: byte = 119;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_8100
     * @tc.name      testIntegerBitwiseOperatorsOne0081
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -52;
      let dest: byte = -35;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_8200
     * @tc.name      testIntegerBitwiseOperatorsOne0082
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -127;
      let dest: byte = -43;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_8300
     * @tc.name      testIntegerBitwiseOperatorsOne0083
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = -103;
      let dest: byte = -35;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_8400
     * @tc.name      testIntegerBitwiseOperatorsOne0084
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 85;
      let y: byte = 102;
      let dest: byte = 119;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_8500
     * @tc.name      testIntegerBitwiseOperatorsOne0085
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 0;
      let dest: byte = -86;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_8600
     * @tc.name      testIntegerBitwiseOperatorsOne0086
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 85;
      let dest: byte = -1;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_8700
     * @tc.name      testIntegerBitwiseOperatorsOne0087
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -86;
      let dest: byte = -86;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_8800
     * @tc.name      testIntegerBitwiseOperatorsOne0088
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 15;
      let dest: byte = -81;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_8900
     * @tc.name      testIntegerBitwiseOperatorsOne0089
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -16;
      let dest: byte = -6;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_9000
     * @tc.name      testIntegerBitwiseOperatorsOne0090
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 51;
      let dest: byte = -69;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_9100
     * @tc.name      testIntegerBitwiseOperatorsOne0091
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -52;
      let dest: byte = -18;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_9200
     * @tc.name      testIntegerBitwiseOperatorsOne0092
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -127;
      let dest: byte = -85;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_9300
     * @tc.name      testIntegerBitwiseOperatorsOne0093
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = -103;
      let dest: byte = -69;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_9400
     * @tc.name      testIntegerBitwiseOperatorsOne0094
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -86;
      let y: byte = 102;
      let dest: byte = -18;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_9500
     * @tc.name      testIntegerBitwiseOperatorsOne0095
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 0;
      let dest: byte = 15;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_9600
     * @tc.name      testIntegerBitwiseOperatorsOne0096
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 85;
      let dest: byte = 95;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_9700
     * @tc.name      testIntegerBitwiseOperatorsOne0097
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -86;
      let dest: byte = -81;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_9800
     * @tc.name      testIntegerBitwiseOperatorsOne0098
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = 15;
      let dest: byte = 15;
      expect((x | y)).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_INTEGER_BITWISE_OPERATORS_ONE_9900
     * @tc.name      testIntegerBitwiseOperatorsOne0099
     * @tc.desc      Integer 'or' operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntegerBitwiseOperatorsOne0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 15;
      let y: byte = -16;
      let dest: byte = -1;
      expect((x | y)).assertEqual(dest);
    })
  })
}