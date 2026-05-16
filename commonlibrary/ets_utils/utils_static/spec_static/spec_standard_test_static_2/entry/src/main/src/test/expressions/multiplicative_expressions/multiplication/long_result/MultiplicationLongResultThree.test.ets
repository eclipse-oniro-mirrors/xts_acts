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

export default function MultiplicationLongResultThreeTest(): void {
  describe("MultiplicationLongResultThreeTest", () => {
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
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_0100
     * @tc.name      testMultiplicationLongResultThree0001
     * @tc.desc      Verify the multiplication of Long wrapper and long primitive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = new Long(123)
      let value2: long = 100
      const result_16 = value1 * value2
      expect(result_16 instanceof long).assertTrue()
      expect(result_16).assertEqual(12300);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_0200
     * @tc.name      testMultiplicationLongResultThree0002
     * @tc.desc      Verify the multiplication of long primitive and Long wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -10
      let value2: Long = new Long(-0x2_0A)
      let result_17 = value1 * value2
      expect(result_17 instanceof long).assertTrue()
      expect(result_17).assertEqual(5220);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_0300
     * @tc.name      testMultiplicationLongResultThree0003
     * @tc.desc      Verify the multiplication of byte primitive and Long wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: byte = +123
      let value2: Long = new Long(2)
      const result_18 = value1 * value2
      expect(result_18 instanceof long).assertTrue()
      expect(result_18).assertEqual(246);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_0400
     * @tc.name      testMultiplicationLongResultThree0004
     * @tc.desc      Verify the multiplication of short primitive and Long wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: short = -3
      let value2: Long = new Long(0x1_a)
      let result_19 = value1 * value2
      expect(result_19 instanceof long).assertTrue()
      expect(result_19).assertEqual(-78);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_0500
     * @tc.name      testMultiplicationLongResultThree0005
     * @tc.desc      Verify the continuous multiplication of long, Int and byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -10
      let value2: Int = 0x2_0A
      let value3: byte = -0b10
      const result_20 = value1 * value2 * value3
      expect(result_20 instanceof long).assertTrue()
      expect(result_20).assertEqual(10440);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_0600
     * @tc.name      testMultiplicationLongResultThree0006
     * @tc.desc      Verify the continuous multiplication of long, Int wrapper and short.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 1_0
      let value2: Int = new Int(-0x20A)
      let value3: short = -0b00010
      let result_21 = value1 * value2 * value3
      expect(result_21 instanceof Long).assertTrue()
      expect(result_21).assertEqual(10440);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_0700
     * @tc.name      testMultiplicationLongResultThree0007
     * @tc.desc      Verify the multiplication of Int maximum value and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MAX_VALUE
      let value2: long = -1
      const result_22 = value1 * value2
      expect(result_22 instanceof long).assertTrue()
      expect(result_22).assertEqual(-2147483647);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_0800
     * @tc.name      testMultiplicationLongResultThree0008
     * @tc.desc      Verify the multiplication of Int maximum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MAX_VALUE
      let value2: Long = 1
      let result_23 = value1 * value2
      expect(result_23 instanceof long).assertTrue()
      expect(result_23).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_0900
     * @tc.name      testMultiplicationLongResultThree0009
     * @tc.desc      Verify the multiplication of Int maximum value and 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = Int.MAX_VALUE
      let value2: long = 0
      const result_24 = value1 * value2
      expect(result_24 instanceof long).assertTrue()
      expect(result_24).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_1000
     * @tc.name      testMultiplicationLongResultThree0010
     * @tc.desc      Verify the multiplication of negative Int maximum value and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = -Int.MAX_VALUE
      let value2: long = -1
      let result_25 = value1 * value2
      expect(result_25 instanceof long).assertTrue()
      expect(result_25).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_1100
     * @tc.name      testMultiplicationLongResultThree0011
     * @tc.desc      Verify the multiplication of Int minimum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MIN_VALUE
      let value2: long = 1
      const result_26 = value1 * value2
      expect(result_26 instanceof long).assertTrue()
      expect(result_26).assertEqual(-2147483648);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_1200
     * @tc.name      testMultiplicationLongResultThree0012
     * @tc.desc      Verify the multiplication of Int minimum value and 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: int = Int.MIN_VALUE
      let value2: long = 0
      let result_27 = value1 * value2
      expect(result_27 instanceof Long).assertTrue()
      expect(result_27).assertEqual(0);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_1300
     * @tc.name      testMultiplicationLongResultThree0013
     * @tc.desc      Verify the multiplication of converted Int minimum value and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = -(Int.MIN_VALUE.toLong())
      let value2: long = -1
      const result_28 = value1 * value2
      expect(result_28 instanceof long).assertTrue()
      expect(result_28).assertEqual(-2147483648);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_1400
     * @tc.name      testMultiplicationLongResultThree0014
     * @tc.desc      Verify the multiplication of Int minimum value and -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Int = Int.MIN_VALUE
      let value2: long = -1
      let result_29 = value1 * value2
      expect(result_29 instanceof long).assertTrue()
      expect(result_29).assertEqual(2147483648);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_1500
     * @tc.name      testMultiplicationLongResultThree0015
     * @tc.desc      Verify the multiplication of decimal Long maximum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 9223372036854775807
      let value2: long = 1
      const result_30 = value1 * value2
      expect(result_30 instanceof long).assertTrue()
      expect(result_30).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_1600
     * @tc.name      testMultiplicationLongResultThree0016
     * @tc.desc      Verify the multiplication of hexadecimal Long maximum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 0x7FFFFFFFFFFFFFFF
      let value2: long = 1
      let result_31 = value1 * value2
      expect(result_31 instanceof long).assertTrue()
      expect(result_31).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_1700
     * @tc.name      testMultiplicationLongResultThree0017
     * @tc.desc      Verify the multiplication of binary Long maximum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: long = 0b111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111
      let value2: long = 1
      let result_33 = value1 * value2
      expect(result_33 instanceof long).assertTrue()
      expect(result_33).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_MULTIPLICATION_LONG_RESULT_THREE_1800
     * @tc.name      testMultiplicationLongResultThree0018
     * @tc.desc      Verify the multiplication of decimal Long minimum value and 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiplicationLongResultThree0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Long = -9223372036854775808
      let value2: long = 1
      const result_34 = value1 * value2
      expect(result_34 instanceof long).assertTrue()
      expect(result_34).assertEqual(-9223372036854775808);
    })

  });
}
