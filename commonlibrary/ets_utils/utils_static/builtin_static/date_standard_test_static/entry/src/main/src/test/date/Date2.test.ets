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

export default function Date2Test() {
  describe('Date2Test', () => {
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
     * @tc.number SUB_BUILTINS_DATE2_TEST_0100
     * @tc.name Date2Test_001
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp1 = Date.parse('2024-05-20');
      expect(timestamp1).assertEqual(1716163200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_0200
     * @tc.name Date2Test_002
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localTimestamp2 = Date.parse('2024-05-20T12:30:00');
      const utcEquivalent2 = new Date('2024-05-20T04:30:00Z').getTime();
      expect(localTimestamp2).assertEqual(utcEquivalent2);
    });
    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_0300
     * @tc.name Date2Test_003
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp3 = Date.parse('2024-05-20T12:30:00Z');
      expect(timestamp3).assertEqual(1716208200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_0400
     * @tc.name Date2Test_004
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp4 = Date.parse('2024-05-20T12:30:00+04:30');
      const utcEquivalent4 = new Date('2024-05-20T08:00:00Z').getTime();
      expect(timestamp4).assertEqual(utcEquivalent4);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_0500
     * @tc.name Date2Test_005
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp5 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      const utcEquivalent5 = new Date('2024-05-20T12:30:00Z').getTime();
      expect(timestamp5).assertEqual(utcEquivalent5);

    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_0600
     * @tc.name Date2Test_006
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp6 = Date.parse('Mon, 20 May 2024 20:30:00 +0800');
      const utcEquivalent6 = new Date('2024-05-20T12:30:00Z').getTime();
      expect(timestamp6).assertEqual(utcEquivalent6);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_0700
     * @tc.name Date2Test_007
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp7 = Date.parse('05/20/2024');
      const localEquivalent7 = new Date(2024, 4, 20).getTime();
      expect(timestamp7).assertEqual(localEquivalent7);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_0800
     * @tc.name Date2Test_008
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp8 = Date.parse('20/05/2024');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_0900
     * @tc.name Date2Test_009
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp9 = Date.parse('May 20 2024');
      const localEquivalent9 = new Date(2024, 4, 20).getTime();
      expect(timestamp9).assertEqual(localEquivalent9);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_1000
     * @tc.name Date2Test_010
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp10 = Date.parse('2024年5月20日');
      expect(timestamp10).assertEqual(1716134400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_1100
     * @tc.name Date2Test_011
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const isoTimestamp11 = Date.parse('2024-05-20');
      const usFormatTimestamp11 = Date.parse('05/20/2024');
      expect(isoTimestamp11 !== usFormatTimestamp11).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_1200
     * @tc.name Date2Test_012
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localDateStr12 = '2024-05-20T12:30:00';
      const utcDateStr12 = '2024-05-20T12:30:00Z';
      const localTimestamp12 = Date.parse(localDateStr12);
      const utcTimestamp12 = Date.parse(utcDateStr12);
      const timeZoneOffset12 = new Date().getTimezoneOffset() * 60 * 1000;
      expect(localTimestamp12 - utcTimestamp12).assertEqual(timeZoneOffset12);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_1300
     * @tc.name Date2Test_013
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp13 = Date.parse('Mon, 20 May 2024 12:30:00');
      const localEquivalent13 = new Date(2024, 4, 20, 12, 30).getTime();
      expect(timestamp13).assertEqual(localEquivalent13);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_1400
     * @tc.name Date2Test_014
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp14 = Date.parse('2024-02-30');
      expect(isNaN(timestamp14)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_1500
     * @tc.name Date2Test_015
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp15 = Date.parse('2024-13-20');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_1600
     * @tc.name Date2Test_016
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp16 = Date.parse('2024-05-20T25:30:00');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_1700
     * @tc.name Date2Test_017
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp17 = Date.parse('');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_1800
     * @tc.name Date2Test_018
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp18 = Date.parse('hello world');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_1900
     * @tc.name Date2Test_019
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp19 = Date.parse('20240520');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_2000
     * @tc.name Date2Test_020
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp20 = Date.parse('1970-01-01T00:00:00Z');
      expect(timestamp20).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_2100
     * @tc.name Date2Test_021
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp21 = Date.parse('1969-12-31T23:59:59Z');
      expect(timestamp21).assertEqual(-1000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_2300
     * @tc.name Date2Test_023
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const dateStr23 = '2024-05-20T12:30:00Z';
      const parseTimestamp23 = Date.parse(dateStr23);
      const dateObjTimestamp23 = new Date(dateStr23).getTime();
      expect(parseTimestamp23).assertEqual(dateObjTimestamp23);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_2400
     * @tc.name Date2Test_024
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date24 = new Date();
      const targetTimestamp24 = Date.parse('2024-05-20T12:30:00Z');
      date24.setTime(targetTimestamp24);
      const isTargetDate24 = date24.getUTCFullYear() === 2024 &&
        date24.getUTCMonth() === 4 &&
        date24.getUTCDate() === 20 &&
        date24.getUTCHours() === 12 &&
        date24.getUTCMinutes() === 30;
      expect(isTargetDate24).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_2500
     * @tc.name Date2Test_025
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const standardTimestamp25 = Date.parse('2024-05-20T12:30:00Z');
      expect(standardTimestamp25).assertEqual(1716208200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_2600
     * @tc.name Date2Test_026
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp26 = Date.parse('20 May 2024 12:30:00 GMT');
      const standardTimestamp26 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp26).assertEqual(standardTimestamp26);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_2700
     * @tc.name Date2Test_027
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp27 = Date.parse('2024-05-20T12:30:00.123Z');
      const standardTimestamp27 = Date.parse('2024-05-20T12:30:00Z') + 123;
      expect(timestamp27).assertEqual(standardTimestamp27);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_2800
     * @tc.name Date2Test_028
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp28_1 = Date.parse('2024-05-20T12:30:00+0000');
      const timestamp28_3 = Date.parse('2024-05-20T12:30:00Z');
      expect(timestamp28_1).assertEqual(timestamp28_3);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_2900
     * @tc.name Date2Test_029
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp29 = Date.parse('2024-05-20T12:30:00+2500');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_3000
     * @tc.name Date2Test_030
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp30 = Date.parse('2024-05-20 12:30:00');
      const localEquivalent30 = new Date(2024, 4, 20, 12, 30).getTime();
      expect(timestamp30).assertEqual(localEquivalent30);
    });
    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_3100
     * @tc.name Date2Test_031
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp31 = Date.parse('2024-1-5');
      const expected31 = new Date('2024-01-05T00:00:00Z').getTime();
      expect(timestamp31).assertEqual(1704384000000);
      expect(expected31).assertEqual(1704412800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_3200
     * @tc.name Date2Test_032
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp32 = Date.parse('2024-05-20T1:5:3');
        const localExpected32 = new Date(2024, 4, 20, 1, 5, 3).getTime();
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_3300
     * @tc.name Date2Test_033
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp33 = Date.parse('2024-05-20T12:30:00-03:00');
      const utcExpected33 = new Date('2024-05-20T15:30:00Z').getTime();
      expect(timestamp33).assertEqual(utcExpected33);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_3400
     * @tc.name Date2Test_034
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp34 = Date.parse('2024-05-20T12:30:00+0800');
      const utcExpected34 = new Date('2024-05-20T04:30:00Z').getTime();
      expect(timestamp34).assertEqual(utcExpected34);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_3500
     * @tc.name Date2Test_035
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp35 = Date.parse('2024-05-20T12:30:00.456Z');
      const expected35 = Date.parse('2024-05-20T12:30:00Z') + 456;
      expect(timestamp35).assertEqual(expected35);

    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_3600
     * @tc.name Date2Test_036
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp36 = Date.parse('Fri, 01 Jan 2024 00:00:00 GMT');
      const expected36 = new Date('2024-01-01T00:00:00Z').getTime();
      expect(timestamp36).assertEqual(expected36);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_3700
     * @tc.name Date2Test_037
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp37 = Date.parse('Sun, 28 Jan 2024 12:00:00 +0000');
      const expected37 = new Date('2024-01-28T12:00:00Z').getTime();
      expect(timestamp37).assertEqual(expected37);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_3800
     * @tc.name Date2Test_038
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp38 = Date.parse('Mon, 20 May 2024 12:30 GMT');
      const expected38 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp38).assertEqual(expected38);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_3900
     * @tc.name Date2Test_039
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp39 = Date.parse('Mon, 20 May 2024 12:30:00 UTC');
      const expected39 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp39).assertEqual(expected39);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_4000
     * @tc.name Date2Test_040
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp40 = Date.parse('Mon, 5 May 2024 12:30:00 GMT');
      const expected40 = Date.parse('Mon, 05 May 2024 12:30:00 GMT');
      expect(timestamp40).assertEqual(expected40);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_4100
     * @tc.name Date2Test_041
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp41 = Date.parse('2024-02-29');
      const expected41 = new Date('2024-02-29T00:00:00Z').getTime();
      expect(timestamp41).assertEqual(expected41);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_4200
     * @tc.name Date2Test_042
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp42 = Date.parse('2023-02-29');
      expect(isNaN(timestamp42)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_4300
     * @tc.name Date2Test_043
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp43 = Date.parse('2024-12-31T23:59:59Z');
      const expected43 = new Date('2024-12-31T23:59:59Z').getTime();
      expect(timestamp43).assertEqual(expected43);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_4400
     * @tc.name Date2Test_044
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp44 = Date.parse('Tue, 01 Jan 2024 00:00:00 GMT');
      const expected44 = new Date('2024-01-01T00:00:00Z').getTime();
      expect(timestamp44).assertEqual(expected44);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_4500
     * @tc.name Date2Test_045
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp45 = Date.parse('2024-12-31T23:59:59+02:00');
      const expected45 = new Date('2025-01-01T01:59:59Z').getTime();
      expect(timestamp45).assertEqual(1735682399000);
      expect(expected45).assertEqual(1735696799000);
    });


    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_4800
     * @tc.name Date2Test_048
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp48 = Date.parse('2024.05.20');
      expect(isNaN(timestamp48)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_4900
     * @tc.name Date2Test_049
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp49 = Date.parse('2024-05/20');
      expect(isNaN(timestamp49)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_5600
     * @tc.name Date2Test_056
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp56 = Date.parse('2024-05-20T12:30:00+14:00');
      const utcExpected56 = new Date('2024-05-20T00:30:00Z').getTime();
      expect(timestamp56).assertEqual(1716157800000);
      expect(utcExpected56).assertEqual(1716165000000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_5700
     * @tc.name Date2Test_057
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp57 = Date.parse('2024-05-20T12:30:00-12:00');
      const utcExpected57 = new Date('2024-05-21T00:30:00Z').getTime();
      expect(timestamp57).assertEqual(utcExpected57);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_5800
     * @tc.name Date2Test_058
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp58 = Date.parse('1899-12-31T00:00:00Z');
      const expected58 = new Date('1899-12-31T00:00:00Z').getTime();
      expect(timestamp58).assertEqual(expected58);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_5900
     * @tc.name Date2Test_059
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp59 = Date.parse('2100-01-01T00:00:00Z');
      const expected59 = new Date('2100-01-01T00:00:00Z').getTime();
      expect(timestamp59).assertEqual(expected59);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_6000
     * @tc.name Date2Test_060
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localDateStr60 = '2024-05-20T23:30:00';
      const timestamp60 = Date.parse(localDateStr60);
      const utcExpected60 = new Date('2024-05-20T07:30:00Z').getTime();
      expect(timestamp60).assertEqual(1716219000000);
      expect(utcExpected60).assertEqual(1716190200000);
    });
    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_6100
     * @tc.name Date2Test_061
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp61 = Date.parse('2024');
      const expected61 = new Date('2024-01-01T00:00:00Z').getTime();
      expect(timestamp61).assertEqual(expected61);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_6200
     * @tc.name Date2Test_062
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp62 = Date.parse('2024-05');
      const expected62 = new Date('2024-05-01T00:00:00Z').getTime();
      expect(timestamp62).assertEqual(expected62);

    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_6300
     * @tc.name Date2Test_063
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp63 = Date.parse('2024-05-20T');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_6400
     * @tc.name Date2Test_064
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp64 = Date.parse('2024-05-20T12:30:00.1234Z');
      const expected64 = Date.parse('2024-05-20T12:30:00.123Z');
      expect(timestamp64).assertEqual(expected64);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_6500
     * @tc.name Date2Test_065
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const expected65 = new Date('2024-05-20T04:30:00Z').getTime();
      expect(expected65).assertEqual(1716179400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_6600
     * @tc.name Date2Test_066
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp66 = Date.parse('  Mon, 20 May 2024 12:30:00 GMT');
      const expected66 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp66).assertEqual(expected66);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_6700
     * @tc.name Date2Test_067
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp67 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      const invalidTimestamp67 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp67).assertEqual(Date.parse('2024-05-20T12:30:00Z'));
      expect(invalidTimestamp67).assertEqual(Date.parse('2024-05-20T12:30:00Z'));
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_6800
     * @tc.name Date2Test_068
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp68 = Date.parse('Mon, May 2024 12:30:00 GMT');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_6900
     * @tc.name Date2Test_069
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp69 = Date.parse('Mon, 20 May 2024 12:30:00 +00');
      const expected69 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp69).assertEqual(expected69);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_7000
     * @tc.name Date2Test_070
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp70 = Date.parse('Mon, 20 May 24 12:30:00 GMT');
      const expected70 = new Date('1924-05-20T12:30:00Z').getTime();
      expect(timestamp70).assertEqual(1716208200000);
      expect(expected70).assertEqual(-1439551800000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_7100
     * @tc.name Date2Test_071
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp71 = Date.parse('   ');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_7600
     * @tc.name Date2Test_076
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp76 = Date.parse('2024-03-31T01:30:00+01:00');
      const expected76 = new Date('2024-03-31T00:30:00Z').getTime();
      expect(timestamp76).assertEqual(expected76);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_7700
     * @tc.name Date2Test_077
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp77 = Date.parse('2024-03-31T03:30:00+02:00');
      const expected77 = new Date('2024-03-31T01:30:00Z').getTime();
      expect(timestamp77).assertEqual(expected77);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_7800
     * @tc.name Date2Test_078
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp78 = Date.parse('2024-05-20T23:30:00+03:00');
      const expected78 = new Date('2024-05-20T20:30:00Z').getTime();
      expect(timestamp78).assertEqual(expected78);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_7900
     * @tc.name Date2Test_079
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localDateStr79 = '2024-05-20T20:30:00';
      const timestamp79 = Date.parse(localDateStr79);
      const expected79 = new Date('2024-05-21T00:30:00Z').getTime();
      expect(timestamp79).assertEqual(1716208200000);
      expect(expected79).assertEqual(1716251400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_8000
     * @tc.name Date2Test_080
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp80 = Date.parse('2024-05-20T00:00:00');
      const expected80 = new Date(2024, 4, 20, 0, 0, 0).getTime();
      expect(timestamp80).assertEqual(expected80);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_8100
     * @tc.name Date2Test_081
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const isoTimestamp81 = Date.parse('2024-05-20T12:30:00Z');
      const rfcTimestamp81 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(isoTimestamp81).assertEqual(rfcTimestamp81);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_8200
     * @tc.name Date2Test_082
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp82 = Date.parse('2024-05-20!12:30:00');
      expect(isNaN(timestamp82)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_8300
     * @tc.name Date2Test_083
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp83 = Date.parse('2024-005-020');
      expect(isNaN(timestamp83)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_8400
     * @tc.name Date2Test_084
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp84 = Date.parse('12:30:00');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_8500
     * @tc.name Date2Test_085
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp85 = Date.parse('12:30:00 2024-05-20');
      expect(isNaN(timestamp85)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_8600
     * @tc.name Date2Test_086
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp86 = Date.parse('1970-01-01T08:00:00+08:00');
      const expected86 = 0;
      expect(timestamp86).assertEqual(expected86);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_8700
     * @tc.name Date2Test_087
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp87 = Date.parse('1969-12-31T16:00:00-08:00');
      const expected87 = 0;
      expect(timestamp87).assertEqual(expected87);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_8800
     * @tc.name Date2Test_088
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp88 = Date.parse('0001-01-01T00:00:00Z');
      const expected88 = new Date('0001-01-01T00:00:00Z').getTime();
      expect(timestamp88).assertEqual(expected88);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_8900
     * @tc.name Date2Test_089
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp89 = Date.parse('2124-05-20T12:30:00Z');
      const expected89 = new Date('2124-05-20T12:30:00Z').getTime();
      expect(timestamp89).assertEqual(expected89);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_9000
     * @tc.name Date2Test_090
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp90 = Date.parse('2024-12-31T23:59:59.999Z');
      const expected90 = Date.parse('2024-12-31T23:59:59Z') + 999;
      expect(timestamp90).assertEqual(expected90);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_9200
     * @tc.name Date2Test_092
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp92 = Date.parse('2024-05-20T12::30:00');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_9300
     * @tc.name Date2Test_093
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp93 = Date.parse('2024-05-20T12:30:00.123aZ');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_9400
     * @tc.name Date2Test_094
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const expected94 = new Date('2024-05-20T04:30:00Z').getTime();
      expect(expected94).assertEqual(1716179400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_9500
     * @tc.name Date2Test_095
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp95 = Date.parse('T12:30:00Z');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_9600
     * @tc.name Date2Test_096
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp96 = Date.parse('Mon,, 20 May 2024 12:30:00 GMT');
      expect(isNaN(timestamp96)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_9700
     * @tc.name Date2Test_097
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp97 = Date.parse('Mon, 20 May2024 12:30:00 GMT');
      expect(isNaN(timestamp97)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_9800
     * @tc.name Date2Test_098
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp98 = Date.parse('Mon, 20 May 2024 12:30:00 GMT+08');
      expect(isNaN(timestamp98)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_9900
     * @tc.name Date2Test_099
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp99 = Date.parse('mon, 20 may 2024 12:30:00 gmt');
      const expected99 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp99).assertEqual(expected99);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_10000
     * @tc.name Date2Test_100
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp100 = Date.parse('Mon, 20. May 2024 12:30:00 GMT');
      expect(isNaN(timestamp100)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_10400
     * @tc.name Date2Test_104
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp104 = Date.parse('NaN');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_10600
     * @tc.name Date2Test_106
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp106 = Date.parse('2024-05-20T01:30:00-12:00');
      const expected106 = new Date('2024-05-20T13:30:00Z').getTime();
      expect(timestamp106).assertEqual(expected106);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_10700
     * @tc.name Date2Test_107
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp107 = Date.parse('2024-02-29T00:00:00Z');
      const expected107 = new Date('2024-02-29T00:00:00Z').getTime();
      expect(timestamp107).assertEqual(expected107);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_10800
     * @tc.name Date2Test_108
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp108 = Date.parse('2024-02-29T08:00:00+08:00');
      const expected108 = new Date('2024-02-29T00:00:00Z').getTime();
      expect(timestamp108).assertEqual(expected108);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_10900
     * @tc.name Date2Test_109
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp109 = Date.parse('2024-04-30T23:30:00+02:00');
      const expected109 = new Date('2024-04-30T21:30:00Z').getTime();
      expect(timestamp109).assertEqual(expected109);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_11000
     * @tc.name Date2Test_110
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp110 = Date.parse('2024-04-30T23:30:00-03:00');
      const expected110 = new Date('2024-05-01T02:30:00Z').getTime();
      expect(timestamp110).assertEqual(expected110);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_11100
     * @tc.name Date2Test_111
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp111 = Date.parse('2024年5月20日');
      expect(timestamp111).assertEqual(1716134400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_11200
     * @tc.name Date2Test_112
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp112 = Date.parse('May 20, 2024');
      const expected112 = new Date(2024, 4, 20).getTime();
      expect(timestamp112).assertEqual(expected112);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_11300
     * @tc.name Date2Test_113
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp113 = Date.parse('05 20, 2024');
      expect(isNaN(timestamp113)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_11400
     * @tc.name Date2Test_114
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp114 = Date.parse('2024-05-20 12:30 UTC');
      const expected114 = new Date('2024-05-20T12:30:00Z').getTime();
      expect(timestamp114).assertEqual(expected114);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_11500
     * @tc.name Date2Test_115
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp115 = Date.parse('2024/05/20 12:30:00Z');
      expect(isNaN(timestamp115)).assertEqual(false)
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_11600
     * @tc.name Date2Test_116
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp116 = Date.parse('-0001-12-31T00:00:00Z');
        const expected116 = new Date('-0001-12-31T00:00:00Z').getTime();
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_11700
     * @tc.name Date2Test_117
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp117 = Date.parse('1970-01-01T08:00:00+08:00');
      const expected117 = 0;
      expect(timestamp117).assertEqual(expected117);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_11800
     * @tc.name Date2Test_118
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp118 = Date.parse('3024-05-20T12:30:00Z');
      const expected118 = new Date('3024-05-20T12:30:00Z').getTime();
      expect(timestamp118).assertEqual(expected118);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_11900
     * @tc.name Date2Test_119
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp119 = Date.parse('2024-01-01T00:00:00.000Z');
      const expected119 = Date.parse('2024-01-01T00:00:00Z');
      expect(timestamp119).assertEqual(expected119);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_12000
     * @tc.name Date2Test_120
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp120 = Date.parse('1999-12-31T23:59:59Z');
      const expected120 = new Date('1999-12-31T23:59:59Z').getTime();
      expect(timestamp120).assertEqual(expected120);
    });
    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_12100
     * @tc.name Date2Test_121
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp121 = Date.parse('+2024-05-20');
      const expected121 = new Date('2024-05-20T00:00:00Z').getTime();
      expect(timestamp121).assertEqual(1716134400000);
      expect(expected121).assertEqual(1716163200000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_12200
     * @tc.name Date2Test_122
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp122 = Date.parse('20245-05-20');
      expect(timestamp122).assertEqual(576715305600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_12300
     * @tc.name Date2Test_123
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp123 = Date.parse('2024-05-20T12:30');
      const localExpected123 = new Date(2024, 4, 20, 12, 30, 0).getTime();
      expect(timestamp123).assertEqual(localExpected123);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_12400
     * @tc.name Date2Test_124
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localExpected124 = new Date(2024, 4, 20, 12, 0, 0).getTime();
      expect(localExpected124).assertEqual(1716177600000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_12500
     * @tc.name Date2Test_125
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp125 = Date.parse('2024-05-20T12:30:00-');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_12600
     * @tc.name Date2Test_126
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp126 = Date.parse('MON, 20 May 2024 12:30:00 GMT');
      const expected126 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp126).assertEqual(expected126);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_12700
     * @tc.name Date2Test_127
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp127 = Date.parse('Mon, 20 MAY 2024 12:30:00 GMT');
      const expected127 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp127).assertEqual(expected127);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_12800
     * @tc.name Date2Test_128
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp128 = Date.parse('Mon, 20 May 2024 12:30 GMT');
      const expected128 = Date.parse('Mon, 20 May 2024 12:30:00 GMT');
      expect(timestamp128).assertEqual(expected128);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_13000
     * @tc.name Date2Test_130
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp130 = Date.parse('Mon, 5 May 2024 12:30:00 GMT');
      const expected130 = Date.parse('Mon, 05 May 2024 12:30:00 GMT');
      expect(timestamp130).assertEqual(expected130);
    });


    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_13200
     * @tc.name Date2Test_132
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp132 = Date.parse('"2024-05-20"');
      expect(isNaN(timestamp132)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_13300
     * @tc.name Date2Test_133
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp133 = Date.parse('undefined');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_13400
     * @tc.name Date2Test_134
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp134 = Date.parse('null');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_13500
     * @tc.name Date2Test_135
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp135True = Date.parse('true');
        const timestamp135False = Date.parse('false');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_13600
     * @tc.name Date2Test_136
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp136 = Date.parse('2024-05-20T00:30:00+14:00');
      const expected136 = new Date('2024-05-19T10:30:00Z').getTime();
      expect(timestamp136).assertEqual(expected136);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_13700
     * @tc.name Date2Test_137
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp137 = Date.parse('2024-05-19T12:30:00-12:00');
      const expected137 = new Date('2024-05-20T00:30:00Z').getTime();
      expect(timestamp137).assertEqual(expected137);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_13800
     * @tc.name Date2Test_138
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp138 = Date.parse('2024-04-30T23:30:00+02:00');
      const expected138 = new Date('2024-04-30T21:30:00Z').getTime();
      expect(timestamp138).assertEqual(expected138);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_13900
     * @tc.name Date2Test_139
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp139 = Date.parse('2024-04-30T23:30:00-03:00');
      const expected139 = new Date('2024-05-01T02:30:00Z').getTime();
      expect(timestamp139).assertEqual(expected139);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_14000
     * @tc.name Date2Test_140
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp140 = Date.parse('1999-12-31T23:59:59Z');
      const expected140 = new Date('1999-12-31T23:59:59Z').getTime();
      expect(timestamp140).assertEqual(expected140);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_14100
     * @tc.name Date2Test_141
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp141 = Date.parse('2024/05/20');
      const localExpected141 = new Date(2024, 4, 20).getTime();
      expect(timestamp141).assertEqual(localExpected141);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_14200
     * @tc.name Date2Test_142
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp142 = Date.parse('2024.05.20');
      expect(isNaN(timestamp142)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_14300
     * @tc.name Date2Test_143
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp143 = Date.parse('2024年5月20日');
      expect(timestamp143).assertEqual(1716134400000);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_14400
     * @tc.name Date2Test_144
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp144 = Date.parse('2024-05-20 12:30 GMT+08');
      const expected144 = new Date('2024-05-20T04:30:00Z').getTime();
      expect(timestamp144).assertEqual(expected144);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_14500
     * @tc.name Date2Test_145
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp145 = Date.parse('20240520');
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_14600
     * @tc.name Date2Test_146
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try{
        const timestamp146 = Date.parse('-0100-01-01T00:00:00Z');
        const expected146 = new Date('-0100-01-01T00:00:00Z').getTime();
        expect().assertFail();
      }catch(e){
        expect(e instanceof FormatError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_14700
     * @tc.name Date2Test_147
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp147 = Date.parse('1000-01-01T00:00:00Z');
      const expected147 = new Date('1000-01-01T00:00:00Z').getTime();
      expect(timestamp147).assertEqual(expected147);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_14800
     * @tc.name Date2Test_148
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp148 = Date.parse('2524-05-20T12:30:00Z');
      const expected148 = new Date('2524-05-20T12:30:00Z').getTime();
      expect(timestamp148).assertEqual(expected148);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_14900
     * @tc.name Date2Test_149
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp149 = Date.parse('2024-12-31T23:59:59.999Z');
      const expected149 = Date.parse('2024-12-31T23:59:59Z') + 999;
      expect(timestamp149).assertEqual(expected149);
    });

    /**
     * @tc.number SUB_BUILTINS_DATE2_TEST_15000
     * @tc.name Date2Test_150
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date2Test_150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timestamp150 = Date.parse('1970-01-01T00:00:01Z');
      const expected150 = 1000;
      expect(timestamp150).assertEqual(expected150);
    });

  })
}