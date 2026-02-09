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

export default function Date7Test() {
  describe('Date7Test', () => {
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
     * @tc.number SUB_BUILTINS_Date7_TEST_0100
     * @tc.name Date7Test_001
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate1 = new Date(2020, 0, 1);
      testDate1.setUTCFullYear(2023);
      testDate1.setUTCMonth(11);
      testDate1.setUTCDate(25);
      expect(testDate1.getUTCFullYear()).assertEqual(2023);
      expect(testDate1.getUTCMonth()).assertEqual(11);
      expect(testDate1.getUTCDate()).assertEqual(25);
    });
    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_0200
     * @tc.name Date7Test_002
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate2 = new Date(2023, 11, 25, 23, 0, 0);
      testDate2.setUTCHours(24);
      expect(testDate2.getUTCDate()).assertEqual(26);
      expect(testDate2.getUTCHours()).assertEqual(0);
      expect(testDate2.getUTCMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_0300
     * @tc.name Date7Test_003
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDate3 = new Date();
      testDate3.setUTCFullYear(2024);
      testDate3.setUTCMonth(1);
      testDate3.setUTCDate(29);
      testDate3.setUTCHours(12);
      testDate3.setUTCMinutes(34);
      testDate3.setUTCSeconds(56);
      testDate3.setUTCMilliseconds(789);
      expect(testDate3.getUTCFullYear()).assertEqual(2024);
      expect(testDate3.getUTCMonth()).assertEqual(1);
      expect(testDate3.getUTCDate()).assertEqual(29);
      expect(testDate3.getUTCHours()).assertEqual(12);
      expect(testDate3.getUTCMinutes()).assertEqual(34);
      expect(testDate3.getUTCSeconds()).assertEqual(56);
      expect(testDate3.getUTCMilliseconds()).assertEqual(789);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_0400
     * @tc.name Date7Test_004
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date4 = new Date(2023, 10, 30);
      date4.setUTCMonth(11);
      date4.setUTCDate(31);
      expect(date4.getUTCMonth()).assertEqual(11);
      expect(date4.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_0500
     * @tc.name Date7Test_005
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date5 = new Date(2023, 11, 1);
      date5.setUTCMonth(12);
      expect(date5.getUTCFullYear()).assertEqual(2024);
      expect(date5.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_0600
     * @tc.name Date7Test_006
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date6 = new Date(2023, 11, 31);
      date6.setUTCMonth(3);
      expect(date6.getUTCMonth()).assertEqual(3);
      expect(date6.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_0700
     * @tc.name Date7Test_007
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date7 = new Date(2023, 11, 31, 22, 0);
      date7.setUTCHours(25);
      expect(date7.getUTCFullYear()).assertEqual(2024);
      expect(date7.getUTCMonth()).assertEqual(0);
      expect(date7.getUTCDate()).assertEqual(1);
      expect(date7.getUTCHours()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_0800
     * @tc.name Date7Test_008
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date8 = new Date(2023, 5, 15, 10, 50);
      date8.setUTCMinutes(70);
      expect(date8.getUTCHours()).assertEqual(3);
      expect(date8.getUTCMinutes()).assertEqual(10);
    });
    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_0900
     * @tc.name Date7Test_009
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date9 = new Date(2023, 3, 20, 15, 30, 45);
      date9.setUTCSeconds(300);
      expect(date9.getUTCMinutes()).assertEqual(35);
      expect(date9.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_1000
     * @tc.name Date7Test_010
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date10 = new Date(2023, 8, 5, 8, 12, 34, 500);
      date10.setUTCMilliseconds(1600);
      expect(date10.getUTCSeconds()).assertEqual(35);
      expect(date10.getUTCMilliseconds()).assertEqual(600);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_1100
     * @tc.name Date7Test_011
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date11 = new Date();
      date11.setUTCFullYear(-500);
      expect(date11.getUTCFullYear()).assertEqual(-500);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_1200
     * @tc.name Date7Test_012
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date12 = new Date(2023, 3, 1);
      date12.setUTCMonth(-1);
      expect(date12.getUTCFullYear()).assertEqual(2022);
      expect(date12.getUTCMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_1300
     * @tc.name Date7Test_013
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date13 = new Date(2023, 4, 1);
      date13.setUTCDate(0);
      expect(date13.getUTCMonth()).assertEqual(2);
      expect(date13.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_1400
     * @tc.name Date7Test_014
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date14 = new Date(2023, 6, 10, 2, 0);
      date14.setUTCHours(-1);
      expect(date14.getUTCDate()).assertEqual(8);
      expect(date14.getUTCHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_1500
     * @tc.name Date7Test_015
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date15 = new Date(2020, 11, 31, 23, 59, 59, 999);
      date15.setUTCFullYear(2024);
      date15.setUTCMonth(1);
      date15.setUTCDate(29);
      date15.setUTCHours(23);
      date15.setUTCMinutes(59);
      date15.setUTCSeconds(59);
      date15.setUTCMilliseconds(999);
      expect(date15.getUTCFullYear()).assertEqual(2024);
      expect(date15.getUTCMonth()).assertEqual(2);
      expect(date15.getUTCDate()).assertEqual(29);
      expect(date15.getUTCHours()).assertEqual(23);
      expect(date15.getUTCMinutes()).assertEqual(59);
      expect(date15.getUTCSeconds()).assertEqual(59);
      expect(date15.getUTCMilliseconds()).assertEqual(999);
    });
    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_1600
     * @tc.name Date7Test_016
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date16 = new Date(2023, 0, 1);
      date16.setUTCDate(32);
      expect(date16.getUTCMonth()).assertEqual(0);
      expect(date16.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_1700
     * @tc.name Date7Test_017
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date17 = new Date(2023, 5, 10, 10, 15);
      date17.setUTCMinutes(-30);
      expect(date17.getUTCHours()).assertEqual(1);
      expect(date17.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_1800
     * @tc.name Date7Test_018
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date18 = new Date(2023, 8, 20, 14, 30, 20);
      date18.setUTCSeconds(-60);
      expect(date18.getUTCMinutes()).assertEqual(29);
      expect(date18.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_1900
     * @tc.name Date7Test_019
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date19 = new Date(2023, 3, 5, 8, 10, 30, 200);
      date19.setUTCMilliseconds(-500);
      expect(date19.getUTCSeconds()).assertEqual(29);
      expect(date19.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_2000
     * @tc.name Date7Test_020
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date20 = new Date();
      date20.setUTCFullYear(1999);
      date20.setUTCMonth(11);
      date20.setUTCDate(31);
      date20.setUTCHours(23);
      date20.setUTCMinutes(59);
      date20.setUTCSeconds(59);
      date20.setUTCMilliseconds(999);
      date20.setUTCSeconds(2);
      expect(date20.getUTCFullYear()).assertEqual(1999);
      expect(date20.getUTCMonth()).assertEqual(11);
      expect(date20.getUTCDate()).assertEqual(31);
      expect(date20.getUTCSeconds()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_2100
     * @tc.name Date7Test_021
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date21 = new Date(2023, 0, 1);
      date21.setUTCMonth(15);
      expect(date21.getUTCFullYear()).assertEqual(2023);
      expect(date21.getUTCMonth()).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_2200
     * @tc.name Date7Test_022
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date22 = new Date(2023, 1, 1);
      date22.setUTCDate(50);
      expect(date22.getUTCMonth()).assertEqual(1);
      expect(date22.getUTCDate()).assertEqual(19);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_2300
     * @tc.name Date7Test_023
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date23 = new Date(2023, 5, 1);
      date23.setUTCHours(100);
      expect(date23.getUTCDate()).assertEqual(4);
      expect(date23.getUTCHours()).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_2400
     * @tc.name Date7Test_024
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date24 = new Date(2023, 7, 10, 0, 0);
      date24.setUTCMinutes(1000);
      expect(date24.getUTCHours()).assertEqual(8);
      expect(date24.getUTCMinutes()).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_2500
     * @tc.name Date7Test_025
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date25 = new Date(2023, 9, 5, 10, 0, 0);
      date25.setUTCSeconds(10000);
      expect(date25.getUTCHours()).assertEqual(4);
      expect(date25.getUTCMinutes()).assertEqual(46);
      expect(date25.getUTCSeconds()).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_2600
     * @tc.name Date7Test_026
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date26 = new Date(2023, 11, 25, 15, 30, 0, 0);
      date26.setUTCMilliseconds(1000000);
      expect(date26.getUTCMinutes()).assertEqual(46);
      expect(date26.getUTCSeconds()).assertEqual(40);
      expect(date26.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_2700
     * @tc.name Date7Test_027
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date27 = new Date();
      date27.setUTCFullYear(2010);
      date27.setUTCMonth(5);
      date27.setUTCDate(15);
      date27.setUTCHours(9);
      date27.setUTCMinutes(30);
      date27.setUTCSeconds(45);
      date27.setUTCMilliseconds(500);
      expect(date27.getUTCFullYear()).assertEqual(2010);
      expect(date27.getUTCMonth()).assertEqual(5);
      expect(date27.getUTCDate()).assertEqual(15);
      expect(date27.getUTCHours()).assertEqual(9);
      expect(date27.getUTCMinutes()).assertEqual(30);
      expect(date27.getUTCSeconds()).assertEqual(45);
      expect(date27.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_2800
     * @tc.name Date7Test_028
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date28 = new Date(2023, 1, 1);
      date28.setUTCDate(29);
      expect(date28.getUTCMonth()).assertEqual(0);
      expect(date28.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_2900
     * @tc.name Date7Test_029
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date29 = new Date();
      date29.setUTCFullYear(0);
      expect(date29.getUTCFullYear()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_3000
     * @tc.name Date7Test_030
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date30 = new Date();
      date30.setUTCFullYear(9999);
      expect(date30.getUTCFullYear()).assertEqual(9999);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_3100
     * @tc.name Date7Test_031
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date31 = new Date(2023, 5, 1);
      date31.setUTCDate(-1);
      expect(date31.getUTCMonth()).assertEqual(3);
      expect(date31.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_3200
     * @tc.name Date7Test_032
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date32 = new Date(2023, 8, 10);
      date32.setUTCHours(-24);
      expect(date32.getUTCMonth()).assertEqual(8);
      expect(date32.getUTCDate()).assertEqual(8);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_3300
     * @tc.name Date7Test_033
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date33 = new Date(2023, 11, 24, 10, 0);
      date33.setUTCMinutes(1440);
      expect(date33.getUTCDate()).assertEqual(25);
      expect(date33.getUTCHours()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_3400
     * @tc.name Date7Test_034
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date34 = new Date(2023, 0, 1, 0, 0, 0);
      date34.setUTCSeconds(86400);
      expect(date34.getUTCMonth()).assertEqual(0);
      expect(date34.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_3500
     * @tc.name Date7Test_035
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date35 = new Date(2023, 3, 30, 12, 0, 0, 0);
      date35.setUTCMilliseconds(86400000);
      expect(date35.getUTCMonth()).assertEqual(4);
      expect(date35.getUTCDate()).assertEqual(1);
      expect(date35.getUTCHours()).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_3600
     * @tc.name Date7Test_036
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date36 = new Date();
      date36.setUTCFullYear(10000);
      expect(date36.getUTCFullYear()).assertEqual(10000);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_3700
     * @tc.name Date7Test_037
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date37 = new Date(2023, 0, 1);
      date37.setUTCMonth(-12);
      expect(date37.getUTCFullYear()).assertEqual(2021);
      expect(date37.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_3800
     * @tc.name Date7Test_038
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date38 = new Date(2023, 2, 12);
      date38.setUTCHours(2);
      date38.setUTCMinutes(0);
      expect(date38.getUTCHours()).assertEqual(2);
      expect(date38.getUTCMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_3900
     * @tc.name Date7Test_039
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date39 = new Date(2023, 0, 1);
      date39.setUTCDate(15);
      date39.setUTCDate(20);
      date39.setUTCDate(25);
      expect(date39.getUTCDate()).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_4000
     * @tc.name Date7Test_040
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date40 = new Date();
      date40.setUTCFullYear(2050);
      expect(date40.getUTCFullYear()).assertEqual(2050);
      date40.setUTCMonth(10);
      expect(date40.getUTCMonth()).assertEqual(10);
      date40.setUTCDate(11);
      expect(date40.getUTCDate()).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_4100
     * @tc.name Date7Test_041
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date41 = new Date(2023, 1, 28);
      date41.setUTCDate(date41.getUTCDate() + 2);
      expect(date41.getUTCMonth()).assertEqual(2);
      expect(date41.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_4200
     * @tc.name Date7Test_042
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date42 = new Date(2024, 1, 28);
      date42.setUTCDate(date42.getUTCDate() + 1);
      expect(date42.getUTCMonth()).assertEqual(1);
      expect(date42.getUTCDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_4300
     * @tc.name Date7Test_043
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date43 = new Date(2023, 5, 10, 15, 30, 45, 123);
      date43.setUTCMilliseconds(456);
      expect(date43.getUTCMilliseconds()).assertEqual(456);
      date43.setUTCMilliseconds(999);
      expect(date43.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_4400
     * @tc.name Date7Test_044
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date44 = new Date(2023, 0, 1, 0, 0, 0, 0);
      date44.setUTCMilliseconds(123456789);
      expect(date44.getUTCFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_4500
     * @tc.name Date7Test_045
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date45 = new Date(2023, 6, 1);
      date45.setUTCMonth(-1);
      date45.setUTCDate(31);
      date45.setUTCHours(25);
      expect(date45.getUTCFullYear()).assertEqual(2023);
      expect(date45.getUTCMonth()).assertEqual(0);
      expect(date45.getUTCDate()).assertEqual(1);
      expect(date45.getUTCHours()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_4600
     * @tc.name Date7Test_046
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date46 = new Date(2023, 0, 1);
      date46.setUTCDate(365);
      expect(date46.getUTCFullYear()).assertEqual(2023);
      expect(date46.getUTCMonth()).assertEqual(10);
      expect(date46.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_4700
     * @tc.name Date7Test_047
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date47 = new Date(2024, 0, 1);
      date47.setUTCDate(366);
      expect(date47.getUTCFullYear()).assertEqual(2024);
      expect(date47.getUTCMonth()).assertEqual(10);
      expect(date47.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_4800
     * @tc.name Date7Test_048
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date48 = new Date(2023, 5, 10);
      date48.setUTCHours(-100);
      expect(date48.getUTCDate()).assertEqual(4);
      expect(date48.getUTCHours()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_4900
     * @tc.name Date7Test_049
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date49 = new Date(2023, 11, 25);
      date49.setUTCMinutes(-1440);
      expect(date49.getUTCDate()).assertEqual(23);
      expect(date49.getUTCHours()).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_5000
     * @tc.name Date7Test_050
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date50 = new Date(2023, 0, 1);
      date50.setUTCSeconds(-86400);
      expect(date50.getUTCMonth()).assertEqual(11);
      expect(date50.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_5100
     * @tc.name Date7Test_051
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date51 = new Date(2023, 3, 1);
      date51.setUTCMilliseconds(-86400000);
      expect(date51.getUTCMonth()).assertEqual(2);
      expect(date51.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_5200
     * @tc.name Date7Test_052
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date52 = new Date(2023, 0, 1);
      date52.setUTCMonth(100);
      expect(date52.getUTCFullYear()).assertEqual(2030);
      expect(date52.getUTCMonth()).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_5300
     * @tc.name Date7Test_053
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date53 = new Date(2023, 0, 1);
      date53.setUTCMonth(-100);
      expect(date53.getUTCFullYear()).assertEqual(2013);
      expect(date53.getUTCMonth()).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_5400
     * @tc.name Date7Test_054
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date54 = new Date(2023, 0, 1);
      date54.setUTCDate(1000);
      expect(date54.getUTCFullYear()).assertEqual(2025);
      expect(date54.getUTCMonth()).assertEqual(7);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_5500
     * @tc.name Date7Test_055
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date55 = new Date(2023, 0, 1);
      date55.setUTCDate(-1000);
      expect(date55.getUTCFullYear()).assertEqual(2020);
      expect(date55.getUTCMonth()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_5600
     * @tc.name Date7Test_056
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date56 = new Date(2023, 5, 15);
      date56.setUTCHours(10);
      date56.setUTCMinutes(20);
      date56.setUTCSeconds(30);
      date56.setUTCMilliseconds(400);
      expect(date56.getUTCHours()).assertEqual(10);
      expect(date56.getUTCMinutes()).assertEqual(20);
      expect(date56.getUTCSeconds()).assertEqual(30);
      expect(date56.getUTCMilliseconds()).assertEqual(400);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_5700
     * @tc.name Date7Test_057
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date57 = new Date(2023, 5, 15, 0, 0, 0, 0);
      date57.setUTCHours(1);
      date57.setUTCMinutes(date57.getUTCMinutes() + 30);
      date57.setUTCSeconds(date57.getUTCSeconds() + 45);
      date57.setUTCMilliseconds(date57.getUTCMilliseconds() + 500);
      expect(date57.getUTCHours()).assertEqual(1);
      expect(date57.getUTCMinutes()).assertEqual(30);
      expect(date57.getUTCSeconds()).assertEqual(45);
      expect(date57.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_5800
     * @tc.name Date7Test_058
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date58 = new Date(2023, 1, 28, 23, 0);
      date58.setUTCHours(date58.getUTCHours() + 2);
      expect(date58.getUTCMonth()).assertEqual(1);
      expect(date58.getUTCDate()).assertEqual(28);
      expect(date58.getUTCHours()).assertEqual(17);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_5900
     * @tc.name Date7Test_059
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date59 = new Date(2023, 4, 31, 23, 50);
      date59.setUTCMinutes(date59.getUTCMinutes() + 20);
      expect(date59.getUTCMonth()).assertEqual(4);
      expect(date59.getUTCDate()).assertEqual(31);
      expect(date59.getUTCHours()).assertEqual(16);
      expect(date59.getUTCMinutes()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_6000
     * @tc.name Date7Test_060
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date60 = new Date(2023, 5, 10, 15, 59, 30);
      date60.setUTCSeconds(date60.getUTCSeconds() + 40);
      expect(date60.getUTCHours()).assertEqual(8);
      expect(date60.getUTCMinutes()).assertEqual(0);
      expect(date60.getUTCSeconds()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_6100
     * @tc.name Date7Test_061
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date61 = new Date(2023, 5, 10, 15, 30, 45, 800);
      date61.setUTCMilliseconds(date61.getUTCMilliseconds() + 300);
      expect(date61.getUTCSeconds()).assertEqual(46);
      expect(date61.getUTCMilliseconds()).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_6200
     * @tc.name Date7Test_062
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date62 = new Date(2023, 0, 1);
      date62.setUTCDate(366);
      expect(date62.getUTCFullYear()).assertEqual(2023);
      expect(date62.getUTCMonth()).assertEqual(11);
      expect(date62.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_6300
     * @tc.name Date7Test_063
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date63 = new Date(1999, 11, 31, 23, 59, 59);
      date63.setUTCSeconds(date63.getUTCSeconds() + 2);
      expect(date63.getUTCFullYear()).assertEqual(1999);
      expect(date63.getUTCMonth()).assertEqual(11);
      expect(date63.getUTCDate()).assertEqual(31);
      expect(date63.getUTCSeconds()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_6400
     * @tc.name Date7Test_064
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date64 = new Date(2023, 0, 1);
      date64.setUTCDate(0);
      expect(date64.getUTCFullYear()).assertEqual(2022);
      expect(date64.getUTCMonth()).assertEqual(10);
      expect(date64.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_6500
     * @tc.name Date7Test_065
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date65 = new Date(2023, 2, 1);
      date65.setUTCDate(0);
      expect(date65.getUTCMonth()).assertEqual(0);
      expect(date65.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_6600
     * @tc.name Date7Test_066
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date66 = new Date(2023, 10, 1);
      date66.setUTCDate(31);
      expect(date66.getUTCMonth()).assertEqual(9);
      expect(date66.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_6700
     * @tc.name Date7Test_067
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date67 = new Date(2023, 5, 10);
      date67.setUTCHours(48);
      expect(date67.getUTCDate()).assertEqual(11);
      expect(date67.getUTCHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_6800
     * @tc.name Date7Test_068
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date68 = new Date(2023, 11, 25);
      date68.setUTCMinutes(-2880);
      expect(date68.getUTCDate()).assertEqual(22);
      expect(date68.getUTCHours()).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_6900
     * @tc.name Date7Test_069
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date69 = new Date(2023, 0, 1);
      date69.setUTCSeconds(172800);
      expect(date69.getUTCDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_7000
     * @tc.name Date7Test_070
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date70 = new Date(2023, 3, 1);
      date70.setUTCMilliseconds(172800000);
      expect(date70.getUTCDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_7100
     * @tc.name Date7Test_071
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date71 = new Date();
      date71.setUTCFullYear(2000);
      date71.setUTCMonth(1);
      date71.setUTCDate(29);
      expect(date71.getUTCFullYear()).assertEqual(2000);
      expect(date71.getUTCMonth()).assertEqual(1);
      expect(date71.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_7200
     * @tc.name Date7Test_072
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date72 = new Date(2000, 1, 29);
      date72.setUTCFullYear(2001);
      expect(date72.getUTCMonth()).assertEqual(1);
      expect(date72.getUTCDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_7300
     * @tc.name Date7Test_073
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date73 = new Date(2023, 5, 10, 12, 0);
      date73.setUTCHours(date73.getUTCHours() + 12);
      expect(date73.getUTCHours()).assertEqual(16);
      expect(date73.getUTCDate()).assertEqual(10);
    });


    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_7400
     * @tc.name Date7Test_074
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date74 = new Date(2023, 5, 10, 10, 30);
      date74.setUTCMinutes(date74.getUTCMinutes() - 60);
      expect(date74.getUTCHours()).assertEqual(1);
      expect(date74.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_7500
     * @tc.name Date7Test_075
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date75 = new Date(2023, 5, 10, 10, 30, 15);
      date75.setUTCSeconds(date75.getUTCSeconds() + 100);
      expect(date75.getUTCMinutes()).assertEqual(31);
      expect(date75.getUTCSeconds()).assertEqual(55);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_7600
     * @tc.name Date7Test_076
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date76 = new Date(2023, 5, 10, 10, 30, 15, 500);
      date76.setUTCMilliseconds(date76.getUTCMilliseconds() + 600);
      expect(date76.getUTCSeconds()).assertEqual(16);
      expect(date76.getUTCMilliseconds()).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_7700
     * @tc.name Date7Test_077
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date77 = new Date(2023, 0, 31);
      date77.setUTCMonth(1);
      expect(date77.getUTCMonth()).assertEqual(2);
      expect(date77.getUTCDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_7800
     * @tc.name Date7Test_078
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date78 = new Date(2023, 0, 1);
      date78.setUTCDate(32);
      date78.setUTCDate(date78.getUTCDate() + 28);
      expect(date78.getUTCMonth()).assertEqual(0);
      expect(date78.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_7900
     * @tc.name Date7Test_079
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date79 = new Date();
      date79.setUTCHours(23);
      date79.setUTCMinutes(59);
      date79.setUTCSeconds(59);
      date79.setUTCMilliseconds(999);
      expect(date79.getUTCHours()).assertEqual(23);
      expect(date79.getUTCMinutes()).assertEqual(59);
      expect(date79.getUTCSeconds()).assertEqual(59);
      expect(date79.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_8000
     * @tc.name Date7Test_080
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date80 = new Date(2023, 5, 10, 23, 59, 59, 999);
      date80.setUTCMilliseconds(1000);
      expect(date80.getUTCDate()).assertEqual(10);
      expect(date80.getUTCHours()).assertEqual(16);
      expect(date80.getUTCMinutes()).assertEqual(0);
      expect(date80.getUTCSeconds()).assertEqual(0);
      expect(date80.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_8100
     * @tc.name Date7Test_081
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date81 = new Date();
      date81.setUTCFullYear(1);
      expect(date81.getUTCFullYear()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_8200
     * @tc.name Date7Test_082
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date82 = new Date();
      date82.setUTCFullYear(999);
      expect(date82.getUTCFullYear()).assertEqual(999);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_8300
     * @tc.name Date7Test_083
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date83 = new Date(2023, 11, 1);
      date83.setUTCDate(31);
      expect(date83.getUTCDate()).assertEqual(1);
      date83.setUTCDate(date83.getUTCDate() + 1);
      expect(date83.getUTCFullYear()).assertEqual(2023);
      expect(date83.getUTCMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_8400
     * @tc.name Date7Test_084
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date84 = new Date();
      date84.setUTCFullYear(2030);
      date84.setUTCMonth(6);
      date84.setUTCDate(15);
      date84.setUTCHours(18);
      date84.setUTCMinutes(45);
      date84.setUTCSeconds(30);
      date84.setUTCMilliseconds(500);
      expect(date84.getUTCFullYear()).assertEqual(2030);
      expect(date84.getUTCMonth()).assertEqual(6);
      expect(date84.getUTCDate()).assertEqual(15);
      expect(date84.getUTCHours()).assertEqual(18);
      expect(date84.getUTCMinutes()).assertEqual(45);
      expect(date84.getUTCSeconds()).assertEqual(30);
      expect(date84.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_8600
     * @tc.name Date7Test_086
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date86 = new Date(2023, 3, 30);
      date86.setUTCMonth(4);
      expect(date86.getUTCMonth()).assertEqual(4);
      expect(date86.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_8700
     * @tc.name Date7Test_087
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date87 = new Date(2023, 5, 10, 0, 0);
      date87.setUTCHours(-1);
      expect(date87.getUTCDate()).assertEqual(8);
      expect(date87.getUTCHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_8800
     * @tc.name Date7Test_088
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date88 = new Date(2023, 5, 10, 10, 0);
      date88.setUTCMinutes(-1);
      expect(date88.getUTCHours()).assertEqual(1);
      expect(date88.getUTCMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_8900
     * @tc.name Date7Test_089
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date89 = new Date(2023, 5, 10, 10, 30, 0);
      date89.setUTCSeconds(-1);
      expect(date89.getUTCMinutes()).assertEqual(29);
      expect(date89.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_9000
     * @tc.name Date7Test_090
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date90 = new Date(2023, 5, 10, 10, 30, 45, 0);
      date90.setUTCMilliseconds(-1);
      expect(date90.getUTCSeconds()).assertEqual(44);
      expect(date90.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_9100
     * @tc.name Date7Test_091
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date91 = new Date(2023, 11, 1);
      date91.setUTCMonth(13);
      expect(date91.getUTCFullYear()).assertEqual(2024);
      expect(date91.getUTCMonth()).assertEqual(2);
    });


    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_9200
     * @tc.name Date7Test_092
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date92 = new Date(2023, 4, 31);
      date92.setUTCMonth(5);
      expect(date92.getUTCMonth()).assertEqual(5);
      expect(date92.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_9300
     * @tc.name Date7Test_093
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date93 = new Date(2024, 1, 1);
      date93.setUTCDate(29);
      expect(date93.getUTCMonth()).assertEqual(0);
      expect(date93.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_9400
     * @tc.name Date7Test_094
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date94 = new Date(2025, 1, 1);
      date94.setUTCDate(28);
      expect(date94.getUTCMonth()).assertEqual(0);
      expect(date94.getUTCDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_9500
     * @tc.name Date7Test_095
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date95 = new Date(2023, 5, 10);
      date95.setUTCHours(14);
      expect(date95.getUTCHours()).assertEqual(14);
      date95.setUTCHours(2);
      expect(date95.getUTCHours()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_9600
     * @tc.name Date7Test_096
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date96 = new Date();
      date96.setUTCFullYear(2026);
      date96.setUTCMonth(8);
      date96.setUTCDate(10);
      date96.setUTCHours(9);
      date96.setUTCMinutes(8);
      date96.setUTCSeconds(7);
      date96.setUTCMilliseconds(6);
      expect(date96.getUTCFullYear()).assertEqual(2026);
      expect(date96.getUTCMonth()).assertEqual(8);
      expect(date96.getUTCDate()).assertEqual(10);
      expect(date96.getUTCHours()).assertEqual(9);
      expect(date96.getUTCMinutes()).assertEqual(8);
      expect(date96.getUTCSeconds()).assertEqual(7);
      expect(date96.getUTCMilliseconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_9700
     * @tc.name Date7Test_097
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date97 = new Date(2023, 5, 1);
      date97.setUTCDate(date97.getUTCDate() - 1);
      expect(date97.getUTCMonth()).assertEqual(4);
      expect(date97.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_9800
     * @tc.name Date7Test_098
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date98 = new Date();
      date98.setUTCFullYear(0);
      date98.setUTCMonth(1);
      date98.setUTCDate(28);
      expect(date98.getUTCFullYear()).assertEqual(0);
      expect(date98.getUTCMonth()).assertEqual(1);
      expect(date98.getUTCDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_9900
     * @tc.name Date7Test_099
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date99 = new Date(2023, 5, 10);
      date99.setUTCHours(50);
      expect(date99.getUTCDate()).assertEqual(11);
      expect(date99.getUTCHours()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_10000
     * @tc.name Date7Test_100
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date100 = new Date(2023, 5, 10, 0, 0);
      date100.setUTCMinutes(3000);
      expect(date100.getUTCDate()).assertEqual(11);
      expect(date100.getUTCHours()).assertEqual(18);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_10100
     * @tc.name Date7Test_101
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date101 = new Date(2023, 5, 10, 0, 0, 0);
      date101.setUTCSeconds(180000);
      expect(date101.getUTCDate()).assertEqual(11);
      expect(date101.getUTCHours()).assertEqual(18);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_10200
     * @tc.name Date7Test_102
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date102 = new Date(2023, 5, 10, 0, 0, 0, 0);
      date102.setUTCMilliseconds(180000000);
      expect(date102.getUTCDate()).assertEqual(11);
      expect(date102.getUTCHours()).assertEqual(18);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_10300
     * @tc.name Date7Test_103
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date103 = new Date(2023, 0, 1);
      date103.setUTCDate(1095);
      expect(date103.getUTCFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_10400
     * @tc.name Date7Test_104
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date104 = new Date(2023, 11, 31);
      date104.setUTCDate(date104.getUTCDate() + 1);
      expect(date104.getUTCFullYear()).assertEqual(2023);
      expect(date104.getUTCMonth()).assertEqual(11);
      expect(date104.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_10500
     * @tc.name Date7Test_105
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date105 = new Date(2023, 5, 10, 12, 30, 45);
      date105.setUTCHours(date105.getUTCHours() - 15);
      date105.setUTCMinutes(date105.getUTCMinutes() - 40);
      expect(date105.getUTCDate()).assertEqual(9);
      expect(date105.getUTCHours()).assertEqual(12);
      expect(date105.getUTCMinutes()).assertEqual(50);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_10600
     * @tc.name Date7Test_106
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date106 = new Date(2023, 0, 31);
      date106.setUTCMonth(1);
      expect(date106.getUTCMonth()).assertEqual(2);
      expect(date106.getUTCDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_10700
     * @tc.name Date7Test_107
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date107 = new Date(2023, 5, 10, 10, 0);
      date107.setUTCHours(30);
      expect(date107.getUTCDate()).assertEqual(11);
      expect(date107.getUTCHours()).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_10800
     * @tc.name Date7Test_108
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date108 = new Date(2023, 5, 10, 10, 0);
      date108.setUTCMinutes(-150);
      expect(date108.getUTCHours()).assertEqual(23);
      expect(date108.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_10900
     * @tc.name Date7Test_109
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date109 = new Date(2023, 5, 10, 10, 30, 0);
      date109.setUTCSeconds(-1500);
      expect(date109.getUTCMinutes()).assertEqual(5);
      expect(date109.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_11000
     * @tc.name Date7Test_110
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date110 = new Date(2023, 5, 10, 10, 30, 0, 0);
      date110.setUTCMilliseconds(-1500000);
      expect(date110.getUTCMinutes()).assertEqual(5);
      expect(date110.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_11100
     * @tc.name Date7Test_111
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date111 = new Date(2023, 0, 1);
      date111.setUTCMonth(50);
      expect(date111.getUTCFullYear()).assertEqual(2026);
      expect(date111.getUTCMonth()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_11200
     * @tc.name Date7Test_112
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date112 = new Date(2023, 0, 1);
      date112.setUTCDate(-365);
      expect(date112.getUTCFullYear()).assertEqual(2021);
      expect(date112.getUTCMonth()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_11300
     * @tc.name Date7Test_113
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date113 = new Date(2024, 1, 29);
      date113.setUTCFullYear(date113.getUTCFullYear() + 1);
      expect(date113.getUTCFullYear()).assertEqual(2025);
      expect(date113.getUTCMonth()).assertEqual(1);
      expect(date113.getUTCDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_11400
     * @tc.name Date7Test_114
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date114 = new Date(2023, 5, 1);
      date114.setUTCMonth(5);
      date114.setUTCMonth(5);
      expect(date114.getUTCMonth()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_11500
     * @tc.name Date7Test_115
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date115 = new Date(2023, 5, 10, 15, 30, 45, 600);
      date115.setUTCHours(0);
      date115.setUTCMinutes(0);
      date115.setUTCSeconds(0);
      date115.setUTCMilliseconds(0);
      expect(date115.getUTCHours()).assertEqual(0);
      expect(date115.getUTCMinutes()).assertEqual(0);
      expect(date115.getUTCSeconds()).assertEqual(0);
      expect(date115.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_11600
     * @tc.name Date7Test_116
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date116 = new Date(2023, 3, 30);
      date116.setUTCDate(date116.getUTCDate() + 1);
      expect(date116.getUTCMonth()).assertEqual(3);
      expect(date116.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_11700
     * @tc.name Date7Test_117
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date117 = new Date(2023, 5, 10, 12, 0);
      date117.setUTCHours(date117.getUTCHours() - 24);
      expect(date117.getUTCDate()).assertEqual(9);
      expect(date117.getUTCHours()).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_11800
     * @tc.name Date7Test_118
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date118 = new Date(2023, 5, 10, 0, 30);
      date118.setUTCMinutes(date118.getUTCMinutes() + 1440);
      expect(date118.getUTCDate()).assertEqual(10);
      expect(date118.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_11900
     * @tc.name Date7Test_119
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date119 = new Date(2023, 5, 10, 0, 0, 15);
      date119.setUTCSeconds(date119.getUTCSeconds() + 86400);
      expect(date119.getUTCDate()).assertEqual(10);
      expect(date119.getUTCSeconds()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_12000
     * @tc.name Date7Test_120
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date120 = new Date(2023, 5, 10, 0, 0, 0, 500);
      date120.setUTCMilliseconds(date120.getUTCMilliseconds() + 86400000);
      expect(date120.getUTCDate()).assertEqual(10);
      expect(date120.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_12100
     * @tc.name Date7Test_121
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date121 = new Date();
      date121.setUTCFullYear(2000);
      date121.setUTCMonth(2);
      date121.setUTCDate(1);
      expect(date121.getUTCFullYear()).assertEqual(2000);
      expect(date121.getUTCMonth()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_12200
     * @tc.name Date7Test_122
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date122 = new Date(2023, 0, 1);
      date122.setUTCDate(date122.getUTCDate() - 1);
      expect(date122.getUTCFullYear()).assertEqual(2022);
      expect(date122.getUTCMonth()).assertEqual(11);
      expect(date122.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_12300
     * @tc.name Date7Test_123
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date123 = new Date(2023, 5, 10, 23, 0);
      date123.setUTCHours(date123.getUTCHours() + 2);
      expect(date123.getUTCDate()).assertEqual(10);
      expect(date123.getUTCHours()).assertEqual(17);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_12400
     * @tc.name Date7Test_124
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date124 = new Date(2023, 5, 10, 10, 59, 0);
      date124.setUTCMinutes(date124.getUTCMinutes() + 2);
      expect(date124.getUTCHours()).assertEqual(3);
      expect(date124.getUTCMinutes()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_12500
     * @tc.name Date7Test_125
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date125 = new Date(2023, 5, 10, 10, 30, 59);
      date125.setUTCSeconds(date125.getUTCSeconds() + 2);
      expect(date125.getUTCMinutes()).assertEqual(31);
      expect(date125.getUTCSeconds()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_12600
     * @tc.name Date7Test_126
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date126 = new Date(2023, 1, 28);
      date126.setUTCMonth(2);
      expect(date126.getUTCMonth()).assertEqual(2);
      expect(date126.getUTCDate()).assertEqual(27);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_12700
     * @tc.name Date7Test_127
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date127 = new Date(2023, 5, 10);
      date127.setUTCHours(-48);
      expect(date127.getUTCDate()).assertEqual(7);
      expect(date127.getUTCHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_12800
     * @tc.name Date7Test_128
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date128 = new Date(2023, 5, 10, 0, 0);
      date128.setUTCMinutes(2880);
      expect(date128.getUTCDate()).assertEqual(11);
      expect(date128.getUTCHours()).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_12900
     * @tc.name Date7Test_129
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date129 = new Date(2023, 5, 10, 0, 0, 0);
      date129.setUTCSeconds(172800);
      expect(date129.getUTCDate()).assertEqual(11);
      expect(date129.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_13000
     * @tc.name Date7Test_130
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date130 = new Date(2023, 5, 10, 0, 0, 0, 0);
      date130.setUTCMilliseconds(172800000);
      expect(date130.getUTCDate()).assertEqual(11);
      expect(date130.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_13100
     * @tc.name Date7Test_131
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date131 = new Date(2023, 0, 1);
      date131.setUTCMonth(-6);
      expect(date131.getUTCFullYear()).assertEqual(2021);
      expect(date131.getUTCMonth()).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_13200
     * @tc.name Date7Test_132
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date132 = new Date(2024, 0, 1);
      date132.setUTCDate(366);
      expect(date132.getUTCFullYear()).assertEqual(2024);
      expect(date132.getUTCMonth()).assertEqual(10);
      expect(date132.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_13300
     * @tc.name Date7Test_133
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date133 = new Date(2023, 1, 28);
      date133.setUTCFullYear(2024);
      expect(date133.getUTCMonth()).assertEqual(1);
      expect(date133.getUTCDate()).assertEqual(27);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_13400
     * @tc.name Date7Test_134
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date134 = new Date(2023, 5, 10);
      date134.setUTCMonth(5);
      expect(date134.getUTCMonth()).assertEqual(5);
      expect(date134.getUTCDate()).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_13500
     * @tc.name Date7Test_135
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date135 = new Date(2023, 5, 10, 23, 59, 59, 999);
      date135.setUTCMilliseconds(date135.getUTCMilliseconds() + 2);
      expect(date135.getUTCDate()).assertEqual(10);
      expect(date135.getUTCHours()).assertEqual(16);
      expect(date135.getUTCMilliseconds()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_13600
     * @tc.name Date7Test_136
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date136 = new Date(2023, 4, 31);
      date136.setUTCDate(date136.getUTCDate() + 1);
      expect(date136.getUTCMonth()).assertEqual(4);
      expect(date136.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_13700
     * @tc.name Date7Test_137
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date137 = new Date(2023, 5, 10, 12, 0);
      date137.setUTCHours(date137.getUTCHours() + 48);
      expect(date137.getUTCDate()).assertEqual(12);
      expect(date137.getUTCHours()).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_13800
     * @tc.name Date7Test_138
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date138 = new Date(2023, 5, 10, 0, 30);
      date138.setUTCMinutes(date138.getUTCMinutes() - 2880);
      expect(date138.getUTCDate()).assertEqual(7);
      expect(date138.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_13900
     * @tc.name Date7Test_139
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date139 = new Date(2023, 5, 10, 0, 0, 15);
      date139.setUTCSeconds(date139.getUTCSeconds() - 172800);
      expect(date139.getUTCDate()).assertEqual(7);
      expect(date139.getUTCSeconds()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_14000
     * @tc.name Date7Test_140
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date140 = new Date(2023, 5, 10, 0, 0, 0, 500);
      date140.setUTCMilliseconds(date140.getUTCMilliseconds() - 172800000);
      expect(date140.getUTCDate()).assertEqual(7);
      expect(date140.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_14100
     * @tc.name Date7Test_141
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date141 = new Date();
      date141.setUTCFullYear(1900);
      date141.setUTCMonth(1);
      date141.setUTCDate(28);
      expect(date141.getUTCFullYear()).assertEqual(1900);
      expect(date141.getUTCMonth()).assertEqual(1);
      expect(date141.getUTCDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_14200
     * @tc.name Date7Test_142
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date142 = new Date(2023, 11, 31);
      date142.setUTCDate(date142.getUTCDate() - 1);
      expect(date142.getUTCMonth()).assertEqual(11);
      expect(date142.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_14300
     * @tc.name Date7Test_143
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date143 = new Date(2023, 5, 10, 0, 0);
      date143.setUTCHours(date143.getUTCHours() - 1);
      expect(date143.getUTCDate()).assertEqual(9);
      expect(date143.getUTCHours()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_14400
     * @tc.name Date7Test_144
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date144 = new Date(2023, 5, 10, 10, 0, 0);
      date144.setUTCMinutes(date144.getUTCMinutes() - 1);
      expect(date144.getUTCHours()).assertEqual(1);
      expect(date144.getUTCMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_14500
     * @tc.name Date7Test_145
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date145 = new Date(2023, 5, 10, 10, 30, 0);
      date145.setUTCSeconds(date145.getUTCSeconds() - 1);
      expect(date145.getUTCMinutes()).assertEqual(29);
      expect(date145.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_14600
     * @tc.name Date7Test_146
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date146 = new Date(2023, 0, 15);
      date146.setUTCDate(date146.getUTCDate() + 45);
      expect(date146.getUTCMonth()).assertEqual(1);
      expect(date146.getUTCDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_14700
     * @tc.name Date7Test_147
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date147 = new Date(2023, 5, 10, 10, 30, 0);
      date147.setUTCHours(date147.getUTCHours() + 50);
      date147.setUTCMinutes(date147.getUTCMinutes() + 120);
      expect(date147.getUTCDate()).assertEqual(12);
      expect(date147.getUTCHours()).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_14800
     * @tc.name Date7Test_148
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date148 = new Date(2024, 2, 1);
      date148.setUTCDate(0);
      expect(date148.getUTCMonth()).assertEqual(0);
      expect(date148.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_14900
     * @tc.name Date7Test_149
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date149 = new Date(2023, 11, 31, 23, 59, 59, 999);
      date149.setUTCMilliseconds(date149.getUTCMilliseconds() + 2);
      expect(date149.getUTCFullYear()).assertEqual(2023);
      expect(date149.getUTCMonth()).assertEqual(11);
      expect(date149.getUTCDate()).assertEqual(31);
      expect(date149.getUTCMilliseconds()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date7_TEST_15000
     * @tc.name Date7Test_150
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date7Test_150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date150 = new Date(2023, 0, 31);
      date150.setUTCMonth(1);
      date150.setUTCDate(date150.getUTCDate() + 3);
      expect(date150.getUTCMonth()).assertEqual(2);
      expect(date150.getUTCDate()).assertEqual(5);
    });
	
  })
}