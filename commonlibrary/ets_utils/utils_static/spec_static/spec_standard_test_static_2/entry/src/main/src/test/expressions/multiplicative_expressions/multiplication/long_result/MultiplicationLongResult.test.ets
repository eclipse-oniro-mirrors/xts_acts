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

export default function MultiplicationLongResultTest(): void {
  describe("MultiplicationLongResultTest", () => {
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
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_0100
     * @tc.name      testMultiplicationLongResult0001
     * @tc.desc      Verify the multiplication of positive long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 2147483649
      let value2: long = 2147483700
      const result_0 = value1 * value2
      expect(result_0 instanceof long).assertTrue()
      expect(result_0).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_0200
     * @tc.name      testMultiplicationLongResult0002
     * @tc.desc      Verify the multiplication of negative long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -2147483649
      let value2: long = -2147483700
      let result_1 = value1 * value2
      expect(result_1 instanceof long).assertTrue()
      expect(result_1).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_0300
     * @tc.name      testMultiplicationLongResult0003
     * @tc.desc      Verify the multiplication of long values in binary and decimal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -0B1000_0000_0000_0000_0000_0000_0000_0001
      let value2: long = -2_147_483_700
      let result_3 = value1 * value2
      expect(result_3 instanceof long).assertTrue()
      expect(result_3).assertEqual(0X4000001A80000034);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_0400
     * @tc.name      testMultiplicationLongResult0004
     * @tc.desc      Verify the multiplication of Long wrapper objects in decimal and octal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(123)
      let value2: Long = new Long(100)
      const result_4 = value1 * value2
      expect(result_4 instanceof long).assertTrue()
      expect(result_4).assertEqual(12300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_0500
     * @tc.name      testMultiplicationLongResult0005
     * @tc.desc      Verify the multiplication of Long wrapper objects in binary and hexadecimal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(-0b10)
      let value2: Long = new Long(0x2_0A)
      let result_5 = value1 * value2
      expect(result_5 instanceof long).assertTrue()
      expect(result_5).assertEqual(-1044);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_0600
     * @tc.name      testMultiplicationLongResult0006
     * @tc.desc      Verify the multiplication of Long wrapper and Byte wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(-3)
      let value2: Byte = new Byte(0x1_a)
      const result_6 = value1 * value2
      expect(result_6 instanceof long).assertTrue()
      expect(result_6).assertEqual(-78);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_0700
     * @tc.name      testMultiplicationLongResult0007
     * @tc.desc      Verify the multiplication of Short wrapper and Long wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(-3)
      let value2: Long = new Long(0x1_a)
      let result_7 = value1 * value2
      expect(result_7 instanceof long).assertTrue()
      expect(result_7).assertEqual(-78);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_0800
     * @tc.name      testMultiplicationLongResult0008
     * @tc.desc      Verify the multiplication of Int wrapper and Long wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = new Int(74)
      let value2: Long = new Long(-0b101)
      const result_8 = value1 * value2
      expect(result_8 instanceof long).assertTrue()
      expect(result_8).assertEqual(-370);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_0900
     * @tc.name      testMultiplicationLongResult0009
     * @tc.desc      Verify the continuous multiplication of Byte, Long, and Int wrappers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(1_000000000000000)
      let value2: Int = new Int(-0x20A)
      let value3: Byte = new Byte(-0b00010)
      let result_9 = value1 * value2 * value3
      expect(result_9 instanceof long).assertTrue()
      expect(result_9).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_1000
     * @tc.name      testMultiplicationLongResult0010
     * @tc.desc      Verify the continuous multiplication of Byte, Short, and Long wrappers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(1_0)
      let value2: Long = new Long(-0xB9739F99468000)
      let value3: Byte = new Byte(-0b00010)
      const result_10 = value1 * value2 * value3
      expect(result_10 instanceof long).assertTrue()
      expect(result_10).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_1100
     * @tc.name      testMultiplicationLongResult0011
     * @tc.desc      Verify the continuous multiplication of Long, Short, and Int wrappers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(2_0)
      let value2: Int = new Int(-0x20A)
      let value3: Long = new Long(-0b0010110101111001100010000011110100100000000000000)
      let result_11 = value1 * value2 * value3
      expect(result_11 instanceof long).assertTrue()
      expect(result_11).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_1200
     * @tc.name      testMultiplicationLongResult0012
     * @tc.desc      Verify the multiplication of Int maximum value and negative Long wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(-2)
      let value2: Int = Int.MAX_VALUE
      const result_12 = value1 * value2
      expect(result_12 instanceof long).assertTrue()
      expect(result_12).assertEqual(-4294967294);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_1300
     * @tc.name      testMultiplicationLongResult0013
     * @tc.desc      Verify the multiplication of Int maximum value and positive Long wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MAX_VALUE
      let value2: Long = new Long(10)
      let result_13 = value1 * value2
      expect(result_13 instanceof long).assertTrue()
      expect(result_13).assertEqual(21474836470);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_1400
     * @tc.name      testMultiplicationLongResult0014
     * @tc.desc      Verify the multiplication of Int maximum value and Long wrapper with value 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = Int.MAX_VALUE
      let value2: Long = new Long(0)
      const result_14 = value1 * value2
      expect(result_14 instanceof long).assertTrue()
      expect(result_14).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_1500
     * @tc.name      testMultiplicationLongResult0015
     * @tc.desc      Verify the multiplication of negative Int maximum value and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(-1)
      let value2: int = -Int.MAX_VALUE
      let result_15 = value1 * value2
      expect(result_15 instanceof long).assertTrue()
      expect(result_15).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_1600
     * @tc.name      testMultiplicationLongResult0016
     * @tc.desc      Verify the multiplication of Int minimum value and positive Long wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MIN_VALUE
      let value2: Long = new Long(2)
      const result_16 = value1 * value2
      expect(result_16 instanceof long).assertTrue()
      expect(result_16).assertEqual(-4294967296);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_1700
     * @tc.name      testMultiplicationLongResult0017
     * @tc.desc      Verify the multiplication of Int minimum value and Long wrapper with value 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = Int.MIN_VALUE
      let value2: Long = new Long(0x000000000_000)
      let result_17 = value1 * value2
      expect(result_17 instanceof long).assertTrue()
      expect(result_17).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_1800
     * @tc.name      testMultiplicationLongResult0018
     * @tc.desc      Verify the multiplication of negated Int minimum value (long) and negative Long wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -(Int.MIN_VALUE.toLong())
      let value2: Long = new Long(-2)
      const result_18 = value1 * value2
      expect(result_18 instanceof long).assertTrue()
      expect(result_18).assertEqual(-4294967296);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_1900
     * @tc.name      testMultiplicationLongResult0019
     * @tc.desc      Verify the multiplication of Int minimum value and Long wrapper with value -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MIN_VALUE
      let value2: Long = new Long(-1)
      let result_19 = value1 * value2
      expect(result_19 instanceof long).assertTrue()
      expect(result_19).assertEqual(2147483648);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_2000
     * @tc.name      testMultiplicationLongResult0020
     * @tc.desc      Verify the multiplication of Long maximum value and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MAX_VALUE
      let value2: int = -1
      const result_20 = value1 * value2
      expect(result_20 instanceof long).assertTrue()
      expect(result_20).assertEqual(-9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_2100
     * @tc.name      testMultiplicationLongResult0021
     * @tc.desc      Verify the multiplication of Long maximum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MAX_VALUE
      let value2: int = 1
      let result_21 = value1 * value2
      expect(result_21 instanceof long).assertTrue()
      expect(result_21).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_2200
     * @tc.name      testMultiplicationLongResult0022
     * @tc.desc      Verify the multiplication of Long maximum value and 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = Long.MAX_VALUE
      let value2: int = 0
      const result_22 = value1 * value2
      expect(result_22 instanceof long).assertTrue()
      expect(result_22).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_2300
     * @tc.name      testMultiplicationLongResult0023
     * @tc.desc      Verify the multiplication of negative Long maximum value and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -Long.MAX_VALUE
      let value2: int = -1
      let result_23 = value1 * value2
      expect(result_23 instanceof long).assertTrue()
      expect(result_23).assertEqual(Long.MAX_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_2400
     * @tc.name      testMultiplicationLongResult0024
     * @tc.desc      Verify the multiplication of Long minimum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = Long.MIN_VALUE
      let value2: int = 1
      const result_24 = value1 * value2
      expect(result_24 instanceof long).assertTrue()
      expect(result_24).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_2500
     * @tc.name      testMultiplicationLongResult0025
     * @tc.desc      Verify the multiplication of Long minimum value and 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MIN_VALUE
      let value2: int = 0
      let result_25 = value1 * value2
      expect(result_25 instanceof long).assertTrue()
      expect(result_25).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_2600
     * @tc.name      testMultiplicationLongResult0026
     * @tc.desc      Verify the multiplication of negative Long minimum value and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = -Long.MIN_VALUE
      let value2: int = -1
      const result_26 = value1 * value2
      expect(result_26 instanceof long).assertTrue()
      expect(result_26).assertEqual(Long.MIN_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_2700
     * @tc.name      testMultiplicationLongResult0027
     * @tc.desc      Verify the multiplication of Long maximum value and Long wrapper with value -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MAX_VALUE
      let value2: Long = new Long(-1)
      let result_27 = value1 * value2
      expect(result_27 instanceof long).assertTrue()
      expect(result_27).assertEqual(-9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_2800
     * @tc.name      testMultiplicationLongResult0028
     * @tc.desc      Verify the multiplication of Long maximum value and Long wrapper with value 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MAX_VALUE
      let value2: Long = new Long(1)
      const result_28 = value1 * value2
      expect(result_28 instanceof long).assertTrue()
      expect(result_28).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_2900
     * @tc.name      testMultiplicationLongResult0029
     * @tc.desc      Verify the multiplication of Long maximum value and Long wrapper with value 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = Long.MAX_VALUE
      let value2: Long = new Long(0)
      let result_29 = value1 * value2
      expect(result_29 instanceof long).assertTrue()
      expect(result_29).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_3000
     * @tc.name      testMultiplicationLongResult0030
     * @tc.desc      Verify the multiplication of negative Long maximum value and Long wrapper with value -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -Long.MAX_VALUE
      let value2: Long = new Long(-1)
      const result_30 = value1 * value2
      expect(result_30 instanceof long).assertTrue()
      expect(result_30).assertEqual(Long.MAX_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_3100
     * @tc.name      testMultiplicationLongResult0031
     * @tc.desc      Verify the multiplication of Long minimum value and Long wrapper with value 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = Long.MIN_VALUE
      let value2: Long = new Long(1)
      let result_31 = value1 * value2
      expect(result_31 instanceof long).assertTrue()
      expect(result_31).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_3200
     * @tc.name      testMultiplicationLongResult0032
     * @tc.desc      Verify the multiplication of Long minimum value and Long wrapper with value 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MIN_VALUE
      let value2: Long = new Long(0)
      const result_32 = value1 * value2
      expect(result_32 instanceof long).assertTrue()
      expect(result_32).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_3300
     * @tc.name      testMultiplicationLongResult0033
     * @tc.desc      Verify the multiplication of negative Long minimum value and Long wrapper with value -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = -Long.MIN_VALUE
      let value2: Long = new Long(-1)
      let result_33 = value1 * value2
      expect(result_33 instanceof long).assertTrue()
      expect(result_33).assertEqual(Long.MIN_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_3400
     * @tc.name      testMultiplicationLongResult0034
     * @tc.desc      Verify the multiplication of decimal Long maximum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 9223372036854775807
      let value2: int = 1
      const result_34 = value1 * value2
      expect(result_34 instanceof long).assertTrue()
      expect(result_34).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_3500
     * @tc.name      testMultiplicationLongResult0035
     * @tc.desc      Verify the multiplication of hexadecimal Long maximum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 0x7FFFFfFFFFFFfFFF
      let value2: int = 1
      let result_35 = value1 * value2
      expect(result_35 instanceof long).assertTrue()
      expect(result_35).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_3600
     * @tc.name      testMultiplicationLongResult0036
     * @tc.desc      Verify the multiplication of binary Long maximum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 0b111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111
      let value2: int = 1
      let result_37 = value1 * value2
      expect(result_37 instanceof long).assertTrue()
      expect(result_37).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_3700
     * @tc.name      testMultiplicationLongResult0037
     * @tc.desc      Verify the multiplication of decimal Long minimum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = -9223372036854775808
      let value2: int = 1
      const result_38 = value1 * value2
      expect(result_38 instanceof long).assertTrue()
      expect(result_38).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_3800
     * @tc.name      testMultiplicationLongResult0038
     * @tc.desc      Verify the multiplication of converted negative long and positive long to Long wrappers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = (-2147483649).toLong()
      let value2: Long = (2147483700).toLong()
      let result_45 = value1 * value2
      expect(result_45 instanceof long).assertTrue()
      expect(result_45).assertEqual(-4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_3900
     * @tc.name      testMultiplicationLongResult0039
     * @tc.desc      Verify the multiplication of two converted negative long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = (-2147483649).toLong()
      let value2: long = (-2147483700).toLong()
      const result_46 = value1 * value2
      expect(result_46 instanceof long).assertTrue()
      expect(result_46).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_4000
     * @tc.name      testMultiplicationLongResult0040
     * @tc.desc      Verify the multiplication of converted positive long and negative long to Long wrappers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = (2147483649).toLong()
      let value2: Long = (-2147483700).toLong()
      let result_47 = value1 * value2
      expect(result_47 instanceof long).assertTrue()
      expect(result_47).assertEqual(-4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_4100
     * @tc.name      testMultiplicationLongResult0041
     * @tc.desc      Verify the multiplication of two converted negative long values (long and Long).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = (-12).toLong()
      let value2: Long = (-10).toLong()
      const result_48 = value1 * value2
      expect(result_48 instanceof long).assertTrue()
      expect(result_48).assertEqual(120);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_4200
     * @tc.name      testMultiplicationLongResult0042
     * @tc.desc      Verify the multiplication of binary negative long and hexadecimal long.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = (-0b10).toLong()
      let value2: long = (0xA).toLong()
      let result_49 = value1 * value2
      expect(result_49 instanceof long).assertTrue()
      expect(result_49).assertEqual(-20);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_4300
     * @tc.name      testMultiplicationLongResult0043
     * @tc.desc      Verify the multiplication of positive long and hexadecimal negative Long wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = (5).toLong()
      let value2: Long = (-0xa).toLong()
      const result_50 = value1 * value2
      expect(result_50 instanceof long).assertTrue()
      expect(result_50).assertEqual(-50);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_4400
     * @tc.name      testMultiplicationLongResult0044
     * @tc.desc      Verify the multiplication of two positive Long wrappers (decimal and binary).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = (+2).toLong()
      let value2: Long = (+0b10).toLong()
      let result_51 = value1 * value2
      expect(result_51 instanceof long).assertTrue()
      expect(result_51).assertEqual(4);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_4500
     * @tc.name      testMultiplicationLongResult0045
     * @tc.desc      Verify the multiplication of positive int and long with value 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 5
      let value2: long = (0).toLong()
      const result_52 = value1 * value2
      expect(result_52 instanceof long).assertTrue()
      expect(result_52).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_4600
     * @tc.name      testMultiplicationLongResult0046
     * @tc.desc      Verify the multiplication of negative int and Long wrapper with value 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -5
      let value2: Long = (0).toLong()
      let result_53 = value1 * value2
      expect(result_53 instanceof long).assertTrue()
      expect(result_53).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_4700
     * @tc.name      testMultiplicationLongResult0047
     * @tc.desc      Verify the direct multiplication of Long wrapper and Byte wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResult0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Byte = new Byte(0x1_a)
      const result_6 = new Long(-3) * value2
      expect(result_6 instanceof long).assertTrue()
      expect(result_6).assertEqual(-78);
    })
  });
}
