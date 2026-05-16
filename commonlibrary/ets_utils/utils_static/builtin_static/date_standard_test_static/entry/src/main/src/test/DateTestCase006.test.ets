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

export default function DateTestCase006() {
  describe('DateTestCase006', () => {
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    /**
     * @tc.name   toStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_001
     * @tc.desc   toString() returns string type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(1995, 11, 17, 3, 24, 0);
      expect(date.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');
    });


    /**
     * @tc.name   toStringWithZeroDate
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_003
     * @tc.desc   toString() with epoch time (1970-01-01).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toStringWithZeroDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(0);
      expect(date.toString()).assertEqual('Thu Jan 01 1970 08:00:00 GMT+0800');
      expect(date.toDateString()).assertEqual('Thu Jan 01 1970');
      expect(date.toTimeString()).assertEqual('08:00:00 GMT+0800');
      expect(date.toLocaleString()).assertEqual('1/1/1970, 8:00:00 AM');
      expect(date.toLocaleDateString()).assertEqual('1/1/1970');
      expect(date.toLocaleTimeString()).assertEqual('8:00:00 AM');
      expect(date.toUTCString()).assertEqual('Thu, 01 Jan 1970 00:00:00 GMT');
      expect(date.toISOString()).assertEqual('1970-01-01T00:00:00.000Z');
    });

    /**
     * @tc.name   toStringWithMaxDate
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_005
     * @tc.desc   toString() with maximum timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toStringWithMaxDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(8640000000000000);
      expect(date.toString()).assertEqual('Sat Sep 13 275760 08:00:00 GMT+0800');
      expect(date.toDateString()).assertEqual('Sat Sep 13 275760');
      expect(date.toTimeString()).assertEqual('08:00:00 GMT+0800');
      expect(date.toLocaleString()).assertEqual('9/13/275760, 8:00:00 AM');
      expect(date.toLocaleDateString()).assertEqual('9/13/275760');
      expect(date.toLocaleTimeString()).assertEqual('8:00:00 AM');
      expect(date.toUTCString()).assertEqual('Sat, 13 Sep 275760 00:00:00 GMT');
      expect(date.toISOString()).assertEqual('+275760-09-13T00:00:00.000Z');
    });

    /**
     * @tc.name   toDateStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_007
     * @tc.desc   toDateString() returns string type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toDateStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(1995, 11, 17, 3, 24, 0);
      expect(date.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');
    });


    /**
     * @tc.name   toTimeStringWithInvalidDate
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_015
     * @tc.desc   toTimeString() with invalid date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toTimeStringWithInvalidDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(8191999999999);
      expect(date.toString()).assertEqual('Thu Aug 06 2229 03:33:19 GMT+0800');
      expect(date.toDateString()).assertEqual('Thu Aug 06 2229');
      expect(date.toTimeString()).assertEqual('03:33:19 GMT+0800');
      expect(date.toLocaleString()).assertEqual('8/6/2229, 3:33:19 AM');
      expect(date.toLocaleDateString()).assertEqual('8/6/2229');
      expect(date.toLocaleTimeString()).assertEqual('3:33:19 AM');
      expect(date.toUTCString()).assertEqual('Wed, 05 Aug 2229 19:33:19 GMT');
      expect(date.toISOString()).assertEqual('2229-08-05T19:33:19.999Z');
    });


    /**
     * @tc.name   toUTCStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_017
     * @tc.desc   toUTCString() returns string type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toUTCStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("1995-12-17T03:24:00");
      const date2: Date = new Date("1995-12-17");
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');

      expect(date2.toString()).assertEqual('Sun Dec 17 1995 08:00:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date2.toTimeString()).assertEqual('08:00:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/17/1995, 8:00:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date2.toLocaleTimeString()).assertEqual('8:00:00 AM');
      expect(date2.toUTCString()).assertEqual('Sun, 17 Dec 1995 00:00:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-17T00:00:00.000Z');
    });

    /**
     * @tc.name   toUTCStringContainsGMT
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_018
     * @tc.desc   toUTCString() contains GMT.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toUTCStringContainsGMT', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("December 17, 1995 03:24:00");
      const date2: Date = new Date("Mon, 25 Dec 1995 13:30:00 GMT");
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');
      expect(date2.toString()).assertEqual('Mon Dec 25 1995 21:30:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Mon Dec 25 1995');
      expect(date2.toTimeString()).assertEqual('21:30:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/25/1995, 9:30:00 PM');
      expect(date2.toLocaleDateString()).assertEqual('12/25/1995');
      expect(date2.toLocaleTimeString()).assertEqual('9:30:00 PM');
      expect(date2.toUTCString()).assertEqual('Mon, 25 Dec 1995 13:30:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-25T13:30:00.000Z');
    });

    /**
     * @tc.name   toUTCStringWithInvalidDate
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_019
     * @tc.desc   toUTCString() with invalid date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toUTCStringWithInvalidDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("1999-12-31");
      const date2: Date = new Date("1999-12-31T03:24:00");
      expect(date1.toString()).assertEqual('Fri Dec 31 1999 08:00:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Fri Dec 31 1999');
      expect(date1.toTimeString()).assertEqual('08:00:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/31/1999, 8:00:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/31/1999');
      expect(date1.toLocaleTimeString()).assertEqual('8:00:00 AM');
      expect(date1.toUTCString()).assertEqual('Fri, 31 Dec 1999 00:00:00 GMT');
      expect(date1.toISOString()).assertEqual('1999-12-31T00:00:00.000Z');


      expect(date2.toString()).assertEqual('Fri Dec 31 1999 03:24:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Fri Dec 31 1999');
      expect(date2.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/31/1999, 3:24:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('12/31/1999');
      expect(date2.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date2.toUTCString()).assertEqual('Thu, 30 Dec 1999 19:24:00 GMT');
      expect(date2.toISOString()).assertEqual('1999-12-30T19:24:00.000Z');
    });

    /**
     * @tc.name   toUTCStringWithEpoch
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_020
     * @tc.desc   toUTCString() with epoch time.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toUTCStringWithEpoch', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("1995-12-17T03:24:00Z");
      const date2: Date = new Date("1995-12-17T03:24:00+08:00");
      const date3: Date = new Date("1995-12-17T03:24:00+08:00");
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 11:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('11:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 11:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('11:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sun, 17 Dec 1995 03:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-17T03:24:00.000Z');

      expect(date2.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date2.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date2.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date2.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');

      expect(date3.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date3.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date3.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date3.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date3.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date3.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date3.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date3.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');
    });

    /**
     * @tc.name   toISOStringReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_021
     * @tc.desc   toISOString() returns ISO 8601 format.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("1995-12-17T03:24:00.000");
      const date2: Date = new Date("1995-12-17T03:24:00.123");

      expect(date1.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');

      expect(date2.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date2.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date2.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date2.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-16T19:24:00.123Z');
    });

    /**
     * @tc.name   toISOStringFormat
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_022
     * @tc.desc   toISOString() format includes T and Z.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringFormat', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("December 17, 1995 03:24:00");
      const date2: Date = new Date("Mon, 25 Dec 1995 13:30:00 GMT");
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');
      expect(date2.toString()).assertEqual('Mon Dec 25 1995 21:30:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Mon Dec 25 1995');
      expect(date2.toTimeString()).assertEqual('21:30:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/25/1995, 9:30:00 PM');
      expect(date2.toLocaleDateString()).assertEqual('12/25/1995');
      expect(date2.toLocaleTimeString()).assertEqual('9:30:00 PM');
      expect(date2.toUTCString()).assertEqual('Mon, 25 Dec 1995 13:30:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-25T13:30:00.000Z');
    });

    /**
     * @tc.name   toISOStringMilliseconds
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_023
     * @tc.desc   toISOString() includes milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringMilliseconds', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("Sunday, December 17, 1995 03:24:00");
      const date2: Date = new Date("Mon, 12 Mar 2024 15:30:00 GMT");
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');

      expect(date2.toString()).assertEqual('Tue Mar 12 2024 23:30:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Tue Mar 12 2024');
      expect(date2.toTimeString()).assertEqual('23:30:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('3/12/2024, 11:30:00 PM');
      expect(date2.toLocaleDateString()).assertEqual('3/12/2024');
      expect(date2.toLocaleTimeString()).assertEqual('11:30:00 PM');
      expect(date2.toUTCString()).assertEqual('Tue, 12 Mar 2024 15:30:00 GMT');
      expect(date2.toISOString()).assertEqual('2024-03-12T15:30:00.000Z');
    });

    /**
     * @tc.name   toISOStringWithEpoch
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_024
     * @tc.desc   toISOString() with epoch time.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringWithEpoch', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("December 17, 1995");
      const date2: Date = new Date("Dec 17, 1995");
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 00:00:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 12:00:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 16:00:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T16:00:00.000Z');

      expect(date2.toString()).assertEqual('Sun Dec 17 1995 00:00:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date2.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/17/1995, 12:00:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date2.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date2.toUTCString()).assertEqual('Sat, 16 Dec 1995 16:00:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-16T16:00:00.000Z');
    });

    /**
     * @tc.name   toISOStringWithInvalidDate
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_025
     * @tc.desc   toISOString() throws error for invalid date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringWithInvalidDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("1995-12-17T03:24:00");
      const date2: Date = new Date("2024-03-12T10:30:45");

      expect(date1.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');

      expect(date2.toString()).assertEqual('Tue Mar 12 2024 10:30:45 GMT+0800');
      expect(date2.toDateString()).assertEqual('Tue Mar 12 2024');
      expect(date2.toTimeString()).assertEqual('10:30:45 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('3/12/2024, 10:30:45 AM');
      expect(date2.toLocaleDateString()).assertEqual('3/12/2024');
      expect(date2.toLocaleTimeString()).assertEqual('10:30:45 AM');
      expect(date2.toUTCString()).assertEqual('Tue, 12 Mar 2024 02:30:45 GMT');
      expect(date2.toISOString()).assertEqual('2024-03-12T02:30:45.000Z');
    });

    /**
     * @tc.name   toISOStringWithZeroMilliseconds
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_026
     * @tc.desc   toISOString() with zero milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringWithZeroMilliseconds', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("1995-12-17T03:24:00Z");
      const date2: Date = new Date("2024-03-12T10:30:45Z");
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 11:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('11:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 11:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('11:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sun, 17 Dec 1995 03:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-17T03:24:00.000Z');

      expect(date2.toString()).assertEqual('Tue Mar 12 2024 18:30:45 GMT+0800');
      expect(date2.toDateString()).assertEqual('Tue Mar 12 2024');
      expect(date2.toTimeString()).assertEqual('18:30:45 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('3/12/2024, 6:30:45 PM');
      expect(date2.toLocaleDateString()).assertEqual('3/12/2024');
      expect(date2.toLocaleTimeString()).assertEqual('6:30:45 PM');
      expect(date2.toUTCString()).assertEqual('Tue, 12 Mar 2024 10:30:45 GMT');
      expect(date2.toISOString()).assertEqual('2024-03-12T10:30:45.000Z');
    });

    /**
     * @tc.name   toISOStringWith999Milliseconds
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_027
     * @tc.desc   toISOString() with 999 milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toISOStringWith999Milliseconds', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("1995-12-17T03:24:00+08:00");
      const date2: Date = new Date("1995-12-17T03:24:00-05:00");
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');
      expect(date2.toString()).assertEqual('Sun Dec 17 1995 16:24:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date2.toTimeString()).assertEqual('16:24:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/17/1995, 4:24:00 PM');
      expect(date2.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date2.toLocaleTimeString()).assertEqual('4:24:00 PM');
      expect(date2.toUTCString()).assertEqual('Sun, 17 Dec 1995 08:24:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-17T08:24:00.000Z');
    });

    /**
     * @tc.name   toJSONReturnValue
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_028
     * @tc.desc   toJSON() returns ISO format string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toJSONReturnValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("1995-12-17");
      const date2: Date = new Date("1995-12-17T19:24:00");
      const date3: Date = new Date("2024-03-12T10:30:45");
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 08:00:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('08:00:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 8:00:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('8:00:00 AM');
      expect(date1.toUTCString()).assertEqual('Sun, 17 Dec 1995 00:00:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-17T00:00:00.000Z');
      expect(date2.toString()).assertEqual('Sun Dec 17 1995 19:24:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date2.toTimeString()).assertEqual('19:24:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/17/1995, 7:24:00 PM');
      expect(date2.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date2.toLocaleTimeString()).assertEqual('7:24:00 PM');
      expect(date2.toUTCString()).assertEqual('Sun, 17 Dec 1995 11:24:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-17T11:24:00.000Z');
      expect(date3.toString()).assertEqual('Tue Mar 12 2024 10:30:45 GMT+0800');
      expect(date3.toDateString()).assertEqual('Tue Mar 12 2024');
      expect(date3.toTimeString()).assertEqual('10:30:45 GMT+0800');
      expect(date3.toLocaleString()).assertEqual('3/12/2024, 10:30:45 AM');
      expect(date3.toLocaleDateString()).assertEqual('3/12/2024');
      expect(date3.toLocaleTimeString()).assertEqual('10:30:45 AM');
      expect(date3.toUTCString()).assertEqual('Tue, 12 Mar 2024 02:30:45 GMT');
      expect(date3.toISOString()).assertEqual('2024-03-12T02:30:45.000Z');
    });

    /**
     * @tc.name   toJSONSameAsISOString
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_029
     * @tc.desc   toJSON() returns same as toISOString().
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toJSONSameAsISOString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("1995-12-17T03:24:00.000");
      const date2: Date = new Date("2024-03-12T10:30:45.123");
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');
      expect(date2.toString()).assertEqual('Tue Mar 12 2024 10:30:45 GMT+0800');
      expect(date2.toDateString()).assertEqual('Tue Mar 12 2024');
      expect(date2.toTimeString()).assertEqual('10:30:45 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('3/12/2024, 10:30:45 AM');
      expect(date2.toLocaleDateString()).assertEqual('3/12/2024');
      expect(date2.toLocaleTimeString()).assertEqual('10:30:45 AM');
      expect(date2.toUTCString()).assertEqual('Tue, 12 Mar 2024 02:30:45 GMT');
      expect(date2.toISOString()).assertEqual('2024-03-12T02:30:45.123Z');
    });

    /**
     * @tc.name   toJSONWithInvalidDate
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_030
     * @tc.desc   toJSON() returns null for invalid date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toJSONWithInvalidDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date(1995, 0, 1);
      const date2: Date = new Date(1995, 13, 1);
      expect(date1.toString()).assertEqual('Sun Jan 01 1995 00:00:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Jan 01 1995');
      expect(date1.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('1/1/1995, 12:00:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('1/1/1995');
      expect(date1.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 31 Dec 1994 16:00:00 GMT');
      expect(date1.toISOString()).assertEqual('1994-12-31T16:00:00.000Z');
      expect(date2.toString()).assertEqual('Thu Feb 01 1996 00:00:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Thu Feb 01 1996');
      expect(date2.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('2/1/1996, 12:00:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('2/1/1996');
      expect(date2.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date2.toUTCString()).assertEqual('Wed, 31 Jan 1996 16:00:00 GMT');
      expect(date2.toISOString()).assertEqual('1996-01-31T16:00:00.000Z');
    });

    /**
     * @tc.name   toJSONWithMaxDate
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_032
     * @tc.desc   toJSON() with maximum date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toJSONWithMaxDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date(2013, 13, 1);
      expect(date1.toString()).assertEqual('Sat Feb 01 2014 00:00:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sat Feb 01 2014');
      expect(date1.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('2/1/2014, 12:00:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('2/1/2014');
      expect(date1.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date1.toUTCString()).assertEqual('Fri, 31 Jan 2014 16:00:00 GMT');
      expect(date1.toISOString()).assertEqual('2014-01-31T16:00:00.000Z');

      const date2: Date = new Date(2013, -1, 1);
      expect(date2.toString()).assertEqual('Sat Dec 01 2012 00:00:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sat Dec 01 2012');
      expect(date2.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/1/2012, 12:00:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('12/1/2012');
      expect(date2.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date2.toUTCString()).assertEqual('Fri, 30 Nov 2012 16:00:00 GMT');
      expect(date2.toISOString()).assertEqual('2012-11-30T16:00:00.000Z');

      const date3: Date = new Date(1995, 11, 32);

      expect(date3.toString()).assertEqual('Mon Jan 01 1996 00:00:00 GMT+0800');
      expect(date3.toDateString()).assertEqual('Mon Jan 01 1996');
      expect(date3.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date3.toLocaleString()).assertEqual('1/1/1996, 12:00:00 AM');
      expect(date3.toLocaleDateString()).assertEqual('1/1/1996');
      expect(date3.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date3.toUTCString()).assertEqual('Sun, 31 Dec 1995 16:00:00 GMT');
      expect(date3.toISOString()).assertEqual('1995-12-31T16:00:00.000Z');
      const date4: Date = new Date(1995, 11, 0);
      expect(date4.toString()).assertEqual('Thu Nov 30 1995 00:00:00 GMT+0800');
      expect(date4.toDateString()).assertEqual('Thu Nov 30 1995');
      expect(date4.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date4.toLocaleString()).assertEqual('11/30/1995, 12:00:00 AM');
      expect(date4.toLocaleDateString()).assertEqual('11/30/1995');
      expect(date4.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date4.toUTCString()).assertEqual('Wed, 29 Nov 1995 16:00:00 GMT');
      expect(date4.toISOString()).assertEqual('1995-11-29T16:00:00.000Z');

      const date5: Date = new Date(2013, 2, 1, 0, 70);
      expect(date5.toString()).assertEqual('Fri Mar 01 2013 01:10:00 GMT+0800');
      expect(date5.toDateString()).assertEqual('Fri Mar 01 2013');
      expect(date5.toTimeString()).assertEqual('01:10:00 GMT+0800');
      expect(date5.toLocaleString()).assertEqual('3/1/2013, 1:10:00 AM');
      expect(date5.toLocaleDateString()).assertEqual('3/1/2013');
      expect(date5.toLocaleTimeString()).assertEqual('1:10:00 AM');
      expect(date5.toUTCString()).assertEqual('Thu, 28 Feb 2013 17:10:00 GMT');
      expect(date5.toISOString()).assertEqual('2013-02-28T17:10:00.000Z');
    });

    /**
     * @tc.name   toJSONWithMinDate
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_033
     * @tc.desc   toJSON() with minimum date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toJSONWithMinDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date(1995, 11);
      const date2: Date = new Date(1995, 11, 17, 3);
      expect(date1.toString()).assertEqual('Fri Dec 01 1995 00:00:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Fri Dec 01 1995');
      expect(date1.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/1/1995, 12:00:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/1/1995');
      expect(date1.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date1.toUTCString()).assertEqual('Thu, 30 Nov 1995 16:00:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-11-30T16:00:00.000Z');
      expect(date2.toString()).assertEqual('Sun Dec 17 1995 03:00:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date2.toTimeString()).assertEqual('03:00:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/17/1995, 3:00:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date2.toLocaleTimeString()).assertEqual('3:00:00 AM');
      expect(date2.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:00:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-16T19:00:00.000Z');
    });

    /**
     * @tc.name   toLocaleDateStringWithZhCN
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_036
     * @tc.desc   toLocaleDateString() with zh-CN locale.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleDateStringWithZhCN', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date(1995, 11, 1);
      expect(date1.toString()).assertEqual('Fri Dec 01 1995 00:00:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Fri Dec 01 1995');
      expect(date1.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/1/1995, 12:00:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/1/1995');
      expect(date1.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date1.toUTCString()).assertEqual('Thu, 30 Nov 1995 16:00:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-11-30T16:00:00.000Z');
      const date2: Date = new Date(1995, 11, 31);
      expect(date2.toString()).assertEqual('Sun Dec 31 1995 00:00:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sun Dec 31 1995');
      expect(date2.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/31/1995, 12:00:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('12/31/1995');
      expect(date2.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date2.toUTCString()).assertEqual('Sat, 30 Dec 1995 16:00:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-30T16:00:00.000Z');
      const date3: Date = new Date(1995, 11, 0);
      expect(date3.toString()).assertEqual('Thu Nov 30 1995 00:00:00 GMT+0800');
      expect(date3.toDateString()).assertEqual('Thu Nov 30 1995');
      expect(date3.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date3.toLocaleString()).assertEqual('11/30/1995, 12:00:00 AM');
      expect(date3.toLocaleDateString()).assertEqual('11/30/1995');
      expect(date3.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date3.toUTCString()).assertEqual('Wed, 29 Nov 1995 16:00:00 GMT');
      expect(date3.toISOString()).assertEqual('1995-11-29T16:00:00.000Z');
      const date4: Date = new Date(1995, 11, 32);
      expect(date4.toString()).assertEqual('Mon Jan 01 1996 00:00:00 GMT+0800');
      expect(date4.toDateString()).assertEqual('Mon Jan 01 1996');
      expect(date4.toTimeString()).assertEqual('00:00:00 GMT+0800');
      expect(date4.toLocaleString()).assertEqual('1/1/1996, 12:00:00 AM');
      expect(date4.toLocaleDateString()).assertEqual('1/1/1996');
      expect(date4.toLocaleTimeString()).assertEqual('12:00:00 AM');
      expect(date4.toUTCString()).assertEqual('Sun, 31 Dec 1995 16:00:00 GMT');
      expect(date4.toISOString()).assertEqual('1995-12-31T16:00:00.000Z');
    });

    /**
     * @tc.name   toLocaleDateStringWithOptions
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_037
     * @tc.desc   toLocaleDateString() with options.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleDateStringWithOptions', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date("1995");
      expect(date1.toString()).assertEqual('Sun Jan 01 1995 08:00:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Jan 01 1995');
      expect(date1.toTimeString()).assertEqual('08:00:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('1/1/1995, 8:00:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('1/1/1995');
      expect(date1.toLocaleTimeString()).assertEqual('8:00:00 AM');
      expect(date1.toUTCString()).assertEqual('Sun, 01 Jan 1995 00:00:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-01-01T00:00:00.000Z');
      try {
        new Date("2024/13/01");
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.name   toLocaleDateStringWithInvalidDate
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_038
     * @tc.desc   toLocaleDateString() with invalid date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleDateStringWithInvalidDate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date(1995, 11, 17, 3, 24, 0);
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');
      const date2: Date = new Date(Date.UTC(1995, 11, 17, 3, 24, 0));
      expect(date2.toString()).assertEqual('Sun Dec 17 1995 11:24:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date2.toTimeString()).assertEqual('11:24:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/17/1995, 11:24:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date2.toLocaleTimeString()).assertEqual('11:24:00 AM');
      expect(date2.toUTCString()).assertEqual('Sun, 17 Dec 1995 03:24:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-17T03:24:00.000Z');
      const date3 = Date.parse("1995-12-17T03:24:00");
      expect(date3).assertEqual(819141840000);
      const date4 = Date.parse("December 17, 1995 03:24:00");
      expect(date4).assertEqual(819141840000);
      const date5 = Date.UTC(1995, 11, 17, 3, 24, 0);
      expect(date5).assertEqual(819170640000);
      const date6 = Date.UTC(2024, 2, 12, 10, 30, 45);
      expect(date6).assertEqual(1710239445000);
    });

    /**
     * @tc.name   toLocaleDate_039
     * @tc.number SUB_COMMONLIBRARY_DATE_TOSTRING_03900
     * @tc.desc   toLocaleDateString() with invalid date.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('toLocaleDate_039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date(1995, 11, 17, 3, 24, 0);
      expect(date1.toString()).assertEqual('Sun Dec 17 1995 03:24:00 GMT+0800');
      expect(date1.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date1.toTimeString()).assertEqual('03:24:00 GMT+0800');
      expect(date1.toLocaleString()).assertEqual('12/17/1995, 3:24:00 AM');
      expect(date1.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date1.toLocaleTimeString()).assertEqual('3:24:00 AM');
      expect(date1.toUTCString()).assertEqual('Sat, 16 Dec 1995 19:24:00 GMT');
      expect(date1.toISOString()).assertEqual('1995-12-16T19:24:00.000Z');
      const date2: Date = new Date(Date.UTC(1995, 11, 17, 3, 24, 0));
      expect(date2.toString()).assertEqual('Sun Dec 17 1995 11:24:00 GMT+0800');
      expect(date2.toDateString()).assertEqual('Sun Dec 17 1995');
      expect(date2.toTimeString()).assertEqual('11:24:00 GMT+0800');
      expect(date2.toLocaleString()).assertEqual('12/17/1995, 11:24:00 AM');
      expect(date2.toLocaleDateString()).assertEqual('12/17/1995');
      expect(date2.toLocaleTimeString()).assertEqual('11:24:00 AM');
      expect(date2.toUTCString()).assertEqual('Sun, 17 Dec 1995 03:24:00 GMT');
      expect(date2.toISOString()).assertEqual('1995-12-17T03:24:00.000Z');
      const date3 = Date.parse("1995-12-17T03:24:00");
      expect(date3).assertEqual(819141840000);
      const date4 = Date.parse("December 17, 1995 03:24:00");
      expect(date4).assertEqual(819141840000);
      const date5 = Date.UTC(1995, 11, 17, 3, 24, 0);
      expect(date5).assertEqual(819170640000);
      const date6 = Date.UTC(2024, 2, 12, 10, 30, 45);
      expect(date6).assertEqual(1710239445000);
    });

  });
}
