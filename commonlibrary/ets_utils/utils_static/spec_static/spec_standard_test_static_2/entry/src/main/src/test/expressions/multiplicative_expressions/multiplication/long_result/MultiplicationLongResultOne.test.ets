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

export default function MultiplicationLongResultOneTest(): void {
  describe("MultiplicationLongResultOneTest", () => {
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
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_0100
     * @tc.name      testMultiplicationLongResultOne0001
     * @tc.desc      Verify the multiplication result of Short and Long types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(0x1_a)
      let result_7 = new Short(-3) * value2
      expect(result_7 instanceof long).assertTrue()
      expect(result_7).assertEqual(-78);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_0200
     * @tc.name      testMultiplicationLongResultOne0002
     * @tc.desc      Verify the multiplication result of Int and Long types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(-0b101)
      const result_8 = new Int(74) * value2
      expect(result_8 instanceof long).assertTrue()
      expect(result_8).assertEqual(-370);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_0300
     * @tc.name      testMultiplicationLongResultOne0003
     * @tc.desc      Verify the multiplication result of Byte, Long and Int types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = new Int(-0x20A)
      let value3: Byte = new Byte(-0b00010)
      let result_9 = new Long(1_000000000000000) * value2 * value3
      expect(result_9 instanceof long).assertTrue()
      expect(result_9).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_0400
     * @tc.name      testMultiplicationLongResultOne0004
     * @tc.desc      Verify the multiplication result of Byte, Short and Long types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(-0xB9739F99468000)
      let value3: Byte = new Byte(-0b00010)
      const result_10 = new Short(1_0) * value2 * value3
      expect(result_10 instanceof long).assertTrue()
      expect(result_10).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_0500
     * @tc.name      testMultiplicationLongResultOne0005
     * @tc.desc      Verify the multiplication result of Long, Short and Int types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = new Int(-0x20A)
      let value3: Long = new Long(-0b0010110101111001100010000011110100100000000000000)
      let result_11 = new Short(2_0) * value2 * value3
      expect(result_11 instanceof long).assertTrue()
      expect(result_11).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_0600
     * @tc.name      testMultiplicationLongResultOne0006
     * @tc.desc      Verify the multiplication of maximum Int value and negative Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Int = Int.MAX_VALUE
      const result_12 = new Long(-2) * value2
      expect(result_12 instanceof long).assertTrue()
      expect(result_12).assertEqual(-4294967294);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_0700
     * @tc.name      testMultiplicationLongResultOne0007
     * @tc.desc      Verify the multiplication of maximum Int value and positive Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(10)
      let result_13 = Int.MAX_VALUE * value2
      expect(result_13 instanceof long).assertTrue()
      expect(result_13).assertEqual(21474836470);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_0800
     * @tc.name      testMultiplicationLongResultOne0008
     * @tc.desc      Verify the multiplication of maximum Int value and zero Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(0)
      const result_14 = Int.MAX_VALUE * value2
      expect(result_14 instanceof long).assertTrue()
      expect(result_14).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_0900
     * @tc.name      testMultiplicationLongResultOne0009
     * @tc.desc      Verify the multiplication of negative maximum Int value and -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -Int.MAX_VALUE
      let result_15 = new Long(-1) * value2
      expect(result_15 instanceof long).assertTrue()
      expect(result_15).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_1000
     * @tc.name      testMultiplicationLongResultOne0010
     * @tc.desc      Verify the multiplication of minimum Int value and positive Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(2)
      const result_16 = Int.MIN_VALUE * value2
      expect(result_16 instanceof long).assertTrue()
      expect(result_16).assertEqual(-4294967296);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_1100
     * @tc.name      testMultiplicationLongResultOne0011
     * @tc.desc      Verify the multiplication of minimum Int value and zero Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(0x000000000_000)
      let result_17 = Int.MIN_VALUE * value2
      expect(result_17 instanceof long).assertTrue()
      expect(result_17).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_1200
     * @tc.name      testMultiplicationLongResultOne0012
     * @tc.desc      Verify the multiplication of converted minimum Int value and negative Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(-2)
      const result_18 = -(Int.MIN_VALUE.toLong()) * value2
      expect(result_18 instanceof long).assertTrue()
      expect(result_18).assertEqual(-4294967296);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_1300
     * @tc.name      testMultiplicationLongResultOne0013
     * @tc.desc      Verify the multiplication of minimum Int value and -1 Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(-1)
      let result_19 = Int.MIN_VALUE * value2
      expect(result_19 instanceof long).assertTrue()
      expect(result_19).assertEqual(2147483648);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_1400
     * @tc.name      testMultiplicationLongResultOne0014
     * @tc.desc      Verify the multiplication of maximum Long value and -1 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -1
      const result_20 = Long.MAX_VALUE * value2
      expect(result_20 instanceof long).assertTrue()
      expect(result_20).assertEqual(-9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_1500
     * @tc.name      testMultiplicationLongResultOne0015
     * @tc.desc      Verify the multiplication of maximum Long value and 1 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      let result_21 = Long.MAX_VALUE * value2
      expect(result_21 instanceof long).assertTrue()
      expect(result_21).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_1600
     * @tc.name      testMultiplicationLongResultOne0016
     * @tc.desc      Verify the multiplication of maximum Long value and 0 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0
      const result_22 = Long.MAX_VALUE * value2
      expect(result_22 instanceof long).assertTrue()
      expect(result_22).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_1700
     * @tc.name      testMultiplicationLongResultOne0017
     * @tc.desc      Verify the multiplication of negative maximum Long value and -1 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -1
      let result_23 = -Long.MAX_VALUE * value2
      expect(result_23 instanceof long).assertTrue()
      expect(result_23).assertEqual(Long.MAX_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_1800
     * @tc.name      testMultiplicationLongResultOne0018
     * @tc.desc      Verify the multiplication of minimum Long value and 1 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      const result_24 = Long.MIN_VALUE * value2
      expect(result_24 instanceof long).assertTrue()
      expect(result_24).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_1900
     * @tc.name      testMultiplicationLongResultOne0019
     * @tc.desc      Verify the multiplication of minimum Long value and 0 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 0
      let result_25 = Long.MIN_VALUE * value2
      expect(result_25 instanceof long).assertTrue()
      expect(result_25).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_2000
     * @tc.name      testMultiplicationLongResultOne0020
     * @tc.desc      Verify the multiplication of negative minimum Long value and -1 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = -1
      const result_26 = -Long.MIN_VALUE * value2
      expect(result_26 instanceof long).assertTrue()
      expect(result_26).assertEqual(Long.MIN_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_2100
     * @tc.name      testMultiplicationLongResultOne0021
     * @tc.desc      Verify the multiplication of maximum Long value and -1 Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(-1)
      let result_27 = Long.MAX_VALUE * value2
      expect(result_27 instanceof long).assertTrue()
      expect(result_27).assertEqual(-9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_2200
     * @tc.name      testMultiplicationLongResultOne0022
     * @tc.desc      Verify the multiplication of maximum Long value and 1 Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(1)
      const result_28 = Long.MAX_VALUE * value2
      expect(result_28 instanceof long).assertTrue()
      expect(result_28).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_2300
     * @tc.name      testMultiplicationLongResultOne0023
     * @tc.desc      Verify the multiplication of maximum Long value and 0 Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(0)
      let result_29 = Long.MAX_VALUE * value2
      expect(result_29 instanceof long).assertTrue()
      expect(result_29).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_2400
     * @tc.name      testMultiplicationLongResultOne0024
     * @tc.desc      Verify the multiplication of negative maximum Long value and -1 Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(-1)
      const result_30 = -Long.MAX_VALUE * value2
      expect(result_30 instanceof long).assertTrue()
      expect(result_30).assertEqual(Long.MAX_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_2500
     * @tc.name      testMultiplicationLongResultOne0025
     * @tc.desc      Verify the multiplication of minimum Long value and 1 Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(1)
      let result_31 = Long.MIN_VALUE * value2
      expect(result_31 instanceof long).assertTrue()
      expect(result_31).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_2600
     * @tc.name      testMultiplicationLongResultOne0026
     * @tc.desc      Verify the multiplication of minimum Long value and 0 Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(0)
      const result_32 = Long.MIN_VALUE * value2
      expect(result_32 instanceof long).assertTrue()
      expect(result_32).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_2700
     * @tc.name      testMultiplicationLongResultOne0027
     * @tc.desc      Verify the multiplication of negative minimum Long value and -1 Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(-1)
      let result_33 = -Long.MIN_VALUE * value2
      expect(result_33 instanceof long).assertTrue()
      expect(result_33).assertEqual(Long.MIN_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_2800
     * @tc.name      testMultiplicationLongResultOne0028
     * @tc.desc      Verify the multiplication of decimal maximum Long value and 1 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      const result_34 = 9223372036854775807 * value2
      expect(result_34 instanceof long).assertTrue()
      expect(result_34).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_2900
     * @tc.name      testMultiplicationLongResultOne0029
     * @tc.desc      Verify the multiplication of hexadecimal maximum Long value and 1 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      let result_35 = 0x7FFFFfFFFFFFfFFF * value2
      expect(result_35 instanceof long).assertTrue()
      expect(result_35).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_3000
     * @tc.name      testMultiplicationLongResultOne0030
     * @tc.desc      Verify the multiplication of binary maximum Long value and 1 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      let result_37 = 0b111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111 * value2
      expect(result_37 instanceof long).assertTrue()
      expect(result_37).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_3100
     * @tc.name      testMultiplicationLongResultOne0031
     * @tc.desc      Verify the multiplication of decimal minimum Long value and 1 int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: int = 1
      const result_38 = -9223372036854775808 * value2
      expect(result_38 instanceof long).assertTrue()
      expect(result_38).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_3200
     * @tc.name      testMultiplicationLongResultOne0032
     * @tc.desc      Verify the multiplication of hexadecimal and octal positive long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: long = 2000000_0064;
      const result_42 = 0x80_00_00_01 * value2;
      expect(result_42 instanceof long).assertTrue();
      expect(result_42).assertEqual(6056184970019850304);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_3300
     * @tc.name      testMultiplicationLongResultOne0033
     * @tc.desc      Verify the multiplication of two positive converted long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: long = (+2147483700).toLong()
      const result_44 = (+2147483649).toLong() * value2
      expect(result_44 instanceof long).assertTrue()
      expect(result_44).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_3400
     * @tc.name      testMultiplicationLongResultOne0034
     * @tc.desc      Verify the multiplication of negative and positive converted long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = (2147483700).toLong()
      let result_45 = (-2147483649).toLong() * value2
      expect(result_45 instanceof long).assertTrue()
      expect(result_45).assertEqual(-4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_3500
     * @tc.name      testMultiplicationLongResultOne0035
     * @tc.desc      Verify the multiplication of two negative converted long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: long = (-2147483700).toLong()
      const result_46 = (-2147483649).toLong() * value2
      expect(result_46 instanceof long).assertTrue()
      expect(result_46).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_3600
     * @tc.name      testMultiplicationLongResultOne0036
     * @tc.desc      Verify the multiplication of positive and negative converted long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = (-2147483700).toLong()
      let result_47 = (2147483649).toLong() * value2
      expect(result_47 instanceof long).assertTrue()
      expect(result_47).assertEqual(-4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_3700
     * @tc.name      testMultiplicationLongResultOne0037
     * @tc.desc      Verify the multiplication of two small negative converted long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = (-10).toLong()
      const result_48 = (-12).toLong() * value2
      expect(result_48 instanceof long).assertTrue()
      expect(result_48).assertEqual(120);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_3800
     * @tc.name      testMultiplicationLongResultOne0038
     * @tc.desc      Verify the multiplication of binary negative and hexadecimal positive long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: long = (0xA).toLong()
      let result_49 = (-0b10).toLong() * value2
      expect(result_49 instanceof long).assertTrue()
      expect(result_49).assertEqual(-20);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_3900
     * @tc.name      testMultiplicationLongResultOne0039
     * @tc.desc      Verify the multiplication of positive and hexadecimal negative long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = (-0xa).toLong()
      const result_50 = (5).toLong() * value2
      expect(result_50 instanceof long).assertTrue()
      expect(result_50).assertEqual(-50);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_4000
     * @tc.name      testMultiplicationLongResultOne0040
     * @tc.desc      Verify the multiplication of two binary positive converted long values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = (+0b10).toLong()
      let result_51 = (+2).toLong() * value2
      expect(result_51 instanceof long).assertTrue()
      expect(result_51).assertEqual(4);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_4100
     * @tc.name      testMultiplicationLongResultOne0041
     * @tc.desc      Verify the multiplication of positive int and zero converted long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: long = (0).toLong()
      const result_52 = 5 * value2
      expect(result_52 instanceof long).assertTrue()
      expect(result_52).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_4200
     * @tc.name      testMultiplicationLongResultOne0042
     * @tc.desc      Verify the multiplication of negative int and zero converted long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = (0).toLong()
      let result_53 = -5 * value2
      expect(result_53 instanceof long).assertTrue()
      expect(result_53).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_4300
     * @tc.name      testMultiplicationLongResultOne0043
     * @tc.desc      Verify the multiplication of converted minimum Int value and negative Long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value2: Long = new Long(-24);
      const result_54 = -(Int.MIN_VALUE.toLong()) * value2;
      expect(result_54 instanceof Long).assertTrue();
      expect(result_54).assertEqual(-51539607552);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_4400
     * @tc.name      testMultiplicationLongResultOne0044
     * @tc.desc      Verify the multiplication of two positive long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 2147483649
      const result_0 = value1 * 2147483700
      expect(result_0 instanceof long).assertTrue()
      expect(result_0).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_4500
     * @tc.name      testMultiplicationLongResultOne0045
     * @tc.desc      Verify the multiplication of two negative long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -2147483649
      let result_1 = value1 * -2147483700
      expect(result_1 instanceof long).assertTrue()
      expect(result_1).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_4600
     * @tc.name      testMultiplicationLongResultOne0046
     * @tc.desc      Verify the multiplication of hexadecimal and octal long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -0x80_00_00_01;
      const result_2 = value1 * 2000000_0064; // 修改后的代码
      expect(result_2 instanceof long).assertTrue();
      expect(result_2).assertEqual(-6056184970019850304);
    });

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_4700
     * @tc.name      testMultiplicationLongResultOne0047
     * @tc.desc      Verify the multiplication of binary and decimal long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -0B1000_0000_0000_0000_0000_0000_0000_0001
      let result_3 = value1 * -2_147_483_700
      expect(result_3 instanceof long).assertTrue()
      expect(result_3).assertEqual(0X4000001A80000034);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_4800
     * @tc.name      testMultiplicationLongResultOne0048
     * @tc.desc      Verify the multiplication of decimal and octal Long type variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(123)
      const result_4 = value1 * new Long(100)
      expect(result_4 instanceof long).assertTrue()
      expect(result_4).assertEqual(12300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_4900
     * @tc.name      testMultiplicationLongResultOne0049
     * @tc.desc      Verify the multiplication of binary and hexadecimal Long type variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(-0b10)
      let result_5 = value1 * new Long(0x2_0A)
      expect(result_5 instanceof long).assertTrue()
      expect(result_5).assertEqual(-1044);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_5000
     * @tc.name      testMultiplicationLongResultOne0050
     * @tc.desc      Verify the multiplication of Long and Byte type variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(-3)
      const result_6 = value1 * new Byte(0x1_a)
      expect(result_6 instanceof long).assertTrue()
      expect(result_6).assertEqual(-78);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_5100
     * @tc.name      testMultiplicationLongResultOne0051
     * @tc.desc      Verify the multiplication of Short and Long type variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(-3)
      let result_7 = value1 * new Long(0x1_a)
      expect(result_7 instanceof long).assertTrue()
      expect(result_7).assertEqual(-78);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_5200
     * @tc.name      testMultiplicationLongResultOne0052
     * @tc.desc      Verify the multiplication of Int and Long type variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = new Int(74)
      const result_8 = value1 * new Long(-0b101)
      expect(result_8 instanceof long).assertTrue()
      expect(result_8).assertEqual(-370);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_5300
     * @tc.name      testMultiplicationLongResultOne0053
     * @tc.desc      Verify the multiplication of Byte, Long and Int type variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(1_000000000000000)
      const value3: Byte = new Byte(-0b00010)
      let result_9 = value1 * new Int(-0x20A) * value3
      expect(result_9 instanceof long).assertTrue()
      expect(result_9).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_5400
     * @tc.name      testMultiplicationLongResultOne0054
     * @tc.desc      Verify the multiplication of Byte, Short and Long type variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(1_0)
      const value3: Byte = new Byte(-0b00010)
      const result_10 = value1 * new Long(-0xB9739F99468000) * value3
      expect(result_10 instanceof long).assertTrue()
      expect(result_10).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_5500
     * @tc.name      testMultiplicationLongResultOne0055
     * @tc.desc      Verify the multiplication of Long, Short and Int type variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Short = new Short(2_0)
      const value3: Long = new Long(-0b0010110101111001100010000011110100100000000000000)
      let result_11 = value1 * new Int(-0x20A) * value3
      expect(result_11 instanceof long).assertTrue()
      expect(result_11).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_5600
     * @tc.name      testMultiplicationLongResultOne0056
     * @tc.desc      Verify the multiplication of maximum Int value and negative Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(-2)
      const result_12 = value1 * Int.MAX_VALUE
      expect(result_12 instanceof long).assertTrue()
      expect(result_12).assertEqual(-4294967294);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_5700
     * @tc.name      testMultiplicationLongResultOne0057
     * @tc.desc      Verify the multiplication of maximum Int value and positive Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MAX_VALUE
      let result_13 = value1 * new Long(10)
      expect(result_13 instanceof long).assertTrue()
      expect(result_13).assertEqual(21474836470);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_5800
     * @tc.name      testMultiplicationLongResultOne0058
     * @tc.desc      Verify the multiplication of maximum Int value and zero Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = Int.MAX_VALUE
      const result_14 = value1 * new Long(0)
      expect(result_14 instanceof long).assertTrue()
      expect(result_14).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_5900
     * @tc.name      testMultiplicationLongResultOne0059
     * @tc.desc      Verify the multiplication of negative maximum Int value and -1 Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(-1)
      let result_15 = value1 * -Int.MAX_VALUE
      expect(result_15 instanceof long).assertTrue()
      expect(result_15).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_6000
     * @tc.name      testMultiplicationLongResultOne0060
     * @tc.desc      Verify the multiplication of minimum Int value and positive Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MIN_VALUE
      const result_16 = value1 * new Long(2)
      expect(result_16 instanceof long).assertTrue()
      expect(result_16).assertEqual(-4294967296);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_6100
     * @tc.name      testMultiplicationLongResultOne0061
     * @tc.desc      Verify the multiplication of minimum Int value and zero Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = Int.MIN_VALUE
      let result_17 = value1 * new Long(0x000000000_000)
      expect(result_17 instanceof long).assertTrue()
      expect(result_17).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_6200
     * @tc.name      testMultiplicationLongResultOne0062
     * @tc.desc      Verify the multiplication of converted minimum Int value and negative Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -(Int.MIN_VALUE.toLong())
      const result_18 = value1 * new Long(-2)
      expect(result_18 instanceof long).assertTrue()
      expect(result_18).assertEqual(-4294967296);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_6300
     * @tc.name      testMultiplicationLongResultOne0063
     * @tc.desc      Verify the multiplication of minimum Int value and -1 Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MIN_VALUE
      let result_19 = value1 * new Long(-1)
      expect(result_19 instanceof long).assertTrue()
      expect(result_19).assertEqual(2147483648);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_6400
     * @tc.name      testMultiplicationLongResultOne0064
     * @tc.desc      Verify the multiplication of maximum Long value and -1 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MAX_VALUE
      const result_20 = value1 * -1
      expect(result_20 instanceof long).assertTrue()
      expect(result_20).assertEqual(-9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_6500
     * @tc.name      testMultiplicationLongResultOne0065
     * @tc.desc      Verify the multiplication of maximum Long value and 1 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MAX_VALUE
      let result_21 = value1 * 1
      expect(result_21 instanceof long).assertTrue()
      expect(result_21).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_6600
     * @tc.name      testMultiplicationLongResultOne0066
     * @tc.desc      Verify the multiplication of maximum Long value and 0 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = Long.MAX_VALUE
      const result_22 = value1 * 0
      expect(result_22 instanceof long).assertTrue()
      expect(result_22).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_6700
     * @tc.name      testMultiplicationLongResultOne0067
     * @tc.desc      Verify the multiplication of negative maximum Long value and -1 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -Long.MAX_VALUE
      let result_23 = value1 * -1
      expect(result_23 instanceof long).assertTrue()
      expect(result_23).assertEqual(Long.MAX_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_6800
     * @tc.name      testMultiplicationLongResultOne0068
     * @tc.desc      Verify the multiplication of minimum Long value and 1 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = Long.MIN_VALUE
      const result_24 = value1 * 1
      expect(result_24 instanceof long).assertTrue()
      expect(result_24).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_6900
     * @tc.name      testMultiplicationLongResultOne0069
     * @tc.desc      Verify the multiplication of minimum Long value and 0 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MIN_VALUE
      let result_25 = value1 * 0
      expect(result_25 instanceof long).assertTrue()
      expect(result_25).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_7000
     * @tc.name      testMultiplicationLongResultOne0070
     * @tc.desc      Verify the multiplication of negative minimum Long value and -1 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = -Long.MIN_VALUE
      const result_26 = value1 * -1
      expect(result_26 instanceof long).assertTrue()
      expect(result_26).assertEqual(Long.MIN_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_7100
     * @tc.name      testMultiplicationLongResultOne0071
     * @tc.desc      Verify the multiplication of maximum Long value and -1 Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MAX_VALUE
      let result_27 = value1 * new Long(-1)
      expect(result_27 instanceof long).assertTrue()
      expect(result_27).assertEqual(-9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_7200
     * @tc.name      testMultiplicationLongResultOne0072
     * @tc.desc      Verify the multiplication of maximum Long value and 1 Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MAX_VALUE
      const result_28 = value1 * new Long(1)
      expect(result_28 instanceof long).assertTrue()
      expect(result_28).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_7300
     * @tc.name      testMultiplicationLongResultOne0073
     * @tc.desc      Verify the multiplication of maximum Long value and 0 Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = Long.MAX_VALUE
      let result_29 = value1 * new Long(0)
      expect(result_29 instanceof long).assertTrue()
      expect(result_29).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_7400
     * @tc.name      testMultiplicationLongResultOne0074
     * @tc.desc      Verify the multiplication of negative maximum Long value and -1 Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -Long.MAX_VALUE
      const result_30 = value1 * new Long(-1)
      expect(result_30 instanceof long).assertTrue()
      expect(result_30).assertEqual(Long.MAX_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_7500
     * @tc.name      testMultiplicationLongResultOne0075
     * @tc.desc      Verify the multiplication of minimum Long value and 1 Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = Long.MIN_VALUE
      let result_31 = value1 * new Long(1)
      expect(result_31 instanceof long).assertTrue()
      expect(result_31).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_7600
     * @tc.name      testMultiplicationLongResultOne0076
     * @tc.desc      Verify the multiplication of minimum Long value and 0 Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = Long.MIN_VALUE
      const result_32 = value1 * new Long(0)
      expect(result_32 instanceof long).assertTrue()
      expect(result_32).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_7700
     * @tc.name      testMultiplicationLongResultOne0077
     * @tc.desc      Verify the multiplication of negative minimum Long value and -1 Long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = -Long.MIN_VALUE
      let result_33 = value1 * new Long(-1)
      expect(result_33 instanceof long).assertTrue()
      expect(result_33).assertEqual(Long.MIN_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_7800
     * @tc.name      testMultiplicationLongResultOne0078
     * @tc.desc      Verify the multiplication of decimal maximum Long value and 1 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 9223372036854775807
      const result_34 = value1 * 1
      expect(result_34 instanceof long).assertTrue()
      expect(result_34).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_7900
     * @tc.name      testMultiplicationLongResultOne0079
     * @tc.desc      Verify the multiplication of hexadecimal maximum Long value and 1 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 0x7FFFFfFFFFFFfFFF
      let result_35 = value1 * 1
      expect(result_35 instanceof long).assertTrue()
      expect(result_35).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_8000
     * @tc.name      testMultiplicationLongResultOne0080
     * @tc.desc      Verify the multiplication of binary maximum Long value and 1 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 0b111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111
      let result_37 = value1 * 1
      expect(result_37 instanceof long).assertTrue()
      expect(result_37).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_8100
     * @tc.name      testMultiplicationLongResultOne0081
     * @tc.desc      Verify the multiplication of decimal minimum Long value and 1 int variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = -9223372036854775808
      const result_38 = value1 * 1
      expect(result_38 instanceof long).assertTrue()
      expect(result_38).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_8200
     * @tc.name      testMultiplicationLongResultOne0082
     * @tc.desc      Verify the multiplication of two positive converted long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = (+2147483649).toLong()
      const result_44 = value1 * (+2147483700).toLong()
      expect(result_44 instanceof long).assertTrue()
      expect(result_44).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_8300
     * @tc.name      testMultiplicationLongResultOne0083
     * @tc.desc      Verify the multiplication of negative and positive converted long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = (-2147483649).toLong()
      let result_45 = value1 * (2147483700).toLong()
      expect(result_45 instanceof long).assertTrue()
      expect(result_45).assertEqual(-4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_8400
     * @tc.name      testMultiplicationLongResultOne0084
     * @tc.desc      Verify the multiplication of two negative converted long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = (-2147483649).toLong()
      const result_46 = value1 * (-2147483700).toLong()
      expect(result_46 instanceof long).assertTrue()
      expect(result_46).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_8500
     * @tc.name      testMultiplicationLongResultOne0085
     * @tc.desc      Verify the multiplication of positive and negative converted long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = (2147483649).toLong()
      let result_47 = value1 * (-2147483700).toLong()
      expect(result_47 instanceof long).assertTrue()
      expect(result_47).assertEqual(-4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_8600
     * @tc.name      testMultiplicationLongResultOne0086
     * @tc.desc      Verify the multiplication of two small negative converted long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = (-12).toLong()
      const result_48 = value1 * (-10).toLong()
      expect(result_48 instanceof long).assertTrue()
      expect(result_48).assertEqual(120);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_8700
     * @tc.name      testMultiplicationLongResultOne0087
     * @tc.desc      Verify the multiplication of binary negative and hexadecimal positive long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = (-0b10).toLong()
      let result_49 = value1 * (0xA).toLong()
      expect(result_49 instanceof long).assertTrue()
      expect(result_49).assertEqual(-20);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_8800
     * @tc.name      testMultiplicationLongResultOne0088
     * @tc.desc      Verify the multiplication of positive and hexadecimal negative long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = (5).toLong()
      const result_50 = value1 * (-0xa).toLong()
      expect(result_50 instanceof long).assertTrue()
      expect(result_50).assertEqual(-50);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_8900
     * @tc.name      testMultiplicationLongResultOne0089
     * @tc.desc      Verify the multiplication of two binary positive converted long variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = (+2).toLong()
      let result_51 = value1 * (+0b10).toLong()
      expect(result_51 instanceof long).assertTrue()
      expect(result_51).assertEqual(4);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_9000
     * @tc.name      testMultiplicationLongResultOne0090
     * @tc.desc      Verify the multiplication of positive int and zero converted long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = 5
      const result_52 = value1 * (0).toLong()
      expect(result_52 instanceof long).assertTrue()
      expect(result_52).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_9100
     * @tc.name      testMultiplicationLongResultOne0091
     * @tc.desc      Verify the multiplication of negative int and zero converted long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -5
      let result_53 = value1 * (0).toLong()
      expect(result_53 instanceof long).assertTrue()
      expect(result_53).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_9200
     * @tc.name      testMultiplicationLongResultOne0092
     * @tc.desc      Verify the multiplication result of two positive long literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_0 = 2147483649 * 2147483700
      expect(result_0 instanceof long).assertTrue()
      expect(result_0).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_9300
     * @tc.name      testMultiplicationLongResultOne0093
     * @tc.desc      Verify the multiplication result of two negative long literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_1 = -2147483649 * -2147483700
      expect(result_1 instanceof long).assertTrue()
      expect(result_1).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_ONE_9400
     * @tc.name      testMultiplicationLongResultOne0094
     * @tc.desc      Verify the multiplication result of binary and decimal long literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultOne0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_3 = -0B1000_0000_0000_0000_0000_0000_0000_0001 * -2_147_483_700
      expect(result_3 instanceof long).assertTrue()
      expect(result_3).assertEqual(0X4000001A80000034);
    })
  });
}
