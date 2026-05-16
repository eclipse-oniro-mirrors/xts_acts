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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function NumericCastingConversionsTest() {

  describe("NumericCastingConversionsTest", () => {
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
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0100
     * @tc.name      testNumericCastingConversions0001
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Byte = 0x77 as byte;
      let data1: Short = s1.toShort();
      expect(data1).assertEqual(119);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0200
     * @tc.name      testNumericCastingConversions0002
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Byte = 0x77 as byte;
      let data2: Int = s2.toInt();
      expect(data2).assertEqual(119);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0300
     * @tc.name      testNumericCastingConversions0003
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Int = 47;
      let data11: Float = s11.toFloat();
      expect(data11).assertEqual(47);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0400
     * @tc.name      testNumericCastingConversions0004
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Int = 47;
      let data12: Double = s12.toDouble();
      expect(data12).assertEqual(47);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0500
     * @tc.name      testNumericCastingConversions0005
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Long = 4;
      let data13: Float = s13.toFloat();
      expect(data13).assertEqual(4.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0600
     * @tc.name      testNumericCastingConversions0006
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Long = 4;
      let data14: Double = s14.toDouble();
      expect(data14).assertEqual(4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0700
     * @tc.name      testNumericCastingConversions0007
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Float = 0.5f;
      let data15: Double = s15.toDouble();
      expect(data15).assertEqual(0.5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0800
     * @tc.name      testNumericCastingConversions0008
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Byte = 0x77 as byte;
      let data3: Long = s3.toLong();
      expect(data3).assertEqual(119);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0900
     * @tc.name      testNumericCastingConversions0009
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Byte = 16 as byte;
      let data4: Float = s4.toFloat();
      expect(data4).assertEqual(16.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1000
     * @tc.name      testNumericCastingConversions0010
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Byte = 16 as byte;
      let data5: Double = s5.toDouble();
      expect(data5).assertEqual(16.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1100
     * @tc.name      testNumericCastingConversions0011
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Short = 21845;
      let data6: Int = s6.toInt();
      expect(data6).assertEqual(21845);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1200
     * @tc.name      testNumericCastingConversions0012
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Short = 21845;
      let data7: Long = s7.toLong();
      expect(data7).assertEqual(21845);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1300
     * @tc.name      testNumericCastingConversions0013
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Short = 32;
      let data8: Float = s8.toFloat();
      expect(data8).assertEqual(32.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1400
     * @tc.name      testNumericCastingConversions0014
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Short = 32;
      let data9: Double = s9.toDouble();
      expect(data9).assertEqual(32.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1500
     * @tc.name      testNumericCastingConversions0015
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Int = 303;
      let data10: Long = s10.toLong();
      expect(data10).assertEqual(303);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1600
     * @tc.name      testNumericCastingConversions0016
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = Double.NaN;
      let data1: Byte = Double.toByte(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1700
     * @tc.name      testNumericCastingConversions0017
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Double = Double.NEGATIVE_INFINITY;
      let data2: Byte = Double.toByte(s2);
      expect(data2).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1800
     * @tc.name      testNumericCastingConversions0018
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Double = -32769.0;
      let data11: Byte = Double.toByte(s11);
      expect(data11).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1900
     * @tc.name      testNumericCastingConversions0019
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -2.2250738585072014E-308;
      let data19: Int = Double.toInt(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2000
     * @tc.name      testNumericCastingConversions0020
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = -0.0;
      let data20: Int = Double.toInt(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2100
     * @tc.name      testNumericCastingConversions0021
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 0.0;
      let data21: Int = Double.toInt(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2200
     * @tc.name      testNumericCastingConversions0022
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 2.2250738585072014E-308;
      let data22: Int = Double.toInt(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2300
     * @tc.name      testNumericCastingConversions0023
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 1.0;
      let data23: Int = Double.toInt(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2400
     * @tc.name      testNumericCastingConversions0024
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 3.1415926;
      let data24: Int = Double.toInt(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2500
     * @tc.name      testNumericCastingConversions0025
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 126.0;
      let data25: Int = Double.toInt(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2600
     * @tc.name      testNumericCastingConversions0026
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 127.0;
      let data26: Int = Double.toInt(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2700
     * @tc.name      testNumericCastingConversions0027
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 128.0;
      let data27: Int = Double.toInt(s27);
      expect(data27).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2800
     * @tc.name      testNumericCastingConversions0028
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 32766.0;
      let data28: Int = Double.toInt(s28);
      expect(data28).assertEqual(32766);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2900
     * @tc.name      testNumericCastingConversions0029
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Double = -32768.0;
      let data12: Byte = Double.toByte(s12);
      expect(data12).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3000
     * @tc.name      testNumericCastingConversions0030
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32767.0;
      let data29: Int = Double.toInt(s29);
      expect(data29).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3100
     * @tc.name      testNumericCastingConversions0031
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 32768.0;
      let data30: Int = Double.toInt(s30);
      expect(data30).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3200
     * @tc.name      testNumericCastingConversions0032
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 65534.0;
      let data31: Int = Double.toInt(s31);
      expect(data31).assertEqual(65534);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3300
     * @tc.name      testNumericCastingConversions0033
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65535.0;
      let data32: Int = Double.toInt(s32);
      expect(data32).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3400
     * @tc.name      testNumericCastingConversions0034
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Double = 65536.0;
      let data33: Int = Double.toInt(s33);
      expect(data33).assertEqual(65536);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3500
     * @tc.name      testNumericCastingConversions0035
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Double = 2.147483646E9;
      let data34: Int = Double.toInt(s34);
      expect(data34).assertEqual(2147483646);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3600
     * @tc.name      testNumericCastingConversions0036
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Double = 2.147483647E9;
      let data35: Int = Double.toInt(s35);
      expect(data35).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3700
     * @tc.name      testNumericCastingConversions0037
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Double = 9.223372036854776E18;
      let data36: Int = Double.toInt(s36);
      expect(data36).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3800
     * @tc.name      testNumericCastingConversions0038
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Double = 3.4028234663852886E38;
      let data37: Int = Double.toInt(s37);
      expect(data37).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3900
     * @tc.name      testNumericCastingConversions0039
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s38: Double = 1.7976931348623157E308;
      let data38: Int = Double.toInt(s38);
      expect(data38).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4000
     * @tc.name      testNumericCastingConversions0040
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s39: Double = Double.POSITIVE_INFINITY;
      let data39: Int = Double.toInt(s39);
      expect(data39).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4100
     * @tc.name      testNumericCastingConversions0041
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = -4.9E-308;
      let data1: Int = Double.toInt(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4200
     * @tc.name      testNumericCastingConversions0042
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = 4.9E-308;
      let data1: Int = Double.toInt(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4300
     * @tc.name      testNumericCastingConversions0043
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = Double.NaN;
      let data1: Long = Double.toLong(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4400
     * @tc.name      testNumericCastingConversions0044
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Double = Double.NEGATIVE_INFINITY;
      let data2: Long = Double.toLong(s2);
      expect(data2).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4500
     * @tc.name      testNumericCastingConversions0045
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Double = -1.7976931348623157E308;
      let data3: Long = Double.toLong(s3);
      expect(data3).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4600
     * @tc.name      testNumericCastingConversions0046
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Double = -3.4028234663852886E38;
      let data4: Long = Double.toLong(s4);
      expect(data4).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4700
     * @tc.name      testNumericCastingConversions0047
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Double = -9.22337203685478E18;
      let data5: Long = Double.toLong(s5);
      expect(data5).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4800
     * @tc.name      testNumericCastingConversions0048
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Double = -2.147483648E9;
      let data6: Long = Double.toLong(s6);
      expect(data6).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4900
     * @tc.name      testNumericCastingConversions0049
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Double = -2.147483647E9;
      let data7: Long = Double.toLong(s7);
      expect(data7).assertEqual(-2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5000
     * @tc.name      testNumericCastingConversions0050
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Double = -129.0;
      let data14: Byte = Double.toByte(s14);
      expect(data14).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5100
     * @tc.name      testNumericCastingConversions0051
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Double = -65537.0;
      let data8: Long = Double.toLong(s8);
      expect(data8).assertEqual(-65537);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5200
     * @tc.name      testNumericCastingConversions0052
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Double = -65536.0;
      let data9: Long = Double.toLong(s9);
      expect(data9).assertEqual(-65536);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5300
     * @tc.name      testNumericCastingConversions0053
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Double = -65535.0;
      let data10: Long = Double.toLong(s10);
      expect(data10).assertEqual(-65535);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5400
     * @tc.name      testNumericCastingConversions0054
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Double = -32769.0;
      let data11: Long = Double.toLong(s11);
      expect(data11).assertEqual(-32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5500
     * @tc.name      testNumericCastingConversions0055
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Double = -32768.0;
      let data12: Long = Double.toLong(s12);
      expect(data12).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5600
     * @tc.name      testNumericCastingConversions0056
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Double = -32767.0;
      let data13: Long = Double.toLong(s13);
      expect(data13).assertEqual(-32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5700
     * @tc.name      testNumericCastingConversions0057
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Double = -129.0;
      let data14: Long = Double.toLong(s14);
      expect(data14).assertEqual(-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5800
     * @tc.name      testNumericCastingConversions0058
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Double = -128.0;
      let data15: Byte = Double.toByte(s15);
      expect(data15).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5900
     * @tc.name      testNumericCastingConversions0059
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Double = -128.0;
      let data15: Long = Double.toLong(s15);
      expect(data15).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6000
     * @tc.name      testNumericCastingConversions0060
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Double = -127.0;
      let data16: Byte = Double.toByte(s16);
      expect(data16).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6100
     * @tc.name      testNumericCastingConversions0061
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Double = -127.0;
      let data16: Long = Double.toLong(s16);
      expect(data16).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6200
     * @tc.name      testNumericCastingConversions0062
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Double = -3.1415926;
      let data17: Byte = Double.toByte(s17);
      expect(data17).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6300
     * @tc.name      testNumericCastingConversions0063
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Double = -3.1415926;
      let data17: Long = Double.toLong(s17);
      expect(data17).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6400
     * @tc.name      testNumericCastingConversions0064
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -1.0;
      let data18: Byte = Double.toByte(s18);
      expect(data18).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6500
     * @tc.name      testNumericCastingConversions0065
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -1.0;
      let data18: Long = Double.toLong(s18);
      expect(data18).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6600
     * @tc.name      testNumericCastingConversions0066
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -2.2250738585072014E-308;
      let data19: Long = Double.toLong(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6700
     * @tc.name      testNumericCastingConversions0067
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = -0.0;
      let data20: Long = Double.toLong(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6800
     * @tc.name      testNumericCastingConversions0068
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 0.0;
      let data21: Long = Double.toLong(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6900
     * @tc.name      testNumericCastingConversions0069
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 2.2250738585072014E-308;
      let data22: Long = Double.toLong(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7000
     * @tc.name      testNumericCastingConversions0070
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 1.0;
      let data23: Long = Double.toLong(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7100
     * @tc.name      testNumericCastingConversions0071
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 3.1415926;
      let data24: Long = Double.toLong(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7200
     * @tc.name      testNumericCastingConversions0072
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 126.0;
      let data25: Long = Double.toLong(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7300
     * @tc.name      testNumericCastingConversions0073
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 127.0;
      let data26: Long = Double.toLong(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7400
     * @tc.name      testNumericCastingConversions0074
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 128.0;
      let data27: Long = Double.toLong(s27);
      expect(data27).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7500
     * @tc.name      testNumericCastingConversions0075
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 32766.0;
      let data28: Long = Double.toLong(s28);
      expect(data28).assertEqual(32766);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7600
     * @tc.name      testNumericCastingConversions0076
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32767.0;
      let data29: Long = Double.toLong(s29);
      expect(data29).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7700
     * @tc.name      testNumericCastingConversions0077
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 32768.0;
      let data30: Long = Double.toLong(s30);
      expect(data30).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7800
     * @tc.name      testNumericCastingConversions0078
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 65534.0;
      let data31: Long = Double.toLong(s31);
      expect(data31).assertEqual(65534);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7900
     * @tc.name      testNumericCastingConversions0079
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65535.0;
      let data32: Long = Double.toLong(s32);
      expect(data32).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8000
     * @tc.name      testNumericCastingConversions0080
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Double = 65536.0;
      let data33: Long = Double.toLong(s33);
      expect(data33).assertEqual(65536);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8100
     * @tc.name      testNumericCastingConversions0081
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Double = 2.147483646E9;
      let data34: Long = Double.toLong(s34);
      expect(data34).assertEqual(2147483646);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8200
     * @tc.name      testNumericCastingConversions0082
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Double = 2.147483647E9;
      let data35: Long = Double.toLong(s35);
      expect(data35).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8300
     * @tc.name      testNumericCastingConversions0083
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Double = 9.223372036854776E18;
      let data36: Long = Double.toLong(s36);
      expect(data36).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8400
     * @tc.name      testNumericCastingConversions0084
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Double = 3.4028234663852886E38;
      let data37: Long = Double.toLong(s37);
      expect(data37).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8500
     * @tc.name      testNumericCastingConversions0085
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s38: Double = 1.7976931348623157E308;
      let data38: Long = Double.toLong(s38);
      expect(data38).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8600
     * @tc.name      testNumericCastingConversions0086
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s39: Double = Double.POSITIVE_INFINITY;
      let data39: Long = Double.toLong(s39);
      expect(data39).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8700
     * @tc.name      testNumericCastingConversions0087
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = -4.9E-308;
      let data1: Long = Double.toLong(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8800
     * @tc.name      testNumericCastingConversions0088
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = 4.9E-308;
      let data1: Long = Double.toLong(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8900
     * @tc.name      testNumericCastingConversions0089
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = Double.NEGATIVE_INFINITY;
      let data1: Float = Double.toFloat(s1);
      expect(data1).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9000
     * @tc.name      testNumericCastingConversions0090
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Double = -1.7976931348623157E308;
      let data2: Float = Double.toFloat(s2);
      expect(data2).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9100
     * @tc.name      testNumericCastingConversions0091
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Double = -3.4028234663852886E38;
      let data3: Float = Double.toFloat(s3);
      expect(data3).assertEqual(-3.4028235E38f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9200
     * @tc.name      testNumericCastingConversions0092
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Double = -9.223372036854776E18;
      let data4: Float = Double.toFloat(s4);
      expect(data4).assertEqual(-9.223372E18f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9300
     * @tc.name      testNumericCastingConversions0093
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Double = -2.147483648E9;
      let data5: Float = Double.toFloat(s5);
      expect(data5).assertEqual(-2.14748365E9f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9400
     * @tc.name      testNumericCastingConversions0094
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Double = -2.147483647E9;
      let data6: Float = Double.toFloat(s6);
      expect(data6).assertEqual(-2.14748365E9f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9500
     * @tc.name      testNumericCastingConversions0095
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -1.0;
      let data18: Byte = Double.toByte(s18);
      expect(data18).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9600
     * @tc.name      testNumericCastingConversions0096
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Double = -65537.0;
      let data7: Float = Double.toFloat(s7);
      expect(data7).assertEqual(-65537.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9700
     * @tc.name      testNumericCastingConversions0097
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Double = -65536.0;
      let data8: Float = Double.toFloat(s8);
      expect(data8).assertEqual(-65536.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9800
     * @tc.name      testNumericCastingConversions0098
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Double = -65535.0;
      let data9: Float = Double.toFloat(s9);
      expect(data9).assertEqual(-65535.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9900
     * @tc.name      testNumericCastingConversions0099
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Double = -32769.0;
      let data10: Float = Double.toFloat(s10);
      expect(data10).assertEqual(-32769.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10000
     * @tc.name      testNumericCastingConversions0100
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Double = -32768.0;
      let data11: Float = Double.toFloat(s11);
      expect(data11).assertEqual(-32768.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10100
     * @tc.name      testNumericCastingConversions0101
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Double = -32767.0;
      let data12: Float = Double.toFloat(s12);
      expect(data12).assertEqual(-32767.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10200
     * @tc.name      testNumericCastingConversions0102
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Double = -129.0;
      let data13: Float = Double.toFloat(s13);
      expect(data13).assertEqual(-129.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10300
     * @tc.name      testNumericCastingConversions0103
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Double = -128.0;
      let data14: Float = Double.toFloat(s14);
      expect(data14).assertEqual(-128.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10400
     * @tc.name      testNumericCastingConversions0104
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Double = -127.0;
      let data15: Float = Double.toFloat(s15);
      expect(data15).assertEqual(-127.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10500
     * @tc.name      testNumericCastingConversions0105
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Double = -3.1415926;
      let data16: Float = Double.toFloat(s16);
      expect(data16).assertEqual(-3.1415925f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10600
     * @tc.name      testNumericCastingConversions0106
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -2.2250738585072014E-308;
      let data19: Byte = Double.toByte(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10700
     * @tc.name      testNumericCastingConversions0107
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Double = -1.0;
      let data17: Float = Double.toFloat(s17);
      expect(data17).assertEqual(-1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10800
     * @tc.name      testNumericCastingConversions0108
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -2.2250738585072014E-308;
      let data18: Float = Double.toFloat(s18);
      expect(data18).assertEqual(-0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10900
     * @tc.name      testNumericCastingConversions0109
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -0.0;
      let data19: Float = Double.toFloat(s19);
      expect(data19).assertEqual(0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11000
     * @tc.name      testNumericCastingConversions0110
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = 0.0;
      let data20: Float = Double.toFloat(s20);
      expect(data20).assertEqual(0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11100
     * @tc.name      testNumericCastingConversions0111
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 2.2250738585072014E-308;
      let data21: Float = Double.toFloat(s21);
      expect(data21).assertEqual(0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11200
     * @tc.name      testNumericCastingConversions0112
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 1.0;
      let data22: Float = Double.toFloat(s22);
      expect(data22).assertEqual(1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11300
     * @tc.name      testNumericCastingConversions0113
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 3.1415926;
      let data23: Float = Double.toFloat(s23);
      expect(data23).assertEqual(3.1415925f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11400
     * @tc.name      testNumericCastingConversions0114
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 126.0;
      let data24: Float = Double.toFloat(s24);
      expect(data24).assertEqual(126.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11500
     * @tc.name      testNumericCastingConversions0115
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 127.0;
      let data25: Float = Double.toFloat(s25);
      expect(data25).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11600
     * @tc.name      testNumericCastingConversions0116
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 128.0;
      let data26: Float = Double.toFloat(s26);
      expect(data26).assertEqual(128.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11700
     * @tc.name      testNumericCastingConversions0117
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = -0.0;
      let data20: Byte = Double.toByte(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11800
     * @tc.name      testNumericCastingConversions0118
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 32766.0;
      let data27: Float = Double.toFloat(s27);
      expect(data27).assertEqual(32766.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11900
     * @tc.name      testNumericCastingConversions0119
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 32767.0;
      let data28: Float = Double.toFloat(s28);
      expect(data28).assertEqual(32767.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12000
     * @tc.name      testNumericCastingConversions0120
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32768.0;
      let data29: Float = Double.toFloat(s29);
      expect(data29).assertEqual(32768.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12100
     * @tc.name      testNumericCastingConversions0121
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 65534.0;
      let data30: Float = Double.toFloat(s30);
      expect(data30).assertEqual(65534.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12200
     * @tc.name      testNumericCastingConversions0122
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 65535.0;
      let data31: Float = Double.toFloat(s31);
      expect(data31).assertEqual(65535.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12300
     * @tc.name      testNumericCastingConversions0123
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65536.0;
      let data32: Float = Double.toFloat(s32);
      expect(data32).assertEqual(65536.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12400
     * @tc.name      testNumericCastingConversions0124
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Double = 2.147483646E9;
      let data33: Float = Double.toFloat(s33);
      expect(data33).assertEqual(2.14748365E9f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12500
     * @tc.name      testNumericCastingConversions0125
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Double = 2.147483647E9;
      let data34: Float = Double.toFloat(s34);
      expect(data34).assertEqual(2.14748365E9f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12600
     * @tc.name      testNumericCastingConversions0126
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Double = 9.223372036854776E18;
      let data35: Float = Double.toFloat(s35);
      expect(data35).assertEqual(9.223372E18f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12700
     * @tc.name      testNumericCastingConversions0127
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Double = 3.4028234663852886E38;
      let data36: Float = Double.toFloat(s36);
      expect(data36).assertEqual(3.4028235E38f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12800
     * @tc.name      testNumericCastingConversions0128
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Double = -1.7976931348623157E308;
      let data3: Byte = Double.toByte(s3);
      expect(data3).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12900
     * @tc.name      testNumericCastingConversions0129
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 0.0;
      let data21: Byte = Double.toByte(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13000
     * @tc.name      testNumericCastingConversions0130
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Double = 1.7976931348623157E308;
      let data37: Float = Double.toFloat(s37);
      expect(data37).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13100
     * @tc.name      testNumericCastingConversions0131
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s38: Double = Double.POSITIVE_INFINITY;
      let data38: Float = Double.toFloat(s38);
      expect(data38).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13200
     * @tc.name      testNumericCastingConversions0132
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = -4.9E-308;
      let data1: Float = Double.toFloat(s1);
      expect(data1).assertEqual(-0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13300
     * @tc.name      testNumericCastingConversions0133
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = 4.9E-308;
      let data1: Float = Double.toFloat(s1);
      expect(data1).assertEqual(0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13400
     * @tc.name      testNumericCastingConversions0134
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = Double.NEGATIVE_INFINITY;
      let data1: Double = Double.toDouble(s1);
      expect(data1).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13500
     * @tc.name      testNumericCastingConversions0135
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Double = -1.7976931348623157E308;
      let data2: Double = Double.toDouble(s2);
      expect(data2).assertEqual(-1.7976931348623157E308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13600
     * @tc.name      testNumericCastingConversions0136
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Double = -3.4028234663852886E38;
      let data3: Double = Double.toDouble(s3);
      expect(data3).assertEqual(-3.4028234663852886E38);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13700
     * @tc.name      testNumericCastingConversions0137
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Double = -9.223372036854776E18;
      let data4: Double = Double.toDouble(s4);
      expect(data4).assertEqual(-9.223372036854776E18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13800
     * @tc.name      testNumericCastingConversions0138
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Double = -2.147483648E9;
      let data5: Double = Double.toDouble(s5);
      expect(data5).assertEqual(-2.147483648E9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13900
     * @tc.name      testNumericCastingConversions0139
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Double = -2.147483647E9;
      let data6: Double = Double.toDouble(s6);
      expect(data6).assertEqual(-2.147483647E9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14000
     * @tc.name      testNumericCastingConversions0140
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 2.2250738585072014E-308;
      let data22: Byte = Double.toByte(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14100
     * @tc.name      testNumericCastingConversions0141
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Double = -65537.0;
      let data7: Double = Double.toDouble(s7);
      expect(data7).assertEqual(-65537.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14200
     * @tc.name      testNumericCastingConversions0142
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Double = -65536.0;
      let data8: Double = Double.toDouble(s8);
      expect(data8).assertEqual(-65536.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14300
     * @tc.name      testNumericCastingConversions0143
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Double = -65535.0;
      let data9: Double = Double.toDouble(s9);
      expect(data9).assertEqual(-65535.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14400
     * @tc.name      testNumericCastingConversions0144
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Double = -32769.0;
      let data10: Double = Double.toDouble(s10);
      expect(data10).assertEqual(-32769.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14500
     * @tc.name      testNumericCastingConversions0145
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Double = -32768.0;
      let data11: Double = Double.toDouble(s11);
      expect(data11).assertEqual(-32768.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14600
     * @tc.name      testNumericCastingConversions0146
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Double = -32767.0;
      let data12: Double = Double.toDouble(s12);
      expect(data12).assertEqual(-32767.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14700
     * @tc.name      testNumericCastingConversions0147
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Double = -129.0;
      let data13: Double = Double.toDouble(s13);
      expect(data13).assertEqual(-129.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14800
     * @tc.name      testNumericCastingConversions0148
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Double = -128.0;
      let data14: Double = Double.toDouble(s14);
      expect(data14).assertEqual(-128.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14900
     * @tc.name      testNumericCastingConversions0149
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Double = -127.0;
      let data15: Double = Double.toDouble(s15);
      expect(data15).assertEqual(-127.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15000
     * @tc.name      testNumericCastingConversions0150
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Double = -3.1415926;
      let data16: Double = Double.toDouble(s16);
      expect(data16).assertEqual(-3.1415926);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15100
     * @tc.name      testNumericCastingConversions0151
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 1.0;
      let data23: Byte = Double.toByte(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15200
     * @tc.name      testNumericCastingConversions0152
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Double = -1.0;
      let data17: Double = Double.toDouble(s17);
      expect(data17).assertEqual(-1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15300
     * @tc.name      testNumericCastingConversions0153
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -2.2250738585072014E-308;
      let data18: Double = Double.toDouble(s18);
      expect(data18).assertEqual(-2.2250738585072014E-308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15400
     * @tc.name      testNumericCastingConversions0154
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -4.9E-308;
      let data19: Double = Double.toDouble(s19);
      expect(data19).assertEqual(-4.9E-308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15500
     * @tc.name      testNumericCastingConversions0155
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = -0.0;
      let data20: Double = Double.toDouble(s20);
      expect(data20).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15600
     * @tc.name      testNumericCastingConversions0156
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 0.0;
      let data21: Double = Double.toDouble(s21);
      expect(data21).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15700
     * @tc.name      testNumericCastingConversions0157
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 4.9E-308;
      let data22: Double = Double.toDouble(s22);
      expect(data22).assertEqual(4.9E-308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15800
     * @tc.name      testNumericCastingConversions0158
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 2.2250738585072014E-308;
      let data23: Double = Double.toDouble(s23);
      expect(data23).assertEqual(2.2250738585072014E-308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15900
     * @tc.name      testNumericCastingConversions0159
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 1.0;
      let data24: Double = Double.toDouble(s24);
      expect(data24).assertEqual(1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16000
     * @tc.name      testNumericCastingConversions0160
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 3.1415926;
      let data25: Double = Double.toDouble(s25);
      expect(data25).assertEqual(3.1415926);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16100
     * @tc.name      testNumericCastingConversions0161
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 126.0;
      let data26: Double = Double.toDouble(s26);
      expect(data26).assertEqual(126.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16200
     * @tc.name      testNumericCastingConversions0162
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 3.1415926;
      let data24: Byte = Double.toByte(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16300
     * @tc.name      testNumericCastingConversions0163
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 127.0;
      let data27: Double = Double.toDouble(s27);
      expect(data27).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16400
     * @tc.name      testNumericCastingConversions0164
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 128.0;
      let data28: Double = Double.toDouble(s28);
      expect(data28).assertEqual(128.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16500
     * @tc.name      testNumericCastingConversions0165
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32766.0;
      let data29: Double = Double.toDouble(s29);
      expect(data29).assertEqual(32766.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16600
     * @tc.name      testNumericCastingConversions0166
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 32767.0;
      let data30: Double = Double.toDouble(s30);
      expect(data30).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16700
     * @tc.name      testNumericCastingConversions0167
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 32768.0;
      let data31: Double = Double.toDouble(s31);
      expect(data31).assertEqual(32768.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16800
     * @tc.name      testNumericCastingConversions0168
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65534.0;
      let data32: Double = Double.toDouble(s32);
      expect(data32).assertEqual(65534.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16900
     * @tc.name      testNumericCastingConversions0169
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Double = 65535.0;
      let data33: Double = Double.toDouble(s33);
      expect(data33).assertEqual(65535.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17000
     * @tc.name      testNumericCastingConversions0170
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Double = 65536.0;
      let data34: Double = Double.toDouble(s34);
      expect(data34).assertEqual(65536.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17100
     * @tc.name      testNumericCastingConversions0171
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Double = 2.147483646E9;
      let data35: Double = Double.toDouble(s35);
      expect(data35).assertEqual(2.147483646E9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17200
     * @tc.name      testNumericCastingConversions0172
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Double = 2.147483647E9;
      let data36: Double = Double.toDouble(s36);
      expect(data36).assertEqual(2.147483647E9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17300
     * @tc.name      testNumericCastingConversions0173
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 126.0;
      let data25: Byte = Double.toByte(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17400
     * @tc.name      testNumericCastingConversions0174
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Double = 9.223372036854776E18;
      let data37: Double = Double.toDouble(s37);
      expect(data37).assertEqual(9.223372036854776E18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17500
     * @tc.name      testNumericCastingConversions0175
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s38: Double = 3.4028234663852886E38;
      let data38: Double = Double.toDouble(s38);
      expect(data38).assertEqual(3.4028234663852886E38);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17600
     * @tc.name      testNumericCastingConversions0176
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s39: Double = 1.7976931348623157E308;
      let data39: Double = Double.toDouble(s39);
      expect(data39).assertEqual(1.7976931348623157E308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17700
     * @tc.name      testNumericCastingConversions0177
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s40: Double = Double.POSITIVE_INFINITY;
      let data40: Double = Double.toDouble(s40);
      expect(data40).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17800
     * @tc.name      testNumericCastingConversions0178
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Float = Float.NaN;
      let data1: Byte = Float.toByte(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17900
     * @tc.name      testNumericCastingConversions0179
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Float = Float.NEGATIVE_INFINITY;
      let data2: Byte = Float.toByte(s2);
      expect(data2).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18000
     * @tc.name      testNumericCastingConversions0180
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Float = -3.4028235E38f;
      let data3: Byte = Float.toByte(s3);
      expect(data3).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18100
     * @tc.name      testNumericCastingConversions0181
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Float = -9.223372E18f;
      let data4: Byte = Float.toByte(s4);
      expect(data4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18200
     * @tc.name      testNumericCastingConversions0182
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Float = -2.14748365E9f;
      let data5: Byte = Float.toByte(s5);
      expect(data5).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18300
     * @tc.name      testNumericCastingConversions0183
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Float = -65537.0f;
      let data6: Byte = Float.toByte(s6);
      expect(data6).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18400
     * @tc.name      testNumericCastingConversions0184
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 127.0;
      let data26: Byte = Double.toByte(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18500
     * @tc.name      testNumericCastingConversions0185
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Float = -65536.0f;
      let data7: Byte = Float.toByte(s7);
      expect(data7).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18600
     * @tc.name      testNumericCastingConversions0186
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Float = -65535.0f;
      let data8: Byte = Float.toByte(s8);
      expect(data8).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18700
     * @tc.name      testNumericCastingConversions0187
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Float = -32769.0f;
      let data9: Byte = Float.toByte(s9);
      expect(data9).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18800
     * @tc.name      testNumericCastingConversions0188
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Float = -32768.0f;
      let data10: Byte = Float.toByte(s10);
      expect(data10).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18900
     * @tc.name      testNumericCastingConversions0189
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Float = -32767.0f;
      let data11: Byte = Float.toByte(s11);
      expect(data11).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19000
     * @tc.name      testNumericCastingConversions0190
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Float = -129.0f;
      let data12: Byte = Float.toByte(s12);
      expect(data12).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19100
     * @tc.name      testNumericCastingConversions0191
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Float = -128.0f;
      let data13: Byte = Float.toByte(s13);
      expect(data13).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19200
     * @tc.name      testNumericCastingConversions0192
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Float = -127.0f;
      let data14: Byte = Float.toByte(s14);
      expect(data14).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19300
     * @tc.name      testNumericCastingConversions0193
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Float = -3.1415925f;
      let data15: Byte = Float.toByte(s15);
      expect(data15).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19400
     * @tc.name      testNumericCastingConversions0194
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Float = -1.0f;
      let data16: Byte = Float.toByte(s16);
      expect(data16).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19500
     * @tc.name      testNumericCastingConversions0195
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 128.0;
      let data27: Byte = Double.toByte(s27);
      expect(data27).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19600
     * @tc.name      testNumericCastingConversions0196
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Float = -1.17549435E-38f;
      let data17: Byte = Float.toByte(s17);
      expect(data17).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19700
     * @tc.name      testNumericCastingConversions0197
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Float = -1.4E-45f;
      let data18: Byte = Float.toByte(s18);
      expect(data18).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19800
     * @tc.name      testNumericCastingConversions0198
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Float = -0.0f;
      let data19: Byte = Float.toByte(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19900
     * @tc.name      testNumericCastingConversions0199
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Float = 0.0f;
      let data20: Byte = Float.toByte(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20000
     * @tc.name      testNumericCastingConversions0200
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Float = 1.4E-45f;
      let data21: Byte = Float.toByte(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20100
     * @tc.name      testNumericCastingConversions0201
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Float = 1.17549435E-38f;
      let data22: Byte = Float.toByte(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20200
     * @tc.name      testNumericCastingConversions0202
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Float = 1.0f;
      let data23: Byte = Float.toByte(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20300
     * @tc.name      testNumericCastingConversions0203
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Float = 3.1415925f;
      let data24: Byte = Float.toByte(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20400
     * @tc.name      testNumericCastingConversions0204
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Float = 126.0f;
      let data25: Byte = Float.toByte(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20500
     * @tc.name      testNumericCastingConversions0205
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Float = 127.0f;
      let data26: Byte = Float.toByte(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20600
     * @tc.name      testNumericCastingConversions0206
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 32766.0;
      let data28: Byte = Double.toByte(s28);
      expect(data28).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20700
     * @tc.name      testNumericCastingConversions0207
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Float = 128.0f;
      let data27: Byte = Float.toByte(s27);
      expect(data27).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20800
     * @tc.name      testNumericCastingConversions0208
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Float = 32766.0f;
      let data28: Byte = Float.toByte(s28);
      expect(data28).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20900
     * @tc.name      testNumericCastingConversions0209
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Float = 32767.0f;
      let data29: Byte = Float.toByte(s29);
      expect(data29).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21000
     * @tc.name      testNumericCastingConversions0210
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Float = 32768.0f;
      let data30: Byte = Float.toByte(s30);
      expect(data30).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21100
     * @tc.name      testNumericCastingConversions0211
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Float = 65534.0f;
      let data31: Byte = Float.toByte(s31);
      expect(data31).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21200
     * @tc.name      testNumericCastingConversions0212
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Float = 65535.0f;
      let data32: Byte = Float.toByte(s32);
      expect(data32).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21300
     * @tc.name      testNumericCastingConversions0213
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Float = 65536.0f;
      let data33: Byte = Float.toByte(s33);
      expect(data33).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21400
     * @tc.name      testNumericCastingConversions0214
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Float = 2.14748365E9f;
      let data34: Byte = Float.toByte(s34);
      expect(data34).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21500
     * @tc.name      testNumericCastingConversions0215
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Float = 9.223372E18f;
      let data35: Byte = Float.toByte(s35);
      expect(data35).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21600
     * @tc.name      testNumericCastingConversions0216
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Float = 3.4028235E38f;
      let data36: Byte = Float.toByte(s36);
      expect(data36).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21700
     * @tc.name      testNumericCastingConversions0217
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32767.0;
      let data29: Byte = Double.toByte(s29);
      expect(data29).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21800
     * @tc.name      testNumericCastingConversions0218
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Float = Float.POSITIVE_INFINITY;
      let data37: Byte = Float.toByte(s37);
      expect(data37).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21900
     * @tc.name      testNumericCastingConversions0219
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Float = Float.NaN;
      let data1: Short = Float.toShort(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22000
     * @tc.name      testNumericCastingConversions0220
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Float = Float.NEGATIVE_INFINITY;
      let data2: Short = Float.toShort(s2);
      expect(data2).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22100
     * @tc.name      testNumericCastingConversions0221
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Float = -3.4028235E38f;
      let data3: Short = Float.toShort(s3);
      expect(data3).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22200
     * @tc.name      testNumericCastingConversions0222
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Float = -9.223372E18f;
      let data4: Short = Float.toShort(s4);
      expect(data4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22300
     * @tc.name      testNumericCastingConversions0223
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Float = -2.14748365E9f;
      let data5: Short = Float.toShort(s5);
      expect(data5).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22400
     * @tc.name      testNumericCastingConversions0224
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Float = -65537.0f;
      let data6: Short = Float.toShort(s6);
      expect(data6).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22500
     * @tc.name      testNumericCastingConversions0225
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Float = -65536.0f;
      let data7: Short = Float.toShort(s7);
      expect(data7).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22600
     * @tc.name      testNumericCastingConversions0226
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Float = -65535.0f;
      let data8: Short = Float.toShort(s8);
      expect(data8).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22700
     * @tc.name      testNumericCastingConversions0227
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Float = -32769.0f;
      let data9: Short = Float.toShort(s9);
      expect(data9).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22800
     * @tc.name      testNumericCastingConversions0228
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 32768.0;
      let data30: Byte = Double.toByte(s30);
      expect(data30).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22900
     * @tc.name      testNumericCastingConversions0229
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Float = -32768.0f;
      let data10: Short = Float.toShort(s10);
      expect(data10).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23000
     * @tc.name      testNumericCastingConversions0230
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Float = -32767.0f;
      let data11: Short = Float.toShort(s11);
      expect(data11).assertEqual(-32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23100
     * @tc.name      testNumericCastingConversions0231
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0231", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Float = -129.0f;
      let data12: Short = Float.toShort(s12);
      expect(data12).assertEqual(-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23200
     * @tc.name      testNumericCastingConversions0232
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0232", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Float = -128.0f;
      let data13: Short = Float.toShort(s13);
      expect(data13).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23300
     * @tc.name      testNumericCastingConversions0233
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0233", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Float = -127.0f;
      let data14: Short = Float.toShort(s14);
      expect(data14).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23400
     * @tc.name      testNumericCastingConversions0234
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0234", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Float = -3.1415925f;
      let data15: Short = Float.toShort(s15);
      expect(data15).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23500
     * @tc.name      testNumericCastingConversions0235
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0235", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Float = -1.0f;
      let data16: Short = Float.toShort(s16);
      expect(data16).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23600
     * @tc.name      testNumericCastingConversions0236
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0236", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Float = -1.17549435E-38f;
      let data17: Short = Float.toShort(s17);
      expect(data17).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23700
     * @tc.name      testNumericCastingConversions0237
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0237", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Float = -1.4E-45f;
      let data18: Short = Float.toShort(s18);
      expect(data18).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23800
     * @tc.name      testNumericCastingConversions0238
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0238", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Float = -0.0f;
      let data19: Short = Float.toShort(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23900
     * @tc.name      testNumericCastingConversions0239
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0239", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Double = -3.4028234663852886E38;
      let data4: Byte = Double.toByte(s4);
      expect(data4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24000
     * @tc.name      testNumericCastingConversions0240
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 65534.0;
      let data31: Byte = Double.toByte(s31);
      expect(data31).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24100
     * @tc.name      testNumericCastingConversions0241
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0241", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Float = 0.0f;
      let data20: Short = Float.toShort(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24200
     * @tc.name      testNumericCastingConversions0242
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0242", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Float = 1.4E-45f;
      let data21: Short = Float.toShort(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24300
     * @tc.name      testNumericCastingConversions0243
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0243", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Float = 1.17549435E-38f;
      let data22: Short = Float.toShort(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24400
     * @tc.name      testNumericCastingConversions0244
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0244", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Float = 1.0f;
      let data23: Short = Float.toShort(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24500
     * @tc.name      testNumericCastingConversions0245
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0245", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Float = 3.1415925f;
      let data24: Short = Float.toShort(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24600
     * @tc.name      testNumericCastingConversions0246
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0246", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Float = 126.0f;
      let data25: Short = Float.toShort(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24700
     * @tc.name      testNumericCastingConversions0247
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0247", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Float = 127.0f;
      let data26: Short = Float.toShort(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24800
     * @tc.name      testNumericCastingConversions0248
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0248", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Float = 128.0f;
      let data27: Short = Float.toShort(s27);
      expect(data27).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24900
     * @tc.name      testNumericCastingConversions0249
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0249", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Float = 32766.0f;
      let data28: Short = Float.toShort(s28);
      expect(data28).assertEqual(32766);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25000
     * @tc.name      testNumericCastingConversions0250
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Float = 32767.0f;
      let data29: Short = Float.toShort(s29);
      expect(data29).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25100
     * @tc.name      testNumericCastingConversions0251
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0251", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65535.0;
      let data32: Byte = Double.toByte(s32);
      expect(data32).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25200
     * @tc.name      testNumericCastingConversions0252
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0252", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Float = 32768.0f;
      let data30: Short = Float.toShort(s30);
      expect(data30).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25300
     * @tc.name      testNumericCastingConversions0253
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0253", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Float = 65534.0f;
      let data31: Short = Float.toShort(s31);
      expect(data31).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25400
     * @tc.name      testNumericCastingConversions0254
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0254", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Float = 65535.0f;
      let data32: Short = Float.toShort(s32);
      expect(data32).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25500
     * @tc.name      testNumericCastingConversions0255
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0255", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Float = 65536.0f;
      let data33: Short = Float.toShort(s33);
      expect(data33).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25600
     * @tc.name      testNumericCastingConversions0256
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0256", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Float = 2.14748365E9f;
      let data34: Short = Float.toShort(s34);
      expect(data34).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25700
     * @tc.name      testNumericCastingConversions0257
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0257", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Float = 9.223372E18f;
      let data35: Short = Float.toShort(s35);
      expect(data35).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25800
     * @tc.name      testNumericCastingConversions0258
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0258", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Float = 3.4028235E38f;
      let data36: Short = Float.toShort(s36);
      expect(data36).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25900
     * @tc.name      testNumericCastingConversions0259
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0259", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Float = Float.POSITIVE_INFINITY;
      let data37: Short = Float.toShort(s37);
      expect(data37).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26000
     * @tc.name      testNumericCastingConversions0260
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Float = Float.NaN;
      let data1: Int = Float.toInt(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26100
     * @tc.name      testNumericCastingConversions0261
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0261", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Float = Float.NEGATIVE_INFINITY;
      let data2: Int = Float.toInt(s2);
      expect(data2).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26200
     * @tc.name      testNumericCastingConversions0262
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0262", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65536.0;
      let data32: Byte = Double.toByte(s32);
      expect(data32).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26300
     * @tc.name      testNumericCastingConversions0263
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0263", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Float = -3.4028235E38f;
      let data3: Int = Float.toInt(s3);
      expect(data3).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26400
     * @tc.name      testNumericCastingConversions0264
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0264", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Float = -9.223372E18f;
      let data4: Int = Float.toInt(s4);
      expect(data4).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26500
     * @tc.name      testNumericCastingConversions0265
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0265", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Float = -2.14748365E9f;
      let data5: Int = Float.toInt(s5);
      expect(data5).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26600
     * @tc.name      testNumericCastingConversions0266
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0266", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Float = -65537.0f;
      let data6: Int = Float.toInt(s6);
      expect(data6).assertEqual(-65537);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26700
     * @tc.name      testNumericCastingConversions0267
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0267", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Float = -65536.0f;
      let data7: Int = Float.toInt(s7);
      expect(data7).assertEqual(-65536);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26800
     * @tc.name      testNumericCastingConversions0268
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0268", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Float = -65535.0f;
      let data8: Int = Float.toInt(s8);
      expect(data8).assertEqual(-65535);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26900
     * @tc.name      testNumericCastingConversions0269
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0269", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Float = -32769.0f;
      let data9: Int = Float.toInt(s9);
      expect(data9).assertEqual(-32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_27000
     * @tc.name      testNumericCastingConversions0270
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Float = -32768.0f;
      let data10: Int = Float.toInt(s10);
      expect(data10).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_27100
     * @tc.name      testNumericCastingConversions0271
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0271", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Float = -32767.0f;
      let data11: Int = Float.toInt(s11);
      expect(data11).assertEqual(-32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_27200
     * @tc.name      testNumericCastingConversions0272
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0272", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Float = -129.0f;
      let data12: Int = Float.toInt(s12);
      expect(data12).assertEqual(-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_27300
     * @tc.name      testNumericCastingConversions0273
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0273", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Double = 2.147483646E9;
      let data34: Byte = Double.toByte(s34);
      expect(data34).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_27400
     * @tc.name      testNumericCastingConversions0274
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0274", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Float = -128.0f;
      let data13: Int = Float.toInt(s13);
      expect(data13).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_27500
     * @tc.name      testNumericCastingConversions0275
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0275", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Float = -127.0f;
      let data14: Int = Float.toInt(s14);
      expect(data14).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_27600
     * @tc.name      testNumericCastingConversions0276
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0276", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Float = -3.1415925f;
      let data15: Int = Float.toInt(s15);
      expect(data15).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_27700
     * @tc.name      testNumericCastingConversions0277
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0277", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Float = -1.0f;
      let data16: Int = Float.toInt(s16);
      expect(data16).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_27800
     * @tc.name      testNumericCastingConversions0278
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0278", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Float = -1.17549435E-38f;
      let data17: Int = Float.toInt(s17);
      expect(data17).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_27900
     * @tc.name      testNumericCastingConversions0279
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0279", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Float = -1.4E-45f;
      let data18: Int = Float.toInt(s18);
      expect(data18).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_28000
     * @tc.name      testNumericCastingConversions0280
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Float = -0.0f;
      let data19: Int = Float.toInt(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_28100
     * @tc.name      testNumericCastingConversions0281
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0281", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Float = 0.0f;
      let data20: Int = Float.toInt(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_28200
     * @tc.name      testNumericCastingConversions0282
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0282", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Float = 1.4E-45f;
      let data21: Int = Float.toInt(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_28300
     * @tc.name      testNumericCastingConversions0283
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0283", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Float = 1.17549435E-38f;
      let data22: Int = Float.toInt(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_28400
     * @tc.name      testNumericCastingConversions0284
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0284", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Double = 2.147483647E9;
      let data35: Byte = Double.toByte(s35);
      expect(data35).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_28500
     * @tc.name      testNumericCastingConversions0285
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0285", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Float = 1.0f;
      let data23: Int = Float.toInt(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_28600
     * @tc.name      testNumericCastingConversions0286
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0286", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Float = 3.1415925f;
      let data24: Int = Float.toInt(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_28700
     * @tc.name      testNumericCastingConversions0287
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0287", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Float = 126.0f;
      let data25: Int = Float.toInt(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_28800
     * @tc.name      testNumericCastingConversions0288
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0288", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Float = 127.0f;
      let data26: Int = Float.toInt(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_28900
     * @tc.name      testNumericCastingConversions0289
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0289", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Float = 128.0f;
      let data27: Int = Float.toInt(s27);
      expect(data27).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_29000
     * @tc.name      testNumericCastingConversions0290
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Float = 32766.0f;
      let data28: Int = Float.toInt(s28);
      expect(data28).assertEqual(32766);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_29100
     * @tc.name      testNumericCastingConversions0291
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0291", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Float = 32767.0f;
      let data29: Int = Float.toInt(s29);
      expect(data29).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_29200
     * @tc.name      testNumericCastingConversions0292
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0292", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Float = 32768.0f;
      let data30: Int = Float.toInt(s30);
      expect(data30).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_29300
     * @tc.name      testNumericCastingConversions0293
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0293", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Float = 65534.0f;
      let data31: Int = Float.toInt(s31);
      expect(data31).assertEqual(65534);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_29400
     * @tc.name      testNumericCastingConversions0294
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0294", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Float = 65535.0f;
      let data32: Int = Float.toInt(s32);
      expect(data32).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_29500
     * @tc.name      testNumericCastingConversions0295
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0295", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Double = 9.223372036854776E18;
      let data36: Byte = Double.toByte(s36);
      expect(data36).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_29600
     * @tc.name      testNumericCastingConversions0296
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0296", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Float = 65536.0f;
      let data33: Int = Float.toInt(s33);
      expect(data33).assertEqual(65536);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_29700
     * @tc.name      testNumericCastingConversions0297
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0297", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Float = 2.14748365E9f;
      let data34: Int = Float.toInt(s34);
      expect(data34).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_29800
     * @tc.name      testNumericCastingConversions0298
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0298", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Float = 9.223372E18f;
      let data35: Int = Float.toInt(s35);
      expect(data35).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_29900
     * @tc.name      testNumericCastingConversions0299
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0299", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Float = 3.4028235E38f;
      let data36: Int = Float.toInt(s36);
      expect(data36).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_30000
     * @tc.name      testNumericCastingConversions0300
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Float = Float.POSITIVE_INFINITY;
      let data37: Int = Float.toInt(s37);
      expect(data37).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_30100
     * @tc.name      testNumericCastingConversions0301
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0301", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Float = Float.NaN;
      let data1: Long = Float.toLong(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_30200
     * @tc.name      testNumericCastingConversions0302
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0302", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Float = Float.NEGATIVE_INFINITY;
      let data2: Long = Float.toLong(s2);
      expect(data2).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_30300
     * @tc.name      testNumericCastingConversions0303
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0303", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Float = -3.4028235E38f;
      let data3: Long = Float.toLong(s3);
      expect(data3).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_30400
     * @tc.name      testNumericCastingConversions0304
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0304", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Float = -9.223373E18f;
      let data4: Long = Float.toLong(s4);
      expect(data4).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_30500
     * @tc.name      testNumericCastingConversions0305
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0305", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Float = -2.14748365E9f;
      let data5: Long = Float.toLong(s5);
      expect(data5).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_30600
     * @tc.name      testNumericCastingConversions0306
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0306", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Double = 3.4028234663852886E38;
      let data37: Byte = Double.toByte(s37);
      expect(data37).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_30700
     * @tc.name      testNumericCastingConversions0307
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0307", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Float = -65537.0f;
      let data6: Long = Float.toLong(s6);
      expect(data6).assertEqual(-65537);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_30800
     * @tc.name      testNumericCastingConversions0308
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0308", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Float = -65536.0f;
      let data7: Long = Float.toLong(s7);
      expect(data7).assertEqual(-65536);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_30900
     * @tc.name      testNumericCastingConversions0309
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0309", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Float = -65535.0f;
      let data8: Long = Float.toLong(s8);
      expect(data8).assertEqual(-65535);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_31000
     * @tc.name      testNumericCastingConversions0310
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Float = -32769.0f;
      let data9: Long = Float.toLong(s9);
      expect(data9).assertEqual(-32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_31100
     * @tc.name      testNumericCastingConversions0311
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0311", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Float = -32768.0f;
      let data10: Long = Float.toLong(s10);
      expect(data10).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_31200
     * @tc.name      testNumericCastingConversions0312
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0312", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Float = -32767.0f;
      let data11: Long = Float.toLong(s11);
      expect(data11).assertEqual(-32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_31300
     * @tc.name      testNumericCastingConversions0313
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0313", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Float = -129.0f;
      let data12: Long = Float.toLong(s12);
      expect(data12).assertEqual(-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_31400
     * @tc.name      testNumericCastingConversions0314
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0314", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Float = -128.0f;
      let data13: Long = Float.toLong(s13);
      expect(data13).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_31500
     * @tc.name      testNumericCastingConversions0315
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0315", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Float = -127.0f;
      let data14: Long = Float.toLong(s14);
      expect(data14).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_31600
     * @tc.name      testNumericCastingConversions0316
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0316", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Float = -3.1415925f;
      let data15: Long = Float.toLong(s15);
      expect(data15).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_31700
     * @tc.name      testNumericCastingConversions0317
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0317", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s38: Double = 1.7976931348623157E308;
      let data38: Byte = Double.toByte(s38);
      expect(data38).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_31800
     * @tc.name      testNumericCastingConversions0318
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0318", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Float = -1.0f;
      let data16: Long = Float.toLong(s16);
      expect(data16).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_31900
     * @tc.name      testNumericCastingConversions0319
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0319", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Float = -1.17549435E-38f;
      let data17: Long = Float.toLong(s17);
      expect(data17).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_32000
     * @tc.name      testNumericCastingConversions0320
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Float = -1.4E-45f;
      let data18: Long = Float.toLong(s18);
      expect(data18).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_32100
     * @tc.name      testNumericCastingConversions0321
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0321", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Float = -0.0f;
      let data19: Long = Float.toLong(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_32200
     * @tc.name      testNumericCastingConversions0322
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0322", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Float = 0.0f;
      let data20: Long = Float.toLong(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_32300
     * @tc.name      testNumericCastingConversions0323
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0323", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Float = 1.4E-45f;
      let data21: Long = Float.toLong(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_32400
     * @tc.name      testNumericCastingConversions0324
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0324", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Float = 1.17549435E-38f;
      let data22: Long = Float.toLong(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_32500
     * @tc.name      testNumericCastingConversions0325
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0325", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Float = 1.0f;
      let data23: Long = Float.toLong(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_32600
     * @tc.name      testNumericCastingConversions0326
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0326", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Float = 3.1415925f;
      let data24: Long = Float.toLong(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_32700
     * @tc.name      testNumericCastingConversions0327
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0327", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Float = 126.0f;
      let data25: Long = Float.toLong(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_32800
     * @tc.name      testNumericCastingConversions0328
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0328", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s39: Double = Double.POSITIVE_INFINITY;
      let data39: Byte = Double.toByte(s39);
      expect(data39).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_32900
     * @tc.name      testNumericCastingConversions0329
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0329", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Float = 127.0f;
      let data26: Long = Float.toLong(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_33000
     * @tc.name      testNumericCastingConversions0330
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0330", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Float = 128.0f;
      let data27: Long = Float.toLong(s27);
      expect(data27).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_33100
     * @tc.name      testNumericCastingConversions0331
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0331", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Float = 32766.0f;
      let data28: Long = Float.toLong(s28);
      expect(data28).assertEqual(32766);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_33200
     * @tc.name      testNumericCastingConversions0332
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0332", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Float = 32767.0f;
      let data29: Long = Float.toLong(s29);
      expect(data29).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_33300
     * @tc.name      testNumericCastingConversions0333
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0333", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Float = 32768.0f;
      let data30: Long = Float.toLong(s30);
      expect(data30).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_33400
     * @tc.name      testNumericCastingConversions0334
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0334", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Float = 65534.0f;
      let data31: Long = Float.toLong(s31);
      expect(data31).assertEqual(65534);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_33500
     * @tc.name      testNumericCastingConversions0335
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0335", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Float = 65535.0f;
      let data32: Long = Float.toLong(s32);
      expect(data32).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_33600
     * @tc.name      testNumericCastingConversions0336
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0336", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Float = 65536.0f;
      let data33: Long = Float.toLong(s33);
      expect(data33).assertEqual(65536);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_33700
     * @tc.name      testNumericCastingConversions0337
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0337", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Float = 2.14748365E9f;
      let data34: Long = Float.toLong(s34);
      expect(data34).assertEqual(2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_33800
     * @tc.name      testNumericCastingConversions0338
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0338", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Float = 9.223372E18f;
      let data35: Long = Float.toLong(s35);
      expect(data35).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_33900
     * @tc.name      testNumericCastingConversions0339
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0339", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = -4.9E-308;
      let data1: Byte = Double.toByte(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_34000
     * @tc.name      testNumericCastingConversions0340
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0340", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Float = 3.4028235E38f;
      let data36: Long = Float.toLong(s36);
      expect(data36).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_34100
     * @tc.name      testNumericCastingConversions0341
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0341", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Float = Float.POSITIVE_INFINITY;
      let data37: Long = Float.toLong(s37);
      expect(data37).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_34200
     * @tc.name      testNumericCastingConversions0342
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0342", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Float = Float.NEGATIVE_INFINITY;
      let data1: Float = Float.toFloat(s1);
      expect(data1).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_34300
     * @tc.name      testNumericCastingConversions0343
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0343", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Float = -3.4028235E38f;
      let data2: Float = Float.toFloat(s2);
      expect(data2).assertEqual(-3.4028235E38f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_34400
     * @tc.name      testNumericCastingConversions0344
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0344", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Float = -9.223372E18f;
      let data3: Float = Float.toFloat(s3);
      expect(data3).assertEqual(-9.223372E18f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_34500
     * @tc.name      testNumericCastingConversions0345
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0345", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Float = -2.14748365E9f;
      let data4: Float = Float.toFloat(s4);
      expect(data4).assertEqual(-2.14748365E9f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_34600
     * @tc.name      testNumericCastingConversions0346
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0346", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Float = -65537.0f;
      let data5: Float = Float.toFloat(s5);
      expect(data5).assertEqual(-65537.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_34700
     * @tc.name      testNumericCastingConversions0347
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0347", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Float = -65536.0f;
      let data6: Float = Float.toFloat(s6);
      expect(data6).assertEqual(-65536.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_34800
     * @tc.name      testNumericCastingConversions0348
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0348", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Float = -65535.0f;
      let data7: Float = Float.toFloat(s7);
      expect(data7).assertEqual(-65535.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_34900
     * @tc.name      testNumericCastingConversions0349
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0349", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Float = -32769.0f;
      let data8: Float = Float.toFloat(s8);
      expect(data8).assertEqual(-32769.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_35000
     * @tc.name      testNumericCastingConversions0350
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Double = -9.223372036854776E18;
      let data5: Byte = Double.toByte(s5);
      expect(data5).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_35100
     * @tc.name      testNumericCastingConversions0351
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0351", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = 4.9E-308;
      let data1: Byte = Double.toByte(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_35200
     * @tc.name      testNumericCastingConversions0352
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0352", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Float = -32768.0f;
      let data9: Float = Float.toFloat(s9);
      expect(data9).assertEqual(-32768.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_35300
     * @tc.name      testNumericCastingConversions0353
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0353", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Float = -32767.0f;
      let data10: Float = Float.toFloat(s10);
      expect(data10).assertEqual(-32767.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_35400
     * @tc.name      testNumericCastingConversions0354
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0354", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Float = -129.0f;
      let data11: Float = Float.toFloat(s11);
      expect(data11).assertEqual(-129.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_35500
     * @tc.name      testNumericCastingConversions0355
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0355", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Float = -128.0f;
      let data12: Float = Float.toFloat(s12);
      expect(data12).assertEqual(-128.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_35600
     * @tc.name      testNumericCastingConversions0356
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0356", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Float = -127.0f;
      let data13: Float = Float.toFloat(s13);
      expect(data13).assertEqual(-127.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_35700
     * @tc.name      testNumericCastingConversions0357
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0357", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Float = -3.1415925f;
      let data14: Float = Float.toFloat(s14);
      expect(data14).assertEqual(-3.1415925f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_35800
     * @tc.name      testNumericCastingConversions0358
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0358", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Float = -1.0f;
      let data15: Float = Float.toFloat(s15);
      expect(data15).assertEqual(-1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_35900
     * @tc.name      testNumericCastingConversions0359
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0359", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Float = -1.17549435E-38f;
      let data16: Float = Float.toFloat(s16);
      expect(data16).assertEqual(-1.17549435E-38f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_36000
     * @tc.name      testNumericCastingConversions0360
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0360", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Float = -1.4E-45f;
      let data17: Float = Float.toFloat(s17);
      expect(data17).assertEqual(-1.4E-45f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_36100
     * @tc.name      testNumericCastingConversions0361
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0361", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Float = -0.0f;
      let data18: Float = Float.toFloat(s18);
      expect(data18).assertEqual(0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_36200
     * @tc.name      testNumericCastingConversions0362
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0362", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = Double.NaN;
      let data1: Short = Double.toShort(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_36300
     * @tc.name      testNumericCastingConversions0363
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0363", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Float = 0.0f;
      let data19: Float = Float.toFloat(s19);
      expect(data19).assertEqual(0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_36400
     * @tc.name      testNumericCastingConversions0364
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0364", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Float = 1.4E-45f;
      let data20: Float = Float.toFloat(s20);
      expect(data20).assertEqual(1.4E-45f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_36500
     * @tc.name      testNumericCastingConversions0365
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0365", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Float = 1.17549435E-38f;
      let data21: Float = Float.toFloat(s21);
      expect(data21).assertEqual(1.17549435E-38f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_36600
     * @tc.name      testNumericCastingConversions0366
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0366", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Float = 1.0f;
      let data22: Float = Float.toFloat(s22);
      expect(data22).assertEqual(1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_36700
     * @tc.name      testNumericCastingConversions0367
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0367", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Float = 3.1415925f;
      let data23: Float = Float.toFloat(s23);
      expect(data23).assertEqual(3.1415925f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_36800
     * @tc.name      testNumericCastingConversions0368
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0368", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Float = 126.0f;
      let data24: Float = Float.toFloat(s24);
      expect(data24).assertEqual(126.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_36900
     * @tc.name      testNumericCastingConversions0369
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0369", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Float = 127.0f;
      let data25: Float = Float.toFloat(s25);
      expect(data25).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_37000
     * @tc.name      testNumericCastingConversions0370
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0370", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Float = 128.0f;
      let data26: Float = Float.toFloat(s26);
      expect(data26).assertEqual(128.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_37100
     * @tc.name      testNumericCastingConversions0371
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0371", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Float = 32766.0f;
      let data27: Float = Float.toFloat(s27);
      expect(data27).assertEqual(32766.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_37200
     * @tc.name      testNumericCastingConversions0372
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0372", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Float = 32767.0f;
      let data28: Float = Float.toFloat(s28);
      expect(data28).assertEqual(32767.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_37300
     * @tc.name      testNumericCastingConversions0373
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0373", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Float = 32768.0f;
      let data29: Float = Float.toFloat(s29);
      expect(data29).assertEqual(32768.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_37400
     * @tc.name      testNumericCastingConversions0374
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0374", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Float = 65534.0f;
      let data30: Float = Float.toFloat(s30);
      expect(data30).assertEqual(65534.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_37500
     * @tc.name      testNumericCastingConversions0375
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0375", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Float = 65535.0f;
      let data31: Float = Float.toFloat(s31);
      expect(data31).assertEqual(65535.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_37600
     * @tc.name      testNumericCastingConversions0376
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0376", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Float = 65536.0f;
      let data32: Float = Float.toFloat(s32);
      expect(data32).assertEqual(65536.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_37700
     * @tc.name      testNumericCastingConversions0377
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0377", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Float = 2.14748365E9f;
      let data33: Float = Float.toFloat(s33);
      expect(data33).assertEqual(2.14748365E9f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_37800
     * @tc.name      testNumericCastingConversions0378
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0378", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Float = 9.223372E18f;
      let data34: Float = Float.toFloat(s34);
      expect(data34).assertEqual(9.223372E18f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_37900
     * @tc.name      testNumericCastingConversions0379
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0379", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Float = 3.4028235E38f;
      let data35: Float = Float.toFloat(s35);
      expect(data35).assertEqual(3.4028235E38f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_38000
     * @tc.name      testNumericCastingConversions0380
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0380", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Float = Float.POSITIVE_INFINITY;
      let data36: Float = Float.toFloat(s36);
      expect(data36).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_38100
     * @tc.name      testNumericCastingConversions0381
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0381", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Float = Float.NEGATIVE_INFINITY;
      let data1: Double = Float.toDouble(s1);
      expect(data1).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_38200
     * @tc.name      testNumericCastingConversions0382
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0382", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Float = -3.4028235E38f;
      let data2: Double = Float.toDouble(s2);
      expect(data2).assertEqual(-3.4028234663852886E38);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_38300
     * @tc.name      testNumericCastingConversions0383
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0383", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Double = -1.7976931348623157E308;
      let data3: Short = Double.toShort(s3);
      expect(data3).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_38400
     * @tc.name      testNumericCastingConversions0384
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0384", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Float = -9.223372E18f;
      let data3: Double = Float.toDouble(s3);
      expect(data3).assertEqual(-9.223372036854776E18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_38500
     * @tc.name      testNumericCastingConversions0385
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0385", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Float = -2.14748365E9f;
      let data4: Double = Float.toDouble(s4);
      expect(data4).assertEqual(-2.147483648E9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_38600
     * @tc.name      testNumericCastingConversions0386
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0386", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Float = -65537.0f;
      let data5: Double = Float.toDouble(s5);
      expect(data5).assertEqual(-65537.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_38700
     * @tc.name      testNumericCastingConversions0387
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0387", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Float = -65536.0f;
      let data6: Double = Float.toDouble(s6);
      expect(data6).assertEqual(-65536.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_38800
     * @tc.name      testNumericCastingConversions0388
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0388", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Float = -65535.0f;
      let data7: Double = Float.toDouble(s7);
      expect(data7).assertEqual(-65535.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_38900
     * @tc.name      testNumericCastingConversions0389
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0389", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Float = -32769.0f;
      let data8: Double = Float.toDouble(s8);
      expect(data8).assertEqual(-32769.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_39000
     * @tc.name      testNumericCastingConversions0390
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0390", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Float = -32768.0f;
      let data9: Double = Float.toDouble(s9);
      expect(data9).assertEqual(-32768.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_39100
     * @tc.name      testNumericCastingConversions0391
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0391", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Float = -32767.0f;
      let data10: Double = Float.toDouble(s10);
      expect(data10).assertEqual(-32767.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_39200
     * @tc.name      testNumericCastingConversions0392
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0392", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Float = -129.0f;
      let data11: Double = Float.toDouble(s11);
      expect(data11).assertEqual(-129.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_39300
     * @tc.name      testNumericCastingConversions0393
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0393", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Float = -128.0f;
      let data12: Double = Float.toDouble(s12);
      expect(data12).assertEqual(-128.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_39400
     * @tc.name      testNumericCastingConversions0394
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0394", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Double = -3.4028234663852886E38;
      let data4: Short = Double.toShort(s4);
      expect(data4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_39500
     * @tc.name      testNumericCastingConversions0395
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0395", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Float = -127.0f;
      let data13: Double = Float.toDouble(s13);
      expect(data13).assertEqual(-127.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_39600
     * @tc.name      testNumericCastingConversions0396
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0396", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Float = -3.1415925f;
      let data14: Double = Float.toDouble(s14);
      expect(data14).assertEqual(-3.141592502593994);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_39700
     * @tc.name      testNumericCastingConversions0397
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0397", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Float = -1.0f;
      let data15: Double = Float.toDouble(s15);
      expect(data15).assertEqual(-1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_39800
     * @tc.name      testNumericCastingConversions0398
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0398", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Float = -1.17549435E-38f;
      let data16: Double = Float.toDouble(s16);
      expect(data16).assertEqual(-1.1754943508222875E-38);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_39900
     * @tc.name      testNumericCastingConversions0399
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0399", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Float = -1.4E-45f;
      let data17: Double = Float.toDouble(s17);
      expect(data17).assertEqual(-1.401298464324817E-45);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_40000
     * @tc.name      testNumericCastingConversions0400
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Float = -0.0f;
      let data18: Double = Float.toDouble(s18);
      expect(data18).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_40100
     * @tc.name      testNumericCastingConversions0401
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Float = 0.0f;
      let data19: Double = Float.toDouble(s19);
      expect(data19).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_40200
     * @tc.name      testNumericCastingConversions0402
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0402", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Float = 1.4E-45f;
      let data20: Double = Float.toDouble(s20);
      expect(data20).assertEqual(1.401298464324817E-45);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_40300
     * @tc.name      testNumericCastingConversions0403
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0403", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Float = 1.17549435E-38f;
      let data21: Double = Float.toDouble(s21);
      expect(data21).assertEqual(1.1754943508222875E-38);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_40400
     * @tc.name      testNumericCastingConversions0404
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0404", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Float = 1.0f;
      let data22: Double = 1.0;
      expect(Float.toDouble(s22)).assertEqual(data22);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_40500
     * @tc.name      testNumericCastingConversions0405
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0405", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Double = -9.223372036854776E18;
      let data5: Short = 0;
      expect(Double.toShort(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_40600
     * @tc.name      testNumericCastingConversions0406
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0406", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Float = 3.1415925f;
      let data23: Double = 3.141592502593994;
      expect(Float.toDouble(s23)).assertEqual(data23);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_40700
     * @tc.name      testNumericCastingConversions0407
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0407", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Float = 126.0f;
      let data24: Double = 126.0;
      expect(Float.toDouble(s24)).assertEqual(data24);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_40800
     * @tc.name      testNumericCastingConversions0408
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0408", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Float = 127.0f;
      let data25: Double = 127.0;
      expect(Float.toDouble(s25)).assertEqual(data25);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_40900
     * @tc.name      testNumericCastingConversions0409
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0409", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Float = 128.0f;
      let data26: Double = 128.0;
      expect(Float.toDouble(s26)).assertEqual(data26);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_41000
     * @tc.name      testNumericCastingConversions0410
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Float = 32766.0f;
      let data27: Double = 32766.0;
      expect(Float.toDouble(s27)).assertEqual(data27);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_41100
     * @tc.name      testNumericCastingConversions0411
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0411", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Float = 32767.0f;
      let data28: Double = 32767.0;
      expect(Float.toDouble(s28)).assertEqual(data28);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_41200
     * @tc.name      testNumericCastingConversions0412
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0412", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Float = 32768.0f;
      let data29: Double = 32768.0;
      expect(Float.toDouble(s29)).assertEqual(data29);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_41300
     * @tc.name      testNumericCastingConversions0413
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0413", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Float = 65534.0f;
      let data30: Double = 65534.0;
      expect(Float.toDouble(s30)).assertEqual(data30);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_41400
     * @tc.name      testNumericCastingConversions0414
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0414", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Float = 65535.0f;
      let data31: Double = 65535.0;
      expect(Float.toDouble(s31)).assertEqual(data31);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_41500
     * @tc.name      testNumericCastingConversions0415
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0415", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Float = 65536.0f;
      let data32: Double = 65536.0;
      expect(Float.toDouble(s32)).assertEqual(data32);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_41600
     * @tc.name      testNumericCastingConversions0416
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0416", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Double = -2.147483648E9;
      let data6: Short = 0;
      expect(Double.toShort(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_41700
     * @tc.name      testNumericCastingConversions0417
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0417", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Float = 2.14748365E9f;
      let data33: Double = 2.147483648E9;
      expect(Float.toDouble(s33)).assertEqual(data33);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_41800
     * @tc.name      testNumericCastingConversions0418
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0418", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Float = 9.223372E18f;
      let data34: Double = 9.223372036854776E18;
      expect(Float.toDouble(s34)).assertEqual(data34);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_41900
     * @tc.name      testNumericCastingConversions0419
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0419", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Float = 3.4028235E38f;
      let data35: Double = 3.4028234663852886E38;
      expect(Float.toDouble(s35)).assertEqual(data35);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_42000
     * @tc.name      testNumericCastingConversions0420
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0420", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Float = Float.POSITIVE_INFINITY;
      let data36: Double = Double.POSITIVE_INFINITY;
      expect(Float.toDouble(s36)).assertEqual(data36);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_42100
     * @tc.name      testNumericCastingConversions0421
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0421", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Long = -9223372036854775808;
      let data1: Byte = 0;
      expect(Long.toByte(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_42200
     * @tc.name      testNumericCastingConversions0422
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0422", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Long = -9223372036854775807;
      let data2: Byte = 1;
      expect(Long.toByte(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_42300
     * @tc.name      testNumericCastingConversions0423
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0423", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Long = 2147483647;
      let data3: Byte = -1;
      expect(Long.toByte(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_42400
     * @tc.name      testNumericCastingConversions0424
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0424", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Long = -2147483648;
      let data4: Byte = 0;
      expect(Long.toByte(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_42500
     * @tc.name      testNumericCastingConversions0425
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0425", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Long = -2147483647;
      let data5: Byte = 1;
      expect(Long.toByte(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_42600
     * @tc.name      testNumericCastingConversions0426
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0426", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Long = -32769;
      let data6: Byte = -1;
      expect(Long.toByte(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_42700
     * @tc.name      testNumericCastingConversions0427
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0427", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Double = -2.147483647E9;
      let data7: Short = 1;
      expect(Double.toShort(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_42800
     * @tc.name      testNumericCastingConversions0428
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0428", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Long = -32768;
      let data7: Byte = 0;
      expect(Long.toByte(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_42900
     * @tc.name      testNumericCastingConversions0429
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0429", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Long = -32767;
      let data8: Byte = 1;
      expect(Long.toByte(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_43000
     * @tc.name      testNumericCastingConversions0430
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0430", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Long = -129;
      let data9: Byte = 127;
      expect(Long.toByte(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_43100
     * @tc.name      testNumericCastingConversions0431
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0431", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Long = -128;
      let data10: Byte = -128;
      expect(Long.toByte(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_43200
     * @tc.name      testNumericCastingConversions0432
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0432", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Long = -127;
      let data11: Byte = -127;
      expect(Long.toByte(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_43300
     * @tc.name      testNumericCastingConversions0433
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0433", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Long = -1;
      let data12: Byte = -1;
      expect(Long.toByte(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_43400
     * @tc.name      testNumericCastingConversions0434
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0434", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Long = 0;
      let data13: Byte = 0;
      expect(Long.toByte(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_43500
     * @tc.name      testNumericCastingConversions0435
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0435", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Long = 1;
      let data14: Byte = 1;
      expect(Long.toByte(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_43600
     * @tc.name      testNumericCastingConversions0436
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0436", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Long = 126;
      let data15: Byte = 126;
      expect(Long.toByte(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_43700
     * @tc.name      testNumericCastingConversions0437
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0437", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Long = 127;
      let data16: Byte = 127;
      expect(Long.toByte(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_43800
     * @tc.name      testNumericCastingConversions0438
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0438", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Double = -65537.0;
      let data8: Short = -1;
      expect(Double.toShort(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_43900
     * @tc.name      testNumericCastingConversions0439
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0439", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Long = 128;
      let data17: Byte = -128;
      expect(Long.toByte(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_44000
     * @tc.name      testNumericCastingConversions0440
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0440", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Long = 32766;
      let data18: Byte = -2;
      expect(Long.toByte(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_44100
     * @tc.name      testNumericCastingConversions0441
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0441", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Long = 32767;
      let data19: Byte = -1;
      expect(Long.toByte(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_44200
     * @tc.name      testNumericCastingConversions0442
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0442", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Long = 32768;
      let data20: Byte = 0;
      expect(Long.toByte(s20)).assertEqual(data20);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_44300
     * @tc.name      testNumericCastingConversions0443
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0443", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Long = 2147483646;
      let data21: Byte = -2;
      expect(Long.toByte(s21)).assertEqual(data21);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_44400
     * @tc.name      testNumericCastingConversions0444
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0444", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Long = 2147483647;
      let data22: Byte = -1;
      expect(Long.toByte(s22)).assertEqual(data22);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_44500
     * @tc.name      testNumericCastingConversions0445
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0445", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Long = -2147483648;
      let data23: Byte = 0;
      expect(Long.toByte(s23)).assertEqual(data23);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_44600
     * @tc.name      testNumericCastingConversions0446
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0446", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Long = 9223372036854775806;
      let data24: Byte = -2;
      expect(Long.toByte(s24)).assertEqual(data24);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_44700
     * @tc.name      testNumericCastingConversions0447
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0447", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Long = 9223372036854775807;
      let data25: Byte = -1;
      expect(Long.toByte(s25)).assertEqual(data25);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_44800
     * @tc.name      testNumericCastingConversions0448
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0448", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Long = -9223372036854775808;
      let data1: Short = 0;
      expect(Long.toShort(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_44900
     * @tc.name      testNumericCastingConversions0449
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0449", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Double = -65536.0;
      let data9: Short = 0;
      expect(Double.toShort(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_45000
     * @tc.name      testNumericCastingConversions0450
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Long = -9223372036854775807;
      let data2: Short = 1;
      expect(Long.toShort(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_45100
     * @tc.name      testNumericCastingConversions0451
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0451", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Long = 2147483647;
      let data3: Short = -1;
      expect(Long.toShort(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_45200
     * @tc.name      testNumericCastingConversions0452
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0452", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Long = -2147483648;
      let data4: Short = 0;
      expect(Long.toShort(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_45300
     * @tc.name      testNumericCastingConversions0453
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0453", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Long = -2147483647;
      let data5: Short = 1;
      expect(Long.toShort(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_45400
     * @tc.name      testNumericCastingConversions0454
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0454", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Long = -32769;
      let data6: Short = 32767;
      expect(Long.toShort(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_45500
     * @tc.name      testNumericCastingConversions0455
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0455", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Long = -32768;
      let data7: Short = -32768;
      expect(Long.toShort(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_45600
     * @tc.name      testNumericCastingConversions0456
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0456", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Long = -32767;
      let data8: Short = -32767;
      expect(Long.toShort(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_45700
     * @tc.name      testNumericCastingConversions0457
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0457", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Long = -129;
      let data9: Short = -129;
      expect(Long.toShort(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_45800
     * @tc.name      testNumericCastingConversions0458
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0458", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Long = -128;
      let data10: Short = -128;
      expect(Long.toShort(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_45900
     * @tc.name      testNumericCastingConversions0459
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0459", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Long = -127;
      let data11: Short = -127;
      expect(Long.toShort(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_46000
     * @tc.name      testNumericCastingConversions0460
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0460", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Double = -2.147483648E9;
      let data6: Byte = 0;
      expect(Double.toByte(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_46100
     * @tc.name      testNumericCastingConversions0461
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0461", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Double = -65535.0;
      let data10: Short = 1;
      expect(Double.toShort(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_46200
     * @tc.name      testNumericCastingConversions0462
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0462", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Long = -1;
      let data12: Short = -1;
      expect(Long.toShort(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_46300
     * @tc.name      testNumericCastingConversions0463
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0463", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Long = 0;
      let data13: Short = 0;
      expect(Long.toShort(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_46400
     * @tc.name      testNumericCastingConversions0464
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0464", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Long = 1;
      let data14: Short = 1;
      expect(Long.toShort(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_46500
     * @tc.name      testNumericCastingConversions0465
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0465", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Long = 126;
      let data15: Short = 126;
      expect(Long.toShort(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_46600
     * @tc.name      testNumericCastingConversions0466
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0466", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Long = 127;
      let data16: Short = 127;
      expect(Long.toShort(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_46700
     * @tc.name      testNumericCastingConversions0467
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0467", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Long = 128;
      let data17: Short = 128;
      expect(Long.toShort(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_46800
     * @tc.name      testNumericCastingConversions0468
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0468", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Long = 32766;
      let data18: Short = 32766;
      expect(Long.toShort(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_46900
     * @tc.name      testNumericCastingConversions0469
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0469", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Long = 32767;
      let data19: Short = 32767;
      expect(Long.toShort(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_47000
     * @tc.name      testNumericCastingConversions0470
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0470", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Long = 32768;
      let data20: Short = -32768;
      expect(Long.toShort(s20)).assertEqual(data20);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_47100
     * @tc.name      testNumericCastingConversions0471
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0471", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Long = 2147483646;
      let data21: Short = -2;
      expect(Long.toShort(s21)).assertEqual(data21);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_47200
     * @tc.name      testNumericCastingConversions0472
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0472", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Long = -2147483648;
      let data23: Short = 0;
      expect(Long.toShort(s23)).assertEqual(data23);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_47300
     * @tc.name      testNumericCastingConversions0473
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0473", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Long = 9223372036854775806;
      let data24: Short = -2;
      expect(Long.toShort(s24)).assertEqual(data24);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_47400
     * @tc.name      testNumericCastingConversions0474
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0474", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Long = 9223372036854775807;
      let data25: Short = -1;
      expect(Long.toShort(s25)).assertEqual(data25);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_47500
     * @tc.name      testNumericCastingConversions0475
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0475", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Long = -9223372036854775808;
      let data1: Int = 0;
      expect(Long.toInt(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_47600
     * @tc.name      testNumericCastingConversions0476
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0476", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Long = -9223372036854775807;
      let data2: Int = 1;
      expect(Long.toInt(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_47700
     * @tc.name      testNumericCastingConversions0477
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0477", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Long = 2147483647;
      let data3: Int = 2147483647;
      expect(Long.toInt(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_47800
     * @tc.name      testNumericCastingConversions0478
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0478", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Long = -2147483648;
      let data4: Int = -2147483648;
      expect(Long.toInt(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_47900
     * @tc.name      testNumericCastingConversions0479
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0479", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Long = -2147483647;
      let data5: Int = -2147483647;
      expect(Long.toInt(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_48000
     * @tc.name      testNumericCastingConversions0480
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0480", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Long = -32769;
      let data6: Int = -32769;
      expect(Long.toInt(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_48100
     * @tc.name      testNumericCastingConversions0481
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0481", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Double = -32768.0;
      let data12: Short = -32768;
      expect(Double.toShort(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_48200
     * @tc.name      testNumericCastingConversions0482
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0482", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Long = -32768;
      let data7: Int = -32768;
      expect(Long.toInt(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_48300
     * @tc.name      testNumericCastingConversions0483
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0483", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Long = -32767;
      let data8: Int = -32767;
      expect(Long.toInt(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_48400
     * @tc.name      testNumericCastingConversions0484
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0484", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Long = -129;
      let data9: Int = -129;
      expect(Long.toInt(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_48500
     * @tc.name      testNumericCastingConversions0485
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0485", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Long = -128;
      let data10: Int = -128;
      expect(Long.toInt(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_48600
     * @tc.name      testNumericCastingConversions0486
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0486", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Long = -127;
      let data11: Int = -127;
      expect(Long.toInt(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_48700
     * @tc.name      testNumericCastingConversions0487
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0487", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Long = -1;
      let data12: Int = -1;
      expect(Long.toInt(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_48800
     * @tc.name      testNumericCastingConversions0488
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0488", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Long = 0;
      let data13: Int = 0;
      expect(Long.toInt(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_48900
     * @tc.name      testNumericCastingConversions0489
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0489", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Long = 1;
      let data14: Int = 1;
      expect(Long.toInt(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_49000
     * @tc.name      testNumericCastingConversions0490
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0490", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Long = 126;
      let data15: Int = 126;
      expect(Long.toInt(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_49100
     * @tc.name      testNumericCastingConversions0491
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0491", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Long = 127;
      let data16: Int = 127;
      expect(Long.toInt(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_49200
     * @tc.name      testNumericCastingConversions0492
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0492", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Double = -32767.0;
      let data13: Short = -32767;
      expect(Double.toShort(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_49300
     * @tc.name      testNumericCastingConversions0493
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0493", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Long = 128;
      let data17: Int = 128;
      expect(Long.toInt(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_49400
     * @tc.name      testNumericCastingConversions0494
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0494", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Long = 32766;
      let data18: Int = 32766;
      expect(Long.toInt(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_49500
     * @tc.name      testNumericCastingConversions0495
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0495", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Long = 32767;
      let data19: Int = 32767;
      expect(Long.toInt(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_49600
     * @tc.name      testNumericCastingConversions0496
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0496", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Long = 32768;
      let data20: Int = 32768;
      expect(Long.toInt(s20)).assertEqual(data20);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_49700
     * @tc.name      testNumericCastingConversions0497
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0497", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Long = 2147483646;
      let data21: Int = 2147483646;
      expect(Long.toInt(s21)).assertEqual(data21);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_49800
     * @tc.name      testNumericCastingConversions0498
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0498", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Long = 2147483647;
      let data22: Int = 2147483647;
      expect(Long.toInt(s22)).assertEqual(data22);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_49900
     * @tc.name      testNumericCastingConversions0499
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0499", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Long = -2147483648;
      let data23: Int = -2147483648;
      expect(Long.toInt(s23)).assertEqual(data23);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_50000
     * @tc.name      testNumericCastingConversions0500
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Long = 9223372036854775806;
      let data24: Int = -2;
      expect(Long.toInt(s24)).assertEqual(data24);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_50100
     * @tc.name      testNumericCastingConversions0501
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0501", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Long = 9223372036854775807;
      let data25: Int = -1;
      expect(Long.toInt(s25)).assertEqual(data25);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_50200
     * @tc.name      testNumericCastingConversions0502
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0502", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Long = -9223372036854775808;
      let data1: Long = -9223372036854775808;
      expect(Long.toLong(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_50300
     * @tc.name      testNumericCastingConversions0503
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0503", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Double = -129.0;
      let data14: Short = -129;
      expect(Double.toShort(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_50400
     * @tc.name      testNumericCastingConversions0504
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0504", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Long = -9223372036854775807;
      let data2: Long = -9223372036854775807;
      expect(Long.toLong(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_50500
     * @tc.name      testNumericCastingConversions0505
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0505", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Long = 2147483647;
      let data3: Long = 2147483647;
      expect(Long.toLong(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_50600
     * @tc.name      testNumericCastingConversions0506
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0506", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Long = -2147483648;
      let data4: Long = -2147483648;
      expect(Long.toLong(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_50700
     * @tc.name      testNumericCastingConversions0507
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0507", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Long = -2147483647;
      let data5: Long = -2147483647;
      expect(Long.toLong(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_50800
     * @tc.name      testNumericCastingConversions0508
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0508", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Long = -32769;
      let data6: Long = -32769;
      expect(Long.toLong(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_50900
     * @tc.name      testNumericCastingConversions0509
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0509", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Long = -32768;
      let data7: Long = -32768;
      expect(Long.toLong(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_51000
     * @tc.name      testNumericCastingConversions0510
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0510", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Long = -32767;
      let data8: Long = -32767;
      expect(Long.toLong(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_51100
     * @tc.name      testNumericCastingConversions0511
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0511", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Long = -129;
      let data9: Long = -129;
      expect(Long.toLong(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_51200
     * @tc.name      testNumericCastingConversions0512
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0512", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Long = -128;
      let data10: Long = -128;
      expect(Long.toLong(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_51300
     * @tc.name      testNumericCastingConversions0513
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0513", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Long = -127;
      let data11: Long = -127;
      expect(Long.toLong(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_51400
     * @tc.name      testNumericCastingConversions0514
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0514", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Double = -128.0;
      let data15: Short = -128;
      expect(Double.toShort(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_51500
     * @tc.name      testNumericCastingConversions0515
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0515", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Long = -1;
      let data12: Long = -1;
      expect(Long.toLong(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_51600
     * @tc.name      testNumericCastingConversions0516
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0516", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Long = 0;
      let data13: Long = 0;
      expect(Long.toLong(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_51700
     * @tc.name      testNumericCastingConversions0517
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0517", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Long = 1;
      let data14: Long = 1;
      expect(Long.toLong(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_51800
     * @tc.name      testNumericCastingConversions0518
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0518", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Long = 126;
      let data15: Long = 126;
      expect(Long.toLong(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_51900
     * @tc.name      testNumericCastingConversions0519
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0519", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Long = 127;
      let data16: Long = 127;
      expect(Long.toLong(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_52000
     * @tc.name      testNumericCastingConversions0520
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0520", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Long = 128;
      let data17: Long = 128;
      expect(Long.toLong(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_52100
     * @tc.name      testNumericCastingConversions0521
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0521", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Long = 32766;
      let data18: Long = 32766;
      expect(Long.toLong(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_52200
     * @tc.name      testNumericCastingConversions0522
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0522", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Long = 32767;
      let data19: Long = 32767;
      expect(Long.toLong(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_52300
     * @tc.name      testNumericCastingConversions0523
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0523", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Long = 32768;
      let data20: Long = 32768;
      expect(Long.toLong(s20)).assertEqual(data20);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_52400
     * @tc.name      testNumericCastingConversions0524
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0524", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Long = 2147483646;
      let data21: Long = 2147483646;
      expect(Long.toLong(s21)).assertEqual(data21);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_52500
     * @tc.name      testNumericCastingConversions0525
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0525", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Double = -127.0;
      let data16: Short = -127;
      expect(Double.toShort(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_52600
     * @tc.name      testNumericCastingConversions0526
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0526", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Long = 2147483647;
      let data22: Long = 2147483647;
      expect(Long.toLong(s22)).assertEqual(data22);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_52700
     * @tc.name      testNumericCastingConversions0527
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0527", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Long = -2147483648;
      let data23: Long = -2147483648;
      expect(Long.toLong(s23)).assertEqual(data23);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_52800
     * @tc.name      testNumericCastingConversions0528
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0528", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Long = 9223372036854775806;
      let data24: Long = 9223372036854775806;
      expect(Long.toLong(s24)).assertEqual(data24);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_52900
     * @tc.name      testNumericCastingConversions0529
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0529", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Long = 9223372036854775807;
      let data25: Long = 9223372036854775807;
      expect(Long.toLong(s25)).assertEqual(data25);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_53000
     * @tc.name      testNumericCastingConversions0530
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0530", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Long = -9223372036854775808;
      let data1: Float = -9.223372E18f;
      expect(Long.toFloat(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_53100
     * @tc.name      testNumericCastingConversions0531
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0531", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Long = -9223372036854775807;
      let data2: Float = -9.223372E18f;
      expect(Long.toFloat(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_53200
     * @tc.name      testNumericCastingConversions0532
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0532", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Long = 2147483647;
      let data3: Float = 2.14748365E9f;
      expect(Long.toFloat(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_53300
     * @tc.name      testNumericCastingConversions0533
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0533", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Long = -2147483648;
      let data4: Float = -2.14748365E9f;
      expect(Long.toFloat(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_53400
     * @tc.name      testNumericCastingConversions0534
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0534", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Long = -2147483647;
      let data5: Float = -2.14748365E9f;
      expect(Long.toFloat(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_53500
     * @tc.name      testNumericCastingConversions0535
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0535", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Long = -32769;
      let data6: Float = -32769.0f;
      expect(Long.toFloat(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_53600
     * @tc.name      testNumericCastingConversions0536
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0536", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Double = -3.1415926;
      let data17: Short = -3;
      expect(Double.toShort(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_53700
     * @tc.name      testNumericCastingConversions0537
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0537", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Long = -32768;
      let data7: Float = -32768.0f;
      expect(Long.toFloat(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_53800
     * @tc.name      testNumericCastingConversions0538
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0538", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Long = -32767;
      let data8: Float = -32767.0f;
      expect(Long.toFloat(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_53900
     * @tc.name      testNumericCastingConversions0539
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0539", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Long = -129;
      let data9: Float = -129.0f;
      expect(Long.toFloat(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_54000
     * @tc.name      testNumericCastingConversions0540
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0540", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Long = -128;
      let data10: Float = -128.0f;
      expect(Long.toFloat(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_54100
     * @tc.name      testNumericCastingConversions0541
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0541", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Long = -127;
      let data11: Float = -127.0f;
      expect(Long.toFloat(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_54200
     * @tc.name      testNumericCastingConversions0542
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0542", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Long = -1;
      let data12: Float = -1.0f;
      expect(Long.toFloat(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_54300
     * @tc.name      testNumericCastingConversions0543
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0543", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Long = 0;
      let data13: Float = 0.0f;
      expect(Long.toFloat(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_54400
     * @tc.name      testNumericCastingConversions0544
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0544", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Long = 1;
      let data14: Float = 1.0f;
      expect(Long.toFloat(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_54500
     * @tc.name      testNumericCastingConversions0545
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0545", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Long = 126;
      let data15: Float = 126.0f;
      expect(Long.toFloat(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_54600
     * @tc.name      testNumericCastingConversions0546
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0546", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Long = 127;
      let data16: Float = 127.0f;
      expect(Long.toFloat(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_54700
     * @tc.name      testNumericCastingConversions0547
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0547", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -1.0;
      let data18: Short = -1;
      expect(Double.toShort(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_54800
     * @tc.name      testNumericCastingConversions0548
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0548", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Long = 128;
      let data17: Float = 128.0f;
      expect(Long.toFloat(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_54900
     * @tc.name      testNumericCastingConversions0549
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0549", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Long = 32766;
      let data18: Float = 32766.0f;
      expect(Long.toFloat(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_55000
     * @tc.name      testNumericCastingConversions0550
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0550", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Long = 32767;
      let data19: Float = 32767.0f;
      expect(Long.toFloat(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_55100
     * @tc.name      testNumericCastingConversions0551
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0551", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Long = 32768;
      let data20: Float = 32768.0f;
      expect(Long.toFloat(s20)).assertEqual(data20);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_55200
     * @tc.name      testNumericCastingConversions0552
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0552", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Long = 2147483646;
      let data21: Float = 2.14748365E9f;
      expect(Long.toFloat(s21)).assertEqual(data21);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_55300
     * @tc.name      testNumericCastingConversions0553
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0553", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Long = 2147483647;
      let data22: Float = 2.14748365E9f;
      expect(Long.toFloat(s22)).assertEqual(data22);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_55400
     * @tc.name      testNumericCastingConversions0554
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0554", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Long = -2147483648;
      let data23: Float = -2.14748365E9f;
      expect(Long.toFloat(s23)).assertEqual(data23);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_55500
     * @tc.name      testNumericCastingConversions0555
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0555", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Long = 9223372036854775806;
      let data24: Float = 9.223372E18f;
      expect(Long.toFloat(s24)).assertEqual(data24);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_55600
     * @tc.name      testNumericCastingConversions0556
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0556", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Long = 9223372036854775807;
      let data25: Float = 9.223372E18f;
      expect(Long.toFloat(s25)).assertEqual(data25);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_55700
     * @tc.name      testNumericCastingConversions0557
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0557", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Long = -9223372036854775808;
      let data1: Double = -9.223372036854776E18;
      expect(Long.toDouble(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_55800
     * @tc.name      testNumericCastingConversions0558
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0558", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -2.2250738585072014E-308;
      let data19: Short = 0;
      expect(Double.toShort(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_55900
     * @tc.name      testNumericCastingConversions0559
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0559", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Long = -9223372036854775807;
      let data2: Double = -9.223372036854776E18;
      expect(Long.toDouble(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_56000
     * @tc.name      testNumericCastingConversions0560
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0560", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Long = 2147483647;
      let data3: Double = 2.147483647E9;
      expect(Long.toDouble(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_56100
     * @tc.name      testNumericCastingConversions0561
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0561", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Long = -2147483648;
      let data4: Double = -2.147483648E9;
      expect(Long.toDouble(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_56200
     * @tc.name      testNumericCastingConversions0562
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0562", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Long = -2147483647;
      let data5: Double = -2.147483647E9;
      expect(Long.toDouble(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_56300
     * @tc.name      testNumericCastingConversions0563
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0563", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Long = -32769;
      let data6: Double = -32769.0;
      expect(Long.toDouble(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_56400
     * @tc.name      testNumericCastingConversions0564
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0564", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Long = -32768;
      let data7: Double = -32768.0;
      expect(Long.toDouble(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_56500
     * @tc.name      testNumericCastingConversions0565
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0565", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Long = -32767;
      let data8: Double = -32767.0;
      expect(Long.toDouble(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_56600
     * @tc.name      testNumericCastingConversions0566
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0566", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Long = -129;
      let data9: Double = -129.0;
      expect(Long.toDouble(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_56700
     * @tc.name      testNumericCastingConversions0567
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0567", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Long = -128;
      let data10: Double = -128.0;
      expect(Long.toDouble(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_56800
     * @tc.name      testNumericCastingConversions0568
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0568", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Long = -127;
      let data11: Double = -127.0;
      expect(Long.toDouble(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_56900
     * @tc.name      testNumericCastingConversions0569
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0569", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Double = -2.147483647E9;
      let data7: Byte = 1;
      expect(Double.toByte(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_57000
     * @tc.name      testNumericCastingConversions0570
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0570", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = -0.0;
      let data20: Short = 0;
      expect(Double.toShort(s20)).assertEqual(data20);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_57100
     * @tc.name      testNumericCastingConversions0571
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0571", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Long = -1;
      let data12: Double = -1.0;
      expect(Long.toDouble(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_57200
     * @tc.name      testNumericCastingConversions0572
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0572", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Long = 0;
      let data13: Double = 0.0;
      expect(Long.toDouble(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_57300
     * @tc.name      testNumericCastingConversions0573
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0573", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Long = 1;
      let data14: Double = 1.0;
      expect(Long.toDouble(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_57400
     * @tc.name      testNumericCastingConversions0574
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0574", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Long = 126;
      let data15: Double = 126.0;
      expect(Long.toDouble(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_57500
     * @tc.name      testNumericCastingConversions0575
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0575", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Long = 127;
      let data16: Double = 127.0;
      expect(Long.toDouble(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_57600
     * @tc.name      testNumericCastingConversions0576
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0576", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Long = 128;
      let data17: Double = 128.0;
      expect(Long.toDouble(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_57700
     * @tc.name      testNumericCastingConversions0577
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0577", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Long = 32766;
      let data18: Double = 32766.0;
      expect(Long.toDouble(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_57800
     * @tc.name      testNumericCastingConversions0578
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0578", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Long = 32767;
      let data19: Double = 32767.0;
      expect(Long.toDouble(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_57900
     * @tc.name      testNumericCastingConversions0579
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0579", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Long = 32768;
      let data20: Double = 32768.0;
      expect(Long.toDouble(s20)).assertEqual(data20);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_58000
     * @tc.name      testNumericCastingConversions0580
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0580", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Long = 2147483646;
      let data21: Double = 2.147483646E9;
      expect(Long.toDouble(s21)).assertEqual(data21);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_58100
     * @tc.name      testNumericCastingConversions0581
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0581", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 0.0;
      let data21: Short = 0;
      expect(Double.toShort(s21)).assertEqual(data21);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_58200
     * @tc.name      testNumericCastingConversions0582
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0582", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Long = 2147483647;
      let data22: Double = 2.147483647E9;
      expect(Long.toDouble(s22)).assertEqual(data22);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_58300
     * @tc.name      testNumericCastingConversions0583
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0583", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Long = -2147483648;
      let data23: Double = -2.147483648E9;
      expect(Long.toDouble(s23)).assertEqual(data23);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_58400
     * @tc.name      testNumericCastingConversions0584
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0584", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Long = 9223372036854775806;
      let data24: Double = 9.223372036854776E18;
      expect(Long.toDouble(s24)).assertEqual(data24);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_58500
     * @tc.name      testNumericCastingConversions0585
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0585", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Long = 9223372036854775807;
      let data25: Double = 9.223372036854776E18;
      expect(Long.toDouble(s25)).assertEqual(data25);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_58600
     * @tc.name      testNumericCastingConversions0586
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0586", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Long = -9223372036854775808;
      let data1: Char = c'\u0000';
      expect(Long.toChar(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_58700
     * @tc.name      testNumericCastingConversions0587
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0587", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Long = -9223372036854775807;
      let data2: Char = c'\u0001';
      expect(Long.toChar(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_58800
     * @tc.name      testNumericCastingConversions0588
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0588", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Long = 2147483647;
      let data3: Char = c'\uffff';
      expect(Long.toChar(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_58900
     * @tc.name      testNumericCastingConversions0589
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0589", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Long = -2147483648;
      let data4: Char = c'\u0000';
      expect(Long.toChar(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_59000
     * @tc.name      testNumericCastingConversions0590
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0590", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Long = -2147483647;
      let data5: Char = c'\u0001';
      expect(Long.toChar(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_59100
     * @tc.name      testNumericCastingConversions0591
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0591", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Long = -32769;
      let data6: Char = c'\u7fff';
      expect(Long.toChar(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_59200
     * @tc.name      testNumericCastingConversions0592
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0592", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 2.2250738585072014E-308;
      let data22: Short = 0;
      expect(Double.toShort(s22)).assertEqual(data22);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_59300
     * @tc.name      testNumericCastingConversions0593
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0593", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Long = -32768;
      let data7: Char = c'\u8000';
      expect(Long.toChar(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_59400
     * @tc.name      testNumericCastingConversions0594
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0594", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Long = -32767;
      let data8: Char = c'\u8001';
      expect(Long.toChar(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_59500
     * @tc.name      testNumericCastingConversions0595
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0595", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Long = -129;
      let data9: Char = c'\uff7f';
      expect(Long.toChar(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_59600
     * @tc.name      testNumericCastingConversions0596
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0596", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Long = -128;
      let data10: Char = c'\uff80';
      expect(Long.toChar(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_59700
     * @tc.name      testNumericCastingConversions0597
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0597", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Long = -127;
      let data11: Char = c'\uff81';
      expect(Long.toChar(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_59800
     * @tc.name      testNumericCastingConversions0598
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0598", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Long = -1;
      let data12: Char = c'\uffff';
      expect(Long.toChar(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_59900
     * @tc.name      testNumericCastingConversions0599
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0599", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Long = 0;
      let data13: Char = c'\u0000';
      expect(Long.toChar(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_60000
     * @tc.name      testNumericCastingConversions0600
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Long = 1;
      let data14: Char = c'\u0001';
      expect(Long.toChar(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_60100
     * @tc.name      testNumericCastingConversions0601
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0601", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Long = 126;
      let data15: Char = c'\u007e';
      expect(Long.toChar(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_60200
     * @tc.name      testNumericCastingConversions0602
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0602", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Long = 127;
      let data16: Char = c'\u007f';
      expect(Long.toChar(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_60300
     * @tc.name      testNumericCastingConversions0603
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0603", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 1.0;
      let data23: Short = 1;
      expect(Double.toShort(s23)).assertEqual(data23);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_60400
     * @tc.name      testNumericCastingConversions0604
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0604", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Long = 128;
      let data17: Char = c'\u0080';
      expect(Long.toChar(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_60500
     * @tc.name      testNumericCastingConversions0605
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0605", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Long = 32766;
      let data18: Char = c'\u7ffe';
      expect(Long.toChar(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_60600
     * @tc.name      testNumericCastingConversions0606
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0606", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Long = 32767;
      let data19: Char = c'\u7fff';
      expect(Long.toChar(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_60700
     * @tc.name      testNumericCastingConversions0607
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0607", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Long = 32768;
      let data20: Char = c'\u8000';
      expect(Long.toChar(s20)).assertEqual(data20);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_60800
     * @tc.name      testNumericCastingConversions0608
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0608", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Long = 2147483646;
      let data21: Char = c'\ufffe';
      expect(Long.toChar(s21)).assertEqual(data21);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_60900
     * @tc.name      testNumericCastingConversions0609
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0609", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Long = 2147483647;
      let data22: Char = c'\uffff';
      expect(Long.toChar(s22)).assertEqual(data22);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_61000
     * @tc.name      testNumericCastingConversions0610
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0610", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Long = -2147483648;
      let data23: Char = c'\u0000';
      expect(Long.toChar(s23)).assertEqual(data23);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_61100
     * @tc.name      testNumericCastingConversions0611
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0611", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Long = 9223372036854775806;
      let data24: Char = c'\ufffe';
      expect(Long.toChar(s24)).assertEqual(data24);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_61200
     * @tc.name      testNumericCastingConversions0612
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0612", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Long = 9223372036854775807;
      let data25: Char = c'\uffff';
      expect(Long.toChar(s25)).assertEqual(data25);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_61300
     * @tc.name      testNumericCastingConversions0613
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0613", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Int = -2147483648;
      let data1: Byte = 0;
      expect(Int.toByte(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_61400
     * @tc.name      testNumericCastingConversions0614
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0614", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 3.1415926;
      let data24: Short = 3;
      expect(Double.toShort(s24)).assertEqual(data24);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_61500
     * @tc.name      testNumericCastingConversions0615
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0615", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Int = -2147483647;
      let data2: Byte = 1;
      expect(Int.toByte(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_61600
     * @tc.name      testNumericCastingConversions0616
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0616", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Int = -32769;
      let data3: Byte = -1;
      expect(Int.toByte(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_61700
     * @tc.name      testNumericCastingConversions0617
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0617", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Int = -32768;
      let data4: Byte = 0;
      expect(Int.toByte(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_61800
     * @tc.name      testNumericCastingConversions0618
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0618", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Int = -32767;
      let data5: Byte = 1;
      expect(Int.toByte(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_61900
     * @tc.name      testNumericCastingConversions0619
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0619", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Int = -129;
      let data6: Byte = 127;
      expect(Int.toByte(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_62000
     * @tc.name      testNumericCastingConversions0620
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0620", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Int = -128;
      let data7: Byte = -128;
      expect(Int.toByte(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_62100
     * @tc.name      testNumericCastingConversions0621
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0621", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Int = -127;
      let data8: Byte = -127;
      expect(Int.toByte(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_62200
     * @tc.name      testNumericCastingConversions0622
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0622", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Int = -1;
      let data9: Byte = -1;
      expect(Int.toByte(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_62300
     * @tc.name      testNumericCastingConversions0623
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0623", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Int = 0;
      let data10: Byte = 0;
      expect(Int.toByte(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_62400
     * @tc.name      testNumericCastingConversions0624
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0624", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Int = 1;
      let data11: Byte = 1;
      expect(Int.toByte(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_62500
     * @tc.name      testNumericCastingConversions0625
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0625", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 126.0;
      let data25: Short = 126;
      expect(Double.toShort(s25)).assertEqual(data25);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_62600
     * @tc.name      testNumericCastingConversions0626
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0626", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Int = 126;
      let data12: Byte = 126;
      expect(Int.toByte(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_62700
     * @tc.name      testNumericCastingConversions0627
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0627", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Int = 127;
      let data13: Byte = 127;
      expect(Int.toByte(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_62800
     * @tc.name      testNumericCastingConversions0628
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0628", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Int = 128;
      let data14: Byte = -128;
      expect(Int.toByte(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_62900
     * @tc.name      testNumericCastingConversions0629
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0629", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Int = 32766;
      let data15: Byte = -2;
      expect(Int.toByte(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_63000
     * @tc.name      testNumericCastingConversions0630
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0630", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Int = 32767;
      let data16: Byte = -1;
      expect(Int.toByte(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_63100
     * @tc.name      testNumericCastingConversions0631
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0631", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Int = 32768;
      let data17: Byte = 0;
      expect(Int.toByte(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_63200
     * @tc.name      testNumericCastingConversions0632
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0632", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Int = 2147483646;
      let data18: Byte = -2;
      expect(Int.toByte(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_63300
     * @tc.name      testNumericCastingConversions0633
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0633", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Int = 2147483647;
      let data19: Byte = -1;
      expect(Int.toByte(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_63400
     * @tc.name      testNumericCastingConversions0634
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0634", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Int = -2147483648;
      let data1: Short = 0;
      expect(Int.toShort(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_63500
     * @tc.name      testNumericCastingConversions0635
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0635", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Int = -2147483647;
      let data2: Short = 1;
      expect(Int.toShort(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_63600
     * @tc.name      testNumericCastingConversions0636
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0636", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 127.0;
      let data26: Short = 127;
      expect(Double.toShort(s26)).assertEqual(data26);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_63700
     * @tc.name      testNumericCastingConversions0637
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0637", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Int = -32769;
      let data3: Short = 32767;
      expect(Int.toShort(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_63800
     * @tc.name      testNumericCastingConversions0638
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0638", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Int = -32768;
      let data4: Short = -32768;
      expect(Int.toShort(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_63900
     * @tc.name      testNumericCastingConversions0639
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0639", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Int = -32767;
      let data5: Short = -32767;
      expect(Int.toShort(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_64000
     * @tc.name      testNumericCastingConversions0640
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0640", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Int = -129;
      let data6: Short = -129;
      expect(Int.toShort(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_64100
     * @tc.name      testNumericCastingConversions0641
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0641", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Int = -128;
      let data7: Short = -128;
      expect(Int.toShort(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_64200
     * @tc.name      testNumericCastingConversions0642
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0642", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Int = -127;
      let data8: Short = -127;
      expect(Int.toShort(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_64300
     * @tc.name      testNumericCastingConversions0643
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0643", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Int = -1;
      let data9: Short = -1;
      expect(Int.toShort(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_64400
     * @tc.name      testNumericCastingConversions0644
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0644", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Int = 0;
      let data10: Short = 0;
      expect(Int.toShort(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_64500
     * @tc.name      testNumericCastingConversions0645
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0645", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Int = 1;
      let data11: Short = 1;
      expect(Int.toShort(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_64600
     * @tc.name      testNumericCastingConversions0646
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0646", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Int = 126;
      let data12: Short = 126;
      expect(Int.toShort(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_64700
     * @tc.name      testNumericCastingConversions0647
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0647", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 128.0;
      let data27: Short = 128;
      expect(Double.toShort(s27)).assertEqual(data27);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_64800
     * @tc.name      testNumericCastingConversions0648
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0648", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Int = 127;
      let data13: Short = 127;
      expect(Int.toShort(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_64900
     * @tc.name      testNumericCastingConversions0649
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0649", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Int = 128;
      let data14: Short = 128;
      expect(Int.toShort(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_65000
     * @tc.name      testNumericCastingConversions0650
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0650", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Int = 32766;
      let data15: Short = 32766;
      expect(Int.toShort(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_65100
     * @tc.name      testNumericCastingConversions0651
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0651", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Int = 32767;
      let data16: Short = 32767;
      expect(Int.toShort(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_65200
     * @tc.name      testNumericCastingConversions0652
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0652", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Int = 32768;
      let data17: Short = -32768;
      expect(Int.toShort(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_65300
     * @tc.name      testNumericCastingConversions0653
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0653", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Int = 2147483646;
      let data18: Short = -2;
      expect(Int.toShort(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_65400
     * @tc.name      testNumericCastingConversions0654
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0654", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Int = 2147483647;
      let data19: Short = -1;
      expect(Int.toShort(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_65500
     * @tc.name      testNumericCastingConversions0655
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0655", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Int = -2147483648;
      let data1: Int = -2147483648;
      expect(Int.toInt(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_65600
     * @tc.name      testNumericCastingConversions0656
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0656", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Int = -2147483647;
      let data2: Int = -2147483647;
      expect(Int.toInt(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_65700
     * @tc.name      testNumericCastingConversions0657
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0657", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Int = -32769;
      let data3: Int = -32769;
      expect(Int.toInt(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_65800
     * @tc.name      testNumericCastingConversions0658
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0658", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 32766.0;
      let data28: Short = 32766;
      expect(Double.toShort(s28)).assertEqual(data28);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_65900
     * @tc.name      testNumericCastingConversions0659
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0659", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Int = -32768;
      let data4: Int = -32768;
      expect(Int.toInt(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_66000
     * @tc.name      testNumericCastingConversions0660
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0660", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Int = -32767;
      let data5: Int = -32767;
      expect(Int.toInt(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_66100
     * @tc.name      testNumericCastingConversions0661
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0661", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Int = -129;
      let data6: Int = -129;
      expect(Int.toInt(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_66200
     * @tc.name      testNumericCastingConversions0662
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0662", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Int = -128;
      let data7: Int = -128;
      expect(Int.toInt(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_66300
     * @tc.name      testNumericCastingConversions0663
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0663", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Int = -127;
      let data8: Int = -127;
      expect(Int.toInt(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_66400
     * @tc.name      testNumericCastingConversions0664
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0664", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Int = -1;
      let data9: Int = -1;
      expect(Int.toInt(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_66500
     * @tc.name      testNumericCastingConversions0665
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0665", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Int = 0;
      let data10: Int = 0;
      expect(Int.toInt(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_66600
     * @tc.name      testNumericCastingConversions0666
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0666", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Int = 1;
      let data11: Int = 1;
      expect(Int.toInt(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_66700
     * @tc.name      testNumericCastingConversions0667
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0667", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Int = 126;
      let data12: Int = 126;
      expect(Int.toInt(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_66800
     * @tc.name      testNumericCastingConversions0668
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0668", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Int = 127;
      let data13: Int = 127;
      expect(Int.toInt(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_66900
     * @tc.name      testNumericCastingConversions0669
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0669", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32767.0;
      let data29: Short = 32767;
      expect(s29.toShort()).assertEqual(data29);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_67000
     * @tc.name      testNumericCastingConversions0670
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0670", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Int = 128;
      let data14: Int = 128;
      expect(Int.toInt(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_67100
     * @tc.name      testNumericCastingConversions0671
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0671", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Int = 32766;
      let data15: Int = 32766;
      expect(Int.toInt(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_67200
     * @tc.name      testNumericCastingConversions0672
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0672", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Int = 32767;
      let data16: Int = 32767;
      expect(Int.toInt(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_67300
     * @tc.name      testNumericCastingConversions0673
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0673", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Int = 32768;
      let data17: Int = 32768;
      expect(Int.toInt(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_67400
     * @tc.name      testNumericCastingConversions0674
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0674", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Int = 2147483646;
      let data18: Int = 2147483646;
      expect(Int.toInt(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_67500
     * @tc.name      testNumericCastingConversions0675
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0675", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Int = 2147483647;
      let data19: Int = 2147483647;
      expect(Int.toInt(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_67600
     * @tc.name      testNumericCastingConversions0676
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0676", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Int = -2147483648;
      let data1: Long = -2147483648;
      expect(Int.toLong(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_67700
     * @tc.name      testNumericCastingConversions0677
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0677", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Int = -2147483647;
      let data2: Long = -2147483647;
      expect(Int.toLong(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_67800
     * @tc.name      testNumericCastingConversions0678
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0678", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Int = -32769;
      let data3: Long = -32769;
      expect(Int.toLong(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_67900
     * @tc.name      testNumericCastingConversions0679
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0679", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Int = -32768;
      let data4: Long = -32768;
      expect(Int.toLong(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_68000
     * @tc.name      testNumericCastingConversions0680
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0680", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Double = -65537.0;
      let data8: Byte = -1;
      expect(s8.toByte()).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_68100
     * @tc.name      testNumericCastingConversions0681
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0681", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 32768.0;
      let data30: Short = -32768;
      expect(s30.toShort()).assertEqual(data30);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_68200
     * @tc.name      testNumericCastingConversions0682
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0682", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Int = -32767;
      let data5: Long = -32767;
      expect(Int.toLong(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_68300
     * @tc.name      testNumericCastingConversions0683
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0683", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Int = -129;
      let data6: Long = -129;
      expect(Int.toLong(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_68400
     * @tc.name      testNumericCastingConversions0684
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0684", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Int = -128;
      let data7: Long = -128;
      expect(Int.toLong(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_68500
     * @tc.name      testNumericCastingConversions0685
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0685", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Int = -127;
      let data8: Long = -127;
      expect(Int.toLong(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_68600
     * @tc.name      testNumericCastingConversions0686
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0686", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Int = -1;
      let data9: Long = -1;
      expect(Int.toLong(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_68700
     * @tc.name      testNumericCastingConversions0687
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0687", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Int = 0;
      let data10: Long = 0;
      expect(Int.toLong(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_68800
     * @tc.name      testNumericCastingConversions0688
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0688", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Int = 1;
      let data11: Long = 1;
      expect(Int.toLong(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_68900
     * @tc.name      testNumericCastingConversions0689
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0689", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Int = 126;
      let data12: Long = 126;
      expect(Int.toLong(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_69000
     * @tc.name      testNumericCastingConversions0690
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0690", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Int = 127;
      let data13: Long = 127;
      expect(Int.toLong(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_69100
     * @tc.name      testNumericCastingConversions0691
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0691", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Int = 128;
      let data14: Long = 128;
      expect(Int.toLong(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_69200
     * @tc.name      testNumericCastingConversions0692
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0692", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 65534.0;
      let data31: Short = -2;
      expect(s31.toShort()).assertEqual(data31);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_69300
     * @tc.name      testNumericCastingConversions0693
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0693", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Int = 32766;
      let data15: Long = 32766;
      expect(Int.toLong(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_69400
     * @tc.name      testNumericCastingConversions0694
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0694", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Int = 32767;
      let data16: Long = 32767;
      expect(Int.toLong(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_69500
     * @tc.name      testNumericCastingConversions0695
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0695", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Int = 32768;
      let data17: Long = 32768;
      expect(Int.toLong(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_69600
     * @tc.name      testNumericCastingConversions0696
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0696", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Int = 2147483646;
      let data18: Long = 2147483646;
      expect(Int.toLong(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_69700
     * @tc.name      testNumericCastingConversions0697
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0697", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Int = 2147483647;
      let data19: Long = 2147483647;
      expect(Int.toLong(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_69800
     * @tc.name      testNumericCastingConversions0698
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0698", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Int = -2147483648;
      let data1: Float = -2.14748365E9f;
      expect(Int.toFloat(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_69900
     * @tc.name      testNumericCastingConversions0699
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0699", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Int = -2147483647;
      let data2: Float = -2.14748365E9f;
      expect(Int.toFloat(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_70000
     * @tc.name      testNumericCastingConversions0700
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Int = -32769;
      let data3: Float = -32769.0f;
      expect(Int.toFloat(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_70100
     * @tc.name      testNumericCastingConversions0701
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0701", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Int = -32768;
      let data4: Float = -32768.0f;
      expect(Int.toFloat(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_70200
     * @tc.name      testNumericCastingConversions0702
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0702", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Int = -32767;
      let data5: Float = -32767.0f;
      expect(Int.toFloat(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_70300
     * @tc.name      testNumericCastingConversions0703
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0703", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65535.0;
      let data32: Short = -1;
      expect(s32.toShort()).assertEqual(data32);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_70400
     * @tc.name      testNumericCastingConversions0704
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0704", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Int = -129;
      let data6: Float = -129.0f;
      expect(Int.toFloat(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_70500
     * @tc.name      testNumericCastingConversions0705
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0705", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Int = -128;
      let data7: Float = -128.0f;
      expect(Int.toFloat(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_70600
     * @tc.name      testNumericCastingConversions0706
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0706", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Int = -127;
      let data8: Float = -127.0f;
      expect(Int.toFloat(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_70700
     * @tc.name      testNumericCastingConversions0707
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0707", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Int = -1;
      let data9: Float = -1.0f;
      expect(Int.toFloat(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_70800
     * @tc.name      testNumericCastingConversions0708
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0708", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Int = 0;
      let data10: Float = 0.0f;
      expect(Int.toFloat(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_70900
     * @tc.name      testNumericCastingConversions0709
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0709", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Int = 1;
      let data11: Float = 1.0f;
      expect(Int.toFloat(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_71000
     * @tc.name      testNumericCastingConversions0710
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0710", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Int = 126;
      let data12: Float = 126.0f;
      expect(Int.toFloat(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_71100
     * @tc.name      testNumericCastingConversions0711
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0711", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Int = 127;
      let data13: Float = 127.0f;
      expect(Int.toFloat(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_71200
     * @tc.name      testNumericCastingConversions0712
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0712", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Int = 128;
      let data14: Float = 128.0f;
      expect(Int.toFloat(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_71300
     * @tc.name      testNumericCastingConversions0713
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0713", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Int = 32766;
      let data15: Float = 32766.0f;
      expect(Int.toFloat(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_71400
     * @tc.name      testNumericCastingConversions0714
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0714", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Double = 65536.0;
      let data33: Short = 0;
      expect(s33.toShort()).assertEqual(data33);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_71500
     * @tc.name      testNumericCastingConversions0715
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0715", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Int = 32767;
      let data16: Float = 32767.0f;
      expect(Int.toFloat(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_71600
     * @tc.name      testNumericCastingConversions0716
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0716", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Int = 32768;
      let data17: Float = 32768.0f;
      expect(Int.toFloat(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_71700
     * @tc.name      testNumericCastingConversions0717
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0717", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Int = 2147483646;
      let data18: Float = 2.14748365E9f;
      expect(Int.toFloat(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_71800
     * @tc.name      testNumericCastingConversions0718
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0718", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Int = 2147483647;
      let data19: Float = 2.14748365E9f;
      expect(Int.toFloat(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_71900
     * @tc.name      testNumericCastingConversions0719
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0719", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Int = -2147483648;
      let data1: Double = -2.147483648E9;
      expect(Int.toDouble(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_72000
     * @tc.name      testNumericCastingConversions0720
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0720", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Int = -2147483647;
      let data2: Double = -2.147483647E9;
      expect(Int.toDouble(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_72100
     * @tc.name      testNumericCastingConversions0721
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0721", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Int = -32769;
      let data3: Double = -32769.0;
      expect(Int.toDouble(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_72200
     * @tc.name      testNumericCastingConversions0722
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0722", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Int = -32768;
      let data4: Double = -32768.0;
      expect(Int.toDouble(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_72300
     * @tc.name      testNumericCastingConversions0723
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0723", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Int = -32767;
      let data5: Double = -32767.0;
      expect(Int.toDouble(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_72400
     * @tc.name      testNumericCastingConversions0724
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0724", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Int = -129;
      let data6: Double = -129.0;
      expect(Int.toDouble(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_72500
     * @tc.name      testNumericCastingConversions0725
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0725", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Double = 2.147483646E9;
      let data34: Short = -2;
      expect(s34.toShort()).assertEqual(data34);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_72600
     * @tc.name      testNumericCastingConversions0726
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0726", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Int = -128;
      let data7: Double = -128.0;
      expect(Int.toDouble(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_72700
     * @tc.name      testNumericCastingConversions0727
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0727", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Int = -127;
      let data8: Double = -127.0;
      expect(Int.toDouble(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_72800
     * @tc.name      testNumericCastingConversions0728
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0728", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Int = -1;
      let data9: Double = -1.0;
      expect(Int.toDouble(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_72900
     * @tc.name      testNumericCastingConversions0729
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0729", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Int = 0;
      let data10: Double = 0.0;
      expect(Int.toDouble(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_73000
     * @tc.name      testNumericCastingConversions0730
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0730", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Int = 1;
      let data11: Double = 1.0;
      expect(Int.toDouble(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_73100
     * @tc.name      testNumericCastingConversions0731
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0731", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Int = 126;
      let data12: Double = 126.0;
      expect(Int.toDouble(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_73200
     * @tc.name      testNumericCastingConversions0732
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0732", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Int = 127;
      let data13: Double = 127.0;
      expect(Int.toDouble(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_73300
     * @tc.name      testNumericCastingConversions0733
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0733", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Int = 128;
      let data14: Double = 128.0;
      expect(Int.toDouble(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_73400
     * @tc.name      testNumericCastingConversions0734
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0734", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Int = 32766;
      let data15: Double = 32766.0;
      expect(Int.toDouble(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_73500
     * @tc.name      testNumericCastingConversions0735
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0735", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Int = 32767;
      let data16: Double = 32767.0;
      expect(Int.toDouble(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_73600
     * @tc.name      testNumericCastingConversions0736
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0736", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Double = 2.147483647E9;
      let data35: Short = -1;
      expect(s35.toShort()).assertEqual(data35);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_73700
     * @tc.name      testNumericCastingConversions0737
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0737", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Int = 32768;
      let data17: Double = 32768.0;
      expect(Int.toDouble(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_73800
     * @tc.name      testNumericCastingConversions0738
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0738", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Int = 2147483646;
      let data18: Double = 2.147483646E9;
      expect(Int.toDouble(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_73900
     * @tc.name      testNumericCastingConversions0739
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0739", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Int = 2147483647;
      let data19: Double = 2.147483647E9;
      expect(Int.toDouble(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_74000
     * @tc.name      testNumericCastingConversions0740
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0740", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Int = -2147483648;
      let data1: Char = c'\u0000';
      expect(Int.toChar(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_74100
     * @tc.name      testNumericCastingConversions0741
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0741", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Int = -2147483647;
      let data2: Char = c'\u0001';
      expect(Int.toChar(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_74200
     * @tc.name      testNumericCastingConversions0742
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0742", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Int = -32769;
      let data3: Char = c'\u7fff';
      expect(Int.toChar(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_74300
     * @tc.name      testNumericCastingConversions0743
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0743", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Int = -32768;
      let data4: Char = c'\u8000';
      expect(Int.toChar(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_74400
     * @tc.name      testNumericCastingConversions0744
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0744", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Int = -32767;
      let data5: Char = c'\u8001';
      expect(Int.toChar(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_74500
     * @tc.name      testNumericCastingConversions0745
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0745", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Int = -129;
      let data6: Char = c'\uff7f';
      expect(Int.toChar(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_74600
     * @tc.name      testNumericCastingConversions0746
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0746", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Int = -128;
      let data7: Char = c'\uff80';
      expect(Int.toChar(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_74700
     * @tc.name      testNumericCastingConversions0747
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0747", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Double = 9.223372036854776E18;
      let data36: Short = -1;
      expect(s36.toShort()).assertEqual(data36);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_74800
     * @tc.name      testNumericCastingConversions0748
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0748", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Int = -127;
      let data8: Char = c'\uff81';
      expect(Int.toChar(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_74900
     * @tc.name      testNumericCastingConversions0749
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0749", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Int = -1;
      let data9: Char = c'\uffff';
      expect(Int.toChar(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_75000
     * @tc.name      testNumericCastingConversions0750
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0750", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Int = 0;
      let data10: Char = c'\u0000';
      expect(Int.toChar(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_75100
     * @tc.name      testNumericCastingConversions0751
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0751", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Int = 1;
      let data11: Char = c'\u0001';
      expect(Int.toChar(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_75200
     * @tc.name      testNumericCastingConversions0752
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0752", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Int = 126;
      let data12: Char = c'\u007e';
      expect(Int.toChar(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_75300
     * @tc.name      testNumericCastingConversions0753
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0753", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Int = 127;
      let data13: Char = c'\u007f';
      expect(Int.toChar(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_75400
     * @tc.name      testNumericCastingConversions0754
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0754", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Int = 128;
      let data14: Char = c'\u0080';
      expect(Int.toChar(s14)).assertEqual(data14);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_75500
     * @tc.name      testNumericCastingConversions0755
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0755", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Int = 32766;
      let data15: Char = c'\u7ffe';
      expect(Int.toChar(s15)).assertEqual(data15);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_75600
     * @tc.name      testNumericCastingConversions0756
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0756", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Int = 32767;
      let data16: Char = c'\u7fff';
      expect(Int.toChar(s16)).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_75700
     * @tc.name      testNumericCastingConversions0757
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0757", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Int = 32768;
      let data17: Char = c'\u8000';
      expect(Int.toChar(s17)).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_75800
     * @tc.name      testNumericCastingConversions0758
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0758", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Double = 3.4028234663852886E38;
      let data37: Short = -1;
      expect(s37.toShort()).assertEqual(data37);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_75900
     * @tc.name      testNumericCastingConversions0759
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0759", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Int = 2147483646;
      let data18: Char = c'\ufffe';
      expect(Int.toChar(s18)).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_76000
     * @tc.name      testNumericCastingConversions0760
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0760", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Int = 2147483647;
      let data19: Char = c'\uffff';
      expect(Int.toChar(s19)).assertEqual(data19);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_76100
     * @tc.name      testNumericCastingConversions0761
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0761", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Short = -32768;
      let data1: Byte = 0;
      expect(Short.toByte(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_76200
     * @tc.name      testNumericCastingConversions0762
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0762", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Short = -32767;
      let data2: Byte = 1;
      expect(Short.toByte(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_76300
     * @tc.name      testNumericCastingConversions0763
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0763", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Short = -129;
      let data3: Byte = 127;
      expect(Short.toByte(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_76400
     * @tc.name      testNumericCastingConversions0764
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0764", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Short = -128;
      let data4: Byte = -128;
      expect(Short.toByte(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_76500
     * @tc.name      testNumericCastingConversions0765
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0765", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Short = -127;
      let data5: Byte = -127;
      expect(Short.toByte(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_76600
     * @tc.name      testNumericCastingConversions0766
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0766", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Short = -1;
      let data6: Byte = -1;
      expect(Short.toByte(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_76700
     * @tc.name      testNumericCastingConversions0767
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0767", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Short = 0;
      let data7: Byte = 0;
      expect(Short.toByte(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_76800
     * @tc.name      testNumericCastingConversions0768
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0768", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Short = 1;
      let data8: Byte = 1;
      expect(Short.toByte(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_76900
     * @tc.name      testNumericCastingConversions0769
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0769", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s38: Double = 1.7976931348623157E308;
      let data38: Short = -1;
      expect(s38.toShort()).assertEqual(data38);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_77000
     * @tc.name      testNumericCastingConversions0770
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0770", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Short = 126;
      let data9: Byte = 126;
      expect(Short.toByte(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_77100
     * @tc.name      testNumericCastingConversions0771
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0771", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Short = 127;
      let data10: Byte = 127;
      expect(Short.toByte(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_77200
     * @tc.name      testNumericCastingConversions0772
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0772", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Short = 128;
      let data11: Byte = -128;
      expect(Short.toByte(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_77300
     * @tc.name      testNumericCastingConversions0773
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0773", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Short = 32766;
      let data12: Byte = -2;
      expect(Short.toByte(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_77400
     * @tc.name      testNumericCastingConversions0774
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0774", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Short = 32767;
      let data13: Byte = -1;
      expect(Short.toByte(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_77500
     * @tc.name      testNumericCastingConversions0775
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0775", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Short = -32768;
      let data1: Short = -32768;
      expect(Short.toShort(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_77600
     * @tc.name      testNumericCastingConversions0776
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0776", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Short = -32767;
      let data2: Short = -32767;
      expect(Short.toShort(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_77700
     * @tc.name      testNumericCastingConversions0777
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0777", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Short = -129;
      let data3: Short = -129;
      expect(Short.toShort(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_77800
     * @tc.name      testNumericCastingConversions0778
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0778", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Short = -128;
      let data4: Short = -128;
      expect(Short.toShort(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_77900
     * @tc.name      testNumericCastingConversions0779
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0779", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Short = -127;
      let data5: Short = -127;
      expect(Short.toShort(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_78000
     * @tc.name      testNumericCastingConversions0780
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0780", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s39: Double = Double.POSITIVE_INFINITY;
      let data39: Short = -1;
      expect(s39.toShort()).assertEqual(data39);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_78100
     * @tc.name      testNumericCastingConversions0781
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0781", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Short = -1;
      let data6: Short = -1;
      expect(Short.toShort(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_78200
     * @tc.name      testNumericCastingConversions0782
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0782", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Short = 0;
      let data7: Short = 0;
      expect(Short.toShort(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_78300
     * @tc.name      testNumericCastingConversions0783
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0783", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Short = 1;
      let data8: Short = 1;
      expect(Short.toShort(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_78400
     * @tc.name      testNumericCastingConversions0784
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0784", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Short = 126;
      let data9: Short = 126;
      expect(Short.toShort(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_78500
     * @tc.name      testNumericCastingConversions0785
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0785", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Short = 127;
      let data10: Short = 127;
      expect(Short.toShort(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_78600
     * @tc.name      testNumericCastingConversions0786
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0786", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Short = 128;
      let data11: Short = 128;
      expect(Short.toShort(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_78700
     * @tc.name      testNumericCastingConversions0787
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0787", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Short = 32766;
      let data12: Short = 32766;
      expect(Short.toShort(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_78800
     * @tc.name      testNumericCastingConversions0788
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0788", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Short = 32767;
      let data13: Short = 32767;
      expect(Short.toShort(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_78900
     * @tc.name      testNumericCastingConversions0789
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0789", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Short = -32768;
      let data1: Int = -32768;
      expect(Short.toInt(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_79000
     * @tc.name      testNumericCastingConversions0790
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0790", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Short = -32767;
      let data2: Int = -32767;
      expect(Short.toInt(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_79100
     * @tc.name      testNumericCastingConversions0791
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0791", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Double = -65536.0;
      let data9: Byte = 0;
      expect(s9.toByte()).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_79200
     * @tc.name      testNumericCastingConversions0792
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0792", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = -4.9E-308;
      let data1: Short = 0;
      expect(s1.toShort()).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_79300
     * @tc.name      testNumericCastingConversions0793
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0793", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Short = -129;
      let data3: Int = -129;
      expect(Short.toInt(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_79400
     * @tc.name      testNumericCastingConversions0794
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0794", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Short = -128;
      let data4: Int = -128;
      expect(Short.toInt(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_79500
     * @tc.name      testNumericCastingConversions0795
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0795", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Short = -127;
      let data5: Int = -127;
      expect(Short.toInt(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_79600
     * @tc.name      testNumericCastingConversions0796
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0796", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Short = -1;
      let data6: Int = -1;
      expect(Short.toInt(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_79700
     * @tc.name      testNumericCastingConversions0797
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0797", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Short = 0;
      let data7: Int = 0;
      expect(Short.toInt(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_79800
     * @tc.name      testNumericCastingConversions0798
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0798", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Short = 1;
      let data8: Int = 1;
      expect(Short.toInt(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_79900
     * @tc.name      testNumericCastingConversions0799
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0799", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Short = 126;
      let data9: Int = 126;
      expect(Short.toInt(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_80000
     * @tc.name      testNumericCastingConversions0800
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Short = 127;
      let data10: Int = 127;
      expect(Short.toInt(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_80100
     * @tc.name      testNumericCastingConversions0801
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0801", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Short = 128;
      let data11: Int = 128;
      expect(Short.toInt(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_80200
     * @tc.name      testNumericCastingConversions0802
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0802", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Short = 32766;
      let data12: Int = 32766;
      expect(Short.toInt(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_80300
     * @tc.name      testNumericCastingConversions0803
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0803", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = 4.9E-308;
      let data1: Short = 0;
      expect(s1.toShort()).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_80400
     * @tc.name      testNumericCastingConversions0804
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0804", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Short = 32767;
      let data13: Int = 32767;
      expect(Short.toInt(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_80500
     * @tc.name      testNumericCastingConversions0805
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0805", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Short = -32768;
      let data1: Long = -32768;
      expect(Short.toLong(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_80600
     * @tc.name      testNumericCastingConversions0806
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0806", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Short = -32767;
      let data2: Long = -32767;
      expect(Short.toLong(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_80700
     * @tc.name      testNumericCastingConversions0807
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0807", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Short = -129;
      let data3: Long = -129;
      expect(Short.toLong(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_80800
     * @tc.name      testNumericCastingConversions0808
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0808", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Short = -128;
      let data4: Long = -128;
      expect(Short.toLong(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_80900
     * @tc.name      testNumericCastingConversions0809
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0809", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Short = -127;
      let data5: Long = -127;
      expect(Short.toLong(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_81000
     * @tc.name      testNumericCastingConversions0810
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0810", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Short = -1;
      let data6: Long = -1;
      expect(Short.toLong(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_81100
     * @tc.name      testNumericCastingConversions0811
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0811", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Short = 0;
      let data7: Long = 0;
      expect(Short.toLong(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_81200
     * @tc.name      testNumericCastingConversions0812
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0812", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Short = 1;
      let data8: Long = 1;
      expect(Short.toLong(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_81300
     * @tc.name      testNumericCastingConversions0813
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0813", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Short = 126;
      let data9: Long = 126;
      expect(Short.toLong(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_81400
     * @tc.name      testNumericCastingConversions0814
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0814", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = Double.NaN;
      let data1: Int = 0;
      expect(s1.toInt()).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_81500
     * @tc.name      testNumericCastingConversions0815
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0815", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Short = 127;
      let data10: Long = 127;
      expect(Short.toLong(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_81600
     * @tc.name      testNumericCastingConversions0816
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0816", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Short = 128;
      let data11: Long = 128;
      expect(Short.toLong(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_81700
     * @tc.name      testNumericCastingConversions0817
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0817", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Short = 32766;
      let data12: Long = 32766;
      expect(Short.toLong(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_81800
     * @tc.name      testNumericCastingConversions0818
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0818", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Short = 32767;
      let data13: Long = 32767;
      expect(Short.toLong(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_81900
     * @tc.name      testNumericCastingConversions0819
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0819", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Short = -32768;
      let data1: Float = -32768.0f;
      expect(Short.toFloat(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_82000
     * @tc.name      testNumericCastingConversions0820
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0820", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Short = -32767;
      let data2: Float = -32767.0f;
      expect(Short.toFloat(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_82100
     * @tc.name      testNumericCastingConversions0821
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0821", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Short = -129;
      let data3: Float = -129.0f;
      expect(Short.toFloat(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_82200
     * @tc.name      testNumericCastingConversions0822
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0822", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Short = -128;
      let data4: Float = -128.0f;
      expect(Short.toFloat(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_82300
     * @tc.name      testNumericCastingConversions0823
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0823", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Short = -127;
      let data5: Float = -127.0f;
      expect(Short.toFloat(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_82400
     * @tc.name      testNumericCastingConversions0824
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0824", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Short = -1;
      let data6: Float = -1.0f;
      expect(Short.toFloat(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_82500
     * @tc.name      testNumericCastingConversions0825
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0825", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Double = Double.NEGATIVE_INFINITY;
      let data2: Int = -2147483648;
      expect(s2.toInt()).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_82600
     * @tc.name      testNumericCastingConversions0826
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0826", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Short = 0;
      let data7: Float = 0.0f;
      expect(Short.toFloat(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_82700
     * @tc.name      testNumericCastingConversions0827
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0827", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Short = 1;
      let data8: Float = 1.0f;
      expect(Short.toFloat(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_82800
     * @tc.name      testNumericCastingConversions0828
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0828", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Short = 126;
      let data9: Float = 126.0f;
      expect(Short.toFloat(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_82900
     * @tc.name      testNumericCastingConversions0829
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0829", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Short = 127;
      let data10: Float = 127.0f;
      expect(Short.toFloat(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_83000
     * @tc.name      testNumericCastingConversions0830
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0830", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Short = 128;
      let data11: Float = 128.0f;
      expect(Short.toFloat(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_83100
     * @tc.name      testNumericCastingConversions0831
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0831", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Short = 32766;
      let data12: Float = 32766.0f;
      expect(Short.toFloat(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_83200
     * @tc.name      testNumericCastingConversions0832
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0832", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Short = 32767;
      let data13: Float = 32767.0f;
      expect(Short.toFloat(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_83300
     * @tc.name      testNumericCastingConversions0833
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0833", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Short = -32768;
      let data1: Double = -32768.0;
      expect(Short.toDouble(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_83400
     * @tc.name      testNumericCastingConversions0834
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0834", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Short = -32767;
      let data2: Double = -32767.0;
      expect(Short.toDouble(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_83500
     * @tc.name      testNumericCastingConversions0835
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0835", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Short = -129;
      let data3: Double = -129.0;
      expect(Short.toDouble(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_83600
     * @tc.name      testNumericCastingConversions0836
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0836", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Double = -1.7976931348623157E308;
      let data3: Int = -2147483648;
      expect(s3.toInt()).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_83700
     * @tc.name      testNumericCastingConversions0837
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0837", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Short = -128;
      let data4: Double = -128.0;
      expect(Short.toDouble(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_83800
     * @tc.name      testNumericCastingConversions0838
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0838", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Short = -127;
      let data5: Double = -127.0;
      expect(Short.toDouble(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_83900
     * @tc.name      testNumericCastingConversions0839
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0839", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Short = -1;
      let data6: Double = -1.0;
      expect(Short.toDouble(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_84000
     * @tc.name      testNumericCastingConversions0840
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0840", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Short = 0;
      let data7: Double = 0.0;
      expect(Short.toDouble(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_84100
     * @tc.name      testNumericCastingConversions0841
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0841", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Short = 1;
      let data8: Double = 1.0;
      expect(Short.toDouble(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_84200
     * @tc.name      testNumericCastingConversions0842
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0842", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Short = 126;
      let data9: Double = 126.0;
      expect(Short.toDouble(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_84300
     * @tc.name      testNumericCastingConversions0843
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0843", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Short = 127;
      let data10: Double = 127.0;
      expect(Short.toDouble(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_84400
     * @tc.name      testNumericCastingConversions0844
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0844", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Short = 128;
      let data11: Double = 128.0;
      expect(Short.toDouble(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_84500
     * @tc.name      testNumericCastingConversions0845
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0845", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Short = 32766;
      let data12: Double = 32766.0;
      expect(Short.toDouble(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_84600
     * @tc.name      testNumericCastingConversions0846
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0846", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Short = 32767;
      let data13: Double = 32767.0;
      expect(Short.toDouble(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_84700
     * @tc.name      testNumericCastingConversions0847
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0847", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Double = -3.4028234663852886E38;
      let data4: Int = -2147483648;
      expect(s4.toInt()).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_84800
     * @tc.name      testNumericCastingConversions0848
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0848", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Short = -32768;
      let data1: Char = c'\u8000';
      expect(Short.toChar(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_84900
     * @tc.name      testNumericCastingConversions0849
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0849", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Short = -32767;
      let data2: Char = c'\u8001';
      expect(Short.toChar(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_85000
     * @tc.name      testNumericCastingConversions0850
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0850", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Short = -129;
      let data3: Char = c'\uff7f';
      expect(Short.toChar(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_85100
     * @tc.name      testNumericCastingConversions0851
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0851", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Short = -128;
      let data4: Char = c'\uff80';
      expect(Short.toChar(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_85200
     * @tc.name      testNumericCastingConversions0852
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0852", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Short = -127;
      let data5: Char = c'\uff81';
      expect(Short.toChar(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_85300
     * @tc.name      testNumericCastingConversions0853
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0853", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Short = -1;
      let data6: Char = c'\uffff';
      expect(Short.toChar(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_85400
     * @tc.name      testNumericCastingConversions0854
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0854", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Short = 0;
      let data7: Char = c'\u0000';
      expect(Short.toChar(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_85500
     * @tc.name      testNumericCastingConversions0855
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0855", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Short = 1;
      let data8: Char = c'\u0001';
      expect(Short.toChar(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_85600
     * @tc.name      testNumericCastingConversions0856
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0856", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Short = 126;
      let data9: Char = c'\u007e';
      expect(Short.toChar(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_85700
     * @tc.name      testNumericCastingConversions0857
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0857", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Short = 127;
      let data10: Char = c'\u007f';
      expect(Short.toChar(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_85800
     * @tc.name      testNumericCastingConversions0858
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0858", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Double = -9.223372036854776E18;
      let data5: Int = -2147483648;
      expect(s5.toInt()).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_85900
     * @tc.name      testNumericCastingConversions0859
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0859", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Short = 128;
      let data11: Char = c'\u0080';
      expect(Short.toChar(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_86000
     * @tc.name      testNumericCastingConversions0860
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0860", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Short = 32766;
      let data12: Char = c'\u7ffe';
      expect(Short.toChar(s12)).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_86100
     * @tc.name      testNumericCastingConversions0861
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0861", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Short = 32767;
      let data13: Char = c'\u7fff';
      expect(Short.toChar(s13)).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_86200
     * @tc.name      testNumericCastingConversions0862
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0862", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Byte = -128;
      let data1: Byte = -128;
      expect(Byte.toByte(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_86300
     * @tc.name      testNumericCastingConversions0863
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0863", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Byte = -127;
      let data2: Byte = -127;
      expect(Byte.toByte(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_86400
     * @tc.name      testNumericCastingConversions0864
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0864", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Byte = -1;
      let data3: Byte = -1;
      expect(Byte.toByte(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_86500
     * @tc.name      testNumericCastingConversions0865
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0865", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Byte = 0;
      let data4: Byte = 0;
      expect(Byte.toByte(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_86600
     * @tc.name      testNumericCastingConversions0866
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0866", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Byte = 1;
      let data5: Byte = 1;
      expect(Byte.toByte(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_86700
     * @tc.name      testNumericCastingConversions0867
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0867", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Byte = 126;
      let data6: Byte = 126;
      expect(Byte.toByte(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_86800
     * @tc.name      testNumericCastingConversions0868
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0868", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Byte = 127;
      let data7: Byte = 127;
      expect(Byte.toByte(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_86900
     * @tc.name      testNumericCastingConversions0869
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0869", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Double = -2.147483648E9;
      let data6: Int = -2147483648;
      expect(s6.toInt()).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_87000
     * @tc.name      testNumericCastingConversions0870
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0870", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Byte = -128;
      let data1: Short = -128;
      expect(Byte.toShort(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_87100
     * @tc.name      testNumericCastingConversions0871
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0871", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Byte = -127;
      let data2: Short = -127;
      expect(Byte.toShort(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_87200
     * @tc.name      testNumericCastingConversions0872
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0872", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Byte = -1;
      let data3: Short = -1;
      expect(Byte.toShort(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_87300
     * @tc.name      testNumericCastingConversions0873
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0873", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Byte = 0;
      let data4: Short = 0;
      expect(Byte.toShort(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_87400
     * @tc.name      testNumericCastingConversions0874
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0874", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Byte = 1;
      let data5: Short = 1;
      expect(Byte.toShort(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_87500
     * @tc.name      testNumericCastingConversions0875
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0875", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Byte = 126;
      let data6: Short = 126;
      expect(Byte.toShort(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_87600
     * @tc.name      testNumericCastingConversions0876
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0876", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Byte = 127;
      let data7: Short = 127;
      expect(Byte.toShort(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_87700
     * @tc.name      testNumericCastingConversions0877
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0877", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Byte = -128;
      let data1: Int = -128;
      expect(Byte.toInt(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_87800
     * @tc.name      testNumericCastingConversions0878
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0878", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Byte = -127;
      let data2: Int = -127;
      expect(Byte.toInt(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_87900
     * @tc.name      testNumericCastingConversions0879
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0879", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Byte = -1;
      let data3: Int = -1;
      expect(Byte.toInt(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_88000
     * @tc.name      testNumericCastingConversions0880
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0880", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Double = -2.147483647E9;
      let data7: Int = -2147483647;
      expect(s7.toInt()).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_88100
     * @tc.name      testNumericCastingConversions0881
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0881", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Byte = 0;
      let data4: Int = 0;
      expect(Byte.toInt(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_88200
     * @tc.name      testNumericCastingConversions0882
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0882", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Byte = 1;
      let data5: Int = 1;
      expect(Byte.toInt(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_88300
     * @tc.name      testNumericCastingConversions0883
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0883", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Byte = 126;
      let data6: Int = 126;
      expect(Byte.toInt(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_88400
     * @tc.name      testNumericCastingConversions0884
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0884", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Byte = 127;
      let data7: Int = 127;
      expect(Byte.toInt(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_88500
     * @tc.name      testNumericCastingConversions0885
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0885", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Byte = -128;
      let data1: Long = -128;
      expect(Byte.toLong(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_88600
     * @tc.name      testNumericCastingConversions0886
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0886", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Byte = -127;
      let data2: Long = -127;
      expect(Byte.toLong(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_88700
     * @tc.name      testNumericCastingConversions0887
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0887", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Byte = -1;
      let data3: Long = -1;
      expect(Byte.toLong(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_88800
     * @tc.name      testNumericCastingConversions0888
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0888", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Byte = 0;
      let data4: Long = 0;
      expect(Byte.toLong(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_88900
     * @tc.name      testNumericCastingConversions0889
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0889", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Byte = 1;
      let data5: Long = 1;
      expect(Byte.toLong(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_89000
     * @tc.name      testNumericCastingConversions0890
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0890", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Byte = 126;
      let data6: Long = 126;
      expect(Byte.toLong(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_89100
     * @tc.name      testNumericCastingConversions0891
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0891", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Double = -65537.0;
      let data8: Int = -65537;
      expect(s8.toInt()).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_89200
     * @tc.name      testNumericCastingConversions0892
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0892", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Byte = 127;
      let data7: Long = 127;
      expect(Byte.toLong(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_89300
     * @tc.name      testNumericCastingConversions0893
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0893", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Byte = -128;
      let data1: Float = -128.0f;
      expect(Byte.toFloat(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_89400
     * @tc.name      testNumericCastingConversions0894
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0894", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Byte = -127;
      let data2: Float = -127.0f;
      expect(Byte.toFloat(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_89500
     * @tc.name      testNumericCastingConversions0895
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0895", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Byte = -1;
      let data3: Float = -1.0f;
      expect(Byte.toFloat(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_89600
     * @tc.name      testNumericCastingConversions0896
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0896", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Byte = 0;
      let data4: Float = 0.0f;
      expect(Byte.toFloat(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_89700
     * @tc.name      testNumericCastingConversions0897
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0897", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Byte = 1;
      let data5: Float = 1.0f;
      expect(Byte.toFloat(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_89800
     * @tc.name      testNumericCastingConversions0898
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0898", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Byte = 126;
      let data6: Float = 126.0f;
      expect(Byte.toFloat(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_89900
     * @tc.name      testNumericCastingConversions0899
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0899", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Byte = 127;
      let data7: Float = 127.0f;
      expect(Byte.toFloat(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_90000
     * @tc.name      testNumericCastingConversions0900
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Byte = -128;
      let data1: Double = -128.0;
      expect(Byte.toDouble(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_90100
     * @tc.name      testNumericCastingConversions0901
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0901", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Byte = -127;
      let data2: Double = -127.0;
      expect(Byte.toDouble(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_90200
     * @tc.name      testNumericCastingConversions0902
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0902", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Double = -65535.0;
      let data10: Byte = 1;
      expect(s10.toByte()).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_90300
     * @tc.name      testNumericCastingConversions0903
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0903", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Double = -65536.0;
      let data9: Int = -65536;
      expect(s9.toInt()).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_90400
     * @tc.name      testNumericCastingConversions0904
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0904", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Byte = -1;
      let data3: Double = -1.0;
      expect(Byte.toDouble(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_90500
     * @tc.name      testNumericCastingConversions0905
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0905", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Byte = 0;
      let data4: Double = 0.0;
      expect(Byte.toDouble(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_90600
     * @tc.name      testNumericCastingConversions0906
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0906", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Byte = 1;
      let data5: Double = 1.0;
      expect(Byte.toDouble(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_90700
     * @tc.name      testNumericCastingConversions0907
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0907", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Byte = 126;
      let data6: Double = 126.0;
      expect(Byte.toDouble(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_90800
     * @tc.name      testNumericCastingConversions0908
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0908", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Byte = 127;
      let data7: Double = 127.0;
      expect(Byte.toDouble(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_90900
     * @tc.name      testNumericCastingConversions0909
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0909", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Byte = -128;
      let data1: Char = c'\uff80';
      expect(Byte.toChar(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_91000
     * @tc.name      testNumericCastingConversions0910
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0910", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Byte = -127;
      let data2: Char = c'\uff81';
      expect(Byte.toChar(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_91100
     * @tc.name      testNumericCastingConversions0911
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0911", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Byte = -1;
      let data3: Char = c'\uffff';
      expect(Byte.toChar(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_91200
     * @tc.name      testNumericCastingConversions0912
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0912", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Byte = 0;
      let data4: Char = c'\u0000';
      expect(Byte.toChar(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_91300
     * @tc.name      testNumericCastingConversions0913
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0913", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Byte = 1;
      let data5: Char = c'\u0001';
      expect(Byte.toChar(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_91400
     * @tc.name      testNumericCastingConversions0914
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0914", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Double = -65535.0;
      let data10: Int = -65535;
      expect(s10.toInt()).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_91500
     * @tc.name      testNumericCastingConversions0915
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0915", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Byte = 126;
      let data6: Char = c'\u007e';
      expect(Byte.toChar(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_91600
     * @tc.name      testNumericCastingConversions0916
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0916", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Byte = 127;
      let data7: Char = c'\u007f';
      expect(Byte.toChar(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_91700
     * @tc.name      testNumericCastingConversions0917
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0917", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Char = c'\u0000';
      let data1: Byte = 0;
      expect(Char.toByte(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_91800
     * @tc.name      testNumericCastingConversions0918
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0918", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Char = c'\u0001';
      let data2: Byte = 1;
      expect(Char.toByte(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_91900
     * @tc.name      testNumericCastingConversions0919
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0919", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Char = c'A';
      let data3: Byte = 65;
      expect(Char.toByte(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_92000
     * @tc.name      testNumericCastingConversions0920
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0920", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Char = c'z';
      let data4: Byte = 122;
      expect(Char.toByte(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_92100
     * @tc.name      testNumericCastingConversions0921
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0921", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Char = c' ';
      let data5: Byte = 32;
      expect(Char.toByte(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_92200
     * @tc.name      testNumericCastingConversions0922
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0922", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Char = c'Ф';
      let data6: Byte = 36;
      expect(Char.toByte(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_92300
     * @tc.name      testNumericCastingConversions0923
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0923", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Char = c'я';
      let data7: Byte = 79;
      expect(Char.toByte(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_92400
     * @tc.name      testNumericCastingConversions0924
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0924", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Char = c'中';
      let data8: Byte = 45;
      expect(Char.toByte(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_92500
     * @tc.name      testNumericCastingConversions0925
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0925", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Double = -32769.0;
      let data11: Int = -32769;
      expect(s11.toInt()).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_92600
     * @tc.name      testNumericCastingConversions0926
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0926", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Char = c'文';
      let data9: Byte = -121;
      expect(Char.toByte(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_92700
     * @tc.name      testNumericCastingConversions0927
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0927", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Char = c'\ufffe';
      let data10: Byte = -2;
      expect(Char.toByte(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_92800
     * @tc.name      testNumericCastingConversions0928
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0928", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Char = c'\uffff';
      let data11: Byte = -1;
      expect(Char.toByte(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_92900
     * @tc.name      testNumericCastingConversions0929
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0929", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Char = c'\u0000';
      let data1: Short = 0;
      expect(Char.toShort(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_93000
     * @tc.name      testNumericCastingConversions0930
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0930", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Char = c'\u0001';
      let data2: Short = 1;
      expect(Char.toShort(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_93100
     * @tc.name      testNumericCastingConversions0931
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0931", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Char = c'A';
      let data3: Short = 65;
      expect(Char.toShort(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_93200
     * @tc.name      testNumericCastingConversions0932
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0932", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Char = c'z';
      let data4: Short = 122;
      expect(Char.toShort(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_93300
     * @tc.name      testNumericCastingConversions0933
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0933", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Char = c' ';
      let data5: Short = 32;
      expect(Char.toShort(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_93400
     * @tc.name      testNumericCastingConversions0934
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0934", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Char = c'Ф';
      let data6: Short = 1060;
      expect(Char.toShort(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_93500
     * @tc.name      testNumericCastingConversions0935
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0935", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Char = c'я';
      let data7: Short = 1103;
      expect(Char.toShort(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_93600
     * @tc.name      testNumericCastingConversions0936
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0936", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Double = -32768.0;
      let data12: Int = -32768;
      expect(s12.toInt()).assertEqual(data12);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_93700
     * @tc.name      testNumericCastingConversions0937
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0937", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Char = c'中';
      let data8: Short = 20013;
      expect(Char.toShort(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_93800
     * @tc.name      testNumericCastingConversions0938
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0938", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Char = c'文';
      let data9: Short = 25991;
      expect(Char.toShort(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_93900
     * @tc.name      testNumericCastingConversions0939
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0939", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Char = c'\ufffe';
      let data10: Short = -2;
      expect(Char.toShort(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_94000
     * @tc.name      testNumericCastingConversions0940
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0940", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Char = c'\uffff';
      let data11: Short = -1;
      expect(Char.toShort(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_94100
     * @tc.name      testNumericCastingConversions0941
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0941", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Char = c'\u0000';
      let data1: Int = 0;
      expect(Char.toInt(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_94200
     * @tc.name      testNumericCastingConversions0942
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0942", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Char = c'\u0001';
      let data2: Int = 1;
      expect(Char.toInt(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_94300
     * @tc.name      testNumericCastingConversions0943
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0943", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Char = c'A';
      let data3: Int = 65;
      expect(Char.toInt(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_94400
     * @tc.name      testNumericCastingConversions0944
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0944", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Char = c'z';
      let data4: Int = 122;
      expect(Char.toInt(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_94500
     * @tc.name      testNumericCastingConversions0945
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0945", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Char = c' ';
      let data5: Int = 32;
      expect(Char.toInt(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_94600
     * @tc.name      testNumericCastingConversions0946
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0946", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Char = c'Ф';
      let data6: Int = 1060;
      expect(Char.toInt(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_94700
     * @tc.name      testNumericCastingConversions0947
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0947", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Double = -32767.0;
      let data13: Int = -32767;
      expect(s13.toInt()).assertEqual(data13);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_94800
     * @tc.name      testNumericCastingConversions0948
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0948", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Char = c'я';
      let data7: Int = 1103;
      expect(Char.toInt(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_94900
     * @tc.name      testNumericCastingConversions0949
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0949", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Char = c'中';
      let data8: Int = 20013;
      expect(Char.toInt(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_95000
     * @tc.name      testNumericCastingConversions0950
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0950", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Char = c'文';
      let data9: Int = 25991;
      expect(Char.toInt(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_95100
     * @tc.name      testNumericCastingConversions0951
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0951", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Char = c'\ufffe';
      let data10: Int = 65534;
      expect(Char.toInt(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_95200
     * @tc.name      testNumericCastingConversions0952
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0952", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Char = c'\uffff';
      let data11: Int = 65535;
      expect(Char.toInt(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_95300
     * @tc.name      testNumericCastingConversions0953
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0953", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Char = c'\u0000';
      let data1: Long = 0;
      expect(Char.toLong(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_95400
     * @tc.name      testNumericCastingConversions0954
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0954", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Char = c'\u0001';
      let data2: Long = 1;
      expect(Char.toLong(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_95500
     * @tc.name      testNumericCastingConversions0955
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0955", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Char = c'A';
      let data3: Long = 65;
      expect(Char.toLong(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_95600
     * @tc.name      testNumericCastingConversions0956
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0956", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Char = c'z';
      let data4: Long = 122;
      expect(Char.toLong(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_95700
     * @tc.name      testNumericCastingConversions0957
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0957", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Char = c' ';
      let data5: Long = 32;
      expect(Char.toLong(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_95800
     * @tc.name      testNumericCastingConversions0958
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0958", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Char = c'Ф';
      let data6: Long = 1060;
      expect(Char.toLong(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_95900
     * @tc.name      testNumericCastingConversions0959
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0959", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Char = c'я';
      let data7: Long = 1103;
      expect(Char.toLong(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_96000
     * @tc.name      testNumericCastingConversions0960
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0960", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Char = c'中';
      let data8: Long = 20013;
      expect(Char.toLong(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_96100
     * @tc.name      testNumericCastingConversions0961
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0961", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Char = c'文';
      let data9: Long = 25991;
      expect(Char.toLong(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_96200
     * @tc.name      testNumericCastingConversions0962
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0962", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Char = c'\ufffe';
      let data10: Long = 65534;
      expect(Char.toLong(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_96300
     * @tc.name      testNumericCastingConversions0963
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0963", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Char = c'\uffff';
      let data11: Long = 65535;
      expect(Char.toLong(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_96400
     * @tc.name      testNumericCastingConversions0964
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0964", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Char = c'\u0000';
      let data1: Float = 0.0f;
      expect(Char.toFloat(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_96500
     * @tc.name      testNumericCastingConversions0965
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0965", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Char = c'\u0001';
      let data2: Float = 1.0f;
      expect(Char.toFloat(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_96600
     * @tc.name      testNumericCastingConversions0966
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0966", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Char = c'A';
      let data3: Float = 65.0f;
      expect(Char.toFloat(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_96700
     * @tc.name      testNumericCastingConversions0967
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0967", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Char = c'z';
      let data4: Float = 122.0f;
      expect(Char.toFloat(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_96800
     * @tc.name      testNumericCastingConversions0968
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0968", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Char = c' ';
      let data5: Float = 32.0f;
      expect(Char.toFloat(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_96900
     * @tc.name      testNumericCastingConversions0969
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0969", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Char = c'Ф';
      let data6: Float = 1060.0f;
      expect(Char.toFloat(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_97000
     * @tc.name      testNumericCastingConversions0970
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0970", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Char = c'я';
      let data7: Float = 1103.0f;
      expect(Char.toFloat(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_97100
     * @tc.name      testNumericCastingConversions0971
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0971", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Char = c'中';
      let data8: Float = 20013.0f;
      expect(Char.toFloat(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_97200
     * @tc.name      testNumericCastingConversions0972
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0972", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Char = c'文';
      let data9: Float = 25991.0f;
      expect(Char.toFloat(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_97300
     * @tc.name      testNumericCastingConversions0973
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0973", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Char = c'\ufffe';
      let data10: Float = 65534.0f;
      expect(Char.toFloat(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_97400
     * @tc.name      testNumericCastingConversions0974
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0974", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Char = c'\uffff';
      let data11: Float = 65535.0f;
      expect(Char.toFloat(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_97500
     * @tc.name      testNumericCastingConversions0975
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0975", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Char = c'\u0000';
      let data1: Double = 0.0;
      expect(Char.toDouble(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_97600
     * @tc.name      testNumericCastingConversions0976
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0976", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Char = c'\u0001';
      let data2: Double = 1.0;
      expect(Char.toDouble(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_97700
     * @tc.name      testNumericCastingConversions0977
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0977", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Char = c'A';
      let data3: Double = 65.0;
      expect(Char.toDouble(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_97800
     * @tc.name      testNumericCastingConversions0978
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0978", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Double = -127.0;
      let data16: Int = -127;
      expect(s16.toInt()).assertEqual(data16);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_97900
     * @tc.name      testNumericCastingConversions0979
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0979", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Char = c'z';
      let data4: Double = 122.0;
      expect(Char.toDouble(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_98000
     * @tc.name      testNumericCastingConversions0980
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0980", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Char = c' ';
      let data5: Double = 32.0;
      expect(Char.toDouble(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_98100
     * @tc.name      testNumericCastingConversions0981
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0981", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Char = c'Ф';
      let data6: Double = 1060.0;
      expect(Char.toDouble(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_98200
     * @tc.name      testNumericCastingConversions0982
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0982", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Char = c'я';
      let data7: Double = 1103.0;
      expect(Char.toDouble(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_98300
     * @tc.name      testNumericCastingConversions0983
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0983", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Char = c'中';
      let data8: Double = 20013.0;
      expect(Char.toDouble(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_98400
     * @tc.name      testNumericCastingConversions0984
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0984", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Char = c'文';
      let data9: Double = 25991.0;
      expect(Char.toDouble(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_98500
     * @tc.name      testNumericCastingConversions0985
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0985", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Char = c'\ufffe';
      let data10: Double = 65534.0;
      expect(Char.toDouble(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_98600
     * @tc.name      testNumericCastingConversions0986
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0986", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Char = c'\uffff';
      let data11: Double = 65535.0;
      expect(Char.toDouble(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_98700
     * @tc.name      testNumericCastingConversions0987
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0987", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Char = c'\u0000';
      let data1: Char = c'\u0000';
      expect(Char.toChar(s1)).assertEqual(data1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_98800
     * @tc.name      testNumericCastingConversions0988
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0988", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Char = c'\u0001';
      let data2: Char = c'\u0001';
      expect(Char.toChar(s2)).assertEqual(data2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_98900
     * @tc.name      testNumericCastingConversions0989
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0989", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Double = -3.1415926;
      let data17: Int = -3;
      expect(s17.toInt()).assertEqual(data17);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_99000
     * @tc.name      testNumericCastingConversions0990
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0990", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Char = c'A';
      let data3: Char = c'\u0041';
      expect(Char.toChar(s3)).assertEqual(data3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_99100
     * @tc.name      testNumericCastingConversions0991
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0991", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Char = c'z';
      let data4: Char = c'\u007a';
      expect(Char.toChar(s4)).assertEqual(data4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_99200
     * @tc.name      testNumericCastingConversions0992
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0992", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Char = c' ';
      let data5: Char = c'\u0020';
      expect(Char.toChar(s5)).assertEqual(data5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_99300
     * @tc.name      testNumericCastingConversions0993
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0993", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Char = c'Ф';
      let data6: Char = c'\u0424';
      expect(Char.toChar(s6)).assertEqual(data6);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_99400
     * @tc.name      testNumericCastingConversions0994
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0994", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Char = c'я';
      let data7: Char = c'\u044f';
      expect(Char.toChar(s7)).assertEqual(data7);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_99500
     * @tc.name      testNumericCastingConversions0995
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0995", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Char = c'中';
      let data8: Char = c'\u4e2d';
      expect(Char.toChar(s8)).assertEqual(data8);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_99600
     * @tc.name      testNumericCastingConversions0996
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0996", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Char = c'文';
      let data9: Char = c'\u6587';
      expect(Char.toChar(s9)).assertEqual(data9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_99700
     * @tc.name      testNumericCastingConversions0997
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0997", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Char = c'\ufffe';
      let data10: Char = c'\ufffe';
      expect(Char.toChar(s10)).assertEqual(data10);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_99800
     * @tc.name      testNumericCastingConversions0998
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0998", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Char = c'\uffff';
      let data11: Char = c'\uffff';
      expect(Char.toChar(s11)).assertEqual(data11);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_99900
     * @tc.name      testNumericCastingConversions0999
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0999", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -1.0;
      let data18: Int = -1;
      expect(s18.toInt()).assertEqual(data18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_100000
     * @tc.name      testNumericCastingConversions1000
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: float = Float.NaN;
      let data1: float = s1;
      expect(Float.isNaN(data1)).assertTrue();
      let s2: float = Float.NaN;
      let data2: double = s2.toDouble();
      expect(data2.isNaN()).assertTrue();
      let s3: double = Double.NaN;
      let data3: double = s3;
      expect(data3.isNaN()).assertTrue();
      let s4: double = Double.NaN;
      let data4: float = s4.toFloat();
      expect(Float.isNaN(data4)).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_100100
     * @tc.name      testNumericCastingConversions1001
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: byte = 85;
      let r1: byte = p1++;
      expect(p1).assertEqual(86);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_100200
     * @tc.name      testNumericCastingConversions1002
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p2: short = 21845;
      let r2: short = p2++;
      expect(p2).assertEqual(21846);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_100300
     * @tc.name      testNumericCastingConversions1003
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p11: float = 0.00001f;
      let r11: float = p11--;
      expect(p11).assertEqual(-0.99999f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_100400
     * @tc.name      testNumericCastingConversions1004
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p12: double = 1e-11;
      let r12: double = p12--;
      expect(p12).assertEqual(-0.99999999999);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_100500
     * @tc.name      testNumericCastingConversions1005
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p3: int = 303174162;
      let r3: int = p3++;
      expect(p3).assertEqual(303174163);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_100600
     * @tc.name      testNumericCastingConversions1006
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p4: long = 3761688988152649302;
      let r4: long = p4++;
      expect(p4).assertEqual(3761688988152649303);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_100700
     * @tc.name      testNumericCastingConversions1007
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p5: float = 0.00001f;
      let r5: float = p5++;
      expect(p5).assertEqual(1.00001f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_100800
     * @tc.name      testNumericCastingConversions1008
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p6: double = 1e-11;
      let r6: double = p6++;
      expect(p6).assertEqual(1.00000000001);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_100900
     * @tc.name      testNumericCastingConversions1009
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p7: byte = 85;
      let r7: byte = p7--;
      expect(p7).assertEqual(84);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_101000
     * @tc.name      testNumericCastingConversions1010
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p8: short = 21845;
      let r8: short = p8--;
      expect(p8).assertEqual(21844);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_101100
     * @tc.name      testNumericCastingConversions1011
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p9: int = 303174162;
      let r9: int = p9--;
      expect(p9).assertEqual(303174161);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_101200
     * @tc.name      testNumericCastingConversions1012
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Postfix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p10: long = 3761688988152649302;
      let r10: long = p10--;
      expect(p10).assertEqual(3761688988152649301);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_101300
     * @tc.name      testNumericCastingConversions1013
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: byte = 85;
      let r1: byte = ++p1;
      expect(r1).assertEqual(86);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_101400
     * @tc.name      testNumericCastingConversions1014
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p2: short = 21845;
      let r2: short = ++p2;
      expect(r2).assertEqual(21846);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_101500
     * @tc.name      testNumericCastingConversions1015
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p11: float = 0.00001f;
      let r11: float = --p11;
      expect(r11).assertEqual(-0.99999f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_101600
     * @tc.name      testNumericCastingConversions1016
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p12: double = 1e-11;
      let r12: double = --p12;
      expect(r12).assertEqual(-0.99999999999);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_101700
     * @tc.name      testNumericCastingConversions1017
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p3: int = 303174162;
      let r3: int = ++p3;
      expect(r3).assertEqual(303174163);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_101800
     * @tc.name      testNumericCastingConversions1018
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p4: long = 3761688988152649302;
      let r4: long = ++p4;
      expect(r4).assertEqual(3761688988152649303);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_101900
     * @tc.name      testNumericCastingConversions1019
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p5: float = 0.00001f;
      let r5: float = ++p5;
      expect(r5).assertEqual(1.00001f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_102000
     * @tc.name      testNumericCastingConversions1020
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p6: double = 1e-11;
      let r6: double = ++p6;
      expect(r6).assertEqual(1.00000000001);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_102100
     * @tc.name      testNumericCastingConversions1021
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p7: byte = 85;
      let r7: byte = --p7;
      expect(r7).assertEqual(84);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_102200
     * @tc.name      testNumericCastingConversions1022
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p8: short = 21845;
      let r8: short = --p8;
      expect(r8).assertEqual(21844);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_102300
     * @tc.name      testNumericCastingConversions1023
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p9: int = 303174162;
      let r9: int = --p9;
      expect(r9).assertEqual(303174161);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_102400
     * @tc.name      testNumericCastingConversions1024
     * @tc.desc      Casting conversion implicitly in the following arithmetic operations - Prefix Increment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p10: long = 3761688988152649302;
      let r10: long = --p10;
      expect(r10).assertEqual(3761688988152649301);
    });

  })
}