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

export default function MultiplicationIntResultTest(): void {
  describe("MultiplicationIntResultTest", () => {
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
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_0100
     * @tc.name      testMultiplicationIntResult0001
     * @tc.desc      0. Multiplication of alias Shorts (decimal, octal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(123)
      let value2: Short = new Short(0o100)
      const result_0 = value1 * value2
      expect(result_0 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_0200
     * @tc.name      testMultiplicationIntResult0002
     * @tc.desc      1. Multiplication of alias Shorts (binary, hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(-0b10)
      let value2: Short = new Short(0x2_0A)
      let result_1 = value1 * value2
      expect(result_1 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_0300
     * @tc.name      testMultiplicationIntResult0003
     * @tc.desc      2. Multiplication of alias Byte (decimal, hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = new Byte(-2)
      let value2: Byte = new Byte(0x1_A)
      const result_2 = value1 * value2
      expect(result_2 instanceof int).assertTrue()
      expect(result_2).assertEqual(-52);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_0400
     * @tc.name      testMultiplicationIntResult0004
     * @tc.desc      3. Multiplication of alias Byte (octal, binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = new Byte(0o74)
      let value2: Byte = new Byte(-0B101)
      let result_3 = value1 * value2
      expect(result_3 instanceof int).assertTrue()
      expect(result_3).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_0500
     * @tc.name      testMultiplicationIntResult0005
     * @tc.desc      4. Multiplication of alias Short and alias Byte (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(-3)
      let value2: Byte = new Byte(0x1_a)
      const result_4 = value1 * value2
      expect(result_4 instanceof int).assertTrue()
      expect(result_4).assertEqual(-78);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_0600
     * @tc.name      testMultiplicationIntResult0006
     * @tc.desc      5. Multiplication of alias Int and alias Short. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = new Int(0o74)
      let value2: Short = new Short(-0b101)
      let result_5 = value1 * value2
      expect(result_5 instanceof int).assertTrue()
      expect(result_5).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_0700
     * @tc.name      testMultiplicationIntResult0007
     * @tc.desc      6. Multiplication of alias Byte and alias Int. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = new Byte(-0O7_4)
      let value2: Int = new Int(-0X1Ff)
      const result_6 = value1 * value2
      expect(result_6 instanceof int).assertTrue()
      expect(result_6).assertEqual(30660);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_0800
     * @tc.name      testMultiplicationIntResult0008
     * @tc.desc      7. Multiplication of alias Byte, alias Short and alias Int. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(1_0)
      let value2: Int = new Int(-0x20A)
      let value3: Byte = new Byte(-0b00010)
      let result_7 = value1 * value2 * value3
      expect(result_7 instanceof int).assertTrue()
      expect(result_7).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_0900
     * @tc.name      testMultiplicationIntResult0009
     * @tc.desc      8. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as short and positive decimal value with plus sign (the conversion ),
     *               second operand - declared as short and positive binary value with plus sign. (<Macro
     *               'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = (+10).toShort()
      let value2: short = (+0b101).toShort()
      const result_8 = value1 * value2
      expect(result_8 instanceof int).assertTrue()
      expect(result_8).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_1000
     * @tc.name      testMultiplicationIntResult0010
     * @tc.desc      9. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as alias Short and negative octal value, second operand - declared as
     *               alias Short and positive hex value. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = (-0o7).toShort()
      let value2: Short = (0xb).toShort()
      let result_9 = value1 * value2
      expect(result_9 instanceof int).assertTrue()
      expect(result_9).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_1100
     * @tc.name      testMultiplicationIntResult0011
     * @tc.desc      10. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as short and negative hex value, second operand - declared as short and
     *               negative binary value. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = (-0xA).toShort()
      let value2: short = (-0B10).toShort()
      const result_10 = value1 * value2
      expect(result_10 instanceof int).assertTrue()
      expect(result_10).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_1200
     * @tc.name      testMultiplicationIntResult0012
     * @tc.desc      11. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as alias Short and positive binary value, second operand - declared as
     *               alias Short and negative decimal value. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = (0b101).toShort()
      let value2: Short = (-12).toShort()
      let result_11 = value1 * value2
      expect(result_11 instanceof int).assertTrue()
      expect(result_11).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_1300
     * @tc.name      testMultiplicationIntResult0013
     * @tc.desc      12. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as byte and positive decimal value with plus sign, second operand - declared
     *               as byte and positive binary value with plus sign. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = (+10).toByte()
      let value2: byte = (+0b101).toByte()
      const result_12 = value1 * value2
      expect(result_12 instanceof int).assertTrue()
      expect(result_12).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_1400
     * @tc.name      testMultiplicationIntResult0014
     * @tc.desc      13. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as alias Byte and negative octal value, second operand - declared as
     *               alias Byte and positive hex value. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = (-0o7).toByte()
      let value2: Byte = (0xb).toByte()
      let result_13 = value1 * value2
      expect(result_13 instanceof int).assertTrue()
      expect(result_13).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_1500
     * @tc.name      testMultiplicationIntResult0015
     * @tc.desc      14. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as byte and negative hex value, second operand - declared as byte and
     *               negative binary value. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = (-0xA).toByte()
      let value2: byte = (-0B10).toByte()
      const result_14 = value1 * value2
      expect(result_14 instanceof int).assertTrue()
      expect(result_14).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_1600
     * @tc.name      testMultiplicationIntResult0016
     * @tc.desc      15. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as alias Byte and positive binary value, second operand - declared as
     *               alias Byte and negative decimal value. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = (0b101).toByte()
      let value2: Byte = (-12).toByte()
      let result_15 = value1 * value2
      expect(result_15 instanceof int).assertTrue()
      expect(result_15).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_1700
     * @tc.name      testMultiplicationIntResult0017
     * @tc.desc      16. Multiplication of negative binary byte, negative decimal short and positive
     *               hex int. Each operand with a type conversion (toByte(), toShort(), toInt()). (<Macro
     *               'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = (-10).toShort()
      let value2: int = (0x2_0A).toInt()
      let value3: Byte = -0b10.toByte()
      const result_16 = value1 * value2 * value3
      expect(result_16 instanceof int).assertTrue()
      expect(result_16).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_1800
     * @tc.name      testMultiplicationIntResult0018
     * @tc.desc      17. Multiplication of negative binary byte, positive decimal short and negative
     *               hex int. Each operand with a type conversion (toByte(), toShort(), toInt()) (<Macro
     *               'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = (1_0).toShort()
      let value2: Int = (-0x20A).toInt()
      let value3: byte = -0b00010.toByte()
      let result_17 = value1 * value2 * value3
      expect(result_17 instanceof Int).assertTrue()
      expect(result_17).assertEqual(10440);
    });
    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_1900
     * @tc.name      testMultiplicationIntResult0019
     * @tc.desc      0. Multiplication of alias Shorts (decimal, octal). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Short = new Short(0o100)
      const result_0 = new Short(123) * value2
      expect(result_0 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_2000
     * @tc.name      testMultiplicationIntResult0020
     * @tc.desc      1. Multiplication of alias Shorts (binary, hex). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Short = new Short(0x2_0A)
      let result_1 = new Short(-0b10) * value2
      expect(result_1 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_2100
     * @tc.name      testMultiplicationIntResult0021
     * @tc.desc      2. Multiplication of alias Byte (decimal, hex). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Byte = new Byte(0x1_A)
      const result_2 = new Byte(-2) * value2
      expect(result_2 instanceof int).assertTrue()
      expect(result_2).assertEqual(-52);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_2200
     * @tc.name      testMultiplicationIntResult0022
     * @tc.desc      3. Multiplication of alias Byte (octal, binary). (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Byte = new Byte(-0B101)
      let result_3 = new Byte(0o74) * value2
      expect(result_3 instanceof int).assertTrue()
      expect(result_3).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_2300
     * @tc.name      testMultiplicationIntResult0023
     * @tc.desc      4. Multiplication of alias Short and alias Byte (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Byte = new Byte(0x1_a)
      const result_4 = new Short(-3) * value2
      expect(result_4 instanceof int).assertTrue()
      expect(result_4).assertEqual(-78);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_2400
     * @tc.name      testMultiplicationIntResult0024
     * @tc.desc      5. Multiplication of alias Int and alias Short. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Short = new Short(-0b101)
      let result_5 = new Int(0o74) * value2
      expect(result_5 instanceof int).assertTrue()
      expect(result_5).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_2500
     * @tc.name      testMultiplicationIntResult0025
     * @tc.desc      6. Multiplication of alias Byte and alias Int. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = new Int(-0X1Ff)
      const result_6 = new Byte(-0O7_4) * value2
      expect(result_6 instanceof int).assertTrue()
      expect(result_6).assertEqual(30660);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_2600
     * @tc.name      testMultiplicationIntResult0026
     * @tc.desc      7. Multiplication of alias Byte, alias Short and alias Int. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = new Int(-0x20A)
      let value3: Byte = new Byte(-0b00010)
      let result_7 = new Short(1_0) * value2 * value3
      expect(result_7 instanceof int).assertTrue()
      expect(result_7).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_2700
     * @tc.name      testMultiplicationIntResult0027
     * @tc.desc      8. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as short and positive decimal value with plus sign (the conversion ),
     *               second operand - declared as short and positive binary value with plus sign. (<Macro
     *               'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: short = (+0b101).toShort()
      const result_8 = (+10).toShort() * value2
      expect(result_8 instanceof int).assertTrue()
      expect(result_8).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_2800
     * @tc.name      testMultiplicationIntResult0028
     * @tc.desc      9. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as alias Short and negative octal value, second operand - declared as
     *               alias Short and positive hex value. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Short = (0xb).toShort()
      let result_9 = (-0o7).toShort() * value2
      expect(result_9 instanceof int).assertTrue()
      expect(result_9).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_2900
     * @tc.name      testMultiplicationIntResult0029
     * @tc.desc      10. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as short and negative hex value, second operand - declared as short and
     *               negative binary value. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: short = (-0B10).toShort()
      const result_10 = (-0xA).toShort() * value2
      expect(result_10 instanceof int).assertTrue()
      expect(result_10).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_3000
     * @tc.name      testMultiplicationIntResult0030
     * @tc.desc      11. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as alias Short and positive binary value, second operand - declared as
     *               alias Short and negative decimal value. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Short = (-12).toShort()
      let result_11 = (0b101).toShort() * value2
      expect(result_11 instanceof int).assertTrue()
      expect(result_11).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_3100
     * @tc.name      testMultiplicationIntResult0031
     * @tc.desc      12. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as byte and positive decimal value with plus sign, second operand - declared
     *               as byte and positive binary value with plus sign. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: byte = (+0b101).toByte()
      const result_12 = (+10).toByte() * value2
      expect(result_12 instanceof int).assertTrue()
      expect(result_12).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_3200
     * @tc.name      testMultiplicationIntResult0032
     * @tc.desc      13. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as alias Byte and negative octal value, second operand - declared as
     *               alias Byte and positive hex value. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Byte = (0xb).toByte()
      let result_13 = (-0o7).toByte() * value2
      expect(result_13 instanceof int).assertTrue()
      expect(result_13).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_3300
     * @tc.name      testMultiplicationIntResult0033
     * @tc.desc      14. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as byte and negative hex value, second operand - declared as byte and
     *               negative binary value. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: byte = (-0B10).toByte()
      const result_14 = (-0xA).toByte() * value2
      expect(result_14 instanceof int).assertTrue()
      expect(result_14).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_3400
     * @tc.name      testMultiplicationIntResult0034
     * @tc.desc      15. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as alias Byte and positive binary value, second operand - declared as
     *               alias Byte and negative decimal value. (<Macro 'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Byte = (-12).toByte()
      let result_15 = (0b101).toByte() * value2
      expect(result_15 instanceof int).assertTrue()
      expect(result_15).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_3500
     * @tc.name      testMultiplicationIntResult0035
     * @tc.desc      16. Multiplication of negative binary byte, negative decimal short and positive
     *               hex int. Each operand with a type conversion (toByte(), toShort(), toInt()). (<Macro
     *               'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = (0x2_0A).toInt()
      let value3: Byte = -0b10.toByte()
      const result_16 = (-10).toShort() * value2 * value3
      expect(result_16 instanceof int).assertTrue()
      expect(result_16).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_3600
     * @tc.name      testMultiplicationIntResult0036
     * @tc.desc      17. Multiplication of negative binary byte, positive decimal short and negative
     *               hex int. Each operand with a type conversion (toByte(), toShort(), toInt()) (<Macro
     *               'generate_complete_test_body_one_const_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = (-0x20A).toInt()
      let value3: byte = -0b00010.toByte()
      let result_17 = (1_0).toShort() * value2 * value3
      expect(result_17 instanceof Int).assertTrue()
      expect(result_17).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_3700
     * @tc.name      testMultiplicationIntResult0037
     * @tc.desc      0. Multiplication of alias Shorts (decimal, octal). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(123)
      const result_0 = value1 * new Short(0o100)
      expect(result_0 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_3800
     * @tc.name      testMultiplicationIntResult0038
     * @tc.desc      1. Multiplication of alias Shorts (binary, hex). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(-0b10)
      let result_1 = value1 * new Short(0x2_0A)
      expect(result_1 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_3900
     * @tc.name      testMultiplicationIntResult0039
     * @tc.desc      2. Multiplication of alias Byte (decimal, hex). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = new Byte(-2)
      const result_2 = value1 * new Byte(0x1_A)
      expect(result_2 instanceof int).assertTrue()
      expect(result_2).assertEqual(-52);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_4000
     * @tc.name      testMultiplicationIntResult0040
     * @tc.desc      3. Multiplication of alias Byte (octal, binary). (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = new Byte(0o74)
      let result_3 = value1 * new Byte(-0B101)
      expect(result_3 instanceof int).assertTrue()
      expect(result_3).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_4100
     * @tc.name      testMultiplicationIntResult0041
     * @tc.desc      4. Multiplication of alias Short and alias Byte (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(-3)
      const result_4 = value1 * new Byte(0x1_a)
      expect(result_4 instanceof int).assertTrue()
      expect(result_4).assertEqual(-78);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_4200
     * @tc.name      testMultiplicationIntResult0042
     * @tc.desc      5. Multiplication of alias Int and alias Short. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = new Int(0o74)
      let result_5 = value1 * new Short(-0b101)
      expect(result_5 instanceof int).assertTrue()
      expect(result_5).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_4300
     * @tc.name      testMultiplicationIntResult0043
     * @tc.desc      6. Multiplication of alias Byte and alias Int. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = new Byte(-0O7_4)
      const result_6 = value1 * new Int(-0X1Ff)
      expect(result_6 instanceof int).assertTrue()
      expect(result_6).assertEqual(30660);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_4400
     * @tc.name      testMultiplicationIntResult0044
     * @tc.desc      7. Multiplication of alias Byte, alias Short and alias Int. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(1_0)
      const value3: Byte = new Byte(-0b00010)
      let result_7 = value1 * new Int(-0x20A) * value3
      expect(result_7 instanceof int).assertTrue()
      expect(result_7).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_4500
     * @tc.name      testMultiplicationIntResult0045
     * @tc.desc      8. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as short and positive decimal value with plus sign (the conversion ),
     *               second operand - declared as short and positive binary value with plus sign. (<Macro
     *               'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = (+10).toShort()
      const result_8 = value1 * (+0b101).toShort()
      expect(result_8 instanceof int).assertTrue()
      expect(result_8).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_4600
     * @tc.name      testMultiplicationIntResult0046
     * @tc.desc      9. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as alias Short and negative octal value, second operand - declared as
     *               alias Short and positive hex value. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = (-0o7).toShort()
      let result_9 = value1 * (0xb).toShort()
      expect(result_9 instanceof int).assertTrue()
      expect(result_9).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_4700
     * @tc.name      testMultiplicationIntResult0047
     * @tc.desc      10. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as short and negative hex value, second operand - declared as short and
     *               negative binary value. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = (-0xA).toShort()
      const result_10 = value1 * (-0B10).toShort()
      expect(result_10 instanceof int).assertTrue()
      expect(result_10).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_4800
     * @tc.name      testMultiplicationIntResult0048
     * @tc.desc      11. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as alias Short and positive binary value, second operand - declared as
     *               alias Short and negative decimal value. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = (0b101).toShort()
      let result_11 = value1 * (-12).toShort()
      expect(result_11 instanceof int).assertTrue()
      expect(result_11).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_4900
     * @tc.name      testMultiplicationIntResult0049
     * @tc.desc      12. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as byte and positive decimal value with plus sign, second operand - declared
     *               as byte and positive binary value with plus sign. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = (+10).toByte()
      const result_12 = value1 * (+0b101).toByte()
      expect(result_12 instanceof int).assertTrue()
      expect(result_12).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_5000
     * @tc.name      testMultiplicationIntResult0050
     * @tc.desc      13. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as alias Byte and negative octal value, second operand - declared as
     *               alias Byte and positive hex value. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = (-0o7).toByte()
      let result_13 = value1 * (0xb).toByte()
      expect(result_13 instanceof int).assertTrue()
      expect(result_13).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_5100
     * @tc.name      testMultiplicationIntResult0051
     * @tc.desc      14. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as byte and negative hex value, second operand - declared as byte and
     *               negative binary value. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = (-0xA).toByte()
      const result_14 = value1 * (-0B10).toByte()
      expect(result_14 instanceof int).assertTrue()
      expect(result_14).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_5200
     * @tc.name      testMultiplicationIntResult0052
     * @tc.desc      15. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as alias Byte and positive binary value, second operand - declared as
     *               alias Byte and negative decimal value. (<Macro 'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Byte = (0b101).toByte()
      let result_15 = value1 * (-12).toByte()
      expect(result_15 instanceof int).assertTrue()
      expect(result_15).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_5300
     * @tc.name      testMultiplicationIntResult0053
     * @tc.desc      16. Multiplication of negative binary byte, negative decimal short and positive
     *               hex int. Each operand with a type conversion (toByte(), toShort(), toInt()). (<Macro
     *               'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = (-10).toShort()
      const value3: Byte = -0b10.toByte()
      const result_16 = value1 * (0x2_0A).toInt() * value3
      expect(result_16 instanceof int).assertTrue()
      expect(result_16).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_5400
     * @tc.name      testMultiplicationIntResult0054
     * @tc.desc      17. Multiplication of negative binary byte, positive decimal short and negative
     *               hex int. Each operand with a type conversion (toByte(), toShort(), toInt()) (<Macro
     *               'generate_complete_test_body_one_let_keyword'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = (1_0).toShort()
      const value3: byte = -0b00010.toByte()
      let result_17 = value1 * (-0x20A).toInt() * value3
      expect(result_17 instanceof Int).assertTrue()
      expect(result_17).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_5500
     * @tc.name      testMultiplicationIntResult0055
     * @tc.desc      0. Multiplication of alias Shorts (decimal, octal).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_0 = new Short(123) * new Short(0o100)
      expect(result_0 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_5600
     * @tc.name      testMultiplicationIntResult0056
     * @tc.desc      1. Multiplication of alias Shorts (binary, hex).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_1 = new Short(-0b10) * new Short(0x2_0A)
      expect(result_1 instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_5700
     * @tc.name      testMultiplicationIntResult0057
     * @tc.desc      2. Multiplication of alias Byte (decimal, hex).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_2 = new Byte(-2) * new Byte(0x1_A)
      expect(result_2 instanceof int).assertTrue()
      expect(result_2).assertEqual(-52);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_5800
     * @tc.name      testMultiplicationIntResult0058
     * @tc.desc      3. Multiplication of alias Byte (octal, binary).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_3 = new Byte(0o74) * new Byte(-0B101)
      expect(result_3 instanceof int).assertTrue()
      expect(result_3).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_5900
     * @tc.name      testMultiplicationIntResult0059
     * @tc.desc      4. Multiplication of alias Short and alias Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_4 = new Short(-3) * new Byte(0x1_a)
      expect(result_4 instanceof int).assertTrue()
      expect(result_4).assertEqual(-78);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_6000
     * @tc.name      testMultiplicationIntResult0060
     * @tc.desc      5. Multiplication of alias Int and alias Short.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_5 = new Int(0o74) * new Short(-0b101)
      expect(result_5 instanceof int).assertTrue()
      expect(result_5).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_6100
     * @tc.name      testMultiplicationIntResult0061
     * @tc.desc      6. Multiplication of alias Byte and alias Int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_6 = new Byte(-0O7_4) * new Int(-0X1Ff)
      expect(result_6 instanceof int).assertTrue()
      expect(result_6).assertEqual(30660);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_6200
     * @tc.name      testMultiplicationIntResult0062
     * @tc.desc      7. Multiplication of alias Byte, alias Short and alias Int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_7 = new Short(1_0) * new Int(-0x20A) * new Byte(-0b00010)
      expect(result_7 instanceof int).assertTrue()
      expect(result_7).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_6300
     * @tc.name      testMultiplicationIntResult0063
     * @tc.desc      8. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as short and positive decimal value with plus sign (the conversion ),
     *               second operand - declared as short and positive binary value with plus sign. (<Macro
     *               'generate_complete_test_result_expression'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_8 = (+10).toShort() * (+0b101).toShort()
      expect(result_8 instanceof int).assertTrue()
      expect(result_8).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_6400
     * @tc.name      testMultiplicationIntResult0064
     * @tc.desc      9. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as alias Short and negative octal value, second operand - declared as
     *               alias Short and positive hex value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_9 = (-0o7).toShort() * (0xb).toShort()
      expect(result_9 instanceof int).assertTrue()
      expect(result_9).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_6500
     * @tc.name      testMultiplicationIntResult0065
     * @tc.desc      10. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as short and negative hex value, second operand - declared as short and
     *               negative binary value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_10 = (-0xA).toShort() * (-0B10).toShort()
      expect(result_10 instanceof int).assertTrue()
      expect(result_10).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_6600
     * @tc.name      testMultiplicationIntResult0066
     * @tc.desc      11. Multiplication of shorts with the type conversion by toShort(). First operand
     *               - declared as alias Short and positive binary value, second operand - declared as
     *               alias Short and negative decimal value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_11 = (0b101).toShort() * (-12).toShort()
      expect(result_11 instanceof int).assertTrue()
      expect(result_11).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_6700
     * @tc.name      testMultiplicationIntResult0067
     * @tc.desc      12. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as byte and positive decimal value with plus sign, second operand - declared
     *               as byte and positive binary value with plus sign.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_12 = (+10).toByte() * (+0b101).toByte()
      expect(result_12 instanceof int).assertTrue()
      expect(result_12).assertEqual(50);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_6800
     * @tc.name      testMultiplicationIntResult0068
     * @tc.desc      13. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as alias Byte and negative octal value, second operand - declared as
     *               alias Byte and positive hex value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_13 = (-0o7).toByte() * (0xb).toByte()
      expect(result_13 instanceof int).assertTrue()
      expect(result_13).assertEqual(-77);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_6900
     * @tc.name      testMultiplicationIntResult0069
     * @tc.desc      14. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as byte and negative hex value, second operand - declared as byte and
     *               negative binary value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_14 = (-0xA).toByte() * (-0B10).toByte()
      expect(result_14 instanceof int).assertTrue()
      expect(result_14).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_7000
     * @tc.name      testMultiplicationIntResult0070
     * @tc.desc      15. Multiplication of bytes with the type conversion by toByte(). First operand
     *               - declared as alias Byte and positive binary value, second operand - declared as
     *               alias Byte and negative decimal value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_15 = (0b101).toByte() * (-12).toByte()
      expect(result_15 instanceof int).assertTrue()
      expect(result_15).assertEqual(-60);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_7100
     * @tc.name      testMultiplicationIntResult0071
     * @tc.desc      16. Multiplication of negative binary byte, negative decimal short and positive
     *               hex int. Each operand with a type conversion (toByte(), toShort(), toInt()). (<Macro
     *               'generate_complete_test_result_expression'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_16 = (-10).toShort() * (0x2_0A).toInt() * -0b10.toByte()
      expect(result_16 instanceof int).assertTrue()
      expect(result_16).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_7200
     * @tc.name      testMultiplicationIntResult0072
     * @tc.desc      17. Multiplication of negative binary byte, positive decimal short and negative
     *               hex int. Each operand with a type conversion (toByte(), toShort(), toInt()) (<Macro
     *               'generate_complete_test_result_expression'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_17 = (1_0).toShort() * (-0x20A).toInt() * -0b00010.toByte()
      expect(result_17 instanceof Int).assertTrue()
      expect(result_17).assertEqual(10440);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_7300
     * @tc.name      testMultiplicationIntResult0073
     * @tc.desc      0. Multiplication of positive shorts. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 123
      let value2: short = 100
      const result_0 = value1 * value2
      expect(result_0 instanceof int).assertTrue()
      expect(result_0).assertEqual(12300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_7400
     * @tc.name      testMultiplicationIntResult0074
     * @tc.desc      1. Multiplication of short (decimal, hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -10
      let value2: short = 0x2_0A
      let result_1 = value1 * value2
      expect(result_1 instanceof int).assertTrue()
      expect(result_1).assertEqual(-5220);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_7500
     * @tc.name      testMultiplicationIntResult0075
     * @tc.desc      2. Multiplication of short (octal, binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 0o74
      let value2: short = -0b101
      const result_2 = value1 * value2
      expect(result_2 instanceof int).assertTrue()
      expect(result_2).assertEqual(-300);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_7600
     * @tc.name      testMultiplicationIntResult0076
     * @tc.desc      3. Multiplication of short (octal, hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -0o7_4
      let value2: short = -0x1Ff
      let result_3 = value1 * value2
      expect(result_3 instanceof int).assertTrue()
      expect(result_3).assertEqual(30660);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_7700
     * @tc.name      testMultiplicationIntResult0077
     * @tc.desc      4. Multiplication of short (decimal, binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -23_00
      let value2: short = +0b10_01
      const result_4 = value1 * value2
      expect(result_4 instanceof int).assertTrue()
      expect(result_4).assertEqual(-0x50d_C);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_7800
     * @tc.name      testMultiplicationIntResult0078
     * @tc.desc      5. Multiplication of short (octal, decimal). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 0o74
      let value2: short = 10
      let result_5 = value1 * value2
      expect(result_5 instanceof int).assertTrue()
      expect(result_5).assertEqual(0b1_001_011_000);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_7900
     * @tc.name      testMultiplicationIntResult0079
     * @tc.desc      6. Multiplication of short (hex, binary). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -0x1a
      let value2: short = -0b100_1
      const result_6 = value1 * value2
      expect(result_6 instanceof int).assertTrue()
      expect(result_6).assertEqual(0o352);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_8000
     * @tc.name      testMultiplicationIntResult0080
     * @tc.desc      7. Multiplication of positive short and 0 (hex). (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 123
      let value2: short = 0x0
      let result_7 = value1 * value2
      expect(result_7 instanceof int).assertTrue()
      expect(result_7).assertEqual(0b0);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_INT_RESULT_8100
     * @tc.name      testMultiplicationIntResult0081
     * @tc.desc      8. Multiplication of positive short (hex) and 0. (<Macro 'generate_complete_test_body_common_keyword_const'>)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationIntResult0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = 0
      let value2: short = -0x1
      const result_8 = value1 * value2
      expect(result_8 instanceof int).assertTrue()
      expect(result_8).assertEqual(0o00);
    });

  });
}
