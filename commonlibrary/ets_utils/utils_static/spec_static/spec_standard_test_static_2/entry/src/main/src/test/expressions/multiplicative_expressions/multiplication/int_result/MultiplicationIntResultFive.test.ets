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
} from "../../../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function MultiplicationIntResultFiveTest(): void {
  describe("MultiplicationIntResultFiveTest", () => {
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
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_0100
     * @tc.name      testMultiplicationIntResultFive0001
     * @tc.desc      47. Multiplication of three decimal ints.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_47 = -23 * 10 * -11
      expect(result_47 instanceof int).assertTrue()
      expect(result_47).assertEqual(2530);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_0200
     * @tc.name      testMultiplicationIntResultFive0002
     * @tc.desc      48. Multiplication of three ints (octal, binary, nex).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_48 = 0o234_5 * 0b010_110 * -0xAdF_3
      expect(result_48 instanceof int).assertTrue()
      expect(result_48).assertEqual(-1227541546);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_0300
     * @tc.name      testMultiplicationIntResultFive0003
     * @tc.desc      49. Multiplication of three 0-s (octal, binary and nex format).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_49 = 0o0 * -0x00 * 0b00_00
      expect(result_49 instanceof int).assertTrue()
      expect(result_49).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_0400
     * @tc.name      testMultiplicationIntResultFive0004
     * @tc.desc      50. Multiplication of ints. Alias Int (binary, hex).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_50 = new Int(0b101) * new Int(-0x234A)
      expect(result_50 instanceof int).assertTrue()
      expect(result_50).assertEqual(-45170);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_0500
     * @tc.name      testMultiplicationIntResultFive0005
     * @tc.desc      51. Multiplication of ints. Alias Int (decimal).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_51 = new Int(123) * 0o23_7
      expect(result_51 instanceof int).assertTrue()
      expect(result_51).assertEqual(19557);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_0600
     * @tc.name      testMultiplicationIntResultFive0006
     * @tc.desc      52. Multiplication of ints. Alias Int (octal).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_52 = -34 * new Int(-0o17)
      expect(result_52 instanceof int).assertTrue()
      expect(result_52).assertEqual(510);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_0700
     * @tc.name      testMultiplicationIntResultFive0007
     * @tc.desc      53. Multiplication of two decimal ints and alias Byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_53 = -23 * new Byte(10) * -11
      expect(result_53 instanceof int).assertTrue()
      expect(result_53).assertEqual(2530);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_0800
     * @tc.name      testMultiplicationIntResultFive0008
     * @tc.desc      54. Multiplication of two ints and alias Short.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_54 = 0o234_5 * -0xAdF_3 * new Short(0b010_110)
      expect(result_54 instanceof int).assertTrue()
      expect(result_54).assertEqual(-1227541546);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_0900
     * @tc.name      testMultiplicationIntResultFive0009
     * @tc.desc      55. Multiplication of Max Int and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_55 = Int.MAX_VALUE * -1
      expect(result_55 instanceof int).assertTrue()
      expect(result_55).assertEqual(-2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_1000
     * @tc.name      testMultiplicationIntResultFive0010
     * @tc.desc      56. Multiplication of Max Int and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_56 = Int.MAX_VALUE * 1
      expect(result_56 instanceof int).assertTrue()
      expect(result_56).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_1100
     * @tc.name      testMultiplicationIntResultFive0011
     * @tc.desc      57. Multiplication of Max Int and 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_57 = Int.MAX_VALUE * 0
      expect(result_57 instanceof int).assertTrue()
      expect(result_57).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_1200
     * @tc.name      testMultiplicationIntResultFive0012
     * @tc.desc      58. Multiplication of negative Max Int and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_58 = -Int.MAX_VALUE * -1
      expect(result_58 instanceof int).assertTrue()
      expect(result_58).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_1300
     * @tc.name      testMultiplicationIntResultFive0013
     * @tc.desc      59. Multiplication of Min Int and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_59 = Int.MIN_VALUE * 1
      expect(result_59 instanceof int).assertTrue()
      expect(result_59).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_1400
     * @tc.name      testMultiplicationIntResultFive0014
     * @tc.desc      60. Multiplication of Min Int and 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_60 = Int.MIN_VALUE * 0
      expect(result_60 instanceof int).assertTrue()
      expect(result_60).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_1500
     * @tc.name      testMultiplicationIntResultFive0015
     * @tc.desc      61. Multiplication of negative Min Int and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_61 = -Int.MIN_VALUE * -1
      expect(result_61 instanceof int).assertTrue()
      expect(result_61).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_1600
     * @tc.name      testMultiplicationIntResultFive0016
     * @tc.desc      62. Multiplication of Max Int (decimal) and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_62 = 2147483647 * 1
      expect(result_62 instanceof int).assertTrue()
      expect(result_62).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_1700
     * @tc.name      testMultiplicationIntResultFive0017
     * @tc.desc      63. Multiplication of Max Int (hex) and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_63 = 0x7FFffFFF * 1
      expect(result_63 instanceof int).assertTrue()
      expect(result_63).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_1800
     * @tc.name      testMultiplicationIntResultFive0018
     * @tc.desc      64. Multiplication of Max Int (octal) and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_64 = 0O17777_777_777 * 1
      expect(result_64 instanceof int).assertTrue()
      expect(result_64).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_1900
     * @tc.name      testMultiplicationIntResultFive0019
     * @tc.desc      65. Multiplication of Max Int (binary) and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_65 = 0b11111111111111111111111_1111_1111 * 1
      expect(result_65 instanceof int).assertTrue()
      expect(result_65).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_2000
     * @tc.name      testMultiplicationIntResultFive0020
     * @tc.desc      66. Multiplication of Min Int (decimal) and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_66 = -2147483648 * 1
      expect(result_66 instanceof int).assertTrue()
      expect(result_66).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_2100
     * @tc.name      testMultiplicationIntResultFive0021
     * @tc.desc      67. Multiplication of Min Int (hex) and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_67 = -0X80000_000 * 1
      expect(result_67).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_2200
     * @tc.name      testMultiplicationIntResultFive0022
     * @tc.desc      68. Multiplication of Min Int (octal) and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_68 = -0o20000000000 * 1
      expect(result_68).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_2300
     * @tc.name      testMultiplicationIntResultFive0023
     * @tc.desc      69. Multiplication of Min Int (binary) and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_69 = -0B10000000000000000000000000000000 * 1
      expect(result_69).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_2400
     * @tc.name      testMultiplicationIntResultFive0024
     * @tc.desc      70. Multiplication of ints with the type conversion by toInt().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_70 = (+10).toInt() * (+0b101).toInt()
      expect(result_70 instanceof int).assertTrue()
      expect(result_70).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_2500
     * @tc.name      testMultiplicationIntResultFive0025
     * @tc.desc      71. Multiplication of ints with the type conversion by toInt().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_71 = (-0o007).toInt() * (0xb).toInt()
      expect(result_71 instanceof int).assertTrue()
      expect(result_71).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_2600
     * @tc.name      testMultiplicationIntResultFive0026
     * @tc.desc      72. Multiplication of ints with the type conversion by toInt().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_72 = (-0xA).toInt() * (-0B10).toInt()
      expect(result_72 instanceof int).assertTrue()
      expect(result_72).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_FIVE_2700
     * @tc.name      testMultiplicationIntResultFive0027
     * @tc.desc      73. Multiplication of ints with the type conversion by toInt().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultFive0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_73 = (0b101).toInt() * (-12).toInt()
      expect(result_73 instanceof int).assertTrue()
      expect(result_73).assertEqual(-60);
    });
  });
}
