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

export default function MultiplicationIntResultTwoTest(): void {
  describe("MultiplicationIntResultTwoTest", () => {
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
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_0100
     * @tc.name      testMultiplicationIntResultTwo0001
     * @tc.desc      46. Integer Overflows. Multiplication of Min and negative ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -2147483648
      let value2: int = -12
      const result_46 = value1 * value2
      expect(result_46 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_0200
     * @tc.name      testMultiplicationIntResultTwo0002
     * @tc.desc      47. Multiplication of three decimal ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -23
      let value2: Int = 10
      let value3: int = -11
      let result_47 = value1 * value2 * value3
      expect(result_47 instanceof int).assertTrue()
      expect(result_47).assertEqual(2530);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_0300
     * @tc.name      testMultiplicationIntResultTwo0003
     * @tc.desc      48. Multiplication of three ints (octal, binary, hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0o234_5
      let value2: int = 0b010_110
      let value3: int = -0xAdF_3
      const result_48 = value1 * value2 * value3
      expect(result_48 instanceof int).assertTrue()
      expect(result_48).assertEqual(-1227541546);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_0400
     * @tc.name      testMultiplicationIntResultTwo0004
     * @tc.desc      49. Multiplication of three 0-s (octal, binary and hex format). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0o0
      let value2: int = -0x00
      let value3: int = 0b00_00
      let result_49 = value1 * value2 * value3
      expect(result_49 instanceof int).assertTrue()
      expect(result_49).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_0500
     * @tc.name      testMultiplicationIntResultTwo0005
     * @tc.desc      50. Multiplication of ints. Alias Int (binary, hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = new Int(0b101)
      let value2: Int = new Int(-0x234A)
      const result_50 = value1 * value2
      expect(result_50 instanceof int).assertTrue()
      expect(result_50).assertEqual(-45170);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_0600
     * @tc.name      testMultiplicationIntResultTwo0006
     * @tc.desc      51. Multiplication of ints. Alias Int (decimal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = new Int(123)
      let value2: int = 0o23_7
      let result_51 = value1 * value2
      expect(result_51 instanceof int).assertTrue()
      expect(result_51).assertEqual(19557);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_0700
     * @tc.name      testMultiplicationIntResultTwo0007
     * @tc.desc      52. Multiplication of ints. Alias Int (octal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -34
      let value2: Int = new Int(-0o17)
      const result_52 = value1 * value2
      expect(result_52 instanceof int).assertTrue()
      expect(result_52).assertEqual(510);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_0800
     * @tc.name      testMultiplicationIntResultTwo0008
     * @tc.desc      53. Multiplication of two decimal ints and alias Byte. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -23
      let value2: Byte = new Byte(10)
      let value3: int = -11
      let result_53 = value1 * value2 * value3
      expect(result_53 instanceof int).assertTrue()
      expect(result_53).assertEqual(2530);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_0900
     * @tc.name      testMultiplicationIntResultTwo0009
     * @tc.desc      54. Multiplication of two ints and alias Short. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0o234_5
      let value2: int = -0xAdF_3
      let value3: Short = new Short(0b010_110)
      const result_54 = value1 * value2 * value3
      expect(result_54 instanceof int).assertTrue()
      expect(result_54).assertEqual(-1227541546);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_1000
     * @tc.name      testMultiplicationIntResultTwo0010
     * @tc.desc      55. Multiplication of Max Int and -1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MAX_VALUE
      let value2: int = -1
      let result_55 = value1 * value2
      expect(result_55 instanceof int).assertTrue()
      expect(result_55).assertEqual(-2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_1100
     * @tc.name      testMultiplicationIntResultTwo0011
     * @tc.desc      56. Multiplication of Max Int and 1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MAX_VALUE
      let value2: int = 1
      const result_56 = value1 * value2
      expect(result_56 instanceof int).assertTrue()
      expect(result_56).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_1200
     * @tc.name      testMultiplicationIntResultTwo0012
     * @tc.desc      57. Multiplication of Max Int and 0. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = Int.MAX_VALUE
      let value2: int = 0
      let result_57 = value1 * value2
      expect(result_57 instanceof int).assertTrue()
      expect(result_57).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_1300
     * @tc.name      testMultiplicationIntResultTwo0013
     * @tc.desc      58. Multiplication of negative Max Int and -1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -Int.MAX_VALUE
      let value2: int = -1
      const result_58 = value1 * value2
      expect(result_58 instanceof int).assertTrue()
      expect(result_58).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_1400
     * @tc.name      testMultiplicationIntResultTwo0014
     * @tc.desc      59. Multiplication of Min Int and 1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MIN_VALUE
      let value2: int = 1
      let result_59 = value1 * value2
      expect(result_59 instanceof int).assertTrue()
      expect(result_59).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_1500
     * @tc.name      testMultiplicationIntResultTwo0015
     * @tc.desc      60. Multiplication of Min Int and 0. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = Int.MIN_VALUE
      let value2: int = 0
      const result_60 = value1 * value2
      expect(result_60 instanceof int).assertTrue()
      expect(result_60).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_1600
     * @tc.name      testMultiplicationIntResultTwo0016
     * @tc.desc      61. Multiplication of negative Min Int and -1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -Int.MIN_VALUE
      let value2: int = -1
      let result_61 = value1 * value2
      expect(result_61 instanceof int).assertTrue()
      expect(result_61).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_1700
     * @tc.name      testMultiplicationIntResultTwo0017
     * @tc.desc      62. Multiplication of Max Int (decimal) and 1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 2147483647
      let value2: int = 1
      const result_62 = value1 * value2
      expect(result_62 instanceof int).assertTrue()
      expect(result_62).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_1800
     * @tc.name      testMultiplicationIntResultTwo0018
     * @tc.desc      63. Multiplication of Max Int (hex) and 1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0x7FFffFFF
      let value2: int = 1
      let result_63 = value1 * value2
      expect(result_63 instanceof int).assertTrue()
      expect(result_63).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_1900
     * @tc.name      testMultiplicationIntResultTwo0019
     * @tc.desc      64. Multiplication of Max Int (octal) and 1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0O17777_777_777
      let value2: int = 1
      const result_64 = value1 * value2
      expect(result_64 instanceof int).assertTrue()
      expect(result_64).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_2000
     * @tc.name      testMultiplicationIntResultTwo0020
     * @tc.desc      65. Multiplication of Max Int (binary) and 1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0b11111111111111111111111_1111_1111
      let value2: int = 1
      let result_65 = value1 * value2
      expect(result_65 instanceof int).assertTrue()
      expect(result_65).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_2100
     * @tc.name      testMultiplicationIntResultTwo0021
     * @tc.desc      66. Multiplication of Min Int (decimal) and 1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -2147483648
      let value2: int = 1
      const result_66 = value1 * value2
      expect(result_66 instanceof int).assertTrue()
      expect(result_66).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_2200
     * @tc.name      testMultiplicationIntResultTwo0022
     * @tc.desc      67. Multiplication of Min Int (hex) and 1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0X80000_000
      let value2: int = 1
      let result_67 = value1 * value2
      expect(result_67 instanceof int).assertTrue()
      expect(result_67).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_2300
     * @tc.name      testMultiplicationIntResultTwo0023
     * @tc.desc      68. Multiplication of Min Int (octal) and 1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0o20000000000
      let value2: int = 1
      const result_68 = value1 * value2
      expect(result_68 instanceof int).assertTrue()
      expect(result_68).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_2400
     * @tc.name      testMultiplicationIntResultTwo0024
     * @tc.desc      69. Multiplication of Min Int (binary) and 1. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0B10000000000000000000000000000000
      let value2: int = 1
      let result_69 = value1 * value2
      expect(result_69 instanceof int).assertTrue()
      expect(result_69).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_2500
     * @tc.name      testMultiplicationIntResultTwo0025
     * @tc.desc      70. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as int and positive decimal value with plus sign, second operand - declared
     *               as int and positive binary value with plus sign. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = (+10).toInt()
      let value2: int = (+0b101).toInt()
      const result_70 = value1 * value2
      expect(result_70 instanceof int).assertTrue()
      expect(result_70).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_2600
     * @tc.name      testMultiplicationIntResultTwo0026
     * @tc.desc      71. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as alias Int and negative octal value, second operand - declared as alias
     *               Int and positive hex value. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = (-0o007).toInt()
      let value2: Int = (0xb).toInt()
      let result_71 = value1 * value2
      expect(result_71 instanceof int).assertTrue()
      expect(result_71).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_2700
     * @tc.name      testMultiplicationIntResultTwo0027
     * @tc.desc      72. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as int and negative hex value, second operand - declared as int and negative
     *               binary value. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = (-0xA).toInt()
      let value2: int = (-0B10).toInt()
      const result_72 = value1 * value2
      expect(result_72 instanceof int).assertTrue()
      expect(result_72).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_2800
     * @tc.name      testMultiplicationIntResultTwo0028
     * @tc.desc      73. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as alias Int and positive binary value, second operand - declared as
     *               alias Int and negative binary value. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = (0b101).toInt()
      let value2: Int = (-12).toInt()
      let result_73 = value1 * value2
      expect(result_73 instanceof int).assertTrue()
      expect(result_73).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_2900
     * @tc.name      testMultiplicationIntResultTwo0029
     * @tc.desc      74. Multiplication of positive int and 0. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 1
      let value2: int = 0
      const result_0 = value1 * value2
      expect(result_0 instanceof int).assertTrue()
      expect(result_0).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_3000
     * @tc.name      testMultiplicationIntResultTwo0030
     * @tc.desc      75. Multiplication of positive ints (1). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 1
      let value2: int = 1
      let result_1 = value1 * value2
      expect(result_1 instanceof int).assertTrue()
      expect(result_1).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_3100
     * @tc.name      testMultiplicationIntResultTwo0031
     * @tc.desc      76. Multiplication of positive ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 42
      let value2: Int = 12
      const result_2 = value1 * value2
      expect(result_2 instanceof int).assertTrue()
      expect(result_2).assertEqual(504);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_3200
     * @tc.name      testMultiplicationIntResultTwo0032
     * @tc.desc      77. Multiplication of positive and negative ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -1
      let value2: int = 1
      let result_3 = value1 * value2
      expect(result_3 instanceof int).assertTrue()
      expect(result_3).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_3300
     * @tc.name      testMultiplicationIntResultTwo0033
     * @tc.desc      78. Multiplication of 0 and negative int. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0
      let value2: Int = -1
      const result_4 = value1 * value2
      expect(result_4 instanceof int).assertTrue()
      expect(result_4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_3400
     * @tc.name      testMultiplicationIntResultTwo0034
     * @tc.desc      79. Multiplication of negative ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -1
      let value2: int = -1
      let result_5 = value1 * value2
      expect(result_5 instanceof int).assertTrue()
      expect(result_5).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_3500
     * @tc.name      testMultiplicationIntResultTwo0035
     * @tc.desc      80. Multiplication of 0 and 0. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0
      let value2: int = 0
      const result_6 = value1 * value2
      expect(result_6 instanceof int).assertTrue()
      expect(result_6).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_3600
     * @tc.name      testMultiplicationIntResultTwo0036
     * @tc.desc      81. Multiplication of positive ints (with underscore). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 4_200
      let value2: int = 1_2
      let result_7 = value1 * value2
      expect(result_7 instanceof int).assertTrue()
      expect(result_7).assertEqual(5040_0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_3700
     * @tc.name      testMultiplicationIntResultTwo0037
     * @tc.desc      82. Multiplication of positive and negative ints (with underscore). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -4_200
      let value2: int = 1_2
      const result_8 = value1 * value2
      expect(result_8 instanceof int).assertTrue()
      expect(result_8).assertEqual(-5_0400);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_3800
     * @tc.name      testMultiplicationIntResultTwo0038
     * @tc.desc      83. Multiplication of negative ints (with underscore). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -4_200
      let value2: int = -1_2
      let result_9 = value1 * value2
      expect(result_9 instanceof int).assertTrue()
      expect(result_9).assertEqual(50_400);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_3900
     * @tc.name      testMultiplicationIntResultTwo0039
     * @tc.desc      84. Multiplication of positive and negative ints (with underscore). (<Macro
     *               'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 4_200
      let value2: int = -1_2
      const result_10 = value1 * value2
      expect(result_10 instanceof int).assertTrue()
      expect(result_10).assertEqual(-504_00);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_4000
     * @tc.name      testMultiplicationIntResultTwo0040
     * @tc.desc      85. Multiplication of 0 and positive int (with underscore). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0
      let value2: Int = -1_2
      let result_11 = value1 * value2
      expect(result_11 instanceof int).assertTrue()
      expect(result_11).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_4100
     * @tc.name      testMultiplicationIntResultTwo0041
     * @tc.desc      86. Multiplication of positive ints (hex). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0xA12
      let value2: int = 0x123
      const result_12 = value1 * value2
      expect(result_12 instanceof int).assertTrue()
      expect(result_12).assertEqual(0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_4200
     * @tc.name      testMultiplicationIntResultTwo0042
     * @tc.desc      87. Multiplication of negative and positive ints (hex). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0xA12
      let value2: int = 0x123
      let result_13 = value1 * value2
      expect(result_13 instanceof int).assertTrue()
      expect(result_13).assertEqual(-0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_4300
     * @tc.name      testMultiplicationIntResultTwo0043
     * @tc.desc      88. Multiplication of positive and negative ints (hex). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0xA12
      let value2: int = -0x123
      const result_14 = value1 * value2
      expect(result_14 instanceof int).assertTrue()
      expect(result_14).assertEqual(-0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_4400
     * @tc.name      testMultiplicationIntResultTwo0044
     * @tc.desc      89. Multiplication of negative and positive ints (hex). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0xA12
      let value2: Int = -0X123
      let result_15 = value1 * value2
      expect(result_15 instanceof int).assertTrue()
      expect(result_15).assertEqual(0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_4500
     * @tc.name      testMultiplicationIntResultTwo0045
     * @tc.desc      90. Multiplication of negative int and 0 (hex). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0x0
      let value2: int = -0x123
      const result_16 = value1 * value2
      expect(result_16 instanceof int).assertTrue()
      expect(result_16).assertEqual(0x0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_4600
     * @tc.name      testMultiplicationIntResultTwo0046
     * @tc.desc      91. Multiplication of positive ints (hex with underscore). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0xA1_2
      let value2: int = 0X12_3
      let result_17 = value1 * value2
      expect(result_17 instanceof int).assertTrue()
      expect(result_17).assertEqual(0xb7_276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_4700
     * @tc.name      testMultiplicationIntResultTwo0047
     * @tc.desc      92. Multiplication of negative and positive ints (hex with underscore). (<Macro
     *               'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0xA1_2
      let value2: int = 0x123
      const result_18 = value1 * value2
      expect(result_18 instanceof int).assertTrue()
      expect(result_18).assertEqual(-0xb727_6);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_4800
     * @tc.name      testMultiplicationIntResultTwo0048
     * @tc.desc      93. Multiplication of positive ints (octal). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0o12
      let value2: int = 0o123
      let result_19 = value1 * value2
      expect(result_19 instanceof int).assertTrue()
      expect(result_19).assertEqual(0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_4900
     * @tc.name      testMultiplicationIntResultTwo0049
     * @tc.desc      94. Multiplication of negative and positive ints (octal). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0o12
      let value2: Int = 0o123
      const result_20 = value1 * value2
      expect(result_20 instanceof int).assertTrue()
      expect(result_20).assertEqual(-0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_5000
     * @tc.name      testMultiplicationIntResultTwo0050
     * @tc.desc      95. Multiplication of positive and negative ints (octal). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0o12
      let value2: int = -0o123
      let result_21 = value1 * value2
      expect(result_21 instanceof int).assertTrue()
      expect(result_21).assertEqual(-0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_5100
     * @tc.name      testMultiplicationIntResultTwo0051
     * @tc.desc      96. Multiplication of negative and positive ints (octal). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0o12
      let value2: Int = -0O123
      const result_22 = value1 * value2
      expect(result_22 instanceof int).assertTrue()
      expect(result_22).assertEqual(0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_5200
     * @tc.name      testMultiplicationIntResultTwo0052
     * @tc.desc      97. Multiplication of negative int and 0 (octal). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0o0
      let value2: int = -0o123
      let result_23 = value1 * value2
      expect(result_23 instanceof int).assertTrue()
      expect(result_23).assertEqual(0o0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_5300
     * @tc.name      testMultiplicationIntResultTwo0053
     * @tc.desc      98. Multiplication of positive ints (octal with underscore). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0O1_2
      let value2: int = 0o12_3
      const result_24 = value1 * value2
      expect(result_24 instanceof int).assertTrue()
      expect(result_24).assertEqual(0o147_6);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_5400
     * @tc.name      testMultiplicationIntResultTwo0054
     * @tc.desc      99. Multiplication of negative and positive ints (octal with underscore). (<Macro
     *               'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0o1_2
      let value2: int = 0o123
      let result_25 = value1 * value2
      expect(result_25 instanceof int).assertTrue()
      expect(result_25).assertEqual(-0o1_476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_5500
     * @tc.name      testMultiplicationIntResultTwo0055
     * @tc.desc      100. Multiplication of positive ints (binary). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0b101
      let value2: int = 0b11101
      const result_26 = value1 * value2
      expect(result_26 instanceof int).assertTrue()
      expect(result_26).assertEqual(0b10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_5600
     * @tc.name      testMultiplicationIntResultTwo0056
     * @tc.desc      101. Multiplication of negative and positive ints (binary). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0b101
      let value2: Int = 0b11101
      let result_27 = value1 * value2
      expect(result_27 instanceof int).assertTrue()
      expect(result_27).assertEqual(-0b10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_5700
     * @tc.name      testMultiplicationIntResultTwo0057
     * @tc.desc      102. Multiplication of positive and negative ints (binary). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0b101
      let value2: int = -0b11101
      const result_28 = value1 * value2
      expect(result_28 instanceof int).assertTrue()
      expect(result_28).assertEqual(-0B10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_5800
     * @tc.name      testMultiplicationIntResultTwo0058
     * @tc.desc      103. Multiplication of negative and positive ints (binary). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0b101
      let value2: Int = -0b11101
      let result_29 = value1 * value2
      expect(result_29 instanceof int).assertTrue()
      expect(result_29).assertEqual(0b10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_5900
     * @tc.name      testMultiplicationIntResultTwo0059
     * @tc.desc      30. Multiplication of negative int and 0 (binary). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0b0
      let value2: int = -0b11101
      const result_30 = value1 * value2
      expect(result_30 instanceof int).assertTrue()
      expect(result_30).assertEqual(0b0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_6000
     * @tc.name      testMultiplicationIntResultTwo0060
     * @tc.desc      31. Multiplication of positive ints (binary with underscore). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0b10_1
      let value2: int = 0b11_101
      let result_31 = value1 * value2
      expect(result_31 instanceof int).assertTrue()
      expect(result_31).assertEqual(0b1_0010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_6100
     * @tc.name      testMultiplicationIntResultTwo0061
     * @tc.desc      32. Multiplication of negative and positive ints (binary with underscore). (<Macro
     *               'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0b1_01
      let value2: int = 0B11101
      const result_32 = value1 * value2
      expect(result_32 instanceof int).assertTrue()
      expect(result_32).assertEqual(-0b1001000_1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_6200
     * @tc.name      testMultiplicationIntResultTwo0062
     * @tc.desc      33. Multiplication of negative decimal and negative binary ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -1
      let value2: int = -0b010_0111
      let result_33 = value1 * value2
      expect(result_33 instanceof int).assertTrue()
      expect(result_33).assertEqual(0b010_0111);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_6300
     * @tc.name      testMultiplicationIntResultTwo0063
     * @tc.desc      34. Multiplication of positive octal and positive binary ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0o234_5
      let value2: int = 0b01001
      const result_34 = value1 * value2
      expect(result_34 instanceof int).assertTrue()
      expect(result_34).assertEqual(0o26015);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_6400
     * @tc.name      testMultiplicationIntResultTwo0064
     * @tc.desc      35. Multiplication of negative hex and positive binary ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0x4ADF_33
      let value2: int = 0b010_0111
      let result_35 = value1 * value2
      expect(result_35 instanceof int).assertTrue()
      expect(result_35).assertEqual(-191365317);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_6500
     * @tc.name      testMultiplicationIntResultTwo0065
     * @tc.desc      36. Multiplication of positive hex and positive decimal ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0x1Efff
      let value2: Int = 1245_1
      const result_36 = value1 * value2
      expect(result_36 instanceof int).assertTrue()
      expect(result_36).assertEqual(0x5e3b9f5d);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_6600
     * @tc.name      testMultiplicationIntResultTwo0066
     * @tc.desc      37. Multiplication of positive decimal and negative octal ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 1245_1
      let value2: int = -0o675
      let result_37 = value1 * value2
      expect(result_37 instanceof int).assertTrue()
      expect(result_37).assertEqual(-0o25105527);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_6700
     * @tc.name      testMultiplicationIntResultTwo0067
     * @tc.desc      38. Multiplication of negative hex and negative octal ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0x3ADF_33
      let value2: Int = -0o675
      const result_38 = value1 * value2
      expect(result_38 instanceof int).assertTrue()
      expect(result_38).assertEqual(0x6655FBA7);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_6800
     * @tc.name      testMultiplicationIntResultTwo0068
     * @tc.desc      39. Multiplication of positive octal int and 0 (binary with minus symbol). (<Macro
     *               'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0o234_5
      let value2: int = -0b0
      let result_39 = value1 * value2
      expect(result_39 instanceof int).assertTrue()
      expect(result_39).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_6900
     * @tc.name      testMultiplicationIntResultTwo0069
     * @tc.desc      40. Multiplication of negative binary int and 0 (hex). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0b010_0111
      let value2: int = 0x0_0
      const result_40 = value1 * value2
      expect(result_40 instanceof int).assertTrue()
      expect(result_40).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_7000
     * @tc.name      testMultiplicationIntResultTwo0070
     * @tc.desc      41. Multiplication of positive decimal int and 0 (octal). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 1245_1
      let value2: int = 0o000
      let result_41 = value1 * value2
      expect(result_41 instanceof int).assertTrue()
      expect(result_41).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_7100
     * @tc.name      testMultiplicationIntResultTwo0071
     * @tc.desc      42. Multiplication of 0 (decimal) and negative hex int. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0
      let value2: int = -0x4ADF_33
      const result_42 = value1 * value2
      expect(result_42 instanceof int).assertTrue()
      expect(result_42).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_7200
     * @tc.name      testMultiplicationIntResultTwo0072
     * @tc.desc      43. Integer Overflows. Multiplication of Max and positive ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 2147483647
      let value2: int = 12
      let result_43 = value1 * value2
      expect(result_43 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_7300
     * @tc.name      testMultiplicationIntResultTwo0073
     * @tc.desc      44. Integer Overflows. Multiplication of Max and negative ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 2147483647
      let value2: int = -12
      const result_44 = value1 * value2
      expect(result_44 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_TWO_7400
     * @tc.name      testMultiplicationIntResultTwo0074
     * @tc.desc      45. Integer Overflows. Multiplication of Min and positive ints. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultTwo0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -2147483648
      let value2: int = 12
      let result_45 = value1 * value2
      expect(result_45 instanceof int).assertTrue()
    });
 });
}
