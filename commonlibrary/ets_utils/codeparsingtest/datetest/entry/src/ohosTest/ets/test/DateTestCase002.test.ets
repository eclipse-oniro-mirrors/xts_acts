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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}
export default function DateTestCase002() {
  describe('DateTestCase002', () => {
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    /**
     * @tc.name   setDateReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_001
     * @tc.desc   Verify setDate() sets day of month and returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setDateReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 1);
      const timestamp: number = date.setDate(15);
      expect(date.getDate()).assertEqual(15);
      expect(typeof timestamp).assertEqual('number');
    });

    /**
     * @tc.name   setDateOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_002
     * @tc.desc   Verify setDate() handles overflow to next month.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setDateOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 0, 31);
      date.setDate(32);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.name   setDateUnderflow
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_003
     * @tc.desc   Verify setDate() handles underflow to previous month.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setDateUnderflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 1, 1);
      date.setDate(0);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.name   setDateNegative
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_004
     * @tc.desc   Verify setDate() handles negative values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setDateNegative', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 1, 15);
      date.setDate(-5);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(26);
    });

    /**
     * @tc.name   setFullYearReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_005
     * @tc.desc   Verify setFullYear() sets year and returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setFullYearReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2020, 5, 15);
      const timestamp: number = date.setFullYear(2024);
      expect(date.getFullYear()).assertEqual(2024);
      expect(typeof timestamp).assertEqual('number');
    });

    /**
     * @tc.name   setFullYearWithMonthAndDate
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_006
     * @tc.desc   Verify setFullYear() with month and date parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setFullYearWithMonthAndDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2020, 0, 1);
      date.setFullYear(2024, 11, 31);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.name   setFullYearZero
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_007
     * @tc.desc   Verify setFullYear(0) sets year to 1900.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setFullYearZero', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      date.setFullYear(0);
      expect(date.getFullYear()).assertEqual(0);
    });

    /**
     * @tc.name   setFullYear99
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_008
     * @tc.desc   Verify setFullYear(99) sets year to 1999.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setFullYear99', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      date.setFullYear(99);
      expect(date.getFullYear()).assertEqual(99);
    });

    /**
     * @tc.name   setHoursReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_009
     * @tc.desc   Verify setHours() sets hour and returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setHoursReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 10, 0, 0);
      const timestamp: number = date.setHours(14);
      expect(date.getHours()).assertEqual(14);
      expect(typeof timestamp).assertEqual('number');
    });

    /**
     * @tc.name   setHoursWithAllParams
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_010
     * @tc.desc   Verify setHours() with all parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setHoursWithAllParams', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 0, 0, 0, 0);
      date.setHours(14, 30, 45, 123);
      expect(date.getHours()).assertEqual(14);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(45);
      expect(date.getMilliseconds()).assertEqual(123);
    });

    /**
     * @tc.name   setHoursOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_011
     * @tc.desc   Verify setHours() handles overflow to next day.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setHoursOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 23, 0, 0);
      date.setHours(25);
      expect(date.getDate()).assertEqual(16);
      expect(date.getHours()).assertEqual(1);
    });

    /**
     * @tc.name   setHoursUnderflow
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_012
     * @tc.desc   Verify setHours() handles underflow to previous day.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setHoursUnderflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 1, 0, 0);
      date.setHours(-1);
      expect(date.getDate()).assertEqual(14);
      expect(date.getHours()).assertEqual(23);
    });

    /**
     * @tc.name   setMillisecondsReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_013
     * @tc.desc   Verify setMilliseconds() sets milliseconds and returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setMillisecondsReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 0, 0, 0);
      const timestamp: number = date.setMilliseconds(123);
      expect(date.getMilliseconds()).assertEqual(123);
      expect(typeof timestamp).assertEqual('number');
    });

    /**
     * @tc.name   setMillisecondsOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_014
     * @tc.desc   Verify setMilliseconds() handles overflow to next second.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setMillisecondsOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 0, 0, 500);
      date.setMilliseconds(1500);
      expect(date.getSeconds()).assertEqual(1);
      expect(date.getMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.name   setMinutesReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_015
     * @tc.desc   Verify setMinutes() sets minutes and returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setMinutesReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 0, 0);
      const timestamp: number = date.setMinutes(30);
      expect(date.getMinutes()).assertEqual(30);
      expect(typeof timestamp).assertEqual('number');
    });

    /**
     * @tc.name   setMinutesWithAllParams
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_016
     * @tc.desc   Verify setMinutes() with all parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setMinutesWithAllParams', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 0, 0, 0);
      date.setMinutes(30, 45, 123);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(45);
      expect(date.getMilliseconds()).assertEqual(123);
    });

    /**
     * @tc.name   setMinutesOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_017
     * @tc.desc   Verify setMinutes() handles overflow to next hour.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setMinutesOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 30, 0);
      date.setMinutes(90);
      expect(date.getHours()).assertEqual(13);
      expect(date.getMinutes()).assertEqual(30);
    });

    /**
     * @tc.name   setMonthReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_018
     * @tc.desc   Verify setMonth() sets month and returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setMonthReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 0, 15);
      const timestamp: number = date.setMonth(5);
      expect(date.getMonth()).assertEqual(5);
      expect(typeof timestamp).assertEqual('number');
    });

    /**
     * @tc.name   setMonthWithDate
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_019
     * @tc.desc   Verify setMonth() with date parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setMonthWithDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 0, 15);
      date.setMonth(5, 20);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(20);
    });

    /**
     * @tc.name   setMonthOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_020
     * @tc.desc   Verify setMonth() handles overflow to next year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setMonthOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      date.setMonth(12);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.name   setMonthUnderflow
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_021
     * @tc.desc   Verify setMonth() handles underflow to previous year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setMonthUnderflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 0, 15);
      date.setMonth(-1);
      expect(date.getFullYear()).assertEqual(2023);
      expect(date.getMonth()).assertEqual(11);
    });

    /**
     * @tc.name   setSecondsReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_022
     * @tc.desc   Verify setSeconds() sets seconds and returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setSecondsReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 0, 0);
      const timestamp: number = date.setSeconds(30);
      expect(date.getSeconds()).assertEqual(30);
      expect(typeof timestamp).assertEqual('number');
    });

    /**
     * @tc.name   setSecondsWithMilliseconds
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_023
     * @tc.desc   Verify setSeconds() with milliseconds parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setSecondsWithMilliseconds', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 0, 0, 0);
      date.setSeconds(30, 456);
      expect(date.getSeconds()).assertEqual(30);
      expect(date.getMilliseconds()).assertEqual(456);
    });

    /**
     * @tc.name   setTimeReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_024
     * @tc.desc   Verify setTime() sets timestamp and returns same value.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setTimeReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date();
      const timestamp: number = Date.UTC(2024, 5, 15, 12, 0, 0);
      const result: number = date.setTime(timestamp);
      expect(date.getTime()).assertEqual(timestamp);
      expect(result).assertEqual(timestamp);
    });

    /**
     * @tc.name   setTimeNegative
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_025
     * @tc.desc   Verify setTime() with negative timestamp (before epoch).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setTimeNegative', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date();
      const timestamp: number = -86400000;
      date.setTime(timestamp);
      expect(date.getTime()).assertEqual(timestamp);
    });

    /**
     * @tc.name   setUTCDateReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_026
     * @tc.desc   Verify setUTCDate() sets UTC day of month.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setUTCDateReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 1));
      date.setUTCDate(15);
      expect(date.getUTCDate()).assertEqual(15);
    });

    /**
     * @tc.name   setUTCFullYearReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_027
     * @tc.desc   Verify setUTCFullYear() sets UTC year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setUTCFullYearReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2020, 5, 15));
      date.setUTCFullYear(2024);
      expect(date.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.name   setUTCHoursReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_028
     * @tc.desc   Verify setUTCHours() sets UTC hour.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setUTCHoursReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 10, 0, 0));
      date.setUTCHours(14);
      expect(date.getUTCHours()).assertEqual(14);
    });

    /**
     * @tc.name   setUTCMillisecondsReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_029
     * @tc.desc   Verify setUTCMilliseconds() sets UTC milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setUTCMillisecondsReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 12, 0, 0, 0));
      date.setUTCMilliseconds(123);
      expect(date.getUTCMilliseconds()).assertEqual(123);
    });

    /**
     * @tc.name   setUTCMinutesReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_030
     * @tc.desc   Verify setUTCMinutes() sets UTC minutes.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setUTCMinutesReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 12, 0, 0));
      date.setUTCMinutes(30);
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.name   setUTCMonthReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_031
     * @tc.desc   Verify setUTCMonth() sets UTC month.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setUTCMonthReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 0, 15));
      date.setUTCMonth(5);
      expect(date.getUTCMonth()).assertEqual(5);
    });

    /**
     * @tc.name   setUTCSecondsReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_032
     * @tc.desc   Verify setUTCSeconds() sets UTC seconds.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setUTCSecondsReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 12, 0, 0));
      date.setUTCSeconds(30);
      expect(date.getUTCSeconds()).assertEqual(30);
    });

    /**
     * @tc.name   setYearReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_033
     * @tc.desc   Verify setYear() sets year relative to 1900 (deprecated).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setYearReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2020, 5, 15);
      date.setFullYear(124);
      expect(date.getFullYear()).assertEqual(124);
    });

    /**
     * @tc.name   setYearZeroTo99
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_034
     * @tc.desc   Verify setYear(0) to setYear(99) sets 1900 to 1999.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setYearZeroTo99', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      for (let i = 0; i <= 99; i++) {
        const date: Date = new Date(2024, 5, 15);
        date.setFullYear(i);
        expect(date.getFullYear()).assertEqual(i);
      }

    });

    /**
     * @tc.name   setterDoesNotAffectOriginal
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_035
     * @tc.desc   Verify setters modify the Date object in place.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('setterDoesNotAffectOriginal', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date(2024, 5, 15);
      const date2: Date = new Date(date1.getTime());
      date2.setDate(20);
      expect(date1.getDate()).assertEqual(15);
      expect(date2.getDate()).assertEqual(20);
    });

    /**
     * @tc.name   chainedSetters
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_036
     * @tc.desc   Verify chaining setters modifies date correctly.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('chainedSetters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 12, 30, 45);
      date.setFullYear(2025);
      date.setMonth(11);
      date.setDate(25);
      date.setHours(18);
      date.setMinutes(45);
      date.setSeconds(30);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(25);
      expect(date.getHours()).assertEqual(18);
      expect(date.getMinutes()).assertEqual(45);
      expect(date.getSeconds()).assertEqual(30);
    });

  });
}
