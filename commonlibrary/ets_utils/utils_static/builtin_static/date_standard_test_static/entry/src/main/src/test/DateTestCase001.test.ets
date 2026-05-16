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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
export default function DateTestCase001() {
  describe('DateTestCase001', () => {
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    /**
     * @tc.name   toDateStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_001
     * @tc.desc   Verify toDateString() returns date portion string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toDateStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      const str: string = date.toDateString();
      expect(typeof str).assertEqual('string');
      expect(str.length).assertLarger(0);
    });

    /**
     * @tc.name   toDateStringFormat
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_002
     * @tc.desc   Verify toDateString() format includes month, day, year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toDateStringFormat', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      const str: string = date.toDateString();
      expect(str).assertEqual("Sat Jun 15 2024");
    });

    /**
     * @tc.name   toISOStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_003
     * @tc.desc   Verify toISOString() returns ISO 8601 format string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date('2024-06-15T12:00:00Z');
      const isoString: string = date.toISOString();
      expect(isoString).assertEqual('2024-06-15T12:00:00.000Z');
    });

    /**
     * @tc.name   toISOStringFormat
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_004
     * @tc.desc   Verify toISOString() format compliance.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringFormat', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 14, 30, 45, 123));
      const isoString: string = date.toISOString();
      expect(isoString).assertEqual("2024-06-15T14:30:45.123Z");
    });

    /**
     * @tc.name   toJSONReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_005
     * @tc.desc   Verify toJSON() returns ISO format string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toJSONReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date('2024-06-15T12:00:00Z');
      const json = date.toJSON();
      expect(json).assertEqual('2024-06-15T12:00:00.000Z');
    });

    /**
     * @tc.name   toJSONVsISOString
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_006
     * @tc.desc   Verify toJSON() and toISOString() return same value.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toJSONVsISOString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date('2024-06-15T12:00:00Z');
      expect(date.toJSON()).assertEqual(date.toISOString());
    });

    /**
     * @tc.name   toLocaleDateStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_008
     * @tc.desc   Verify toLocaleDateString() returns localized date string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleDateStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      const str: string = date.toLocaleDateString();
      expect(typeof str).assertEqual('string');
      expect(str.length).assertLarger(0);
    });

    /**
     * @tc.name   toLocaleDateStringWithLocale
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_009
     * @tc.desc   Verify toLocaleDateString() with locale parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleDateStringWithLocale', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      const str: string = date.toLocaleDateString('zh-CN');
      expect(typeof str).assertEqual('string');
    });

    /**
     * @tc.name   toLocaleDateStringWithOptions
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_010
     * @tc.desc   Verify toLocaleDateString() with options parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleDateStringWithOptions', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      const options: Intl.DateTimeFormatOptions = {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      };
      const str: string = date.toLocaleDateString('en-US', options);
      expect(typeof str).assertEqual('string');
    });

    /**
     * @tc.name   toLocaleStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_011
     * @tc.desc   Verify toLocaleString() returns localized date and time string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      const str: string = date.toLocaleString();
      expect(typeof str).assertEqual('string');
      expect(str.length).assertLarger(0);
    });

    /**
     * @tc.name   toLocaleStringWithLocale
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_012
     * @tc.desc   Verify toLocaleString() with locale parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleStringWithLocale', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      const str: string = date.toLocaleString('zh-CN');
      expect(typeof str).assertEqual('string');
    });

    /**
     * @tc.name   toLocaleTimeStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_013
     * @tc.desc   Verify toLocaleTimeString() returns localized time string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleTimeStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      const str: string = date.toLocaleTimeString();
      expect(typeof str).assertEqual('string');
      expect(str.length).assertLarger(0);
    });

    /**
     * @tc.name   toLocaleTimeStringWithLocale
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_014
     * @tc.desc   Verify toLocaleTimeString() with locale parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleTimeStringWithLocale', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      const str: string = date.toLocaleTimeString('en-US');
      expect(typeof str).assertEqual('string');
    });

    /**
     * @tc.name   toLocaleTimeStringWith24Hour
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_015
     * @tc.desc   Verify toLocaleTimeString() with 24-hour format option.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleTimeStringWith24Hour', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      const options: Intl.DateTimeFormatOptions = {
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        hour12: false
      };
      const str: string = date.toLocaleTimeString('en-US', options);
      expect(typeof str).assertEqual('string');
    });

    /**
     * @tc.name   toStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_016
     * @tc.desc   Verify toString() returns human-readable date string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      const str: string = date.toString();
      expect(typeof str).assertEqual('string');
      expect(str.length).assertLarger(0);
    });

    /**
     * @tc.name   toStringVsValueOf
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_017
     * @tc.desc   Verify toString() and valueOf() return different types.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toStringVsValueOf', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      expect(typeof date.toString()).assertEqual('string');
      expect(typeof date.valueOf()).assertEqual('long');
    });

    /**
     * @tc.name   toTimeStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_018
     * @tc.desc   Verify toTimeString() returns time portion string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toTimeStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      const str: string = date.toTimeString();
      expect(typeof str).assertEqual('string');
      expect(str.length).assertLarger(0);
    });

    /**
     * @tc.name   toTimeStringFormat
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_019
     * @tc.desc   Verify toTimeString() format includes hours, minutes, seconds.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toTimeStringFormat', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      const str: string = date.toTimeString();
      expect(str).assertEqual('14:30:45 GMT+0800');
    });

    /**
     * @tc.name   toUTCStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_020
     * @tc.desc   Verify toUTCString() returns UTC formatted string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toUTCStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 14, 30, 45));
      const str: string = date.toUTCString();
      expect(typeof str).assertEqual('string');
      expect(str.length).assertLarger(0);
    });

    /**
     * @tc.name   toUTCStringFormat
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_021
     * @tc.desc   Verify toUTCString() format compliance.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toUTCStringFormat', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 14, 30, 45));
      const str: string = date.toUTCString();
      expect(str).assertEqual('Sat, 15 Jun 2024 14:30:45 GMT');
    });

    /**
     * @tc.name   valueOfReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_022
     * @tc.desc   Verify valueOf() returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('valueOfReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      const value: number = date.valueOf();
      expect(typeof value).assertEqual('number');
      expect(value).assertEqual(date.getTime());
    });

    /**
     * @tc.name   valueOfVsGetTime
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_023
     * @tc.desc   Verify valueOf() and getTime() return same value.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('valueOfVsGetTime', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      expect(date.valueOf()).assertEqual(date.getTime());
    });

    /**
     * @tc.name   toISOStringWithZero
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_024
     * @tc.desc   Verify toISOString() handles epoch time.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringWithZero', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(0);
      expect(date.toISOString()).assertEqual('1970-01-01T00:00:00.000Z');
    });

    /**
     * @tc.name   toISOStringMillisecondPrecision
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_025
     * @tc.desc   Verify toISOString() includes millisecond precision.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringMillisecondPrecision', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(2024, 5, 15, 14, 30, 45, 1));
      const isoString: string = date.toISOString();
      expect(isoString).assertEqual('2024-06-15T14:30:45.001Z');
    });

    /**
     * @tc.name   toISOStringLargeDate
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_026
     * @tc.desc   Verify toISOString() with large year value.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringLargeDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(Date.UTC(9999, 11, 31, 23, 59, 59, 999));
      const isoString: string = date.toISOString();
       expect(isoString).assertEqual('9999-12-31T23:59:59.999Z');
    })

    /**
     * @tc.name   multipleLocaleFormats
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_027
     * @tc.desc   Verify different locale formatting.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('multipleLocaleFormats', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15, 14, 30, 45);
      const locales: string[] = ['en-US', 'zh-CN', 'ja-JP', 'fr-FR', 'de-DE'];
      locales.forEach(locale => {
        const str: string = date.toLocaleDateString(locale);
        expect(typeof str).assertEqual('string');
      });
    });

    /**
     * @tc.name   customFormatOptions
     * @tc.number SUB_COMMONLIBRARY_DATE_CONVERTERS_028
     * @tc.desc   Verify custom format options for toLocaleDateString.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('customFormatOptions', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 5, 15);
      const options: Intl.DateTimeFormatOptions = {
        weekday: 'long',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      };
      const str: string = date.toLocaleDateString('en-US', options);
      expect(typeof str).assertEqual('string');
      expect(str.length).assertLarger(0);
    });

  });
}
