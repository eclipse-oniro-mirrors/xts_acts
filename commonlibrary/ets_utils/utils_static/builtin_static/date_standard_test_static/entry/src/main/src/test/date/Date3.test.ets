/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';
import {BusinessError} from '@ohos.base';

export default function Date3Test() {
  describe('Date3Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_0100
     * @tc.name Date3Test_001
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test1Actual = Date.UTC(2024, 4, 20, 14, 30);
      expect(test1Actual).assertEqual(1716215400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_0200
     * @tc.name Date3Test_002
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test2Actual = Date.UTC(95, 0, 1);
      const test2Expected = 788918400000;
      expect(test2Actual).assertEqual(test2Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_0400
     * @tc.name Date3Test_004
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test4Actual = Date.UTC(2023, 8);
      const test4Expected = 1693526400000;
      expect(test4Actual).assertEqual(test4Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_0500
     * @tc.name Date3Test_005
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test5Actual = Date.UTC(2024, 1, 32);
      expect(test5Actual).assertEqual(1709424000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_0600
     * @tc.name Date3Test_006
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test6Actual = Date.UTC(2024, 4, 20, 25);
      expect(test6Actual).assertEqual(1716253200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_0700
     * @tc.name Date3Test_007
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test7Actual = Date.UTC(2024, 4, 20, 14, 65);
      expect(test7Actual).assertEqual(1716217500000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_0800
     * @tc.name Date3Test_008
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test8Actual = Date.UTC(2024, 4, 20, 14, 30, 70);
      expect(test8Actual).assertEqual(1716215470000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_0900
     * @tc.name Date3Test_009
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test9Actual = Date.UTC(2024, 4, 20, 14, 30, 0, 1500);
      expect(test9Actual).assertEqual(1716215401500);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_1000
     * @tc.name Date3Test_010
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test10Actual = Date.UTC(0, 0, 1);
      const test10Expected = -2208988800000;
      expect(test10Actual).assertEqual(test10Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_1100
     * @tc.name Date3Test_011
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test11Actual = Date.UTC(99, 11, 31);
      const test11Expected = 946598400000;
      expect(test11Actual).assertEqual(test11Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_1200
     * @tc.name Date3Test_012
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test12Actual = Date.UTC(100, 0, 1);
      expect(test12Actual).assertEqual(-59011459200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_1300
     * @tc.name Date3Test_013
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test13Actual = Date.UTC(2000, 1, 29);
      expect(test13Actual).assertEqual(951782400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_1400
     * @tc.name Date3Test_014
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test14Actual = Date.UTC(2023, 1, 29);
      expect(test14Actual).assertEqual(1677628800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_1600
     * @tc.name Date3Test_016
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test16Actual = Date.UTC(2024, 2, 0);
      expect(test16Actual).assertEqual(1709164800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_1700
     * @tc.name Date3Test_017
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test17Actual = Date.UTC(2024, 4, 20, -2);
      const test17Expected = 1716156000000;
      expect(test17Actual).assertEqual(test17Expected)
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_1800
     * @tc.name Date3Test_018
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test18Actual = Date.UTC(2024, 4, 20, 14, -5);
      expect(test18Actual).assertEqual(1716213300000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_1900
     * @tc.name Date3Test_019
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test19Actual = Date.UTC(2024, 4, 20, 14, 30, -10);
      expect(test19Actual).assertEqual(1716215390000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_2000
     * @tc.name Date3Test_020
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test20Actual = Date.UTC(2024, 4, 20, 14, 30, 1, -500);
      expect(test20Actual).assertEqual(1716215400500);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_2200
     * @tc.name Date3Test_022
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test22Actual = Date.UTC(2024, 13, 32);
      expect(test22Actual).assertEqual(1741046400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_2300
     * @tc.name Date3Test_023
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test23Actual = Date.UTC(1970, 0, 1, 0, 0, 1);
      const test23Expected = 1000;
      expect(test23Actual).assertEqual(test23Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_2400
     * @tc.name Date3Test_024
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test24Actual = Date.UTC(1969, 11, 31, 23, 59, 59);
      const test24Expected = -1000;
      expect(test24Actual).assertEqual(test24Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_2500
     * @tc.name Date3Test_025
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test25Actual = Date.UTC(2100, 1, 29);
      expect(test25Actual).assertEqual(4107542400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_2600
     * @tc.name Date3Test_026
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test26Actual = Date.UTC(2024, 11, 31);
      const test26Expected = 1735689600000 - 86400000;
      expect(test26Actual).assertEqual(test26Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_2700
     * @tc.name Date3Test_027
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test27Actual = Date.UTC(2024, 3, 30);
      expect(test27Actual).assertEqual(1714435200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_2800
     * @tc.name Date3Test_028
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test28Actual = Date.UTC(2024, 3, 31);
      expect(test28Actual).assertEqual(1714521600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_2900
     * @tc.name Date3Test_029
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test29Actual = Date.UTC(2024, 4, 20, 10, -30);
      expect(test29Actual).assertEqual(1716197400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_3000
     * @tc.name Date3Test_030
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test30Actual = Date.UTC(2024, 4, 20, 14, 20, -45);
      expect(test30Actual).assertEqual(1716214755000);
    });
    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_3100
     * @tc.name Date3Test_031
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test31Actual = Date.UTC(2024, 4, 20, 14, 30, 5, -800);
      expect(test31Actual).assertEqual(1716215404200);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_3200
     * @tc.name Date3Test_032
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test32Actual = Date.UTC(2023, 1, 28);
      expect(test32Actual).assertEqual(1677542400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_3400
     * @tc.name Date3Test_034
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test34Actual = Date.UTC(2024, 4, -5);
      expect(test34Actual).assertEqual(1714003200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_3500
     * @tc.name Date3Test_035
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test35Actual = Date.UTC(2024, 4, 20, -10);
      expect(test35Actual).assertEqual(1716127200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_3700
     * @tc.name Date3Test_037
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test37Actual = Date.UTC(1900, 0, 1);
      const test37Expected = -2208988800000;
      expect(test37Actual).assertEqual(test37Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_3800
     * @tc.name Date3Test_038
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test38Actual = Date.UTC(99, 11, 30);
      const test38Expected = 946512000000;
      expect(test38Actual).assertEqual(test38Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_3900
     * @tc.name Date3Test_039
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test39Actual = Date.UTC(2024, 11, 30);
      expect(test39Actual).assertEqual(1735516800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_4000
     * @tc.name Date3Test_040
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test40Actual = Date.UTC(2024, 4, 20, 23, 59, 59, 999);
      expect(test40Actual).assertEqual(1716249599999);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_4100
     * @tc.name Date3Test_041
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test41Actual = Date.UTC(2025, 1, 28);
      expect(test41Actual).assertEqual(1740700800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_4200
     * @tc.name Date3Test_042
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test42Actual = Date.UTC(2024, 5, 30);
      expect(test42Actual).assertEqual(1719705600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_4300
     * @tc.name Date3Test_043
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test43Actual = Date.UTC(2024, 5, 31);
      expect(test43Actual).assertEqual(1719792000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_4400
     * @tc.name Date3Test_044
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test44Actual = Date.UTC(1970, 0, 1, 0, 0, 0);
      const test44Expected = 0;
      expect(test44Actual).assertEqual(test44Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_4500
     * @tc.name Date3Test_045
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test45Actual = Date.UTC(1969, 11, 31, 0, 0, 0);
      const test45Expected = -86400000;
      expect(test45Actual).assertEqual(test45Expected);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_4600
     * @tc.name Date3Test_046
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test46Actual = Date.UTC(2024, 4, 20, 25, 70);
      expect(test46Actual).assertEqual(1716257400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_4700
     * @tc.name Date3Test_047
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test47Actual = Date.UTC(2024, 4, 20, 14, 65, 80);
      expect(test47Actual).assertEqual(1716217580000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_4800
     * @tc.name Date3Test_048
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test48Actual = Date.UTC(2024, 4, 20, 14, 30, 2, -1500);
      expect(test48Actual).assertEqual(1716215400500);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_4900
     * @tc.name Date3Test_049
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test49Actual = Date.UTC(200, 5, 15);
      expect(test49Actual).assertEqual(-55841529600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_5100
     * @tc.name Date3Test_051
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test51Actual = Date.UTC(2024, 5, -10);
      expect(test51Actual).assertEqual(1716249600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_5200
     * @tc.name Date3Test_052
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test52Actual = Date.UTC(2024, 4, 20, -20);
      expect(test52Actual).assertEqual(1716091200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_5300
     * @tc.name Date3Test_053
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test53Actual = Date.UTC(1800, 1, 29);
      expect(test53Actual).assertEqual(-5359564800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_5400
     * @tc.name Date3Test_054
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test54Actual = Date.UTC(2400, 1, 29);
      expect(test54Actual).assertEqual(13574563200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_5500
     * @tc.name Date3Test_055
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test55Actual = Date.UTC(2024, 10, 30);
      expect(test55Actual).assertEqual(1732924800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_5600
     * @tc.name Date3Test_056
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test56Actual = Date.UTC(2024, 10, 31);
      expect(test56Actual).assertEqual(1733011200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_5700
     * @tc.name Date3Test_057
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test57Actual = Date.UTC(2024, 4, 20, 14, 30, -65);
      expect(test57Actual).assertEqual(1716215335000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_5800
     * @tc.name Date3Test_058
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test58Actual = Date.UTC(2025, 2, 8);
      const test58Expected = 1735689600000 + (8 * 3600000);
      expect(test58Actual).assertEqual(1741392000000);
      expect(test58Expected).assertEqual(1735718400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_5900
     * @tc.name Date3Test_059
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test59Actual = Date.UTC(50, 8, 15);
      expect(test59Actual).assertEqual(-608947200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_6000
     * @tc.name Date3Test_060
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test60Actual = Date.UTC(2024, 4, 20, 14, 30, 0, 999);
      expect(test60Actual).assertEqual(1716215400999);
    });
    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_6100
     * @tc.name Date3Test_061
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test61Actual = Date.UTC(2025, 1, 28);
      expect(test61Actual).assertEqual(1740700800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_6300
     * @tc.name Date3Test_063
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test63Actual = Date.UTC(1000, 0, 1);
      expect(test63Actual).assertEqual(-30610224000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_6400
     * @tc.name Date3Test_064
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test64Actual = Date.UTC(2024, 7, 31);
      expect(test64Actual).assertEqual(1725062400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_6500
     * @tc.name Date3Test_065
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test65Actual = Date.UTC(2024, 8, 31);
      expect(test65Actual).assertEqual(1727740800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_6600
     * @tc.name Date3Test_066
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test66Actual = Date.UTC(2024, 4, 20, 14, -120);
      expect(test66Actual).assertEqual(1716206400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_6700
     * @tc.name Date3Test_067
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test67Actual = Date.UTC(1999, 11, 31, 23, 59, 59);
      expect(test67Actual).assertEqual(946684799000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_6800
     * @tc.name Date3Test_068
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test68Actual = Date.UTC(2024, 0, 31, 23);
      expect(test68Actual).assertEqual(1706742000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_7000
     * @tc.name Date3Test_070
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test70Actual = Date.UTC(2024, 13, -5);
      expect(test70Actual).assertEqual(1737849600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_7100
     * @tc.name Date3Test_071
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test71Actual = Date.UTC(2024, 4, 20, 26, -40);
      expect(test71Actual).assertEqual(1716254400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_7200
     * @tc.name Date3Test_072
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test72Actual = Date.UTC(30, 1, 30);
      expect(test72Actual).assertEqual(-1257120000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_7400
     * @tc.name Date3Test_074
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test74Actual = Date.UTC(2024, 6, -15);
      expect(test74Actual).assertEqual(1718409600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_7500
     * @tc.name Date3Test_075
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test75Actual = Date.UTC(2024, 4, 20, -23);
      expect(test75Actual).assertEqual(1716080400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_7600
     * @tc.name Date3Test_076
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test76Actual = Date.UTC(1500, 1, 28);
      expect(test76Actual).assertEqual(-14826758400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_7700
     * @tc.name Date3Test_077
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test77Actual = Date.UTC(2024, 4, 31);
      expect(test77Actual).assertEqual(1717113600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_7800
     * @tc.name Date3Test_078
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test78Actual = Date.UTC(2024, 4, 20, 14, 30, -120);
      expect(test78Actual).assertEqual(1716215280000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_7900
     * @tc.name Date3Test_079
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test79Actual = Date.UTC(2024, 4, 20, 14, 30, 5, -2000);
      expect(test79Actual).assertEqual(1716215403000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_8000
     * @tc.name Date3Test_080
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test80Actual = Date.UTC(999, 11, 31);
      expect(test80Actual).assertEqual(-30610310400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_8200
     * @tc.name Date3Test_082
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test82Actual = Date.UTC(2024, 6, 31);
      expect(test82Actual).assertEqual(1722384000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_8300
     * @tc.name Date3Test_083
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test83Actual = Date.UTC(1970, 11, 31, 23, 59, 59);
      expect(test83Actual).assertEqual(31535999000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_8400
     * @tc.name Date3Test_084
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test84Actual = Date.UTC(2024, 9, 0);
      expect(test84Actual).assertEqual(1727654400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_8500
     * @tc.name Date3Test_085
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test85Actual = Date.UTC(2024, 4, 20, 24);
      expect(test85Actual).assertEqual(1716249600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_8600
     * @tc.name Date3Test_086
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test86Actual = Date.UTC(70, 0, 1, 25);
      expect(test86Actual).assertEqual(90000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_8700
     * @tc.name Date3Test_087
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test87Actual = Date.UTC(2024, 11, 31);
      expect(test87Actual).assertEqual(1735603200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_8800
     * @tc.name Date3Test_088
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test88Actual = Date.UTC(2024, 4, 20, 15, -180);
      expect(test88Actual).assertEqual(1716206400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_8900
     * @tc.name Date3Test_089
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test89Actual = Date.UTC(2024, 4, -8, -10);
      expect(test89Actual).assertEqual(1713708000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_9000
     * @tc.name Date3Test_090
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test90Actual = Date.UTC(2099, 1, 28);
      expect(test90Actual).assertEqual(4075920000000);
    });
    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_9100
     * @tc.name Date3Test_091
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test91Actual = Date.UTC(1600, 1, 29);
      expect(test91Actual).assertEqual(-11670998400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_9200
     * @tc.name Date3Test_092
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test92Actual = Date.UTC(2024, 4, 20, 14, 30, 90, 1500);
      expect(test92Actual).assertEqual(1716215491500);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_9300
     * @tc.name Date3Test_093
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test93Actual = Date.UTC(2026, -4, 25);
      expect(test93Actual).assertEqual(1758758400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_9400
     * @tc.name Date3Test_094
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test94Actual = Date.UTC(2024, 8, -20);
      expect(test94Actual).assertEqual(1723334400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_9500
     * @tc.name Date3Test_095
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test95Actual = Date.UTC(40, 13, 5);
      expect(test95Actual).assertEqual(-912124800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_9600
     * @tc.name Date3Test_096
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test96Actual = Date.UTC(2024, 11, 5, -15);
      expect(test96Actual).assertEqual(1733302800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_9700
     * @tc.name Date3Test_097
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test97Actual = Date.UTC(2025, 2, 31);
      expect(test97Actual).assertEqual(1743379200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_9800
     * @tc.name Date3Test_098
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test98Actual = Date.UTC(2024, 4, 20, 16, 45, -180);
      expect(test98Actual).assertEqual(1716223320000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_9900
     * @tc.name Date3Test_099
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test99Actual = Date.UTC(2024, 4, 20, 14, 30, 8, -2500);
      expect(test99Actual).assertEqual(1716215405500);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_10000
     * @tc.name Date3Test_100
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test100Actual = Date.UTC(1200, 11, 31);
      expect(test100Actual).assertEqual(-24267340800000);
    });


    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_10200
     * @tc.name Date3Test_102
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test102Actual = Date.UTC(2024, 9, 31);
      expect(test102Actual).assertEqual(1730332800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_10300
     * @tc.name Date3Test_103
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test103Actual = Date.UTC(1968, 1, 29);
      expect(test103Actual).assertEqual(-58060800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_10400
     * @tc.name Date3Test_104
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test104Actual = Date.UTC(2024, 2, 0);
      expect(test104Actual).assertEqual(1709164800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_10500
     * @tc.name Date3Test_105
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test105Actual = Date.UTC(2024, 4, 20, -24);
      expect(test105Actual).assertEqual(1716076800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_10600
     * @tc.name Date3Test_106
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test106Actual = Date.UTC(80, 5, 15, 10, 20, 75);
      expect(test106Actual).assertEqual(329912475000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_10700
     * @tc.name Date3Test_107
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test107Actual = Date.UTC(2025, 5, 30);
      expect(test107Actual).assertEqual(1751241600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_10800
     * @tc.name Date3Test_108
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test108Actual = Date.UTC(2024, 4, 20, 20, -240);
      expect(test108Actual).assertEqual(1716220800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_10900
     * @tc.name Date3Test_109
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test109Actual = Date.UTC(2024, 4, 35, 14, -50);
      expect(test109Actual).assertEqual(1717506600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_11000
     * @tc.name Date3Test_110
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test110Actual = Date.UTC(2100, 1, 29);
      expect(test110Actual).assertEqual(4107542400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_11100
     * @tc.name Date3Test_111
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test111Actual = Date.UTC(1700, 1, 29);
      expect(test111Actual).assertEqual(-8515238400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_11200
     * @tc.name Date3Test_112
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test112Actual = Date.UTC(2024, 4, 20, 18, 75, 30, 2000);
      expect(test112Actual).assertEqual(1716232532000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_11300
     * @tc.name Date3Test_113
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test113Actual = Date.UTC(2027, -6, 18);
      expect(test113Actual).assertEqual(1784332800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_11400
     * @tc.name Date3Test_114
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test114Actual = Date.UTC(2024, 10, -25);
      expect(test114Actual).assertEqual(1728172800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_11500
     * @tc.name Date3Test_115
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test115Actual = Date.UTC(60, 3, 31);
      expect(test115Actual).assertEqual(-305164800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_11600
     * @tc.name Date3Test_116
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test116Actual = Date.UTC(2024, 11, 25, -18);
      expect(test116Actual).assertEqual(1735020000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_11700
     * @tc.name Date3Test_117
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test117Actual = Date.UTC(2028, 1, 29);
      expect(test117Actual).assertEqual(1835395200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_11800
     * @tc.name Date3Test_118
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test118Actual = Date.UTC(2024, 4, 20, 12, 15, -240);
      expect(test118Actual).assertEqual(1716207060000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_11900
     * @tc.name Date3Test_119
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test119Actual = Date.UTC(2024, 4, 20, 14, 30, 12, -3000);
      expect(test119Actual).assertEqual(1716215409000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_12000
     * @tc.name Date3Test_120
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test120Actual = Date.UTC(1300, 8, 30);
      expect(test120Actual).assertEqual(-21119616000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_12200
     * @tc.name Date3Test_122
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test122Actual = Date.UTC(2025, 8, 30);
      expect(test122Actual).assertEqual(1759190400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_12300
     * @tc.name Date3Test_123
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test123Actual = Date.UTC(1952, 1, 29);
      expect(test123Actual).assertEqual(-562982400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_12400
     * @tc.name Date3Test_124
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test124Actual = Date.UTC(2024, 4, 0);
      expect(test124Actual).assertEqual(1714435200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_12500
     * @tc.name Date3Test_125
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test125Actual = Date.UTC(2024, 4, 20, -30);
      expect(test125Actual).assertEqual(1716055200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_12600
     * @tc.name Date3Test_126
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test126Actual = Date.UTC(20, 11, 5, 28);
      expect(test126Actual).assertEqual(-1548532800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_12700
     * @tc.name Date3Test_127
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test127Actual = Date.UTC(2026, 4, 31);
      expect(test127Actual).assertEqual(1780185600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_12800
     * @tc.name Date3Test_128
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test128Actual = Date.UTC(2024, 4, 20, 22, -300);
      expect(test128Actual).assertEqual(1716224400000);
    });


    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_13000
     * @tc.name Date3Test_130
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test130Actual = Date.UTC(2200, 1, 29);
      expect(test130Actual).assertEqual(7263216000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_13100
     * @tc.name Date3Test_131
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test131Actual = Date.UTC(1800, 1, 28);
      expect(test131Actual).assertEqual(-5359651200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_13200
     * @tc.name Date3Test_132
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test132Actual = Date.UTC(2024, 4, 20, 9, 45, 100, 3500);
      expect(test132Actual).assertEqual(1716198403500);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_13400
     * @tc.name Date3Test_134
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test134Actual = Date.UTC(2024, 7, -30);
      expect(test134Actual).assertEqual(1719792000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_13600
     * @tc.name Date3Test_136
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test136Actual = Date.UTC(2024, 11, 10, -22);
      expect(test136Actual).assertEqual(1733709600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_13700
     * @tc.name Date3Test_137
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test137Actual = Date.UTC(2025, 3, 30);
      expect(test137Actual).assertEqual(1745971200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_13800
     * @tc.name Date3Test_138
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test138Actual = Date.UTC(2024, 4, 20, 15, 30, -300);
      expect(test138Actual).assertEqual(1716218700000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_13900
     * @tc.name Date3Test_139
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test139Actual = Date.UTC(2024, 4, 20, 14, 30, 15, -4000);
      expect(test139Actual).assertEqual(1716215411000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_14000
     * @tc.name Date3Test_140
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test140Actual = Date.UTC(1400, 5, 30);
      expect(test140Actual).assertEqual(-17971891200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_14200
     * @tc.name Date3Test_142
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test142Actual = Date.UTC(2025, 7, 31);
      expect(test142Actual).assertEqual(1756598400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_14300
     * @tc.name Date3Test_143
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test143Actual = Date.UTC(1944, 1, 29);
      expect(test143Actual).assertEqual(-815443200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_14400
     * @tc.name Date3Test_144
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test144Actual = Date.UTC(2024, 6, 0);
      expect(test144Actual).assertEqual(1719705600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_14500
     * @tc.name Date3Test_145
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test145Actual = Date.UTC(2024, 4, 20, -36);
      expect(test145Actual).assertEqual(1716033600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_14600
     * @tc.name Date3Test_146
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test146Actual = Date.UTC(35, 8, 20, 14, 50, 85);
      expect(test146Actual).assertEqual(-1081847315000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_14700
     * @tc.name Date3Test_147
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test147Actual = Date.UTC(2025, 10, 30);
      expect(test147Actual).assertEqual(1764460800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_14800
     * @tc.name Date3Test_148
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test148Actual = Date.UTC(2024, 4, 20, 18, -360);
      expect(test148Actual).assertEqual(1716206400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_14900
     * @tc.name Date3Test_149
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test149Actual = Date.UTC(2024, 4, 20, 28, 15, -70);
      expect(test149Actual).assertEqual(1716264830000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE3_TEST_15000
     * @tc.name Date3Test_150
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date3Test_150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const test150Actual = Date.UTC(2300, 1, 29);
      expect(test150Actual).assertEqual(10418889600000);
    });

  })
}