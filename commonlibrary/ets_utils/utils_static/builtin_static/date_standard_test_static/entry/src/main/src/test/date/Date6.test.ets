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

export default function Date6Test() {
  describe('Date6Test', () => {
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
     * @tc.number SUB_BUILTINS_Date6_TEST_0100
     * @tc.name Date6Test_001
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const standardUTCDate = new Date(Date.UTC(2024, 7, 10, 16, 20, 35, 456));
      expect(standardUTCDate.getUTCDate()).assertEqual(10);
      expect(standardUTCDate.getUTCDay()).assertEqual(6);
      expect(standardUTCDate.getUTCFullYear()).assertEqual(2024);
      expect(standardUTCDate.getUTCHours()).assertEqual(16);
      expect(standardUTCDate.getUTCMilliseconds()).assertEqual(456);
      expect(standardUTCDate.getUTCMinutes()).assertEqual(20);
      expect(standardUTCDate.getUTCMonth()).assertEqual(7);
      expect(standardUTCDate.getUTCSeconds()).assertEqual(35);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_0200
     * @tc.name Date6Test_002
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundaryUTCDate = new Date(Date.UTC(2024, 10, 30, 23, 59, 59, 999));
      expect(boundaryUTCDate.getUTCDate()).assertEqual(30);
      expect(boundaryUTCDate.getUTCDay()).assertEqual(6);
      expect(boundaryUTCDate.getUTCFullYear()).assertEqual(2024);
      expect(boundaryUTCDate.getUTCHours()).assertEqual(23);
      expect(boundaryUTCDate.getUTCMilliseconds()).assertEqual(999);
      expect(boundaryUTCDate.getUTCMinutes()).assertEqual(59);
      expect(boundaryUTCDate.getUTCMonth()).assertEqual(10);
      expect(boundaryUTCDate.getUTCSeconds()).assertEqual(59);
    });
    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_0300
     * @tc.name Date6Test_003
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcNewYearDate = new Date(Date.UTC(2024, 0, 1, 0, 0, 0, 0));
      expect(utcNewYearDate.getUTCDate()).assertEqual(1);
      expect(utcNewYearDate.getUTCHours()).assertEqual(0);
      expect(utcNewYearDate.getUTCMonth()).assertEqual(0);
      expect(utcNewYearDate.getDate()).assertEqual(1);
      expect(utcNewYearDate.getHours()).assertEqual(8);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_0400
     * @tc.name Date6Test_004
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 0, 31, 12, 0, 0, 0));
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_0500
     * @tc.name Date6Test_005
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 4, 15, 23, 59, 59, 999));
      expect(utcDate.getUTCHours()).assertEqual(23);
      expect(utcDate.getUTCDate()).assertEqual(15);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_0600
     * @tc.name Date6Test_006
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 1, 28, 18, 30, 0, 500));
      expect(utcDate.getUTCDate()).assertEqual(28);
      expect(utcDate.getUTCMonth()).assertEqual(1);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_0700
     * @tc.name Date6Test_007
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2023, 1, 28, 9, 15, 30, 200));
      expect(utcDate.getUTCDate()).assertEqual(28);
      expect(utcDate.getUTCMonth()).assertEqual(1);
      expect(utcDate.getUTCFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_0800
     * @tc.name Date6Test_008
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 20, 14, 59, 59, 100));
      expect(utcDate.getUTCMinutes()).assertEqual(59);
      expect(utcDate.getUTCHours()).assertEqual(14);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_0900
     * @tc.name Date6Test_009
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 2, 10, 8, 20, 59, 999));
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMinutes()).assertEqual(20);
      expect(utcDate.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_1000
     * @tc.name Date6Test_010
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 11, 31, 23, 59, 59, 999));
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_1100
     * @tc.name Date6Test_011
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 5, 5, 10, 40, 20, 999));
      expect(utcDate.getUTCMilliseconds()).assertEqual(999);
      expect(utcDate.getUTCSeconds()).assertEqual(20);
      expect(utcDate.getUTCMinutes()).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_1200
     * @tc.name Date6Test_012
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 6, 18, 16, 10, 0, 0));
      expect(utcDate.getUTCMilliseconds()).assertEqual(0);
      expect(utcDate.getUTCSeconds()).assertEqual(0);
      expect(utcDate.getUTCHours()).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_1300
     * @tc.name Date6Test_013
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 11, 0, 0, 0, 0));
      expect(utcDate.getUTCDay()).assertEqual(0);
      expect(utcDate.getUTCDate()).assertEqual(11);
      expect(utcDate.getUTCMonth()).assertEqual(7);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_1400
     * @tc.name Date6Test_014
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 13, 12, 30, 45, 600));
      expect(utcDate.getUTCDay()).assertEqual(5);
      expect(utcDate.getUTCHours()).assertEqual(12);
      expect(utcDate.getUTCSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_1500
     * @tc.name Date6Test_015
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 11, 1, 6, 0, 0, 300));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(11);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_1600
     * @tc.name Date6Test_016
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 5, 30, 18, 0, 0, 700));
      expect(utcDate.getUTCDate()).assertEqual(30);
      expect(utcDate.getUTCMonth()).assertEqual(5);
      expect(utcDate.getUTCHours()).assertEqual(18);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_1700
     * @tc.name Date6Test_017
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 0, 1, 0, 0, 0, 0));
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_1800
     * @tc.name Date6Test_018
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 9, 1, 12, 0, 0, 0));
      expect(utcDate.getUTCHours()).assertEqual(12);
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_1900
     * @tc.name Date6Test_019
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 2, 31, 20, 15, 30, 400));
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCMonth()).assertEqual(2);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_2000
     * @tc.name Date6Test_020
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 3, 20, 11, 59, 59, 800));
      expect(utcDate.getUTCHours()).assertEqual(11);
      expect(utcDate.getUTCMinutes()).assertEqual(59);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_2100
     * @tc.name Date6Test_021
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2023, 1, 28, 23, 59, 59, 999));
      expect(utcDate.getUTCDate()).assertEqual(28);
      expect(utcDate.getUTCMonth()).assertEqual(1);
      expect(utcDate.getUTCFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_2200
     * @tc.name Date6Test_022
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 4, 12, 9, 29, 59, 100));
      expect(utcDate.getUTCMinutes()).assertEqual(29);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_2300
     * @tc.name Date6Test_023
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 6, 8, 14, 40, 29, 600));
      expect(utcDate.getUTCSeconds()).assertEqual(29);
      expect(utcDate.getUTCMilliseconds()).assertEqual(600);
      expect(utcDate.getUTCMinutes()).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_2400
     * @tc.name Date6Test_024
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 1, 3, 0, 0, 200));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(7);
      expect(utcDate.getUTCHours()).assertEqual(3)
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_2500
     * @tc.name Date6Test_025
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 19, 18, 30, 15, 700));
      expect(utcDate.getUTCDay()).assertEqual(4);
      expect(utcDate.getUTCHours()).assertEqual(18);
      expect(utcDate.getUTCSeconds()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_2600
     * @tc.name Date6Test_026
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 9, 25, 11, 11, 11, 500));
      expect(utcDate.getUTCMilliseconds()).assertEqual(500);
      expect(utcDate.getUTCSeconds()).assertEqual(11);
      expect(utcDate.getUTCMinutes()).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_2700
     * @tc.name Date6Test_027
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 10, 1, 7, 45, 0, 300));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(10);
      expect(utcDate.getUTCMinutes()).assertEqual(45)
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_2800
     * @tc.name Date6Test_028
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 3, 30, 23, 59, 59, 999));
      expect(utcDate.getUTCMonth()).assertEqual(3);
      expect(utcDate.getUTCDate()).assertEqual(30);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_2900
     * @tc.name Date6Test_029
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 11, 10, 10, 0, 0, 0));
      expect(utcDate.getUTCDay()).assertEqual(2);
      expect(utcDate.getUTCDate()).assertEqual(10);
      expect(utcDate.getUTCHours()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_3000
     * @tc.name Date6Test_030
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 5, 18, 17, 59, 59, 400));
      expect(utcDate.getUTCHours()).assertEqual(17);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(400);
    });
    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_3100
     * @tc.name Date6Test_031
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 4, 31, 15, 20, 40, 800));
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCMonth()).assertEqual(4);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_3200
     * @tc.name Date6Test_032
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 1, 10, 5, 59, 59, 300));
      expect(utcDate.getUTCHours()).assertEqual(5);
      expect(utcDate.getUTCMinutes()).assertEqual(59);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_3300
     * @tc.name Date6Test_033
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 1, 29, 22, 30, 15, 600));
      expect(utcDate.getUTCDate()).assertEqual(29);
      expect(utcDate.getUTCMonth()).assertEqual(1);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_3400
     * @tc.name Date6Test_034
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 15, 10, 44, 59, 200));
      expect(utcDate.getUTCMinutes()).assertEqual(44);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(200);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_3500
     * @tc.name Date6Test_035
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 5, 16, 20, 44, 700));
      expect(utcDate.getUTCSeconds()).assertEqual(44);
      expect(utcDate.getUTCMilliseconds()).assertEqual(700);
      expect(utcDate.getUTCMinutes()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_3600
     * @tc.name Date6Test_036
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 1, 1, 9, 0, 0, 100));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(1);
      expect(utcDate.getUTCHours()).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_3700
     * @tc.name Date6Test_037
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 9, 14, 8, 15, 30, 500));
      expect(utcDate.getUTCDay()).assertEqual(1);
      expect(utcDate.getUTCHours()).assertEqual(8);
      expect(utcDate.getUTCSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_3800
     * @tc.name Date6Test_038
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 10, 20, 14, 14, 14, 250));
      expect(utcDate.getUTCMilliseconds()).assertEqual(250);
      expect(utcDate.getUTCSeconds()).assertEqual(14);
      expect(utcDate.getUTCMinutes()).assertEqual(14);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_3900
     * @tc.name Date6Test_039
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 6, 31, 19, 45, 0, 900));
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCMonth()).assertEqual(6);
      expect(utcDate.getUTCMinutes()).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_4000
     * @tc.name Date6Test_040
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 30, 23, 59, 59, 999));
      expect(utcDate.getUTCMonth()).assertEqual(8);
      expect(utcDate.getUTCDate()).assertEqual(30);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_4100
     * @tc.name Date6Test_041
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 11, 18, 11, 30, 45, 400));
      expect(utcDate.getUTCDay()).assertEqual(3);
      expect(utcDate.getUTCDate()).assertEqual(18);
      expect(utcDate.getUTCHours()).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_4200
     * @tc.name Date6Test_042
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 2, 25, 14, 59, 59, 600));
      expect(utcDate.getUTCHours()).assertEqual(14);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(600);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_4300
     * @tc.name Date6Test_043
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 3, 30, 12, 0, 0, 300));
      expect(utcDate.getUTCDate()).assertEqual(30);
      expect(utcDate.getUTCMonth()).assertEqual(3);
      expect(utcDate.getUTCHours()).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_4400
     * @tc.name Date6Test_044
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 5, 12, 7, 14, 59, 800));
      expect(utcDate.getUTCMinutes()).assertEqual(14);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(800);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_4500
     * @tc.name Date6Test_045
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 0, 20, 19, 40, 14, 200));
      expect(utcDate.getUTCSeconds()).assertEqual(14);
      expect(utcDate.getUTCMilliseconds()).assertEqual(200);
      expect(utcDate.getUTCMinutes()).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_4600
     * @tc.name Date6Test_046
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 9, 31, 21, 30, 0, 700));
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCMonth()).assertEqual(9);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_4700
     * @tc.name Date6Test_047
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 5, 13, 13, 13, 750));
      expect(utcDate.getUTCMilliseconds()).assertEqual(750);
      expect(utcDate.getUTCSeconds()).assertEqual(13);
      expect(utcDate.getUTCMinutes()).assertEqual(13);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_4800
     * @tc.name Date6Test_048
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 10, 30, 23, 59, 59, 999));
      expect(utcDate.getUTCMonth()).assertEqual(10);
      expect(utcDate.getUTCDate()).assertEqual(30);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_4900
     * @tc.name Date6Test_049
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 6, 20, 6, 0, 0, 100));
      expect(utcDate.getUTCDay()).assertEqual(6);
      expect(utcDate.getUTCDate()).assertEqual(20);
      expect(utcDate.getUTCHours()).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_5000
     * @tc.name Date6Test_050
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 4, 8, 19, 59, 59, 500));
      expect(utcDate.getUTCHours()).assertEqual(19);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_5100
     * @tc.name Date6Test_051
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 0, 31, 17, 40, 25, 600));
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_5200
     * @tc.name Date6Test_052
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 2, 15, 2, 59, 59, 400));
      expect(utcDate.getUTCHours()).assertEqual(2);
      expect(utcDate.getUTCMinutes()).assertEqual(59);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_5300
     * @tc.name Date6Test_053
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2023, 2, 1, 10, 15, 0, 200));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(2);
      expect(utcDate.getUTCFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_5400
     * @tc.name Date6Test_054
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 25, 13, 54, 59, 900));
      expect(utcDate.getUTCMinutes()).assertEqual(54);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(900);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_5500
     * @tc.name Date6Test_055
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 9, 10, 8, 30, 54, 300));
      expect(utcDate.getUTCSeconds()).assertEqual(54);
      expect(utcDate.getUTCMilliseconds()).assertEqual(300);
      expect(utcDate.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_5600
     * @tc.name Date6Test_056
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 5, 1, 14, 0, 0, 700));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(5);
      expect(utcDate.getUTCHours()).assertEqual(14);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_5700
     * @tc.name Date6Test_057
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 18, 23, 59, 59, 100));
      expect(utcDate.getUTCDay()).assertEqual(0);
      expect(utcDate.getUTCDate()).assertEqual(18);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_5800
     * @tc.name Date6Test_058
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 10, 5, 16, 16, 16, 100));
      expect(utcDate.getUTCMilliseconds()).assertEqual(100);
      expect(utcDate.getUTCSeconds()).assertEqual(16);
      expect(utcDate.getUTCMinutes()).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_5900
     * @tc.name Date6Test_059
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 31, 20, 30, 45, 800));
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCMonth()).assertEqual(7);
      expect(utcDate.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_6000
     * @tc.name Date6Test_060
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 1, 29, 23, 59, 59, 999));
      expect(utcDate.getUTCMonth()).assertEqual(1);
      expect(utcDate.getUTCDate()).assertEqual(29);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });
    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_6100
     * @tc.name Date6Test_061
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 26, 18, 59, 59, 500));
      expect(utcDate.getUTCDay()).assertEqual(4);
      expect(utcDate.getUTCHours()).assertEqual(18);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_6200
     * @tc.name Date6Test_062
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 3, 12, 8, 59, 59, 600));
      expect(utcDate.getUTCHours()).assertEqual(8);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(600);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_6300
     * @tc.name Date6Test_063
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 6, 1, 5, 15, 30, 200));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(6);
      expect(utcDate.getUTCMinutes()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_6400
     * @tc.name Date6Test_064
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 4, 28, 11, 19, 59, 400));
      expect(utcDate.getUTCMinutes()).assertEqual(19);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(400);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_6500
     * @tc.name Date6Test_065
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 0, 15, 13, 45, 19, 700));
      expect(utcDate.getUTCSeconds()).assertEqual(19);
      expect(utcDate.getUTCMilliseconds()).assertEqual(700);
      expect(utcDate.getUTCMinutes()).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_6600
     * @tc.name Date6Test_066
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 30, 19, 0, 0, 300));
      expect(utcDate.getUTCDate()).assertEqual(30);
      expect(utcDate.getUTCMonth()).assertEqual(8);
      expect(utcDate.getUTCHours()).assertEqual(19);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_6700
     * @tc.name Date6Test_067
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 9, 22, 9, 9, 9, 800));
      expect(utcDate.getUTCMilliseconds()).assertEqual(800);
      expect(utcDate.getUTCSeconds()).assertEqual(9);
      expect(utcDate.getUTCMinutes()).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_6800
     * @tc.name Date6Test_068
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 4, 31, 23, 59, 59, 999));
      expect(utcDate.getUTCMonth()).assertEqual(4);
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_6900
     * @tc.name Date6Test_069
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 11, 3, 23, 59, 59, 100));
      expect(utcDate.getUTCDay()).assertEqual(2);
      expect(utcDate.getUTCDate()).assertEqual(3);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_7000
     * @tc.name Date6Test_070
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 5, 15, 11, 59, 59, 999));
      expect(utcDate.getUTCHours()).assertEqual(11);
      expect(utcDate.getUTCDate()).assertEqual(15);
      expect(utcDate.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_7100
     * @tc.name Date6Test_071
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 2, 1, 1, 59, 59, 700));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCHours()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_7200
     * @tc.name Date6Test_072
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 3, 25, 17, 59, 59, 300));
      expect(utcDate.getUTCHours()).assertEqual(17);
      expect(utcDate.getUTCDate()).assertEqual(25);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_7300
     * @tc.name Date6Test_073
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2023, 4, 31, 14, 20, 30, 600));
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCFullYear()).assertEqual(2023);
      expect(utcDate.getUTCMonth()).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_7400
     * @tc.name Date6Test_074
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 6, 12, 9, 34, 59, 800));
      expect(utcDate.getUTCMinutes()).assertEqual(34);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(800);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_7500
     * @tc.name Date6Test_075
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 20, 16, 40, 34, 200));
      expect(utcDate.getUTCSeconds()).assertEqual(34);
      expect(utcDate.getUTCMilliseconds()).assertEqual(200);
      expect(utcDate.getUTCMinutes()).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_7600
     * @tc.name Date6Test_076
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 9, 1, 6, 30, 0, 500));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(9);
      expect(utcDate.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_7700
     * @tc.name Date6Test_077
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 9, 22, 59, 59, 400));
      expect(utcDate.getUTCDay()).assertEqual(1);
      expect(utcDate.getUTCHours()).assertEqual(22);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_7800
     * @tc.name Date6Test_078
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 10, 15, 11, 22, 33, 400));
      expect(utcDate.getUTCMilliseconds()).assertEqual(400);
      expect(utcDate.getUTCSeconds()).assertEqual(33);
      expect(utcDate.getUTCMinutes()).assertEqual(22);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_7900
     * @tc.name Date6Test_079
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 11, 31, 18, 45, 15, 900));
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCMonth()).assertEqual(11);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_8000
     * @tc.name Date6Test_080
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 6, 31, 23, 59, 59, 999));
      expect(utcDate.getUTCMonth()).assertEqual(6);
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_8100
     * @tc.name Date6Test_081
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 9, 23, 23, 59, 59, 100));
      expect(utcDate.getUTCDay()).assertEqual(3);
      expect(utcDate.getUTCDate()).assertEqual(23);
      expect(utcDate.getUTCMilliseconds()).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_8200
     * @tc.name Date6Test_082
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 1, 18, 20, 59, 59, 600));
      expect(utcDate.getUTCHours()).assertEqual(20);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(600);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_8300
     * @tc.name Date6Test_083
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 3, 1, 13, 15, 0, 700));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(3);
      expect(utcDate.getUTCHours()).assertEqual(13);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_8400
     * @tc.name Date6Test_084
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 5, 8, 12, 49, 59, 300));
      expect(utcDate.getUTCMinutes()).assertEqual(49);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(300);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_8500
     * @tc.name Date6Test_085
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 2, 12, 7, 25, 49, 800));
      expect(utcDate.getUTCSeconds()).assertEqual(49);
      expect(utcDate.getUTCMilliseconds()).assertEqual(800);
      expect(utcDate.getUTCMinutes()).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_8600
     * @tc.name Date6Test_086
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 1, 0, 59, 59, 200));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMinutes()).assertEqual(59);
      expect(utcDate.getUTCHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_8700
     * @tc.name Date6Test_087
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 15, 14, 34, 56, 600));
      expect(utcDate.getUTCMilliseconds()).assertEqual(600);
      expect(utcDate.getUTCSeconds()).assertEqual(56);
      expect(utcDate.getUTCMinutes()).assertEqual(34);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_8800
     * @tc.name Date6Test_088
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 31, 23, 59, 59, 999));
      expect(utcDate.getUTCMonth()).assertEqual(7);
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_8900
     * @tc.name Date6Test_089
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 10, 15, 19, 59, 59, 500));
      expect(utcDate.getUTCDay()).assertEqual(5);
      expect(utcDate.getUTCHours()).assertEqual(19);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_9000
     * @tc.name Date6Test_090
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 11, 5, 5, 59, 59, 400));
      expect(utcDate.getUTCHours()).assertEqual(5);
      expect(utcDate.getUTCDate()).assertEqual(5);
      expect(utcDate.getUTCMilliseconds()).assertEqual(400);
    });
    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_9100
     * @tc.name Date6Test_091
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 1, 29, 21, 59, 59, 800));
      expect(utcDate.getUTCDate()).assertEqual(29);
      expect(utcDate.getUTCHours()).assertEqual(21);
      expect(utcDate.getUTCMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_9200
     * @tc.name Date6Test_092
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 4, 18, 13, 59, 59, 300));
      expect(utcDate.getUTCHours()).assertEqual(13);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(300);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_9300
     * @tc.name Date6Test_093
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2023, 9, 31, 10, 0, 0, 600));
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCFullYear()).assertEqual(2023);
      expect(utcDate.getUTCMonth()).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_9400
     * @tc.name Date6Test_094
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 5, 15, 24, 59, 200));
      expect(utcDate.getUTCMinutes()).assertEqual(24);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(200);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_9500
     * @tc.name Date6Test_095
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 12, 8, 10, 24, 700));
      expect(utcDate.getUTCSeconds()).assertEqual(24);
      expect(utcDate.getUTCMilliseconds()).assertEqual(700);
      expect(utcDate.getUTCMinutes()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_9600
     * @tc.name Date6Test_096
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 10, 30, 19, 30, 45, 500));
      expect(utcDate.getUTCDate()).assertEqual(30);
      expect(utcDate.getUTCMonth()).assertEqual(10);
      expect(utcDate.getUTCHours()).assertEqual(19);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_9700
     * @tc.name Date6Test_097
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 6, 13, 23, 59, 59, 400));
      expect(utcDate.getUTCDay()).assertEqual(6);
      expect(utcDate.getUTCDate()).assertEqual(13);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_9800
     * @tc.name Date6Test_098
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 9, 28, 12, 12, 12, 300));
      expect(utcDate.getUTCMilliseconds()).assertEqual(300);
      expect(utcDate.getUTCSeconds()).assertEqual(12);
      expect(utcDate.getUTCMinutes()).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_9900
     * @tc.name Date6Test_099
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 0, 1, 2, 59, 59, 900));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCHours()).assertEqual(2);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_10000
     * @tc.name Date6Test_100
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 5, 30, 23, 59, 59, 999));
      expect(utcDate.getUTCMonth()).assertEqual(5);
      expect(utcDate.getUTCDate()).assertEqual(30);
      expect(utcDate.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_10100
     * @tc.name Date6Test_101
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 7, 20, 17, 59, 59, 600));
      expect(utcDate.getUTCDay()).assertEqual(2);
      expect(utcDate.getUTCHours()).assertEqual(17);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_10200
     * @tc.name Date6Test_102
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 2, 22, 9, 59, 59, 700));
      expect(utcDate.getUTCHours()).assertEqual(9);
      expect(utcDate.getUTCMinutes()).assertEqual(59);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_10300
     * @tc.name Date6Test_103
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 4, 1, 4, 15, 30, 200));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(4);
      expect(utcDate.getUTCMinutes()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_10400
     * @tc.name Date6Test_104
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 6, 25, 11, 39, 59, 800));
      expect(utcDate.getUTCMinutes()).assertEqual(39);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(800);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_10500
     * @tc.name Date6Test_105
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 3, 15, 16, 25, 39, 300));
      expect(utcDate.getUTCSeconds()).assertEqual(39);
      expect(utcDate.getUTCMilliseconds()).assertEqual(300);
      expect(utcDate.getUTCMinutes()).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_10600
     * @tc.name Date6Test_106
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 1, 18, 0, 0, 500));
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(8);
      expect(utcDate.getUTCHours()).assertEqual(18)
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_10700
     * @tc.name Date6Test_107
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 10, 8, 15, 15, 15, 700));
      expect(utcDate.getUTCMilliseconds()).assertEqual(700);
      expect(utcDate.getUTCSeconds()).assertEqual(15);
      expect(utcDate.getUTCMinutes()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_10800
     * @tc.name Date6Test_108
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 9, 31, 23, 59, 59, 999));
      expect(utcDate.getUTCMonth()).assertEqual(9);
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_10900
     * @tc.name Date6Test_109
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 8, 26, 23, 59, 59, 100));
      expect(utcDate.getUTCDay()).assertEqual(4);
      expect(utcDate.getUTCDate()).assertEqual(26);
      expect(utcDate.getUTCMilliseconds()).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_11000
     * @tc.name Date6Test_110
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(2024, 11, 12, 21, 59, 59, 400));
      expect(utcDate.getUTCHours()).assertEqual(21);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(400);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_11100
     * @tc.name Date6Test_111
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-1, 5, 15, 10, 30, 20, 500));
      expect(utcDate.getUTCFullYear()).assertEqual(-1);
      expect(utcDate.getUTCDate()).assertEqual(15);
      expect(utcDate.getUTCMonth()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_11200
     * @tc.name Date6Test_112
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-31536000000);
      expect(utcDate.getUTCHours()).assertEqual(0);
      expect(utcDate.getUTCFullYear()).assertEqual(1969);
      expect(utcDate.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_11300
     * @tc.name Date6Test_113
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-100, 11, 25, 18, 45, 30, 700));
      expect(utcDate.getUTCMonth()).assertEqual(11);
      expect(utcDate.getUTCDate()).assertEqual(25);
      expect(utcDate.getUTCFullYear()).assertEqual(-100);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_11400
     * @tc.name Date6Test_114
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-63115199000);
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCFullYear()).assertEqual(1968);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_11500
     * @tc.name Date6Test_115
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-50, 2, 20, 8, 15, 0, 200));
      expect(utcDate.getUTCHours()).assertEqual(8);
      expect(utcDate.getUTCMinutes()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_11600
     * @tc.name Date6Test_116
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-2208988799700);
      expect(utcDate.getUTCMilliseconds()).assertEqual(300);
      expect(utcDate.getUTCSeconds()).assertEqual(0);
      expect(utcDate.getUTCHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_11700
     * @tc.name Date6Test_117
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-200, 8, 5, 14, 20, 59, 900));
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMinutes()).assertEqual(20);
      expect(utcDate.getUTCMilliseconds()).assertEqual(900);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_11800
     * @tc.name Date6Test_118
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-788918399500);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCFullYear()).assertEqual(1945);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_11900
     * @tc.name Date6Test_119
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-300, 6, 10, 5, 59, 30, 400));
      expect(utcDate.getUTCMinutes()).assertEqual(59);
      expect(utcDate.getUTCHours()).assertEqual(5);
      expect(utcDate.getUTCSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_12000
     * @tc.name Date6Test_120
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-1262303999200);
      expect(utcDate.getUTCFullYear()).assertEqual(1930);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCDate()).assertEqual(1);
    });
    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_12100
     * @tc.name Date6Test_121
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-500, 1, 28, 19, 30, 45, 600));
      expect(utcDate.getUTCDate()).assertEqual(28);
      expect(utcDate.getUTCMonth()).assertEqual(1);
      expect(utcDate.getUTCFullYear()).assertEqual(-500);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_12200
     * @tc.name Date6Test_122
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-31556736000000);
      expect(utcDate.getUTCFullYear()).assertEqual(970);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCDate()).assertEqual(3)
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_12300
     * @tc.name Date6Test_123
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-150, 10, 15, 23, 59, 59, 100));
      expect(utcDate.getUTCHours()).assertEqual(23);
      expect(utcDate.getUTCDate()).assertEqual(15);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_12400
     * @tc.name Date6Test_124
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-1893453840000);
      expect(utcDate.getUTCDay()).assertEqual(6);
      expect(utcDate.getUTCHours()).assertEqual(0);
      expect(utcDate.getUTCMinutes()).assertEqual(36);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_12500
     * @tc.name Date6Test_125
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-250, 4, 20, 12, 34, 56, 999));
      expect(utcDate.getUTCMilliseconds()).assertEqual(999);
      expect(utcDate.getUTCSeconds()).assertEqual(56);
      expect(utcDate.getUTCMinutes()).assertEqual(34);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_12600
     * @tc.name Date6Test_126
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-946943999800);
      expect(utcDate.getUTCDate()).assertEqual(30);
      expect(utcDate.getUTCMonth()).assertEqual(11);
      expect(utcDate.getUTCFullYear()).assertEqual(1939);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_12700
     * @tc.name Date6Test_127
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-800, 11, 31, 22, 10, 30, 600));
      expect(utcDate.getUTCMonth()).assertEqual(11);
      expect(utcDate.getUTCDate()).assertEqual(31);
      expect(utcDate.getUTCFullYear()).assertEqual(-800);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_12800
     * @tc.name Date6Test_128
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-5679935999001);
      expect(utcDate.getUTCSeconds()).assertEqual(0);
      expect(utcDate.getUTCMilliseconds()).assertEqual(999);
      expect(utcDate.getUTCMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_12900
     * @tc.name Date6Test_129
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-350, 7, 5, 9, 59, 45, 400));
      expect(utcDate.getUTCMinutes()).assertEqual(59);
      expect(utcDate.getUTCHours()).assertEqual(9);
      expect(utcDate.getUTCSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_13000
     * @tc.name Date6Test_130
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-2177452799500);
      expect(utcDate.getUTCFullYear()).assertEqual(1901);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_13100
     * @tc.name Date6Test_131
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-600, 3, 20, 16, 30, 15, 0));
      expect(utcDate.getUTCMilliseconds()).assertEqual(0);
      expect(utcDate.getUTCSeconds()).assertEqual(15);
      expect(utcDate.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_13200
     * @tc.name Date6Test_132
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-7985567999300);
      expect(utcDate.getUTCHours()).assertEqual(10);
      expect(utcDate.getUTCMinutes()).assertEqual(40);
      expect(utcDate.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_13300
     * @tc.name Date6Test_133
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-900, 10, 5, 23, 45, 20, 800));
      expect(utcDate.getUTCDate()).assertEqual(5);
      expect(utcDate.getUTCHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_13400
     * @tc.name Date6Test_134
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-12622780799700);
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCFullYear()).assertEqual(1570);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_13500
     * @tc.name Date6Test_135
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-1000, 6, 15, 5, 59, 59, 100));
      expect(utcDate.getUTCHours()).assertEqual(5);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_13600
     * @tc.name Date6Test_136
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-1577836799400);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCDate()).assertEqual(2);
      expect(utcDate.getUTCFullYear()).assertEqual(1920);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_13700
     * @tc.name Date6Test_137
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-400, 4, 25, 13, 20, 29, 900));
      expect(utcDate.getUTCSeconds()).assertEqual(29);
      expect(utcDate.getUTCMilliseconds()).assertEqual(900);
      expect(utcDate.getUTCMinutes()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_13800
     * @tc.name Date6Test_138
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-15768000000600);
      expect(utcDate.getUTCMinutes()).assertEqual(59);
      expect(utcDate.getUTCHours()).assertEqual(23);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_13900
     * @tc.name Date6Test_139
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-700, 1, 28, 19, 30, 45, 500));
      expect(utcDate.getUTCDate()).assertEqual(28);
      expect(utcDate.getUTCMonth()).assertEqual(1);
      expect(utcDate.getUTCFullYear()).assertEqual(-700);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_14000
     * @tc.name Date6Test_140
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-4733856000000 + 54645500);
      expect(utcDate.getUTCMilliseconds()).assertEqual(500);
      expect(utcDate.getUTCSeconds()).assertEqual(45);
      expect(utcDate.getUTCMinutes()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_14100
     * @tc.name Date6Test_141
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-978307199200);
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCFullYear()).assertEqual(1939);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_14200
     * @tc.name Date6Test_142
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-1200, 8, 20, 17, 59, 30, 300));
      expect(utcDate.getUTCHours()).assertEqual(17);
      expect(utcDate.getUTCSeconds()).assertEqual(30);
      expect(utcDate.getUTCMilliseconds()).assertEqual(300);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_14300
     * @tc.name Date6Test_143
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-9466848000000 + 51615600);
      expect(utcDate.getUTCDate()).assertEqual(3);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCFullYear()).assertEqual(1670);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_14400
     * @tc.name Date6Test_144
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-550, 2, 15, 10, 14, 59, 700));
      expect(utcDate.getUTCMinutes()).assertEqual(14);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
      expect(utcDate.getUTCMilliseconds()).assertEqual(700);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_14500
     * @tc.name Date6Test_145
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-1893407999800);
      expect(utcDate.getUTCMonth()).assertEqual(0);
      expect(utcDate.getUTCDate()).assertEqual(1);
      expect(utcDate.getUTCFullYear()).assertEqual(1910);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_14600
     * @tc.name Date6Test_146
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-850, 6, 25, 16, 30, 44, 900));
      expect(utcDate.getUTCSeconds()).assertEqual(44);
      expect(utcDate.getUTCMinutes()).assertEqual(30);
      expect(utcDate.getUTCMilliseconds()).assertEqual(900);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_14700
     * @tc.name Date6Test_147
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-11045376000000 + 33320200);
      expect(utcDate.getUTCMilliseconds()).assertEqual(200);
      expect(utcDate.getUTCHours()).assertEqual(9);
      expect(utcDate.getUTCSeconds()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_14800
     * @tc.name Date6Test_148
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-1100, 11, 31, 23, 59, 59, 500));
      expect(utcDate.getUTCFullYear()).assertEqual(-1100);
      expect(utcDate.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_14900
     * @tc.name Date6Test_149
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(-5679936000000 + 730483199600);
      expect(utcDate.getUTCHours()).assertEqual(15);
      expect(utcDate.getUTCDate()).assertEqual(27);
      expect(utcDate.getUTCMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date6_TEST_15000
     * @tc.name Date6Test_150
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date6Test_150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const utcDate = new Date(Date.UTC(-750, 4, 10, 13, 39, 59, 100));
      expect(utcDate.getUTCMinutes()).assertEqual(39);
      expect(utcDate.getUTCHours()).assertEqual(13);
      expect(utcDate.getUTCSeconds()).assertEqual(59);
    });

  })
}