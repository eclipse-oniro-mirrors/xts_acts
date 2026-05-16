/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ParseFloatTest() {
  describe('ParseFloatTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async() => {
      await sleep(50);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_0100
     * @tc.name parseFloatTest001
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("3.14");
      expect(result).assertEqual(3.14);
    });
    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_0200
     * @tc.name parseFloatTest002
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("  3.14  ");
      expect(result).assertEqual(3.14);
    });
    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_0300
     * @tc.name parseFloatTest003
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("314e-2");
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_0400
     * @tc.name parseFloatTest004
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("0.0314E+2");
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_0500
     * @tc.name parseFloatTest005
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("3.14abc");
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_0600
     * @tc.name parseFloatTest006
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("FF2");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_0700
     * @tc.name parseFloatTest007
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("NaN");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_0800
     * @tc.name parseFloatTest008
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1.7976931348623159e+308");
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_0900
     * @tc.name parseFloatTest009
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-1.7976931348623159e+308");
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_1000
     * @tc.name parseFloatTest010
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("Infinity");
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_1100
     * @tc.name parseFloatTest011
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-Infinity");
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_1200
     * @tc.name parseFloatTest012
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("  Infinity");
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_1300
     * @tc.name parseFloatTest013
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("900719925474099267n");
      expect(result).assertEqual(900719925474099300);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_1400
     * @tc.name parseFloatTest014
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("42");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_1500
     * @tc.name parseFloatTest015
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("+123.45");
      expect(result).assertEqual(123.45);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_1600
     * @tc.name parseFloatTest016
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-67.89");
      expect(result).assertEqual(-67.89);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_1700
     * @tc.name parseFloatTest017
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1e+3");
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_1800
     * @tc.name parseFloatTest018
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("2e-4");
      expect(result).assertEqual(0.0002);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_1900
     * @tc.name parseFloatTest019
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("12.34.56");
      expect(result).assertEqual(12.34);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_2000
     * @tc.name parseFloatTest020
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat(".789");
      expect(result).assertEqual(0.789);
    });
    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_2100
     * @tc.name parseFloatTest021
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("e10");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_2200
     * @tc.name parseFloatTest022
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_2300
     * @tc.name parseFloatTest023
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("   ");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_2400
     * @tc.name parseFloatTest024
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123-45");
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_2500
     * @tc.name parseFloatTest025
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1e2e3");
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_2600
     * @tc.name parseFloatTest026
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("\t6.78");
      expect(result).assertEqual(6.78);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_2700
     * @tc.name parseFloatTest027
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("\n90.12");
      expect(result).assertEqual(90.12);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_2800
     * @tc.name parseFloatTest028
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1.23e5");
      expect(result).assertEqual(123000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_2900
     * @tc.name parseFloatTest029
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("4.56E-3");
      expect(result).assertEqual(0.00456);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_3000
     * @tc.name parseFloatTest030
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("78.9 xyz");
      expect(result).assertEqual(78.9);
    });
    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_3100
     * @tc.name parseFloatTest031
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat(".");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_3200
     * @tc.name parseFloatTest032
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123.");
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_3300
     * @tc.name parseFloatTest033
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("45#abc");
      expect(result).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_3400
     * @tc.name parseFloatTest034
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123一二三");
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_3500
     * @tc.name parseFloatTest035
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("0b101");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_3600
     * @tc.name parseFloatTest036
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("0o777");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_3700
     * @tc.name parseFloatTest037
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("0xFF");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_3800
     * @tc.name parseFloatTest038
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("+1.2e4");
      expect(result).assertEqual(12000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_3900
     * @tc.name parseFloatTest039
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-3.4e6");
      expect(result).assertEqual(-3400000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_4000
     * @tc.name parseFloatTest040
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("5e+-2");
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_4100
     * @tc.name parseFloatTest041
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1704067200000");
      expect(result).assertEqual(1704067200000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_4300
     * @tc.name parseFloatTest043
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1,234.56");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_4400
     * @tc.name parseFloatTest044
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("$987.65");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_4500
     * @tc.name parseFloatTest045
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("infinity");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_4600
     * @tc.name parseFloatTest046
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-InFiNiTy");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_4700
     * @tc.name parseFloatTest047
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("0.1 + 0.2");
      expect(result).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_4800
     * @tc.name parseFloatTest048
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("(123.45)");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_4900
     * @tc.name parseFloatTest049
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("\v45.67");
      expect(result).assertEqual(45.67);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_5000
     * @tc.name parseFloatTest050
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("\r89.01");
      expect(result).assertEqual(89.01);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_5100
     * @tc.name parseFloatTest051
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("0.000123e3");
      expect(result).assertEqual(0.123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_5200
     * @tc.name parseFloatTest052
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("9.87E+4");
      expect(result).assertEqual(98700);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_5300
     * @tc.name parseFloatTest053
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("34.56\n");
      expect(result).assertEqual(34.56);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_5400
     * @tc.name parseFloatTest054
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("78.90\t");
      expect(result).assertEqual(78.90);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_5500
     * @tc.name parseFloatTest055
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat(".123");
      expect(result).assertEqual(0.123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_5600
     * @tc.name parseFloatTest056
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("000123.45");
      expect(result).assertEqual(123.45);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_5700
     * @tc.name parseFloatTest057
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("000.678");
      expect(result).assertEqual(0.678);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_5800
     * @tc.name parseFloatTest058
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("12345678901234567890n");
      expect(result).assertEqual(12345678901234568000.0);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_5900
     * @tc.name parseFloatTest059
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1010");
      expect(result).assertEqual(1010);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_6000
     * @tc.name parseFloatTest060
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("777");
      expect(result).assertEqual(777);
    });
    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_6100
     * @tc.name parseFloatTest061
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1A");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_6200
     * @tc.name parseFloatTest062
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("2.3e10");
      expect(result).assertEqual(23000000000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_6300
     * @tc.name parseFloatTest063
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("5.6e-7");
      expect(result).assertEqual(0.00000056);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_6400
     * @tc.name parseFloatTest064
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("++123.45");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_6500
     * @tc.name parseFloatTest065
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("--67.89");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_6800
     * @tc.name parseFloatTest068
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("€123.45");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_6900
     * @tc.name parseFloatTest069
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("98.7%");
      expect(result).assertEqual(98.7);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_7000
     * @tc.name parseFloatTest070
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123@45");
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_7100
     * @tc.name parseFloatTest071
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("45/67");
      expect(result).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_7200
     * @tc.name parseFloatTest072
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("78.9?");
      expect(result).assertEqual(78.9);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_7300
     * @tc.name parseFloatTest073
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("　12.34");
      expect(result).assertEqual(12.34);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_7400
     * @tc.name parseFloatTest074
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat(" 　56.78");
      expect(result).assertEqual(56.78);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_7500
     * @tc.name parseFloatTest075
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1234.56e-2");
      expect(result).assertEqual(12.3456);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_7600
     * @tc.name parseFloatTest076
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("0.987E3");
      expect(result).assertEqual(987);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_7700
     * @tc.name parseFloatTest077
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("90.12１２３");
      expect(result).assertEqual(90.12);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_7800
     * @tc.name parseFloatTest078
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("34.56_abc");
      expect(result).assertEqual(34.56);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_7900
     * @tc.name parseFloatTest079
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_8000
     * @tc.name parseFloatTest080
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("+");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_8100
     * @tc.name parseFloatTest081
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("0001e2");
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_8200
     * @tc.name parseFloatTest082
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("9999999999999999999999n");
      expect(result).assertEqual(10000000000000000000000.0);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_8300
     * @tc.name parseFloatTest083
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1010b");
      expect(result).assertEqual(1010);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_8400
     * @tc.name parseFloatTest084
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("777o");
      expect(result).assertEqual(777);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_8500
     * @tc.name parseFloatTest085
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("FFx");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_8600
     * @tc.name parseFloatTest086
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("3.14e0");
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_8700
     * @tc.name parseFloatTest087
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("6.28e-0");
      expect(result).assertEqual(6.28);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_8800
     * @tc.name parseFloatTest088
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("+.123");
      expect(result).assertEqual(0.123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_8900
     * @tc.name parseFloatTest089
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-.456");
      expect(result).assertEqual(-0.456);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_9000
     * @tc.name parseFloatTest090
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1.7976931348623157e+308");
      expect(result).assertEqual(1.7976931348623157e+308);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_9300
     * @tc.name parseFloatTest093
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123.45kg");
      expect(result).assertEqual(123.45);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_9400
     * @tc.name parseFloatTest094
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("456*789");
      expect(result).assertEqual(456);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_9500
     * @tc.name parseFloatTest095
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123(45)");
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_9600
     * @tc.name parseFloatTest096
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("789~012");
      expect(result).assertEqual(789);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_9700
     * @tc.name parseFloatTest097
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("\t  45.67");
      expect(result).assertEqual(45.67);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_9800
     * @tc.name parseFloatTest098
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("\n  89.01");
      expect(result).assertEqual(89.01);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_9900
     * @tc.name parseFloatTest099
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("0.00123e4");
      expect(result).assertEqual(12.3);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_10000
     * @tc.name parseFloatTest100
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("987.65E-2");
      expect(result).assertEqual(9.8765);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_10100
     * @tc.name parseFloatTest101
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("34.56\v");
      expect(result).assertEqual(34.56);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_10200
     * @tc.name parseFloatTest102
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("78.90\r");
      expect(result).assertEqual(78.90);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_10300
     * @tc.name parseFloatTest103
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("+123.");
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_10400
     * @tc.name parseFloatTest104
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-456.");
      expect(result).assertEqual(-456);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_10500
     * @tc.name parseFloatTest105
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("000000789.012");
      expect(result).assertEqual(789.012);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_10600
     * @tc.name parseFloatTest106
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1000000000000000000000n");
      expect(result).assertEqual(1000000000000000000000.0);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_10700
     * @tc.name parseFloatTest107
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1100b10");
      expect(result).assertEqual(1100);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_10800
     * @tc.name parseFloatTest108
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123o45");
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_10900
     * @tc.name parseFloatTest109
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1Fx23");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_11000
     * @tc.name parseFloatTest110
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("5.67e12");
      expect(result).assertEqual(5670000000000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_11100
     * @tc.name parseFloatTest111
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("8.90e-10");
      expect(result).assertEqual(0.00000000089);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_11200
     * @tc.name parseFloatTest112
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("+1.2e3");
      expect(result).assertEqual(1200);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_11300
     * @tc.name parseFloatTest113
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-3.4e5");
      expect(result).assertEqual(-340000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_11400
     * @tc.name parseFloatTest114
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1717209600000");
      expect(result).assertEqual(1717209600000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_11500
     * @tc.name parseFloatTest115
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-1.7976931348623157e+308");
      expect(result).assertEqual(-1.7976931348623157e+308);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_11600
     * @tc.name parseFloatTest116
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("$123.45");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_11700
     * @tc.name parseFloatTest117
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("67.8 %");
      expect(result).assertEqual(67.8);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_11800
     * @tc.name parseFloatTest118
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("901#234");
      expect(result).assertEqual(901);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_11900
     * @tc.name parseFloatTest119
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("56/78.9");
      expect(result).assertEqual(56);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_12000
     * @tc.name parseFloatTest120
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("34.5?67");
      expect(result).assertEqual(34.5);
    });
    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_12100
     * @tc.name parseFloatTest121
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("890@123");
      expect(result).assertEqual(890);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_12200
     * @tc.name parseFloatTest122
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("\xA012.34");
      expect(result).assertEqual(12.34);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_12300
     * @tc.name parseFloatTest123
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("\u200956.78");
      expect(result).assertEqual(56.78);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_12400
     * @tc.name parseFloatTest124
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123.456e3");
      expect(result).assertEqual(123456);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_12500
     * @tc.name parseFloatTest125
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("789.012E-4");
      expect(result).assertEqual(0.0789012);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_12600
     * @tc.name parseFloatTest126
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("34.56\u200B");
      expect(result).assertEqual(34.56);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_12700
     * @tc.name parseFloatTest127
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("78.90\u3000");
      expect(result).assertEqual(78.90);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_12800
     * @tc.name parseFloatTest128
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("+.");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_12900
     * @tc.name parseFloatTest129
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_13000
     * @tc.name parseFloatTest130
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("00123e-2");
      expect(result).assertEqual(1.23);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_13100
     * @tc.name parseFloatTest131
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("999999999999999999999999999n");
      expect(result).assertEqual(1000000000000000000000000000.0);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_13200
     * @tc.name parseFloatTest132
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1011b00");
      expect(result).assertEqual(1011);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_13300
     * @tc.name parseFloatTest133
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("456o70");
      expect(result).assertEqual(456);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_13400
     * @tc.name parseFloatTest134
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("AB12");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_13500
     * @tc.name parseFloatTest135
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1.23e15");
      expect(result).assertEqual(1230000000000000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_13600
     * @tc.name parseFloatTest136
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("4.56e-12");
      expect(result).assertEqual(0.00000000000456);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_13700
     * @tc.name parseFloatTest137
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("+7.89e4");
      expect(result).assertEqual(78900);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_13800
     * @tc.name parseFloatTest138
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-0.123e6");
      expect(result).assertEqual(-123000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_13900
     * @tc.name parseFloatTest139
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("1720000000000");
      expect(result).assertEqual(1720000000000);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_14000
     * @tc.name parseFloatTest140
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("-1.7976931348623157e+308");
      expect(result).assertEqual(-1.7976931348623157e+308);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_14100
     * @tc.name parseFloatTest141
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("€456.78");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_14200
     * @tc.name parseFloatTest142
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("23.4°");
      expect(result).assertEqual(23.4);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_14300
     * @tc.name parseFloatTest143
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("789$012");
      expect(result).assertEqual(789);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_14400
     * @tc.name parseFloatTest144
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("345*678");
      expect(result).assertEqual(345);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_14500
     * @tc.name parseFloatTest145
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("678.9!");
      expect(result).assertEqual(678.9);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_14600
     * @tc.name parseFloatTest146
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123#456");
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_14700
     * @tc.name parseFloatTest147
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123#456");
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_14800
     * @tc.name parseFloatTest148
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("\u200C123.45");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_14900
     * @tc.name parseFloatTest149
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("0.0000123e6");
      expect(result).assertEqual(12.3);
    });

    /**
     * @tc.number SUB_BUILTINS_ParseFloat_TEST_15000
     * @tc.name parseFloatTest150
     * @tc.desc test parseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseFloatTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("456.78©");
      expect(result).assertEqual(456.78);
    });



  })
}

