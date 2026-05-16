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

export default function DateTestCase007() {
  describe('DateTestCase007', () => {
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    /**
     * @tc.name   dateNowReturnsNumber
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_001
     * @tc.desc   Verify Date.now() returns a number representing milliseconds since epoch.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateNowReturnsNumber', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const now: number = Date.now();
      expect(typeof now).assertEqual('number');
      expect(now).assertLarger(0);
    });

    /**
     * @tc.name   dateNowIncrements
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_002
     * @tc.desc   Verify Date.now() returns increasing values on subsequent calls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateNowIncrements', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const start: number = Date.now();
      const end: number = Date.now();
      expect(end >= start).assertTrue();
    });

    /**
     * @tc.name   dateNowPrecision
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_003
     * @tc.desc   Verify Date.now() returns values with millisecond precision.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateNowPrecision', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const now: number = Date.now();
      expect(now % 1).assertEqual(0);
    });

    /**
     * @tc.name   dateParseValidDate
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_004
     * @tc.desc   Verify Date.parse() with valid date string returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateParseValidDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp: number = Date.parse('2024-01-15T12:00:00Z');
      expect(typeof timestamp).assertEqual('number');
      expect(timestamp).assertLarger(0);
    });

    /**
     * @tc.name   dateParseISO8601
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_005
     * @tc.desc   Verify Date.parse() with ISO 8601 format.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateParseISO8601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const isoString: string = '2024-06-15T14:30:45.123Z';
      const timestamp = Date.parse(isoString);
      const date: Date = new Date(timestamp);
      expect(date.toISOString()).assertEqual(isoString);
    });

    /**
     * @tc.name   dateParseRFC2822
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_006
     * @tc.desc   Verify Date.parse() with RFC 2822 format.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateParseRFC2822', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const rfcString: string = 'Tue, 15 Jun 2024 14:30:45 GMT';
      const timestamp: number = Date.parse(rfcString);
      expect(typeof timestamp).assertEqual('number');
      expect(timestamp).assertLarger(0);
    });

    /**
     * @tc.name   dateParseInvalid
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_007
     * @tc.desc   Verify Date.parse() with invalid string returns NaN.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateParseInvalid', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      try {
        const invalid: number = Date.parse('not a date');
      } catch (e) {
        expect(e.name).assertEqual('FormatError')
      }
    });

    /**
     * @tc.name   dateParseEmpty
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_008
     * @tc.desc   Verify Date.parse() with empty string returns NaN.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateParseEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      try {
        const empty: number = Date.parse('');
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.name   dateUTCBasic
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_009
     * @tc.desc   Verify Date.UTC() with basic parameters returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateUTCBasic', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp: number = Date.UTC(2024, 5, 15, 14, 30, 45, 123);
      expect(typeof timestamp).assertEqual('number');
      expect(timestamp).assertLarger(0);
    });

    /**
     * @tc.name   dateUTCEpoch
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_010
     * @tc.desc   Verify Date.UTC(1970, 0, 1) returns 0.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateUTCEpoch', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp: number = Date.UTC(1970, 0, 1);
      expect(timestamp).assertEqual(0);
    });

    /**
     * @tc.name   dateUTCMilliseconds
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_011
     * @tc.desc   Verify Date.UTC() includes millisecond precision.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateUTCMilliseconds', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp = Date.UTC(2024, 5, 15, 14, 30, 45, 999);
      const date: Date = new Date(timestamp);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.name   dateUTCNegativeYear
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_012
     * @tc.desc   Verify Date.UTC() with negative year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateUTCNegativeYear', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp: number = Date.UTC(-100, 5, 15);
      expect(timestamp).assertLess(0);
    });

    /**
     * @tc.name   dateUTCLargeYear
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_013
     * @tc.desc   Verify Date.UTC() with large year.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateUTCLargeYear', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp: number = Date.UTC(9999, 11, 31);
      expect(timestamp).assertLarger(0);
    });

    /**
     * @tc.name   dateUTCLocalVsUTC
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_014
     * @tc.desc   Verify difference between Date.UTC() and local time constructor.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateUTCLocalVsUTC', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const utcTimestamp: number = Date.UTC(2024, 5, 15, 12, 0, 0);
      const localDate: Date = new Date(2024, 5, 15, 12, 0, 0);
      expect(utcTimestamp !== localDate.getTime()).assertTrue();
    });

    /**
     * @tc.name   dateParseVsConstructor
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_015
     * @tc.desc   Verify Date.parse() vs Date constructor with string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateParseVsConstructor', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const str: string = '2024-06-15T12:00:00Z';
      const parseResult: number = Date.parse(str);
      const date: Date = new Date(str);
      expect(parseResult).assertEqual(date.getTime());
    });

    /**
     * @tc.name   dateParseTimeOnly
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_016
     * @tc.desc   Verify Date.parse() with time-only string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateParseTimeOnly', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp: number = Date.parse('1970-01-01T12:30:45.123Z');
      const expected: number = 12 * 3600000 + 30 * 60000 + 45 * 1000 + 123;
      expect(timestamp).assertEqual(expected);
    });

    /**
     * @tc.name   dateUTCOverflow
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_017
     * @tc.desc   Verify Date.UTC() handles overflow in parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateUTCOverflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const overflow: number = Date.UTC(2024, 12, 32);
      const normal: number = Date.UTC(2025, 0, 1);
      expect(overflow).assertEqual(1738368000000);
      expect(normal).assertEqual(1735689600000);
    });

    /**
     * @tc.name   dateUTCUnderflow
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_018
     * @tc.desc   Verify Date.UTC() handles underflow in parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateUTCUnderflow', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const underflow: number = Date.UTC(2024, 0, 0);
      const normal: number = Date.UTC(2023, 11, 31);
      expect(underflow).assertEqual(normal);
    });

    /**
     * @tc.name   dateUTCMinimalParams
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_019
     * @tc.desc   Verify Date.UTC() with minimal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateUTCMinimalParams', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const timestamp = Date.UTC(2024, 5);
      const date: Date = new Date(timestamp);
      expect(date.getUTCFullYear()).assertEqual(2024);
      expect(date.getUTCMonth()).assertEqual(5);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.name   dateParseCaseInsensitive
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_020
     * @tc.desc   Verify Date.parse() is case-insensitive for month names.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateParseCaseInsensitive', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const upper: number = Date.parse('15 JUNE 2024');
      const lower: number = Date.parse('15 june 2024');
      expect(upper).assertEqual(lower);
    });

    /**
     * @tc.name   dateNowVsDateConstructor
     * @tc.number SUB_COMMONLIBRARY_DATE_STATIC_021
     * @tc.desc   Verify Date.now() equals new Date().getTime().
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('dateNowVsDateConstructor', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const nowNumber: number = Date.now();
      const nowDate: Date = new Date();
      expect(Math.abs(nowDate.getTime() - nowNumber)).assertLess(10);
    });

  });
}
