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

export default function MultiplicationLongResultTwoTest(): void {
  describe("MultiplicationLongResultTwoTest", () => {
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
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_0100
     * @tc.name      testMultiplicationLongResultTwo0001
     * @tc.desc      Verify multiplication of Long objects (decimal, octal).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_4 = new Long(123) * new Long(100)
      expect(result_4 instanceof long).assertTrue()
      expect(result_4).assertEqual(12300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_0200
     * @tc.name      testMultiplicationLongResultTwo0002
     * @tc.desc      Verify multiplication of Long objects (binary, hex).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_5 = new Long(-0b10) * new Long(0x2_0A)
      expect(result_5 instanceof long).assertTrue()
      expect(result_5).assertEqual(-1044);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_0300
     * @tc.name      testMultiplicationLongResultTwo0003
     * @tc.desc      Verify multiplication of Long and Byte objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_6 = new Long(-3) * new Byte(0x1_a)
      expect(result_6 instanceof long).assertTrue()
      expect(result_6).assertEqual(-78);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_0400
     * @tc.name      testMultiplicationLongResultTwo0004
     * @tc.desc      Verify multiplication of Short and Long objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_7 = new Short(-3) * new Long(0x1_a)
      expect(result_7 instanceof long).assertTrue()
      expect(result_7).assertEqual(-78);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_0500
     * @tc.name      testMultiplicationLongResultTwo0005
     * @tc.desc      Verify multiplication of Int and Long objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_8 = new Int(74) * new Long(-0b101)
      expect(result_8 instanceof long).assertTrue()
      expect(result_8).assertEqual(-370);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_0600
     * @tc.name      testMultiplicationLongResultTwo0006
     * @tc.desc      Verify continuous multiplication of Byte, Long and Int objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_9 = new Long(1_000000000000000) * new Int(-0x20A) * new Byte(-0b00010)
      expect(result_9 instanceof long).assertTrue()
      expect(result_9).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_0700
     * @tc.name      testMultiplicationLongResultTwo0007
     * @tc.desc      Verify continuous multiplication of Short, Long and Byte objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_10 = new Short(1_0) * new Long(-0xB9739F99468000) * new Byte(-0b00010)
      expect(result_10 instanceof long).assertTrue()
      expect(result_10).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_0800
     * @tc.name      testMultiplicationLongResultTwo0008
     * @tc.desc      Verify continuous multiplication of Short, Int and Long objects.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_11 = new Short(2_0) * new Int(-0x20A) * new Long(-0b0010110101111001100010000011110100100000000000000)
      expect(result_11 instanceof long).assertTrue()
      expect(result_11).assertEqual(1044000000000000000);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_0900
     * @tc.name      testMultiplicationLongResultTwo0009
     * @tc.desc      Verify multiplication of Int.MAX_VALUE and negative Long.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_12 = new Long(-2) * Int.MAX_VALUE
      expect(result_12 instanceof long).assertTrue()
      expect(result_12).assertEqual(-4294967294);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_1000
     * @tc.name      testMultiplicationLongResultTwo0010
     * @tc.desc      Verify multiplication of Int.MAX_VALUE and positive Long.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_13 = Int.MAX_VALUE * new Long(10)
      expect(result_13 instanceof long).assertTrue()
      expect(result_13).assertEqual(21474836470);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_1100
     * @tc.name      testMultiplicationLongResultTwo0011
     * @tc.desc      Verify multiplication of Int.MAX_VALUE and Long(0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_14 = Int.MAX_VALUE * new Long(0)
      expect(result_14 instanceof long).assertTrue()
      expect(result_14).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_1200
     * @tc.name      testMultiplicationLongResultTwo0012
     * @tc.desc      Verify multiplication of -Int.MAX_VALUE and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_15 = new Long(-1) * -Int.MAX_VALUE
      expect(result_15 instanceof long).assertTrue()
      expect(result_15).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_1300
     * @tc.name      testMultiplicationLongResultTwo0013
     * @tc.desc      Verify multiplication of Int.MIN_VALUE and positive Long.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_16 = Int.MIN_VALUE * new Long(2)
      expect(result_16 instanceof long).assertTrue()
      expect(result_16).assertEqual(-4294967296);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_1400
     * @tc.name      testMultiplicationLongResultTwo0014
     * @tc.desc      Verify multiplication of Int.MIN_VALUE and Long(0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_17 = Int.MIN_VALUE * new Long(0x000000000_000)
      expect(result_17 instanceof long).assertTrue()
      expect(result_17).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_1500
     * @tc.name      testMultiplicationLongResultTwo0015
     * @tc.desc      Verify multiplication of converted Int.MIN_VALUE and Long(-2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_18 = -(Int.MIN_VALUE.toLong()) * new Long(-2)
      expect(result_18 instanceof long).assertTrue()
      expect(result_18).assertEqual(-4294967296);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_1600
     * @tc.name      testMultiplicationLongResultTwo0016
     * @tc.desc      Verify multiplication of Int.MIN_VALUE and Long(-1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_19 = Int.MIN_VALUE * new Long(-1)
      expect(result_19 instanceof long).assertTrue()
      expect(result_19).assertEqual(2147483648);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_1700
     * @tc.name      testMultiplicationLongResultTwo0017
     * @tc.desc      Verify multiplication of Long.MAX_VALUE and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_20 = Long.MAX_VALUE * -1
      expect(result_20 instanceof long).assertTrue()
      expect(result_20).assertEqual(-9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_1800
     * @tc.name      testMultiplicationLongResultTwo0018
     * @tc.desc      Verify multiplication of Long.MAX_VALUE and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_21 = Long.MAX_VALUE * 1
      expect(result_21 instanceof long).assertTrue()
      expect(result_21).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_1900
     * @tc.name      testMultiplicationLongResultTwo0019
     * @tc.desc      Verify multiplication of Long.MAX_VALUE and 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_22 = Long.MAX_VALUE * 0
      expect(result_22 instanceof long).assertTrue()
      expect(result_22).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_2000
     * @tc.name      testMultiplicationLongResultTwo0020
     * @tc.desc      Verify multiplication of -Long.MAX_VALUE and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_23 = -Long.MAX_VALUE * -1
      expect(result_23 instanceof long).assertTrue()
      expect(result_23).assertEqual(Long.MAX_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_2100
     * @tc.name      testMultiplicationLongResultTwo0021
     * @tc.desc      Verify multiplication of Long.MIN_VALUE and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_24 = Long.MIN_VALUE * 1
      expect(result_24 instanceof long).assertTrue()
      expect(result_24).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_2200
     * @tc.name      testMultiplicationLongResultTwo0022
     * @tc.desc      Verify multiplication of Long.MIN_VALUE and 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_25 = Long.MIN_VALUE * 0
      expect(result_25 instanceof long).assertTrue()
      expect(result_25).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_2300
     * @tc.name      testMultiplicationLongResultTwo0023
     * @tc.desc      Verify multiplication of -Long.MIN_VALUE and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_26 = -Long.MIN_VALUE * -1
      expect(result_26 instanceof long).assertTrue()
      expect(result_26).assertEqual(Long.MIN_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_2400
     * @tc.name      testMultiplicationLongResultTwo0024
     * @tc.desc      Verify multiplication of Long.MAX_VALUE and Long(-1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_27 = Long.MAX_VALUE * new Long(-1)
      expect(result_27 instanceof long).assertTrue()
      expect(result_27).assertEqual(-9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_2500
     * @tc.name      testMultiplicationLongResultTwo0025
     * @tc.desc      Verify multiplication of Long.MAX_VALUE and Long(1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_28 = Long.MAX_VALUE * new Long(1)
      expect(result_28 instanceof long).assertTrue()
      expect(result_28).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_2600
     * @tc.name      testMultiplicationLongResultTwo0026
     * @tc.desc      Verify multiplication of Long.MAX_VALUE and Long(0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_29 = Long.MAX_VALUE * new Long(0)
      expect(result_29 instanceof long).assertTrue()
      expect(result_29).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_2700
     * @tc.name      testMultiplicationLongResultTwo0027
     * @tc.desc      Verify multiplication of -Long.MAX_VALUE and Long(-1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_30 = -Long.MAX_VALUE * new Long(-1)
      expect(result_30 instanceof long).assertTrue()
      expect(result_30).assertEqual(Long.MAX_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_2800
     * @tc.name      testMultiplicationLongResultTwo0028
     * @tc.desc      Verify multiplication of Long.MIN_VALUE and Long(1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_31 = Long.MIN_VALUE * new Long(1)
      expect(result_31 instanceof long).assertTrue()
      expect(result_31).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_2900
     * @tc.name      testMultiplicationLongResultTwo0029
     * @tc.desc      Verify multiplication of Long.MIN_VALUE and Long(0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_32 = Long.MIN_VALUE * new Long(0)
      expect(result_32 instanceof long).assertTrue()
      expect(result_32).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_3000
     * @tc.name      testMultiplicationLongResultTwo0030
     * @tc.desc      Verify multiplication of -Long.MIN_VALUE and Long(-1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_33 = -Long.MIN_VALUE * new Long(-1)
      expect(result_33 instanceof long).assertTrue()
      expect(result_33).assertEqual(Long.MIN_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_3100
     * @tc.name      testMultiplicationLongResultTwo0031
     * @tc.desc      Verify multiplication of decimal Long.MAX_VALUE and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_34 = 9223372036854775807 * 1
      expect(result_34 instanceof long).assertTrue()
      expect(result_34).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_3200
     * @tc.name      testMultiplicationLongResultTwo0032
     * @tc.desc      Verify multiplication of hexadecimal Long.MAX_VALUE and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_35 = 0x7FFFFfFFFFFFfFFF * 1
      expect(result_35 instanceof long).assertTrue()
      expect(result_35).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_3300
     * @tc.name      testMultiplicationLongResultTwo0033
     * @tc.desc      Verify multiplication of binary Long.MAX_VALUE and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_37 = 0b111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111 * 1
      expect(result_37 instanceof long).assertTrue()
      expect(result_37).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_3400
     * @tc.name      testMultiplicationLongResultTwo0034
     * @tc.desc      Verify multiplication of decimal Long.MIN_VALUE and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_38 = -9223372036854775808 * 1
      expect(result_38 instanceof long).assertTrue()
      expect(result_38).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_3500
     * @tc.name      testMultiplicationLongResultTwo0035
     * @tc.desc      Verify multiplication of positive long values (hex, octal).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_42 = 0x80_00_00_01 * 20000000064;
      expect(result_42 instanceof long).assertTrue()
      expect(result_42).assertEqual(6056184970019850304);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_3600
     * @tc.name      testMultiplicationLongResultTwo0036
     * @tc.desc      Verify multiplication of positive Long objects (hex, octal).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_43 = new Long(0x80_00_00_01) * new Long(20000000064);
      expect(result_43 instanceof long).assertTrue()
      expect(result_43).assertEqual(6056184970019850304);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_3700
     * @tc.name      testMultiplicationLongResultTwo0037
     * @tc.desc      Verify multiplication of positive converted long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_44 = (+2147483649).toLong() * (+2147483700).toLong()
      expect(result_44 instanceof long).assertTrue()
      expect(result_44).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_3800
     * @tc.name      testMultiplicationLongResultTwo0038
     * @tc.desc      Verify multiplication of negative and positive converted long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_45 = (-2147483649).toLong() * (2147483700).toLong()
      expect(result_45 instanceof long).assertTrue()
      expect(result_45).assertEqual(-4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_3900
     * @tc.name      testMultiplicationLongResultTwo0039
     * @tc.desc      Verify multiplication of two negative converted long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_46 = (-2147483649).toLong() * (-2147483700).toLong()
      expect(result_46 instanceof long).assertTrue()
      expect(result_46).assertEqual(4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_4000
     * @tc.name      testMultiplicationLongResultTwo0040
     * @tc.desc      Verify multiplication of positive and negative converted long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_47 = (2147483649).toLong() * (-2147483700).toLong()
      expect(result_47 instanceof long).assertTrue()
      expect(result_47).assertEqual(-4611686132244021300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_4100
     * @tc.name      testMultiplicationLongResultTwo0041
     * @tc.desc      Verify multiplication of two small negative long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_48 = (-12).toLong() * (-10).toLong()
      expect(result_48 instanceof long).assertTrue()
      expect(result_48).assertEqual(120);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_4200
     * @tc.name      testMultiplicationLongResultTwo0042
     * @tc.desc      Verify multiplication of binary negative and hex positive long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_49 = (-0b10).toLong() * (0xA).toLong()
      expect(result_49 instanceof long).assertTrue()
      expect(result_49).assertEqual(-20);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_4300
     * @tc.name      testMultiplicationLongResultTwo0043
     * @tc.desc      Verify multiplication of positive and hex negative long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_50 = (5).toLong() * (-0xa).toLong()
      expect(result_50 instanceof long).assertTrue()
      expect(result_50).assertEqual(-50);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_4400
     * @tc.name      testMultiplicationLongResultTwo0044
     * @tc.desc      Verify multiplication of two small positive binary long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_51 = (+2).toLong() * (+0b10).toLong()
      expect(result_51 instanceof long).assertTrue()
      expect(result_51).assertEqual(4);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_4500
     * @tc.name      testMultiplicationLongResultTwo0045
     * @tc.desc      Verify multiplication of positive value and long(0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_52 = 5 * (0).toLong()
      expect(result_52 instanceof long).assertTrue()
      expect(result_52).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_4600
     * @tc.name      testMultiplicationLongResultTwo0046
     * @tc.desc      Verify multiplication of negative value and long(0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result_53 = -5 * (0).toLong()
      expect(result_53 instanceof long).assertTrue()
      expect(result_53).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_4700
     * @tc.name      testMultiplicationLongResultTwo0047
     * @tc.desc      Verify multiplication of converted Int.MIN_VALUE and Long(-24).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result_54 = -(Int.MIN_VALUE.toLong()) * new Long(-24)
      expect(result_54 instanceof long).assertTrue()
      expect(result_54).assertEqual(-51539607552);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_4800
     * @tc.name      testMultiplicationLongResultTwo0048
     * @tc.desc      Verify multiplication of two small positive long values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 123
      let value2: long = 100
      const result_0 = value1 * value2
      expect(result_0 instanceof long).assertTrue()
      expect(result_0).assertEqual(12300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_4900
     * @tc.name      testMultiplicationLongResultTwo0049
     * @tc.desc      Verify multiplication of long values (decimal, hex).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -10
      let value2: long = 0x2_0A
      let result_1 = value1 * value2
      expect(result_1 instanceof long).assertTrue()
      expect(result_1).assertEqual(-5220);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_5000
     * @tc.name      testMultiplicationLongResultTwo0050
     * @tc.desc      Verify multiplication of long values (octal, binary).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = 74
      let value2: long = -0b101
      const result_2 = value1 * value2
      expect(result_2 instanceof long).assertTrue()
      expect(result_2).assertEqual(-370);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_5100
     * @tc.name      testMultiplicationLongResultTwo0051
     * @tc.desc      Verify multiplication of long values (octal, hex).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -7_4
      let value2: Long = -0x1Ff
      let result_3 = value1 * value2
      expect(result_3 instanceof long).assertTrue()
      expect(result_3).assertEqual(37814);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_5200
     * @tc.name      testMultiplicationLongResultTwo0052
     * @tc.desc      Verify multiplication of long values (decimal, binary).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = -23_00
      let value2: long = 0b10_01
      const result_4 = value1 * value2
      expect(result_4 instanceof long).assertTrue()
      expect(result_4).assertEqual(-0x50d_C);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_5300
     * @tc.name      testMultiplicationLongResultTwo0053
     * @tc.desc      Verify multiplication of long values (octal, decimal).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 74
      let value2: long = 10
      let result_5 = value1 * value2
      expect(result_5 instanceof long).assertTrue()
      expect(result_5).assertEqual(740);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_5400
     * @tc.name      testMultiplicationLongResultTwo0054
     * @tc.desc      Verify multiplication of long values (hex, binary).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -0x1a
      let value2: Long = -0b100_1
      const result_6 = value1 * value2
      expect(result_6 instanceof long).assertTrue()
      expect(result_6).assertEqual(234);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_5500
     * @tc.name      testMultiplicationLongResultTwo0055
     * @tc.desc      Verify multiplication of positive long and hex 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 123
      let value2: long = 0x0
      let result_7 = value1 * value2
      expect(result_7 instanceof long).assertTrue()
      expect(result_7).assertEqual(0b0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_5600
     * @tc.name      testMultiplicationLongResultTwo0056
     * @tc.desc      Verify multiplication of positive byte and small long value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = 123
      let value2: long = 2
      let result_9 = value1 * value2
      expect(result_9 instanceof long).assertTrue()
      expect(result_9).assertEqual(246);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_5700
     * @tc.name      testMultiplicationLongResultTwo0057
     * @tc.desc      Verify multiplication of short and hex long value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -3
      let value2: long = 0x1_a
      const result_10 = value1 * value2
      expect(result_10 instanceof long).assertTrue()
      expect(result_10).assertEqual(-78);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_5800
     * @tc.name      testMultiplicationLongResultTwo0058
     * @tc.desc      Verify multiplication of octal long and hex int value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -7_4
      let value2: int = -0x1Ff
      let result_11 = value1 * value2
      expect(result_11 instanceof long).assertTrue()
      expect(result_11).assertEqual(37814);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_5900
     * @tc.name      testMultiplicationLongResultTwo0059
     * @tc.desc      Verify multiplication of int and binary Long value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = +74
      let value2: Long = -0b101
      const result_12 = value1 * value2
      expect(result_12 instanceof long).assertTrue()
      expect(result_12).assertEqual(-370);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_6000
     * @tc.name      testMultiplicationLongResultTwo0060
     * @tc.desc      Verify continuous multiplication of short, long and byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -10
      let value2: long = 0x2_0A
      let value3: byte = -0b10
      let result_13 = value1 * value2 * value3
      expect(result_13 instanceof long).assertTrue()
      expect(result_13).assertEqual(10440);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_6100
     * @tc.name      testMultiplicationLongResultTwo0061
     * @tc.desc      Verify continuous multiplication of long, int and byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -10
      let value2: int = 0x2_0A
      let value3: byte = -0b10
      const result_14 = value1 * value2 * value3
      expect(result_14 instanceof long).assertTrue()
      expect(result_14).assertEqual(10440);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_6200
     * @tc.name      testMultiplicationLongResultTwo0062
     * @tc.desc      Verify continuous multiplication of short, int and Long.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -10
      let value2: int = 0x2_0A
      let value3: Long = -0b10
      let result_15 = value1 * value2 * value3
      expect(result_15 instanceof long).assertTrue()
      expect(result_15).assertEqual(10440);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_6300
     * @tc.name      testMultiplicationLongResultTwo0063
     * @tc.desc      Verify multiplication of Long object and long primitive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(123)
      let value2: long = 100
      const result_16 = value1 * value2
      expect(result_16 instanceof long).assertTrue()
      expect(result_16).assertEqual(12300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_6400
     * @tc.name      testMultiplicationLongResultTwo0064
     * @tc.desc      Verify multiplication of long primitive and Long object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -10
      let value2: Long = new Long(-0x2_0A)
      let result_17 = value1 * value2
      expect(result_17 instanceof long).assertTrue()
      expect(result_17).assertEqual(5220);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_6500
     * @tc.name      testMultiplicationLongResultTwo0065
     * @tc.desc      Verify multiplication of byte and Long object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = +123
      let value2: Long = new Long(2)
      const result_18 = value1 * value2
      expect(result_18 instanceof long).assertTrue()
      expect(result_18).assertEqual(246);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_6600
     * @tc.name      testMultiplicationLongResultTwo0066
     * @tc.desc      Verify multiplication of short and Long object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -3
      let value2: Long = new Long(0x1_a)
      let result_19 = value1 * value2
      expect(result_19 instanceof long).assertTrue()
      expect(result_19).assertEqual(-78);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_6700
     * @tc.name      testMultiplicationLongResultTwo0067
     * @tc.desc      Verify continuous multiplication of long, Int and byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -10
      let value2: Int = 0x2_0A
      let value3: byte = -0b10
      const result_20 = value1 * value2 * value3
      expect(result_20 instanceof long).assertTrue()
      expect(result_20).assertEqual(10440);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_6800
     * @tc.name      testMultiplicationLongResultTwo0068
     * @tc.desc      Verify continuous multiplication of long, Int object and short.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 1_0
      let value2: Int = new Int(-0x20A)
      let value3: short = -0b00010
      let result_21 = value1 * value2 * value3
      expect(result_21 instanceof Long).assertTrue()
      expect(result_21).assertEqual(10440);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_6900
     * @tc.name      testMultiplicationLongResultTwo0069
     * @tc.desc      Verify multiplication of Int.MAX_VALUE and long(-1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MAX_VALUE
      let value2: long = -1
      const result_22 = value1 * value2
      expect(result_22 instanceof long).assertTrue()
      expect(result_22).assertEqual(-2147483647);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_7000
     * @tc.name      testMultiplicationLongResultTwo0070
     * @tc.desc      Verify multiplication of Int.MAX_VALUE and Long(1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MAX_VALUE
      let value2: Long = 1
      let result_23 = value1 * value2
      expect(result_23 instanceof long).assertTrue()
      expect(result_23).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_7100
     * @tc.name      testMultiplicationLongResultTwo0071
     * @tc.desc      Verify multiplication of Int.MAX_VALUE and long(0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = Int.MAX_VALUE
      let value2: long = 0
      const result_24 = value1 * value2
      expect(result_24 instanceof long).assertTrue()
      expect(result_24).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_7200
     * @tc.name      testMultiplicationLongResultTwo0072
     * @tc.desc      Verify multiplication of -Int.MAX_VALUE and long(-1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -Int.MAX_VALUE
      let value2: long = -1
      let result_25 = value1 * value2
      expect(result_25 instanceof long).assertTrue()
      expect(result_25).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_7300
     * @tc.name      testMultiplicationLongResultTwo0073
     * @tc.desc      Verify multiplication of Int.MIN_VALUE and long(1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MIN_VALUE
      let value2: long = 1
      const result_26 = value1 * value2
      expect(result_26 instanceof long).assertTrue()
      expect(result_26).assertEqual(-2147483648);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_7400
     * @tc.name      testMultiplicationLongResultTwo0074
     * @tc.desc      Verify multiplication of Int.MIN_VALUE and long(0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = Int.MIN_VALUE
      let value2: long = 0
      let result_27 = value1 * value2
      expect(result_27 instanceof Long).assertTrue()
      expect(result_27).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_7500
     * @tc.name      testMultiplicationLongResultTwo0075
     * @tc.desc      Verify multiplication of converted Int.MIN_VALUE and long(-1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -(Int.MIN_VALUE.toLong())
      let value2: long = -1
      const result_28 = value1 * value2
      expect(result_28 instanceof long).assertTrue()
      expect(result_28).assertEqual(-2147483648);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_7600
     * @tc.name      testMultiplicationLongResultTwo0076
     * @tc.desc      Verify multiplication of Int.MIN_VALUE and long(-1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MIN_VALUE
      let value2: long = -1
      let result_29 = value1 * value2
      expect(result_29 instanceof long).assertTrue()
      expect(result_29).assertEqual(2147483648);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_7700
     * @tc.name      testMultiplicationLongResultTwo0077
     * @tc.desc      Verify multiplication of decimal Long.MAX_VALUE and long(1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 9223372036854775807
      let value2: long = 1
      const result_30 = value1 * value2
      expect(result_30 instanceof long).assertTrue()
      expect(result_30).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_7800
     * @tc.name      testMultiplicationLongResultTwo0078
     * @tc.desc      Verify multiplication of hexadecimal Long.MAX_VALUE and long(1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 0x7FFFFFFFFFFFFFFF
      let value2: long = 1
      let result_31 = value1 * value2
      expect(result_31 instanceof long).assertTrue()
      expect(result_31).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_7900
     * @tc.name      testMultiplicationLongResultTwo0079
     * @tc.desc      Verify multiplication of binary Long.MAX_VALUE and long(1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 0b111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111
      let value2: long = 1
      let result_33 = value1 * value2
      expect(result_33 instanceof long).assertTrue()
      expect(result_33).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_TWO_8000
     * @tc.name      testMultiplicationLongResultTwo0080
     * @tc.desc      Verify multiplication of decimal Long.MIN_VALUE and long(1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultTwo0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = -9223372036854775808
      let value2: long = 1
      const result_34 = value1 * value2
      expect(result_34 instanceof long).assertTrue()
      expect(result_34).assertEqual(-9223372036854775808);
    })
  })
}
