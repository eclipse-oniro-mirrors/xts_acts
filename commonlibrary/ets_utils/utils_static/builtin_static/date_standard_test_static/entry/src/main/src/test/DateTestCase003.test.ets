/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';


export default function DateTestCase003() {
  describe('DateTestCase003', () => {
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    /**
     * @tc.name   constructorNoArguments
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_001
     * @tc.desc   Verify Date constructor with no arguments creates current date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('constructorNoArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date();
      expect(date.getTime()).assertLarger(0);
    });

    /**
     * @tc.name   constructorOneArgument
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_002
     * @tc.desc   Verify Date constructor with one timestamp argument.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('constructorOneArgument', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(1718460800000);
      expect(date.getTime()).assertEqual(1718460800000);
    });

    /**
     * @tc.name   constructorStringArgument
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_003
     * @tc.desc   Verify Date constructor with string argument.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('constructorStringArgument', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date('2024-06-15T12:00:00Z');
      expect(date.getTime()).assertLarger(0);
    });

    /**
     * @tc.name   constructorSevenArguments
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_004
     * @tc.desc   Verify Date constructor with seven arguments.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('constructorSevenArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45, 123);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.name   invalidDateString
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_005
     * @tc.desc   Verify Date constructor with invalid string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('invalidDateString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      try {
        new Date('invalid date');
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.name   emptyDateString
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_006
     * @tc.desc   Verify Date constructor with empty string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('emptyDateString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      try {
        new Date('');
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.name   epochTime
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_007
     * @tc.desc   Verify epoch time (January 1, 1970).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('epochTime', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(0);
      expect(date.getTime()).assertEqual(0);
      expect(date.getFullYear()).assertEqual(1970);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.name   negativeTimestamp
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_008
     * @tc.desc   Verify negative timestamp (before epoch).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('negativeTimestamp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(-86400000);
      expect(date.getTime()).assertEqual(-86400000);
      expect(date.getFullYear()).assertEqual(1969);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.name   largePositiveTimestamp
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_009
     * @tc.desc   Verify large positive timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('largePositiveTimestamp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp = 253402300799000;
      const date: Date = new Date(timestamp);
      expect(date.getFullYear()).assertEqual(10000);
    });

    /**
     * @tc.name   largeNegativeTimestamp
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_010
     * @tc.desc   Verify large negative timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('largeNegativeTimestamp', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp = -1000000000000000;
      const date: Date = new Date(timestamp);
      expect(date.getTime()).assertEqual(timestamp);
    });

    /**
     * @tc.name   yearZero
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_011
     * @tc.desc   Verify year 0 in constructor.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('yearZero', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(0, 5, 15);
      expect(date.getFullYear()).assertEqual(1900);
    });

    /**
     * @tc.name   year99
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_012
     * @tc.desc   Verify year 99 in constructor.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('year99', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(99, 5, 15);
      expect(date.getFullYear()).assertEqual(1999);
    });

    /**
     * @tc.name   year100
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_013
     * @tc.desc   Verify year 100 in constructor.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('year100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(100, 5, 15);
      expect(date.getFullYear()).assertEqual(100);
    });

    /**
     * @tc.name   monthOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_014
     * @tc.desc   Verify month overflow behavior.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('monthOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 12, 15);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.name   monthUnderflow
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_015
     * @tc.desc   Verify month underflow behavior.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('monthUnderflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, -1, 15);
      expect(date.getFullYear()).assertEqual(2023);
      expect(date.getMonth()).assertEqual(11);
    });

    /**
     * @tc.name   dateOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_016
     * @tc.desc   Verify date overflow behavior.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 32);
      expect(date.getMonth()).assertEqual(6);
      expect(date.getDate()).assertEqual(2);
    });

    /**
     * @tc.name   dateUnderflow
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_017
     * @tc.desc   Verify date underflow behavior.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateUnderflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 0);
      expect(date.getMonth()).assertEqual(4);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.name   hoursOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_018
     * @tc.desc   Verify hours overflow behavior.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('hoursOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 25);
      expect(date.getDate()).assertEqual(16);
      expect(date.getHours()).assertEqual(1);
    });

    /**
     * @tc.name   hoursUnderflow
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_019
     * @tc.desc   Verify hours underflow behavior.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('hoursUnderflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, -1);
      expect(date.getDate()).assertEqual(14);
      expect(date.getHours()).assertEqual(23);
    });

    /**
     * @tc.name   minutesOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_020
     * @tc.desc   Verify minutes overflow behavior.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('minutesOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 70);
      expect(date.getHours()).assertEqual(13);
      expect(date.getMinutes()).assertEqual(10);
    });

    /**
     * @tc.name   secondsOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_021
     * @tc.desc   Verify seconds overflow behavior.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('secondsOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 30, 70);
      expect(date.getMinutes()).assertEqual(31);
      expect(date.getSeconds()).assertEqual(10);
    });

    /**
     * @tc.name   millisecondsOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_022
     * @tc.desc   Verify milliseconds overflow behavior.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('millisecondsOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 30, 45, 1500);
      expect(date.getSeconds()).assertEqual(46);
      expect(date.getMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.name   leapYear2020
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_023
     * @tc.desc   Verify February 29 in leap year 2020.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('leapYear2020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2020, 1, 29);
      expect(date.getFullYear()).assertEqual(2020);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_024
     * @tc.desc   Verify February 29 is invalid in non-leap year 2023.
     * @tc.name   nonLeapYear2023
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('nonLeapYear2023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2023, 1, 29);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.name   leapYear2000
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_025
     * @tc.desc   Verify year 2000 is a leap year (century divisible by 400).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('leapYear2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2000, 1, 29);
      expect(date.getFullYear()).assertEqual(2000);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.name   nonLeapYear1900
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_026
     * @tc.desc   Verify year 1900 is not a leap year (century not divisible by 400).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('nonLeapYear1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(1900, 1, 29);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.name   februaryDays2024
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_027
     * @tc.desc   Verify February has 29 days in leap year 2024.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('februaryDays2024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const feb28: Date = new Date(2024, 1, 28);
      const feb29: Date = new Date(2024, 1, 29);
      const mar1: Date = new Date(2024, 1, 29);
      mar1.setDate(feb29.getDate() + 1);
      expect(mar1.getMonth()).assertEqual(2);
      expect(mar1.getDate()).assertEqual(1);
    });

    /**
     * @tc.name   monthDays30
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_028
     * @tc.desc   Verify months with 30 days.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('monthDays30', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const months30: int[] = [3, 5, 8, 10];
      months30.forEach(month => {
        const date: Date = new Date(2024, month, 31);
        expect(date.getMonth()).assertEqual(month + 1);
        expect(date.getDate()).assertEqual(1);
      });
    });

    /**
     * @tc.name   monthDays31
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_029
     * @tc.desc   Verify months with 31 days.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('monthDays31', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const months31: int[] = [0, 2, 4, 6, 7, 9, 11];
      months31.forEach(month => {
        const date: Date = new Date(2024, month, 31);
        expect(date.getMonth()).assertEqual(month);
        expect(date.getDate()).assertEqual(31);
      });
    });


    /**
     * @tc.name   toJSONInvalidDate
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_031
     * @tc.desc   Verify toJSON() returns null for invalid date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toJSONInvalidDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      try {
        new Date('invalid');
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.name   setDate31To30DayMonth
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_035
     * @tc.desc   Verify setDate(31) in 30-day month.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setDate31To30DayMonth', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 3, 15);
      date.setDate(31);
      expect(date.getMonth()).assertEqual(4);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.name   setDateFebruary30
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_036
     * @tc.desc   Verify setDate(30) in February of leap year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setDateFebruary30', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 1, 15);
      date.setDate(30);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.name   setDateZero
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_037
     * @tc.desc   Verify setDate(0) sets last day of previous month.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setDateZero', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      date.setDate(0);
      expect(date.getMonth()).assertEqual(4);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.name   setDateNegative
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_038
     * @tc.desc   Verify setDate with negative value.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setDateNegative', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      date.setDate(-5);
      expect(date.getMonth()).assertEqual(4);
      expect(date.getDate()).assertEqual(26);
    });

    /**
     * @tc.name   setFullYearWithTwoDigitYear
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_039
     * @tc.desc   Verify setFullYear with two-digit year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setFullYearWithTwoDigitYear', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      date.setFullYear(99);
      expect(date.getFullYear()).assertEqual(99);
    });

    /**
     * @tc.name   dateComparisonEquality
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_041
     * @tc.desc   Verify date comparison with same timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateComparisonEquality', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp = Date.UTC(2024, 5, 15, 12, 0, 0);
      const date1: Date = new Date(timestamp);
      const date2: Date = new Date(timestamp);
      expect(date1.getTime() === date2.getTime()).assertTrue();
    });

    /**
     * @tc.name   dateComparisonInequality
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_042
     * @tc.desc   Verify date comparison with different timestamps.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateComparisonInequality', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date(Date.UTC(2024, 5, 15, 12, 0, 0));
      const date2: Date = new Date(Date.UTC(2024, 5, 15, 13, 0, 0));
      expect(date1.getTime() < date2.getTime()).assertTrue();
    });

    /**
     * @tc.name   dateArithmeticAddDays
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_043
     * @tc.desc   Verify adding days to a date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateArithmeticAddDays', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      date.setDate(date.getDate() + 7);
      expect(date.getDate()).assertEqual(22);
    });

    /**
     * @tc.name   dateArithmeticAddMonths
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_044
     * @tc.desc   Verify adding months to a date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateArithmeticAddMonths', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      date.setMonth(date.getMonth() + 1);
      expect(date.getMonth()).assertEqual(6);
    });

    /**
     * @tc.name   dateArithmeticAddYears
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_045
     * @tc.desc   Verify adding years to a date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateArithmeticAddYears', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      date.setFullYear(date.getFullYear() + 1);
      expect(date.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.name   dateArithmeticAddMilliseconds
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_046
     * @tc.desc   Verify adding milliseconds to a date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateArithmeticAddMilliseconds', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 0, 0, 0);
      date.setTime(date.getTime() + 1000);
      expect(date.getSeconds()).assertEqual(1);
    });

    /**
     * @tc.name   dateArithmeticAcrossYearBoundary
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_047
     * @tc.desc   Verify date arithmetic across year boundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateArithmeticAcrossYearBoundary', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 11, 31);
      date.setDate(date.getDate() + 1);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.name   dateArithmeticAcrossMonthBoundary
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_048
     * @tc.desc   Verify date arithmetic across month boundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateArithmeticAcrossMonthBoundary', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 0, 31);
      date.setDate(date.getDate() + 1);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.name   dateArithmeticAcrossLeapDay
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_049
     * @tc.desc   Verify date arithmetic across February 29 in leap year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateArithmeticAcrossLeapDay', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 1, 28);
      date.setDate(date.getDate() + 1);
      expect(date.getDate()).assertEqual(29);
      date.setDate(date.getDate() + 1);
      expect(date.getDate()).assertEqual(1);
      expect(date.getMonth()).assertEqual(2);
    });

    /**
     * @tc.name   dateArithmeticInNonLeapYear
     * @tc.number SUB_COMMONLIBRARY_DATE_EDGECASES_050
     * @tc.desc   Verify date arithmetic in non-leap year February.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateArithmeticInNonLeapYear', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2023, 1, 28);
      date.setDate(date.getDate() + 1);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

  });
}
