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

import { describe, it, expect, TestType, Level, Size, beforeEach } from '@ohos/hypium';
function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}
export default function DateTestCase005() {
  describe('DateTestCase005', () => {
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    /**
     * @tc.name   getDateReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_001
     * @tc.desc   Verify getDate() returns day of month (1-31).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getDateReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.name   getDateRange
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_002
     * @tc.desc   Verify getDate() returns values in range 1-31.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getDateRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const dates: Date[] = [
        new Date(2024, 0, 1),
        new Date(2024, 0, 31),
        new Date(2024, 5, 15),
        new Date(2024, 11, 31)
      ];
      dates.forEach(date => {
        const day: number = date.getDate();
        expect(day >= 1 && day <= 31).assertTrue();
      });
    });

    /**
     * @tc.name   getDayReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_003
     * @tc.desc   Verify getDay() returns day of week (0-6).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getDayReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const monday: Date = new Date(2024, 0, 1);
      expect(monday.getDay()).assertEqual(1);
    });

    /**
     * @tc.name   getDayRange
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_004
     * @tc.desc   Verify getDay() returns values in range 0-6.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getDayRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const week: Date[] = [];
      for (let i = 0; i < 7; i++) {
        week.push(new Date(2024, 0, i + 1));
      }
      week.forEach(date => {
        const day: number = date.getDay();
        expect(day >= 0 && day <= 6).assertTrue();
      });
    });

    /**
     * @tc.name   getFullYearReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_005
     * @tc.desc   Verify getFullYear() returns four-digit year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getFullYearReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      expect(date.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.name   getFullYearRange
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_006
     * @tc.desc   Verify getFullYear() handles various year ranges.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getFullYearRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const years: number[] = [1900, 1970, 2000, 2024, 2100];
      years.forEach(year => {
        const date: Date = new Date(year, 5, 15);
        expect(date.getFullYear()).assertEqual(year);
      });
    });

    /**
     * @tc.name   getHoursReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_007
     * @tc.desc   Verify getHours() returns hour (0-23).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getHoursReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      expect(date.getHours()).assertEqual(14);
    });

    /**
     * @tc.name   getHoursRange
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_008
     * @tc.desc   Verify getHours() returns values in range 0-23.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getHoursRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      for (let hour = 0; hour <= 23; hour++) {
        const date: Date = new Date(2024, 5, 15, hour, 0, 0);
        expect(date.getHours()).assertEqual(hour);
      }
    });

    /**
     * @tc.name   getMillisecondsReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_009
     * @tc.desc   Verify getMilliseconds() returns milliseconds (0-999).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getMillisecondsReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45, 123);
      expect(date.getMilliseconds()).assertEqual(123);
    });

    /**
     * @tc.name   getMillisecondsRange
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_010
     * @tc.desc   Verify getMilliseconds() returns values in range 0-999.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getMillisecondsRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const dates: Date[] = [
        new Date(2024, 5, 15, 0, 0, 0, 0),
        new Date(2024, 5, 15, 0, 0, 0, 500),
        new Date(2024, 5, 15, 0, 0, 0, 999)
      ];
      dates.forEach(date => {
        const ms: number = date.getMilliseconds();
        expect(ms >= 0 && ms <= 999).assertTrue();
      });
    });

    /**
     * @tc.name   getMinutesReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_011
     * @tc.desc   Verify getMinutes() returns minutes (0-59).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getMinutesReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      expect(date.getMinutes()).assertEqual(30);
    });

    /**
     * @tc.name   getMinutesRange
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_012
     * @tc.desc   Verify getMinutes() returns values in range 0-59.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getMinutesRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      for (let minute = 0; minute <= 59; minute++) {
        const date: Date = new Date(2024, 5, 15, 12, minute, 0);
        expect(date.getMinutes()).assertEqual(minute);
      }
    });

    /**
     * @tc.name   getMonthReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_013
     * @tc.desc   Verify getMonth() returns month (0-11).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getMonthReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      expect(date.getMonth()).assertEqual(5);
    });

    /**
     * @tc.name   getMonthRange
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_014
     * @tc.desc   Verify getMonth() returns values in range 0-11.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getMonthRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      for (let month = 0; month <= 11; month++) {
        const date: Date = new Date(2024, month, 15);
        expect(date.getMonth()).assertEqual(month);
      }
    });

    /**
     * @tc.name   getSecondsReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_015
     * @tc.desc   Verify getSeconds() returns seconds (0-59).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getSecondsReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      expect(date.getSeconds()).assertEqual(45);
    });

    /**
     * @tc.name   getSecondsRange
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_016
     * @tc.desc   Verify getSeconds() returns values in range 0-59.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getSecondsRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      for (let second = 0; second <= 59; second++) {
        const date: Date = new Date(2024, 5, 15, 12, 30, second);
        expect(date.getSeconds()).assertEqual(second);
      }
    });

    /**
     * @tc.name   getTimeReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_017
     * @tc.desc   Verify getTime() returns timestamp in milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getTimeReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date('2024-06-15T12:00:00Z');
      const time: number = date.getTime();
      expect(typeof time).assertEqual('number');
      expect(time).assertLarger(0);
    });

    /**
     * @tc.name   getTimeEpoch
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_018
     * @tc.desc   Verify getTime() returns 0 for epoch.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getTimeEpoch', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(0);
      expect(date.getTime()).assertEqual(0);
    });

    /**
     * @tc.name   getTimezoneOffsetReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_019
     * @tc.desc   Verify getTimezoneOffset() returns offset in minutes.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getTimezoneOffsetReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date();
      const offset: number = date.getTimezoneOffset();
      expect(typeof offset).assertEqual('number');
      expect(offset >= -720 && offset <= 720).assertTrue();
    });

    /**
     * @tc.name   getTimezoneOffsetRange
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_020
     * @tc.desc   Verify getTimezoneOffset() returns values within valid range.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getTimezoneOffsetRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date();
      const offset: number = date.getTimezoneOffset();
      expect(offset >= -720 && offset <= 720).assertTrue();
    });

    /**
     * @tc.name   getUTCDateReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_021
     * @tc.desc   Verify getUTCDate() returns UTC day of month.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getUTCDateReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15));
      expect(date.getUTCDate()).assertEqual(15);
    });

    /**
     * @tc.name   getUTCDayReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_022
     * @tc.desc   Verify getUTCDay() returns UTC day of week.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getUTCDayReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 0, 1));
      expect(date.getUTCDay()).assertEqual(1);
    });

    /**
     * @tc.name   getUTCFullYearReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_023
     * @tc.desc   Verify getUTCFullYear() returns UTC year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getUTCFullYearReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15));
      expect(date.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.name   getUTCHoursReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_024
     * @tc.desc   Verify getUTCHours() returns UTC hour.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getUTCHoursReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 14, 30, 45));
      expect(date.getUTCHours()).assertEqual(14);
    });

    /**
     * @tc.name   getUTCMillisecondsReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_025
     * @tc.desc   Verify getUTCMilliseconds() returns UTC milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getUTCMillisecondsReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 14, 30, 45, 123));
      expect(date.getUTCMilliseconds()).assertEqual(123);
    });

    /**
     * @tc.name   getUTCMinutesReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_026
     * @tc.desc   Verify getUTCMinutes() returns UTC minutes.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getUTCMinutesReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 14, 30, 45));
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.name   getUTCMonthReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_027
     * @tc.desc   Verify getUTCMonth() returns UTC month.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getUTCMonthReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15));
      expect(date.getUTCMonth()).assertEqual(5);
    });

    /**
     * @tc.name   getUTCSecondsReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_028
     * @tc.desc   Verify getUTCSeconds() returns UTC seconds.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getUTCSecondsReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 14, 30, 45));
      expect(date.getUTCSeconds()).assertEqual(45);
    });

    /**
     * @tc.name   getYearReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_029
     * @tc.desc   Verify getYear() returns year relative to 1900 (deprecated).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getYearReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      expect(date.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.name   getYearVsFullYear
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_030
     * @tc.desc   Verify relationship between getYear() and getFullYear().
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('getYearVsFullYear', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      expect(date.getFullYear() - 1900).assertEqual(124);
    });

    /**
     * @tc.name   localVsUTCGetters
     * @tc.number SUB_COMMONLIBRARY_DATE_GETTERS_031
     * @tc.desc   Verify difference between local and UTC getters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('localVsUTCGetters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 12, 0, 0));
      const offset: number = date.getTimezoneOffset();
      const diffHours: number = Math.round(offset / 60);
      const diffMinutes: number = Math.abs(offset % 60);
      
      const localHours: number = date.getHours();
      const utcHours: number = date.getUTCHours();
      const hoursDiff: number = (localHours - utcHours + 24) % 24;
      expect(Math.abs(hoursDiff - diffHours) <= 1).assertFalse();
    });

  });
}
