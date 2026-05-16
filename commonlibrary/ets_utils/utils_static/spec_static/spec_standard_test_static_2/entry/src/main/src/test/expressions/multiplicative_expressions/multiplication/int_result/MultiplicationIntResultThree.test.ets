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

export default function MultiplicationIntResultThreeTest(): void {
  describe("MultiplicationIntResultThreeTest", () => {
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
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_0100
     * @tc.name      testMultiplicationIntResultThree0001
     * @tc.desc      71. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as alias Int and negative octal value, second operand - declared as alias
     *               Int and positive hex value. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = (-0o007).toInt()
      let value2: Int = (0xb).toInt()
      let result_71 = value1 * value2
      expect(result_71 instanceof int).assertTrue()
      expect(result_71).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_0200
     * @tc.name      testMultiplicationIntResultThree0002
     * @tc.desc      72. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as int and negative hex value, second operand - declared as int and negative
     *               binary value. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = (-0xA).toInt()
      let value2: int = (-0B10).toInt()
      const result_72 = value1 * value2
      expect(result_72 instanceof int).assertTrue()
      expect(result_72).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_0300
     * @tc.name      testMultiplicationIntResultThree0003
     * @tc.desc      73. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as alias Int and positive binary value, second operand - declared as
     *               alias Int and negative binary value. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = (0b101).toInt()
      let value2: Int = (-12).toInt()
      let result_73 = value1 * value2
      expect(result_73 instanceof int).assertTrue()
      expect(result_73).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_0400
     * @tc.name      testMultiplicationIntResultThree0004
     * @tc.desc      0. Multiplication of positive int and 0. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0
      const result_0 = 1 * value2
      expect(result_0 instanceof int).assertTrue()
      expect(result_0).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_0500
     * @tc.name      testMultiplicationIntResultThree0005
     * @tc.desc      1. Multiplication of positive ints (1). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      let result_1 = 1 * value2
      expect(result_1 instanceof int).assertTrue()
      expect(result_1).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_0600
     * @tc.name      testMultiplicationIntResultThree0006
     * @tc.desc      2. Multiplication of positive ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = 12
      const result_2 = 42 * value2
      expect(result_2 instanceof int).assertTrue()
      expect(result_2).assertEqual(504);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_0700
     * @tc.name      testMultiplicationIntResultThree0007
     * @tc.desc      3. Multiplication of positive and negative ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      let result_3 = -1 * value2
      expect(result_3 instanceof int).assertTrue()
      expect(result_3).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_0800
     * @tc.name      testMultiplicationIntResultThree0008
     * @tc.desc      4. Multiplication of 0 and negative int. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = -1
      const result_4 = 0 * value2
      expect(result_4 instanceof int).assertTrue()
      expect(result_4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_0900
     * @tc.name      testMultiplicationIntResultThree0009
     * @tc.desc      5. Multiplication of negative ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -1
      let result_5 = -1 * value2
      expect(result_5 instanceof int).assertTrue()
      expect(result_5).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_1000
     * @tc.name      testMultiplicationIntResultThree0010
     * @tc.desc      6. Multiplication of 0 and 0. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0
      const result_6 = 0 * value2
      expect(result_6 instanceof int).assertTrue()
      expect(result_6).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_1100
     * @tc.name      testMultiplicationIntResultThree0011
     * @tc.desc      7. Multiplication of positive ints (with underscore). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1_2
      let result_7 = 4_200 * value2
      expect(result_7 instanceof int).assertTrue()
      expect(result_7).assertEqual(5040_0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_1200
     * @tc.name      testMultiplicationIntResultThree0012
     * @tc.desc      8. Multiplication of positive and negative ints (with underscore). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1_2
      const result_8 = -4_200 * value2
      expect(result_8 instanceof int).assertTrue()
      expect(result_8).assertEqual(-5_0400);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_1300
     * @tc.name      testMultiplicationIntResultThree0013
     * @tc.desc      9. Multiplication of negative ints (with underscore). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -1_2
      let result_9 = -4_200 * value2
      expect(result_9 instanceof int).assertTrue()
      expect(result_9).assertEqual(50_400);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_1400
     * @tc.name      testMultiplicationIntResultThree0014
     * @tc.desc      10. Multiplication of positive and negative ints (with underscore). (<Macro
     *               'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -1_2
      const result_10 = 4_200 * value2
      expect(result_10 instanceof int).assertTrue()
      expect(result_10).assertEqual(-504_00);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_1500
     * @tc.name      testMultiplicationIntResultThree0015
     * @tc.desc      11. Multiplication of 0 and positive int (with underscore). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = -1_2
      let result_11 = 0 * value2
      expect(result_11 instanceof int).assertTrue()
      expect(result_11).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_1600
     * @tc.name      testMultiplicationIntResultThree0016
     * @tc.desc      12. Multiplication of positive ints (hex). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0x123
      const result_12 = 0xA12 * value2
      expect(result_12 instanceof int).assertTrue()
      expect(result_12).assertEqual(0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_1700
     * @tc.name      testMultiplicationIntResultThree0017
     * @tc.desc      13. Multiplication of negative and positive ints (hex). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0x123
      let result_13 = -0xA12 * value2
      expect(result_13 instanceof int).assertTrue()
      expect(result_13).assertEqual(-0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_1800
     * @tc.name      testMultiplicationIntResultThree0018
     * @tc.desc      14. Multiplication of positive and negative ints (hex). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0x123
      const result_14 = 0xA12 * value2
      expect(result_14 instanceof int).assertTrue()
      expect(result_14).assertEqual(-0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_1900
     * @tc.name      testMultiplicationIntResultThree0019
     * @tc.desc      15. Multiplication of negative and positive ints (hex). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = -0X123
      let result_15 = -0xA12 * value2
      expect(result_15 instanceof int).assertTrue()
      expect(result_15).assertEqual(0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_2000
     * @tc.name      testMultiplicationIntResultThree0020
     * @tc.desc      16. Multiplication of negative int and 0 (hex). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0x123
      const result_16 = 0x0 * value2
      expect(result_16 instanceof int).assertTrue()
      expect(result_16).assertEqual(0x0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_2100
     * @tc.name      testMultiplicationIntResultThree0021
     * @tc.desc      17. Multiplication of positive ints (hex with underscore). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0X12_3
      let result_17 = 0xA1_2 * value2
      expect(result_17 instanceof int).assertTrue()
      expect(result_17).assertEqual(0xb7_276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_2200
     * @tc.name      testMultiplicationIntResultThree0022
     * @tc.desc      18. Multiplication of negative and positive ints (hex with underscore). (<Macro
     *               'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0x123
      const result_18 = -0xA1_2 * value2
      expect(result_18 instanceof int).assertTrue()
      expect(result_18).assertEqual(-0xb727_6);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_2300
     * @tc.name      testMultiplicationIntResultThree0023
     * @tc.desc      19. Multiplication of positive ints (octal). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0o123
      let result_19 = 0o12 * value2
      expect(result_19 instanceof int).assertTrue()
      expect(result_19).assertEqual(0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_2400
     * @tc.name      testMultiplicationIntResultThree0024
     * @tc.desc      20. Multiplication of negative and positive ints (octal). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = 0o123
      const result_20 = -0o12 * value2
      expect(result_20 instanceof int).assertTrue()
      expect(result_20).assertEqual(-0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_2500
     * @tc.name      testMultiplicationIntResultThree0025
     * @tc.desc      21. Multiplication of positive and negative ints (octal). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0o123
      let result_21 = 0o12 * value2
      expect(result_21 instanceof int).assertTrue()
      expect(result_21).assertEqual(-0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_2600
     * @tc.name      testMultiplicationIntResultThree0026
     * @tc.desc      22. Multiplication of negative and positive ints (octal). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = -0O123
      const result_22 = -0o12 * value2
      expect(result_22 instanceof int).assertTrue()
      expect(result_22).assertEqual(0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_2700
     * @tc.name      testMultiplicationIntResultThree0027
     * @tc.desc      23. Multiplication of negative int and 0 (octal). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0o123
      let result_23 = 0o0 * value2
      expect(result_23 instanceof int).assertTrue()
      expect(result_23).assertEqual(0o0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_2800
     * @tc.name      testMultiplicationIntResultThree0028
     * @tc.desc      24. Multiplication of positive ints (octal with underscore). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0o12_3
      const result_24 = 0O1_2 * value2
      expect(result_24 instanceof int).assertTrue()
      expect(result_24).assertEqual(0o147_6);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_2900
     * @tc.name      testMultiplicationIntResultThree0029
     * @tc.desc      25. Multiplication of negative and positive ints (octal with underscore). (<Macro
     *               'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0o123
      let result_25 = -0o1_2 * value2
      expect(result_25 instanceof int).assertTrue()
      expect(result_25).assertEqual(-0o1_476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_3000
     * @tc.name      testMultiplicationIntResultThree0030
     * @tc.desc      26. Multiplication of positive ints (binary). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0b11101
      const result_26 = 0b101 * value2
      expect(result_26 instanceof int).assertTrue()
      expect(result_26).assertEqual(0b10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_3100
     * @tc.name      testMultiplicationIntResultThree0031
     * @tc.desc      27. Multiplication of negative and positive ints (binary). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = 0b11101
      let result_27 = -0b101 * value2
      expect(result_27 instanceof int).assertTrue()
      expect(result_27).assertEqual(-0b10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_3200
     * @tc.name      testMultiplicationIntResultThree0032
     * @tc.desc      28. Multiplication of positive and negative ints (binary). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0b11101
      const result_28 = 0b101 * value2
      expect(result_28 instanceof int).assertTrue()
      expect(result_28).assertEqual(-0B10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_3300
     * @tc.name      testMultiplicationIntResultThree0033
     * @tc.desc      29. Multiplication of negative and positive ints (binary). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = -0b11101
      let result_29 = -0b101 * value2
      expect(result_29 instanceof int).assertTrue()
      expect(result_29).assertEqual(0b10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_3400
     * @tc.name      testMultiplicationIntResultThree0034
     * @tc.desc      30. Multiplication of negative int and 0 (binary). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0b11101
      const result_30 = 0b0 * value2
      expect(result_30 instanceof int).assertTrue()
      expect(result_30).assertEqual(0b0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_3500
     * @tc.name      testMultiplicationIntResultThree0035
     * @tc.desc      31. Multiplication of positive ints (binary with underscore). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0b11_101
      let result_31 = 0b10_1 * value2
      expect(result_31 instanceof int).assertTrue()
      expect(result_31).assertEqual(0b1_0010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_3600
     * @tc.name      testMultiplicationIntResultThree0036
     * @tc.desc      32. Multiplication of negative and positive ints (binary with underscore). (<Macro
     *               'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0B11101
      const result_32 = -0b1_01 * value2
      expect(result_32 instanceof int).assertTrue()
      expect(result_32).assertEqual(-0b1001000_1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_3700
     * @tc.name      testMultiplicationIntResultThree0037
     * @tc.desc      33. Multiplication of negative decimal and negative binary ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0b010_0111
      let result_33 = -1 * value2
      expect(result_33 instanceof int).assertTrue()
      expect(result_33).assertEqual(0b010_0111);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_3800
     * @tc.name      testMultiplicationIntResultThree0038
     * @tc.desc      34. Multiplication of positive octal and positive binary ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0b01001
      const result_34 = 0o234_5 * value2
      expect(result_34 instanceof int).assertTrue()
      expect(result_34).assertEqual(0o26015);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_3900
     * @tc.name      testMultiplicationIntResultThree0039
     * @tc.desc      35. Multiplication of negative hex and positive binary ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0b010_0111
      let result_35 = -0x4ADF_33 * value2
      expect(result_35 instanceof int).assertTrue()
      expect(result_35).assertEqual(-191365317);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_4000
     * @tc.name      testMultiplicationIntResultThree0040
     * @tc.desc      36. Multiplication of positive hex and positive decimal ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = 1245_1
      const result_36 = 0x1Efff * value2
      expect(result_36 instanceof int).assertTrue()
      expect(result_36).assertEqual(0x5e3b9f5d);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_4100
     * @tc.name      testMultiplicationIntResultThree0041
     * @tc.desc      37. Multiplication of positive decimal and negative octal ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0o675
      let result_37 = 1245_1 * value2
      expect(result_37 instanceof int).assertTrue()
      expect(result_37).assertEqual(-0o25105527);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_4200
     * @tc.name      testMultiplicationIntResultThree0042
     * @tc.desc      38. Multiplication of negative hex and negative octal ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = -0o675
      const result_38 = -0x3ADF_33 * value2
      expect(result_38 instanceof int).assertTrue()
      expect(result_38).assertEqual(0x6655FBA7);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_4300
     * @tc.name      testMultiplicationIntResultThree0043
     * @tc.desc      39. Multiplication of positive octal int and 0 (binary with minus symbol). (<Macro
     *               'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0b0
      let result_39 = 0o234_5 * value2
      expect(result_39 instanceof int).assertTrue()
      expect(result_39).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_4400
     * @tc.name      testMultiplicationIntResultThree0044
     * @tc.desc      40. Multiplication of negative binary int and 0 (hex). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0x0_0
      const result_40 = -0b010_0111 * value2
      expect(result_40 instanceof int).assertTrue()
      expect(result_40).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_4500
     * @tc.name      testMultiplicationIntResultThree0045
     * @tc.desc      41. Multiplication of positive decimal int and 0 (octal). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0o000
      let result_41 = 1245_1 * value2
      expect(result_41 instanceof int).assertTrue()
      expect(result_41).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_4600
     * @tc.name      testMultiplicationIntResultThree0046
     * @tc.desc      42. Multiplication of 0 (decimal) and negative hex int. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0x4ADF_33
      const result_42 = 0 * value2
      expect(result_42 instanceof int).assertTrue()
      expect(result_42).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_4700
     * @tc.name      testMultiplicationIntResultThree0047
     * @tc.desc      43. Integer Overflows. Multiplication of Max and positive ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 12
      let result_43 = 2147483647 * value2
      expect(result_43 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_4800
     * @tc.name      testMultiplicationIntResultThree0048
     * @tc.desc      44. Integer Overflows. Multiplication of Max and negative ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -12
      const result_44 = 2147483647 * value2
      expect(result_44 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_4900
     * @tc.name      testMultiplicationIntResultThree0049
     * @tc.desc      45.Integer Overflows. Multiplication of Min and positive ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 12
      let result_45 = -2147483648 * value2
      expect(result_45 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_5000
     * @tc.name      testMultiplicationIntResultThree0050
     * @tc.desc      46. Integer Overflows. Multiplication of Min and negative ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -12
      const result_46 = -2147483648 * value2
      expect(result_46 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_5100
     * @tc.name      testMultiplicationIntResultThree0051
     * @tc.desc      47. Multiplication of three decimal ints. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = 10
      let value3: int = -11
      let result_47 = -23 * value2 * value3
      expect(result_47 instanceof int).assertTrue()
      expect(result_47).assertEqual(2530);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_5200
     * @tc.name      testMultiplicationIntResultThree0052
     * @tc.desc      48. Multiplication of three ints (octal, binary, hex). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0b010_110
      let value3: int = -0xAdF_3
      const result_48 = 0o234_5 * value2 * value3
      expect(result_48 instanceof int).assertTrue()
      expect(result_48).assertEqual(-1227541546);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_5300
     * @tc.name      testMultiplicationIntResultThree0053
     * @tc.desc      49. Multiplication of three 0-s (octal, binary and hex format). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0x00
      let value3: int = 0b00_00
      let result_49 = 0o0 * value2 * value3
      expect(result_49 instanceof int).assertTrue()
      expect(result_49).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_5400
     * @tc.name      testMultiplicationIntResultThree0054
     * @tc.desc      50. Multiplication of ints. Alias Int (binary, hex). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = new Int(-0x234A)
      const result_50 = new Int(0b101) * value2
      expect(result_50 instanceof int).assertTrue()
      expect(result_50).assertEqual(-45170);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_5500
     * @tc.name      testMultiplicationIntResultThree0055
     * @tc.desc      51. Multiplication of ints. Alias Int (decimal). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0o23_7
      let result_51 = new Int(123) * value2
      expect(result_51 instanceof int).assertTrue()
      expect(result_51).assertEqual(19557);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_5600
     * @tc.name      testMultiplicationIntResultThree0056
     * @tc.desc      52. Multiplication of ints. Alias Int (octal). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = new Int(-0o17)
      const result_52 = -34 * value2
      expect(result_52 instanceof int).assertTrue()
      expect(result_52).assertEqual(510);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_5700
     * @tc.name      testMultiplicationIntResultThree0057
     * @tc.desc      53. Multiplication of two decimal ints and alias Byte. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Byte = new Byte(10)
      let value3: int = -11
      let result_53 = -23 * value2 * value3
      expect(result_53 instanceof int).assertTrue()
      expect(result_53).assertEqual(2530);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_5800
     * @tc.name      testMultiplicationIntResultThree0058
     * @tc.desc      54. Multiplication of two ints and alias Short. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -0xAdF_3
      let value3: Short = new Short(0b010_110)
      const result_54 = 0o234_5 * value2 * value3
      expect(result_54 instanceof int).assertTrue()
      expect(result_54).assertEqual(-1227541546);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_5900
     * @tc.name      testMultiplicationIntResultThree0059
     * @tc.desc      55. Multiplication of Max Int and -1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -1
      let result_55 = Int.MAX_VALUE * value2
      expect(result_55 instanceof int).assertTrue()
      expect(result_55).assertEqual(-2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_6000
     * @tc.name      testMultiplicationIntResultThree0060
     * @tc.desc      56. Multiplication of Max Int and 1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      const result_56 = Int.MAX_VALUE * value2
      expect(result_56 instanceof int).assertTrue()
      expect(result_56).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_6100
     * @tc.name      testMultiplicationIntResultThree0061
     * @tc.desc      57. Multiplication of Max Int and 0. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0
      let result_57 = Int.MAX_VALUE * value2
      expect(result_57 instanceof int).assertTrue()
      expect(result_57).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_6200
     * @tc.name      testMultiplicationIntResultThree0062
     * @tc.desc      58. Multiplication of negative Max Int and -1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -1
      const result_58 = -Int.MAX_VALUE * value2
      expect(result_58 instanceof int).assertTrue()
      expect(result_58).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_6300
     * @tc.name      testMultiplicationIntResultThree0063
     * @tc.desc      59. Multiplication of Min Int and 1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      let result_59 = Int.MIN_VALUE * value2
      expect(result_59 instanceof int).assertTrue()
      expect(result_59).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_6400
     * @tc.name      testMultiplicationIntResultThree0064
     * @tc.desc      60. Multiplication of Min Int and 0. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0
      const result_60 = Int.MIN_VALUE * value2
      expect(result_60 instanceof int).assertTrue()
      expect(result_60).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_6500
     * @tc.name      testMultiplicationIntResultThree0065
     * @tc.desc      61. Multiplication of negative Min Int and -1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -1
      let result_61 = -Int.MIN_VALUE * value2
      expect(result_61 instanceof int).assertTrue()
      expect(result_61).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_6600
     * @tc.name      testMultiplicationIntResultThree0066
     * @tc.desc      62. Multiplication of Max Int (decimal) and 1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      const result_62 = 2147483647 * value2
      expect(result_62 instanceof int).assertTrue()
      expect(result_62).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_6700
     * @tc.name      testMultiplicationIntResultThree0067
     * @tc.desc      63. Multiplication of Max Int (hex) and 1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      let result_63 = 0x7FFffFFF * value2
      expect(result_63 instanceof int).assertTrue()
      expect(result_63).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_6800
     * @tc.name      testMultiplicationIntResultThree0068
     * @tc.desc      64. Multiplication of Max Int (octal) and 1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      const result_64 = 0O17777_777_777 * value2
      expect(result_64 instanceof int).assertTrue()
      expect(result_64).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_6900
     * @tc.name      testMultiplicationIntResultThree0069
     * @tc.desc      65. Multiplication of Max Int (binary) and 1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      let result_65 = 0b11111111111111111111111_1111_1111 * value2
      expect(result_65 instanceof int).assertTrue()
      expect(result_65).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_7000
     * @tc.name      testMultiplicationIntResultThree0070
     * @tc.desc      66. Multiplication of Min Int (decimal) and 1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      const result_66 = -2147483648 * value2
      expect(result_66 instanceof int).assertTrue()
      expect(result_66).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_7100
     * @tc.name      testMultiplicationIntResultThree0071
     * @tc.desc      67. Multiplication of Min Int (hex) and 1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      let result_67 = -0X80000_000 * value2
      expect(result_67).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_7200
     * @tc.name      testMultiplicationIntResultThree0072
     * @tc.desc      68. Multiplication of Min Int (octal) and 1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      const result_68 = -0o20000000000 * value2
      expect(result_68).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_7300
     * @tc.name      testMultiplicationIntResultThree0073
     * @tc.desc      69. Multiplication of Min Int (binary) and 1. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      let result_69 = -0B10000000000000000000000000000000 * value2
      expect(result_69).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_7400
     * @tc.name      testMultiplicationIntResultThree0074
     * @tc.desc      70. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as int and positive decimal value with plus sign, second operand - declared
     *               as int and positive binary value with plus sign. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = (+0b101).toInt()
      const result_70 = (+10).toInt() * value2
      expect(result_70 instanceof int).assertTrue()
      expect(result_70).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_7500
     * @tc.name      testMultiplicationIntResultThree0075
     * @tc.desc      71. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as alias Int and negative octal value, second operand - declared as alias
     *               Int and positive hex value. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = (0xb).toInt()
      let result_71 = (-0o007).toInt() * value2
      expect(result_71 instanceof int).assertTrue()
      expect(result_71).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_7600
     * @tc.name      testMultiplicationIntResultThree0076
     * @tc.desc      72. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as int and negative hex value, second operand - declared as int and negative
     *               binary value. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = (-0B10).toInt()
      const result_72 = (-0xA).toInt() * value2
      expect(result_72 instanceof int).assertTrue()
      expect(result_72).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_7700
     * @tc.name      testMultiplicationIntResultThree0077
     * @tc.desc      73. Multiplication of ints with the type conversion by toInt(). First operand
     *               - declared as alias Int and positive binary value, second operand - declared as
     *               alias Int and negative binary value. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = (-12).toInt()
      let result_73 = (0b101).toInt() * value2
      expect(result_73 instanceof int).assertTrue()
      expect(result_73).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_7800
     * @tc.name      testMultiplicationIntResultThree0078
     * @tc.desc      0. Multiplication of positive int and 0. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 1
      const result_0 = value1 * 0
      expect(result_0 instanceof int).assertTrue()
      expect(result_0).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_7900
     * @tc.name      testMultiplicationIntResultThree0079
     * @tc.desc      1. Multiplication of positive ints (1). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 1
      let result_1 = value1 * 1
      expect(result_1 instanceof int).assertTrue()
      expect(result_1).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_8000
     * @tc.name      testMultiplicationIntResultThree0080
     * @tc.desc      2. Multiplication of positive ints. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 42
      const result_2 = value1 * 12
      expect(result_2 instanceof int).assertTrue()
      expect(result_2).assertEqual(504);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_8100
     * @tc.name      testMultiplicationIntResultThree0081
     * @tc.desc      3. Multiplication of positive and negative ints. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -1
      let result_3 = value1 * 1
      expect(result_3 instanceof int).assertTrue()
      expect(result_3).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_8200
     * @tc.name      testMultiplicationIntResultThree0082
     * @tc.desc      4. Multiplication of 0 and negative int. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0
      const result_4 = value1 * -1
      expect(result_4 instanceof int).assertTrue()
      expect(result_4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_8300
     * @tc.name      testMultiplicationIntResultThree0083
     * @tc.desc      5. Multiplication of negative ints. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -1
      let result_5 = value1 * -1
      expect(result_5 instanceof int).assertTrue()
      expect(result_5).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_8400
     * @tc.name      testMultiplicationIntResultThree0084
     * @tc.desc      6. Multiplication of 0 and 0. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0
      const result_6 = value1 * 0
      expect(result_6 instanceof int).assertTrue()
      expect(result_6).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_8500
     * @tc.name      testMultiplicationIntResultThree0085
     * @tc.desc      7. Multiplication of positive ints (with underscore). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 4_200
      let result_7 = value1 * 1_2
      expect(result_7 instanceof int).assertTrue()
      expect(result_7).assertEqual(5040_0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_8600
     * @tc.name      testMultiplicationIntResultThree0086
     * @tc.desc      8. Multiplication of positive and negative ints (with underscore). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -4_200
      const result_8 = value1 * 1_2
      expect(result_8 instanceof int).assertTrue()
      expect(result_8).assertEqual(-5_0400);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_8700
     * @tc.name      testMultiplicationIntResultThree0087
     * @tc.desc      9. Multiplication of negative ints (with underscore). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -4_200
      let result_9 = value1 * -1_2
      expect(result_9 instanceof int).assertTrue()
      expect(result_9).assertEqual(50_400);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_8800
     * @tc.name      testMultiplicationIntResultThree0088
     * @tc.desc      10. Multiplication of positive and negative ints (with underscore). (<Macro
     *               'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 4_200
      const result_10 = value1 * -1_2
      expect(result_10 instanceof int).assertTrue()
      expect(result_10).assertEqual(-504_00);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_8900
     * @tc.name      testMultiplicationIntResultThree0089
     * @tc.desc      11. Multiplication of 0 and positive int (with underscore). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0
      let result_11 = value1 * -1_2
      expect(result_11 instanceof int).assertTrue()
      expect(result_11).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_9000
     * @tc.name      testMultiplicationIntResultThree0090
     * @tc.desc      12. Multiplication of positive ints (hex). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0xA12
      const result_12 = value1 * 0x123
      expect(result_12 instanceof int).assertTrue()
      expect(result_12).assertEqual(0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_9100
     * @tc.name      testMultiplicationIntResultThree0091
     * @tc.desc      13. Multiplication of negative and positive ints (hex). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0xA12
      let result_13 = value1 * 0x123
      expect(result_13 instanceof int).assertTrue()
      expect(result_13).assertEqual(-0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_9200
     * @tc.name      testMultiplicationIntResultThree0092
     * @tc.desc      14. Multiplication of positive and negative ints (hex). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0xA12
      const result_14 = value1 * -0x123
      expect(result_14 instanceof int).assertTrue()
      expect(result_14).assertEqual(-0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_9300
     * @tc.name      testMultiplicationIntResultThree0093
     * @tc.desc      15. Multiplication of negative and positive ints (hex). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0xA12
      let result_15 = value1 * -0X123
      expect(result_15 instanceof int).assertTrue()
      expect(result_15).assertEqual(0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_9400
     * @tc.name      testMultiplicationIntResultThree0094
     * @tc.desc      16. Multiplication of negative int and 0 (hex). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0x0
      const result_16 = value1 * -0x123
      expect(result_16 instanceof int).assertTrue()
      expect(result_16).assertEqual(0x0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_9500
     * @tc.name      testMultiplicationIntResultThree0095
     * @tc.desc      17. Multiplication of positive ints (hex with underscore). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0xA1_2
      let result_17 = value1 * 0X12_3
      expect(result_17 instanceof int).assertTrue()
      expect(result_17).assertEqual(0xb7_276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_9600
     * @tc.name      testMultiplicationIntResultThree0096
     * @tc.desc      18. Multiplication of negative and positive ints (hex with underscore). (<Macro
     *               'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0xA1_2
      const result_18 = value1 * 0x123
      expect(result_18 instanceof int).assertTrue()
      expect(result_18).assertEqual(-0xb727_6);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_9700
     * @tc.name      testMultiplicationIntResultThree0097
     * @tc.desc      19. Multiplication of positive ints (octal). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0o12
      let result_19 = value1 * 0o123
      expect(result_19 instanceof int).assertTrue()
      expect(result_19).assertEqual(0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_9800
     * @tc.name      testMultiplicationIntResultThree0098
     * @tc.desc      20. Multiplication of negative and positive ints (octal). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0o12
      const result_20 = value1 * 0o123
      expect(result_20 instanceof int).assertTrue()
      expect(result_20).assertEqual(-0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_THREE_9900
     * @tc.name      testMultiplicationIntResultThree0099
     * @tc.desc      21. Multiplication of positive and negative ints (octal). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultThree0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0o12
      let result_21 = value1 * -0o123
      expect(result_21 instanceof int).assertTrue()
      expect(result_21).assertEqual(-0o1476);
    });
  });
}
