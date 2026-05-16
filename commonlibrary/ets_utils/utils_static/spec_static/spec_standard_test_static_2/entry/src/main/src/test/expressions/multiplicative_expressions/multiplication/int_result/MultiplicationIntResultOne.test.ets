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

export default function MultiplicationIntResultOneTest(): void {
  describe("MultiplicationIntResultOneTest", () => {
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
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_0100
     * @tc.name      testMultiplicationIntResultOne0001
     * @tc.desc      9. Multiplication of positive bytes. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = 123
      let value2: byte = 2
      let result_9 = value1 * value2
      expect(result_9 instanceof int).assertTrue()
      expect(result_9).assertEqual(246);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_0200
     * @tc.name      testMultiplicationIntResultOne0002
     * @tc.desc      10. Multiplication of bytes (decimal, hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = -2
      let value2: byte = 0x1_A
      const result_10 = value1 * value2
      expect(result_10 instanceof int).assertTrue()
      expect(result_10).assertEqual(-52);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_0300
     * @tc.name      testMultiplicationIntResultOne0003
     * @tc.desc      11. Multiplication of bytes (octal, binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = +0o74
      let value2: byte = -0b101
      let result_11 = value1 * value2
      expect(result_11 instanceof int).assertTrue()
      expect(result_11).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_0400
     * @tc.name      testMultiplicationIntResultOne0004
     * @tc.desc      12. Multiplication of bytes (octal, hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = -0o7_4
      let value2: byte = -0x0_f
      const result_12 = value1 * value2
      expect(result_12 instanceof int).assertTrue()
      expect(result_12).assertEqual(900);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_0500
     * @tc.name      testMultiplicationIntResultOne0005
     * @tc.desc      13. Multiplication of bytes (decimal, binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = -1_01
      let value2: byte = 0b10_01
      let result_13 = value1 * value2
      expect(result_13 instanceof int).assertTrue()
      expect(result_13).assertEqual(-0x38D);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_0600
     * @tc.name      testMultiplicationIntResultOne0006
     * @tc.desc      14. Multiplication of bytes (octal, decimal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = 0o74
      let value2: byte = +10
      const result_14 = value1 * value2
      expect(result_14 instanceof int).assertTrue()
      expect(result_14).assertEqual(0b1_001_011_000);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_0700
     * @tc.name      testMultiplicationIntResultOne0007
     * @tc.desc      15. Multiplication of bytes (hex, binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = -0x1a
      let value2: byte = -0b100_1
      let result_15 = value1 * value2
      expect(result_15 instanceof int).assertTrue()
      expect(result_15).assertEqual(0o352);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_0800
     * @tc.name      testMultiplicationIntResultOne0008
     * @tc.desc      16. Multiplication of positive bytes and 0 (hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = 123
      let value2: byte = +0x0
      const result_16 = value1 * value2
      expect(result_16 instanceof int).assertTrue()
      expect(result_16).assertEqual(0b0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_0900
     * @tc.name      testMultiplicationIntResultOne0009
     * @tc.desc      17. Multiplication of positive bytes (hex) and 0. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = -0x1
      let value2: byte = 0
      let result_17 = value1 * value2
      expect(result_17 instanceof int).assertTrue()
      expect(result_17).assertEqual(+0o00);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_1000
     * @tc.name      testMultiplicationIntResultOne0010
     * @tc.desc      18. Multiplication of positive byte and short. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = 123
      let value2: short = 2
      const result_18 = value1 * value2
      expect(result_18 instanceof int).assertTrue()
      expect(result_18).assertEqual(246);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_1100
     * @tc.name      testMultiplicationIntResultOne0011
     * @tc.desc      19. Multiplication of negative short and positive bytes (decimal, hex). (<Macro
     *               'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -3
      let value2: byte = +0x1_a
      let result_19 = value1 * value2
      expect(result_19 instanceof int).assertTrue()
      expect(result_19).assertEqual(-78);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_1200
     * @tc.name      testMultiplicationIntResultOne0012
     * @tc.desc      20. Multiplication of negative byte and negative int (octal, hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = -0o7_4
      let value2: int = -0x1Ff
      const result_20 = value1 * value2
      expect(result_20 instanceof int).assertTrue()
      expect(result_20).assertEqual(30660);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_1300
     * @tc.name      testMultiplicationIntResultOne0013
     * @tc.desc      21. Multiplication of positive int and negative short (octal, binary). (<Macro
     *               'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0o74
      let value2: short = -0b101
      let result_21 = value1 * value2
      expect(result_21 instanceof int).assertTrue()
      expect(result_21).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_1400
     * @tc.name      testMultiplicationIntResultOne0014
     * @tc.desc      22. Multiplication of byte, short and int. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -10
      let value2: int = 0x2_0A
      let value3: byte = -0b10
      const result_22 = value1 * value2 * value3
      expect(result_22 instanceof int).assertTrue()
      expect(result_22).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_1500
     * @tc.name      testMultiplicationIntResultOne0015
     * @tc.desc      23. Multiplication of positive short and alias Short. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(123)
      let value2: short = 100
      let result_23 = value1 * value2
      expect(result_23 instanceof int).assertTrue()
      expect(result_23).assertEqual(12300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_1600
     * @tc.name      testMultiplicationIntResultOne0016
     * @tc.desc      24. Multiplication of positive short and negative alias Short. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -10
      let value2: Short = new Short(-0x2_0A)
      const result_24 = value1 * value2
      expect(result_24 instanceof int).assertTrue()
      expect(result_24).assertEqual(5220);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_1700
     * @tc.name      testMultiplicationIntResultOne0017
     * @tc.desc      25. Multiplication of positive byte and alias Byte. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = new Byte(0o74)
      let value2: byte = 10
      let result_25 = value1 * value2
      expect(result_25 instanceof int).assertTrue()
      expect(result_25).assertEqual(0b1_001_011_000);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_1800
     * @tc.name      testMultiplicationIntResultOne0018
     * @tc.desc      26. Multiplication of positive byte and negative alias Byte. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = -0x1a
      let value2: Byte = new Byte(-0b100_1)
      const result_26 = value1 * value2
      expect(result_26 instanceof int).assertTrue()
      expect(result_26).assertEqual(0o352);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_1900
     * @tc.name      testMultiplicationIntResultOne0019
     * @tc.desc      27. Multiplication of byte and alias Short. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = +123
      let value2: Short = new Short(2)
      let result_27 = value1 * value2
      expect(result_27 instanceof int).assertTrue()
      expect(result_27).assertEqual(246);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_2000
     * @tc.name      testMultiplicationIntResultOne0020
     * @tc.desc      28. Multiplication of short and alias Byte (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -3
      let value2: Byte = new Byte(0x1_a)
      const result_28 = value1 * value2
      expect(result_28 instanceof int).assertTrue()
      expect(result_28).assertEqual(-78);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_2100
     * @tc.name      testMultiplicationIntResultOne0021
     * @tc.desc      29. Multiplication of byte, short and positive alias Int. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -10
      let value2: Int = 0x2_0A
      let value3: byte = -0b10
      let result_29 = value1 * value2 * value3
      expect(result_29 instanceof int).assertTrue()
      expect(result_29).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_2200
     * @tc.name      testMultiplicationIntResultOne0022
     * @tc.desc      30. Multiplication of byte, short and negative alias Int. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 1_0
      let value2: Int = new Int(-0x20A)
      let value3: byte = -0b00010
      const result_30 = value1 * value2 * value3
      expect(result_30 instanceof Int).assertTrue()
      expect(result_30).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_2300
     * @tc.name      testMultiplicationIntResultOne0023
     * @tc.desc      0. Multiplication of positive shorts. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 123
      let value2: short = 100
      const result_0 = value1 * value2
      expect(result_0 instanceof int).assertTrue()
      expect(result_0).assertEqual(12300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_2400
     * @tc.name      testMultiplicationIntResultOne0024
     * @tc.desc      1. Multiplication of short (decimal, hex). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -10
      let value2: short = 0x2_0A
      let result_1 = value1 * value2
      expect(result_1 instanceof int).assertTrue()
      expect(result_1).assertEqual(-5220);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_2500
     * @tc.name      testMultiplicationIntResultOne0025
     * @tc.desc      2. Multiplication of short (octal, binary). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 0o74
      let value2: short = -0b101
      const result_2 = value1 * value2
      expect(result_2 instanceof int).assertTrue()
      expect(result_2).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_2600
     * @tc.name      testMultiplicationIntResultOne0026
     * @tc.desc      3. Multiplication of short (octal, hex). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -0o7_4
      let value2: short = -0x1Ff
      let result_3 = value1 * value2
      expect(result_3 instanceof int).assertTrue()
      expect(result_3).assertEqual(30660);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_2700
     * @tc.name      testMultiplicationIntResultOne0027
     * @tc.desc      4. Multiplication of short (decimal, binary). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -23_00
      let value2: short = +0b10_01
      const result_4 = value1 * value2
      expect(result_4 instanceof int).assertTrue()
      expect(result_4).assertEqual(-0x50d_C);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_2800
     * @tc.name      testMultiplicationIntResultOne0028
     * @tc.desc      5. Multiplication of short (octal, decimal). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 0o74
      let value2: short = 10
      let result_5 = value1 * value2
      expect(result_5 instanceof int).assertTrue()
      expect(result_5).assertEqual(0b1_001_011_000);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_2900
     * @tc.name      testMultiplicationIntResultOne0029
     * @tc.desc      6. Multiplication of short (hex, binary). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -0x1a
      let value2: short = -0b100_1
      const result_6 = value1 * value2
      expect(result_6 instanceof int).assertTrue()
      expect(result_6).assertEqual(0o352);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_3000
     * @tc.name      testMultiplicationIntResultOne0030
     * @tc.desc      7. Multiplication of positive short and 0 (hex). (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 123
      let value2: short = 0x0
      let result_7 = value1 * value2
      expect(result_7 instanceof int).assertTrue()
      expect(result_7).assertEqual(0b0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_3100
     * @tc.name      testMultiplicationIntResultOne0031
     * @tc.desc      8. Multiplication of positive short (hex) and 0. (<Macro 'generate_complete_test_body_common_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 0
      let value2: short = -0x1
      const result_8 = value1 * value2
      expect(result_8 instanceof int).assertTrue()
      expect(result_8).assertEqual(0o00);
    }); /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_3200
     * @tc.name      testMultiplicationIntResultOne0032
     * @tc.desc      0. Multiplication of positive int and 0. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 1
      let value2: int = 0
      const result_0 = value1 * value2
      expect(result_0 instanceof int).assertTrue()
      expect(result_0).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_3300
     * @tc.name      testMultiplicationIntResultOne0033
     * @tc.desc      1. Multiplication of positive ints (1). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 1
      let value2: int = 1
      let result_1 = value1 * value2
      expect(result_1 instanceof int).assertTrue()
      expect(result_1).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_3400
     * @tc.name      testMultiplicationIntResultOne0034
     * @tc.desc      2. Multiplication of positive ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 42
      let value2: Int = 12
      const result_2 = value1 * value2
      expect(result_2 instanceof int).assertTrue()
      expect(result_2).assertEqual(504);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_3500
     * @tc.name      testMultiplicationIntResultOne0035
     * @tc.desc      3. Multiplication of positive and negative ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -1
      let value2: int = 1
      let result_3 = value1 * value2
      expect(result_3 instanceof int).assertTrue()
      expect(result_3).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_3600
     * @tc.name      testMultiplicationIntResultOne0036
     * @tc.desc      4. Multiplication of 0 and negative int. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0
      let value2: Int = -1
      const result_4 = value1 * value2
      expect(result_4 instanceof int).assertTrue()
      expect(result_4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_3700
     * @tc.name      testMultiplicationIntResultOne0037
     * @tc.desc      5. Multiplication of negative ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -1
      let value2: int = -1
      let result_5 = value1 * value2
      expect(result_5 instanceof int).assertTrue()
      expect(result_5).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_3800
     * @tc.name      testMultiplicationIntResultOne0038
     * @tc.desc      6. Multiplication of 0 and 0. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0
      let value2: int = 0
      const result_6 = value1 * value2
      expect(result_6 instanceof int).assertTrue()
      expect(result_6).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_3900
     * @tc.name      testMultiplicationIntResultOne0039
     * @tc.desc      7. Multiplication of positive ints (with underscore). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 4_200
      let value2: int = 1_2
      let result_7 = value1 * value2
      expect(result_7 instanceof int).assertTrue()
      expect(result_7).assertEqual(5040_0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_4000
     * @tc.name      testMultiplicationIntResultOne0040
     * @tc.desc      8. Multiplication of positive and negative ints (with underscore). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -4_200
      let value2: int = 1_2
      const result_8 = value1 * value2
      expect(result_8 instanceof int).assertTrue()
      expect(result_8).assertEqual(-5_0400);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_4100
     * @tc.name      testMultiplicationIntResultOne0041
     * @tc.desc      9. Multiplication of negative ints (with underscore). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -4_200
      let value2: int = -1_2
      let result_9 = value1 * value2
      expect(result_9 instanceof int).assertTrue()
      expect(result_9).assertEqual(50_400);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_4200
     * @tc.name      testMultiplicationIntResultOne0042
     * @tc.desc      10. Multiplication of positive and negative ints (with underscore). (<Macro
     *               'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 4_200
      let value2: int = -1_2
      const result_10 = value1 * value2
      expect(result_10 instanceof int).assertTrue()
      expect(result_10).assertEqual(-504_00);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_4300
     * @tc.name      testMultiplicationIntResultOne0043
     * @tc.desc      11. Multiplication of 0 and positive int (with underscore). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0
      let value2: Int = -1_2
      let result_11 = value1 * value2
      expect(result_11 instanceof int).assertTrue()
      expect(result_11).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_4400
     * @tc.name      testMultiplicationIntResultOne0044
     * @tc.desc      12. Multiplication of positive ints (hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0xA12
      let value2: int = 0x123
      const result_12 = value1 * value2
      expect(result_12 instanceof int).assertTrue()
      expect(result_12).assertEqual(0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_4500
     * @tc.name      testMultiplicationIntResultOne0045
     * @tc.desc      13. Multiplication of negative and positive ints (hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0xA12
      let value2: int = 0x123
      let result_13 = value1 * value2
      expect(result_13 instanceof int).assertTrue()
      expect(result_13).assertEqual(-0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_4600
     * @tc.name      testMultiplicationIntResultOne0046
     * @tc.desc      14. Multiplication of positive and negative ints (hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0xA12
      let value2: int = -0x123
      const result_14 = value1 * value2
      expect(result_14 instanceof int).assertTrue()
      expect(result_14).assertEqual(-0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_4700
     * @tc.name      testMultiplicationIntResultOne0047
     * @tc.desc      15. Multiplication of negative and positive ints (hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0xA12
      let value2: Int = -0X123
      let result_15 = value1 * value2
      expect(result_15 instanceof int).assertTrue()
      expect(result_15).assertEqual(0xb7276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_4800
     * @tc.name      testMultiplicationIntResultOne0048
     * @tc.desc      16. Multiplication of negative int and 0 (hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0x0
      let value2: int = -0x123
      const result_16 = value1 * value2
      expect(result_16 instanceof int).assertTrue()
      expect(result_16).assertEqual(0x0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_4900
     * @tc.name      testMultiplicationIntResultOne0049
     * @tc.desc      17. Multiplication of positive ints (hex with underscore). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0xA1_2
      let value2: int = 0X12_3
      let result_17 = value1 * value2
      expect(result_17 instanceof int).assertTrue()
      expect(result_17).assertEqual(0xb7_276);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_5000
     * @tc.name      testMultiplicationIntResultOne0050
     * @tc.desc      18. Multiplication of negative and positive ints (hex with underscore). (<Macro
     *               'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0xA1_2
      let value2: int = 0x123
      const result_18 = value1 * value2
      expect(result_18 instanceof int).assertTrue()
      expect(result_18).assertEqual(-0xb727_6);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_5100
     * @tc.name      testMultiplicationIntResultOne0051
     * @tc.desc      19. Multiplication of positive ints (octal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0o12
      let value2: int = 0o123
      let result_19 = value1 * value2
      expect(result_19 instanceof int).assertTrue()
      expect(result_19).assertEqual(0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_5200
     * @tc.name      testMultiplicationIntResultOne0052
     * @tc.desc      20. Multiplication of negative and positive ints (octal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0o12
      let value2: Int = 0o123
      const result_20 = value1 * value2
      expect(result_20 instanceof int).assertTrue()
      expect(result_20).assertEqual(-0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_5300
     * @tc.name      testMultiplicationIntResultOne0053
     * @tc.desc      21. Multiplication of positive and negative ints (octal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0o12
      let value2: int = -0o123
      let result_21 = value1 * value2
      expect(result_21 instanceof int).assertTrue()
      expect(result_21).assertEqual(-0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_5400
     * @tc.name      testMultiplicationIntResultOne0054
     * @tc.desc      22. Multiplication of negative and positive ints (octal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0o12
      let value2: Int = -0O123
      const result_22 = value1 * value2
      expect(result_22 instanceof int).assertTrue()
      expect(result_22).assertEqual(0o1476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_5500
     * @tc.name      testMultiplicationIntResultOne0055
     * @tc.desc      23. Multiplication of negative int and 0 (octal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0o0
      let value2: int = -0o123
      let result_23 = value1 * value2
      expect(result_23 instanceof int).assertTrue()
      expect(result_23).assertEqual(0o0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_5600
     * @tc.name      testMultiplicationIntResultOne0056
     * @tc.desc      24. Multiplication of positive ints (octal with underscore). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0O1_2
      let value2: int = 0o12_3
      const result_24 = value1 * value2
      expect(result_24 instanceof int).assertTrue()
      expect(result_24).assertEqual(0o147_6);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_5700
     * @tc.name      testMultiplicationIntResultOne0057
     * @tc.desc      25. Multiplication of negative and positive ints (octal with underscore). (<Macro
     *               'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0o1_2
      let value2: int = 0o123
      let result_25 = value1 * value2
      expect(result_25 instanceof int).assertTrue()
      expect(result_25).assertEqual(-0o1_476);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_5800
     * @tc.name      testMultiplicationIntResultOne0058
     * @tc.desc      26. Multiplication of positive ints (binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0b101
      let value2: int = 0b11101
      const result_26 = value1 * value2
      expect(result_26 instanceof int).assertTrue()
      expect(result_26).assertEqual(0b10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_5900
     * @tc.name      testMultiplicationIntResultOne0059
     * @tc.desc      27. Multiplication of negative and positive ints (binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0b101
      let value2: Int = 0b11101
      let result_27 = value1 * value2
      expect(result_27 instanceof int).assertTrue()
      expect(result_27).assertEqual(-0b10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_6000
     * @tc.name      testMultiplicationIntResultOne0060
     * @tc.desc      28. Multiplication of positive and negative ints (binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0b101
      let value2: int = -0b11101
      const result_28 = value1 * value2
      expect(result_28 instanceof int).assertTrue()
      expect(result_28).assertEqual(-0B10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_6100
     * @tc.name      testMultiplicationIntResultOne0061
     * @tc.desc      29. Multiplication of negative and positive ints (binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0b101
      let value2: Int = -0b11101
      let result_29 = value1 * value2
      expect(result_29 instanceof int).assertTrue()
      expect(result_29).assertEqual(0b10010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_6200
     * @tc.name      testMultiplicationIntResultOne0062
     * @tc.desc      30. Multiplication of negative int and 0 (binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0b0
      let value2: int = -0b11101
      const result_30 = value1 * value2
      expect(result_30 instanceof int).assertTrue()
      expect(result_30).assertEqual(0b0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_6300
     * @tc.name      testMultiplicationIntResultOne0063
     * @tc.desc      31. Multiplication of positive ints (binary with underscore). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0b10_1
      let value2: int = 0b11_101
      let result_31 = value1 * value2
      expect(result_31 instanceof int).assertTrue()
      expect(result_31).assertEqual(0b1_0010001);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_6400
     * @tc.name      testMultiplicationIntResultOne0064
     * @tc.desc      32. Multiplication of negative and positive ints (binary with underscore). (<Macro
     *               'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0b1_01
      let value2: int = 0B11101
      const result_32 = value1 * value2
      expect(result_32 instanceof int).assertTrue()
      expect(result_32).assertEqual(-0b1001000_1);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_6500
     * @tc.name      testMultiplicationIntResultOne0065
     * @tc.desc      33. Multiplication of negative decimal and negative binary ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -1
      let value2: int = -0b010_0111
      let result_33 = value1 * value2
      expect(result_33 instanceof int).assertTrue()
      expect(result_33).assertEqual(0b010_0111);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_6600
     * @tc.name      testMultiplicationIntResultOne0066
     * @tc.desc      34. Multiplication of positive octal and positive binary ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = 0o234_5
      let value2: int = 0b01001
      const result_34 = value1 * value2
      expect(result_34 instanceof int).assertTrue()
      expect(result_34).assertEqual(0o26015);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_6700
     * @tc.name      testMultiplicationIntResultOne0067
     * @tc.desc      35. Multiplication of negative hex and positive binary ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0x4ADF_33
      let value2: int = 0b010_0111
      let result_35 = value1 * value2
      expect(result_35 instanceof int).assertTrue()
      expect(result_35).assertEqual(-191365317);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_6800
     * @tc.name      testMultiplicationIntResultOne0068
     * @tc.desc      36. Multiplication of positive hex and positive decimal ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0x1Efff
      let value2: Int = 1245_1
      const result_36 = value1 * value2
      expect(result_36 instanceof int).assertTrue()
      expect(result_36).assertEqual(0x5e3b9f5d);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_6900
     * @tc.name      testMultiplicationIntResultOne0069
     * @tc.desc      37. Multiplication of positive decimal and negative octal ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 1245_1
      let value2: int = -0o675
      let result_37 = value1 * value2
      expect(result_37 instanceof int).assertTrue()
      expect(result_37).assertEqual(-0o25105527);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_7000
     * @tc.name      testMultiplicationIntResultOne0070
     * @tc.desc      38. Multiplication of negative hex and negative octal ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = -0x3ADF_33
      let value2: Int = -0o675
      const result_38 = value1 * value2
      expect(result_38 instanceof int).assertTrue()
      expect(result_38).assertEqual(0x6655FBA7);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_7100
     * @tc.name      testMultiplicationIntResultOne0071
     * @tc.desc      39. Multiplication of positive octal int and 0 (binary with minus symbol). (<Macro
     *               'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0o234_5
      let value2: int = -0b0
      let result_39 = value1 * value2
      expect(result_39 instanceof int).assertTrue()
      expect(result_39).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_7200
     * @tc.name      testMultiplicationIntResultOne0072
     * @tc.desc      40. Multiplication of negative binary int and 0 (hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -0b010_0111
      let value2: int = 0x0_0
      const result_40 = value1 * value2
      expect(result_40 instanceof int).assertTrue()
      expect(result_40).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_7300
     * @tc.name      testMultiplicationIntResultOne0073
     * @tc.desc      41. Multiplication of positive decimal int and 0 (octal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 1245_1
      let value2: int = 0o000
      let result_41 = value1 * value2
      expect(result_41 instanceof int).assertTrue()
      expect(result_41).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_7400
     * @tc.name      testMultiplicationIntResultOne0074
     * @tc.desc      42. Multiplication of 0 (decimal) and negative hex int. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 0
      let value2: int = -0x4ADF_33
      const result_42 = value1 * value2
      expect(result_42 instanceof int).assertTrue()
      expect(result_42).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_7500
     * @tc.name      testMultiplicationIntResultOne0075
     * @tc.desc      43. Integer Overflows. Multiplication of Max and positive ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 2147483647
      let value2: int = 12
      let result_43 = value1 * value2
      expect(result_43 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_7600
     * @tc.name      testMultiplicationIntResultOne0076
     * @tc.desc      44. Integer Overflows. Multiplication of Max and negative ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 2147483647
      let value2: int = -12
      const result_44 = value1 * value2
      expect(result_44 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_ONE_7700
     * @tc.name      testMultiplicationIntResultOne0077
     * @tc.desc      45. Integer Overflows. Multiplication of Min and positive ints. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResultOne0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -2147483648
      let value2: int = 12
      let result_45 = value1 * value2
      expect(result_45 instanceof int).assertTrue()
    });
  });
}
