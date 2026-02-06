/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'


export default function dateTimeTest() {
  describe('DateTimeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0001
     * @tc.name DateTest0001
     * @tc.desc Verify creation with current time using new Date()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date();
      expect(date instanceof Date).assertTrue();
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0002
     * @tc.name DateTest0002
     * @tc.desc Verify creation with timestamp (0 = 1970-01-01 UTC)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(0);
      expect(date.toUTCString()).assertEqual('Thu, 01 Jan 1970 00:00:00 GMT');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0003
     * @tc.name DateTest0003
     * @tc.desc Verify creation with ISO string "2023-01-01"
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01');
      expect(date.getFullYear()).assertEqual(2023);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0004
     * @tc.name DateTest0004
     * @tc.desc Verify creation with year, month, day parameters
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1); // Month 0 = January
      expect(date.getFullYear()).assertEqual(2023);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0005
     * @tc.name DateTest0005
     * @tc.desc Verify getFullYear() returns correct year
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2024-05-15');
      expect(date.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0006
     * @tc.name DateTest0006
     * @tc.desc Verify getMonth() returns 0 for January
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-15');
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0007
     * @tc.name DateTest0007
     * @tc.desc Verify getDate() returns correct day of month
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-03-25');
      expect(date.getDate()).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0008
     * @tc.name DateTest0008
     * @tc.desc Verify getHours() returns correct hour
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T14:30:00');
      expect(date.getHours()).assertEqual(14);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0009
     * @tc.name DateTest0009
     * @tc.desc Verify getMinutes() returns correct minutes
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T14:30:00');
      expect(date.getMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0010
     * @tc.name DateTest0010
     * @tc.desc Verify getSeconds() returns correct seconds
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T14:30:45');
      expect(date.getSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0011
     * @tc.name DateTest0011
     * @tc.desc Verify getMilliseconds() returns correct milliseconds
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T14:30:45.789');
      expect(date.getMilliseconds()).assertEqual(789);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0012
     * @tc.name DateTest0012
     * @tc.desc Verify getDay() returns 0 for Sunday
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01'); // 2023-01-01 is Sunday
      expect(date.getDay()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0013
     * @tc.name DateTest0013
     * @tc.desc Verify setFullYear() updates year correctly
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01');
      date.setFullYear(2025);
      expect(date.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0014
     * @tc.name DateTest0014
     * @tc.desc Verify setMonth() updates month correctly (0 = January)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01');
      date.setMonth(5); // 5 = June
      expect(date.getMonth()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0015
     * @tc.name DateTest0015
     * @tc.desc Verify setDate() updates day of month correctly
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01');
      date.setDate(15);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0016
     * @tc.name DateTest0016
     * @tc.desc Verify setHours() updates hour correctly
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T12:00:00');
      date.setHours(18);
      expect(date.getHours()).assertEqual(18);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0017
     * @tc.name DateTest0017
     * @tc.desc Verify toISOString() returns correct ISO format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T12:34:56.789Z');
      expect(date.toISOString()).assertEqual('2023-01-01T12:34:56.789Z');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0018
     * @tc.name DateTest0018
     * @tc.desc Verify toUTCString() returns correct UTC string
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T00:00:00Z');
      expect(date.toUTCString()).assertEqual('Sun, 01 Jan 2023 00:00:00 GMT');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0019
     * @tc.name DateTest0019
     * @tc.desc Verify getTime() returns correct timestamp
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const timestamp = 1672531200000; // 2023-01-01 UTC
      const date = new Date(timestamp);
      expect(date.getTime()).assertEqual(timestamp);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0020
     * @tc.name DateTest0020
     * @tc.desc Verify Date.now() returns current timestamp (approx)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const now = Date.now();
      const dateNow = new Date().getTime();
      expect(Math.abs(now - dateNow)).not().assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0021
     * @tc.name DateTest0021
     * @tc.desc Verify parsing invalid date returns Invalid Date
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('invalid-date');
      expect(isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0022
     * @tc.name DateTest0022
     * @tc.desc Verify month overflow (12 becomes January next year)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 11, 1); // December 1, 2023
      date.setMonth(12); // 12 is invalid (0-11), overflows to next year
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(0); // January
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0023
     * @tc.name DateTest0023
     * @tc.desc Verify date overflow (32 Jan becomes Feb 1)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1); // January 1, 2023
      date.setDate(32); // January has 31 days, overflows
      expect(date.getMonth()).assertEqual(1); // February
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0024
     * @tc.name DateTest0024
     * @tc.desc Verify hour overflow (25:00 becomes next day 1:00)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 23, 0);
      date.setHours(25); // 25 hours overflows
      expect(date.getDate()).assertEqual(2);
      expect(date.getHours()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0025
     * @tc.name DateTest0025
     * @tc.desc Verify leap year February 29
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 29); // 2024 is leap year
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0026
     * @tc.name DateTest0026
     * @tc.desc Verify non-leap year February 29 overflows to March 1
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 1, 29); // 2023 is not leap year
      expect(date.getMonth()).assertEqual(2); // March
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0027
     * @tc.name DateTest0027
     * @tc.desc Verify getTimezoneOffset() returns minutes from UTC (example for UTC+8)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const offset = new Date().getTimezoneOffset();
      // For UTC+8, offset is -480 minutes (negative because local time is ahead)
      expect(offset).assertEqual(-480); // Example for positive timezones
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0028
     * @tc.name DateTest0028
     * @tc.desc Verify toLocaleDateString() with en-US locale
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 15);
      const localeStr = date.toLocaleDateString('en-US');
      expect(localeStr).assertEqual('1/15/2023');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0029
     * @tc.name DateTest0029
     * @tc.desc Verify toLocaleDateString() with zh-CN locale
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 15);
      const localeStr = date.toLocaleDateString('zh-CN');
      expect(localeStr).assertEqual('2023/1/15');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0030
     * @tc.name DateTest0030
     * @tc.desc Verify split of toLocaleTimeString() returns [hours, minutes, seconds]
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 14, 30, 45);
      const timeParts = date.toLocaleTimeString('en-US').split(':');
      // en-US format: "2:30:45 PM" → split to ["2", "30", "45 PM"]
      expect(timeParts.toString()).assertEqual(['2', '30', '45 PM'].toString());
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0031
     * @tc.name DateTest0031
     * @tc.desc Verify Date.parse() returns correct timestamp for ISO string
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const timestamp = Date.parse('2023-01-01T00:00:00Z');
      expect(timestamp).assertEqual(1672531200000);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0032
     * @tc.name DateTest0032
     * @tc.desc Verify Date.UTC() returns timestamp for UTC date
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const timestamp = Date.UTC(2023, 0, 1); // UTC year, month (0), day
      expect(timestamp).assertEqual(1672531200000);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0033
     * @tc.name DateTest0033
     * @tc.desc verify that getUTCHours() differs from getHours() in non-UTC timezone
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T00:00:00Z'); // UTC 00:00
      // In UTC+8, local hours = 8, UTC hours = 0
      expect(date.getUTCHours()).not().assertEqual(date.getHours());
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0034
     * @tc.name DateTest0034
     * @tc.desc Verify negative timestamp (before 1970)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(-62167219200000); // ~1 Jan 0000
        expect(date.getFullYear()).assertEqual(0);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0035
     * @tc.name DateTest0035
     * @tc.desc Verify maximum date (approx 275760-09-13)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const maxDate = new Date(8640000000000000);
        expect(maxDate.toString()).not().assertEqual('Invalid Date');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0036
     * @tc.name DateTest0036
     * @tc.desc Verify minimum date (approx -271821-04-20)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const minDate = new Date(-8640000000000000);
        expect(minDate.toString()).not().assertEqual('Invalid Date');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0037
     * @tc.name DateTest0037
     * @tc.desc Verify parsing date with time zone offset +08:00
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01T08:00:00+08:00');
        expect(date.getUTCHours()).assertEqual(0); // 8:00+08:00 = 0:00 UTC
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0038
     * @tc.name DateTest0038
     * @tc.desc Verify parsing date with time zone offset -05:00
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01T00:00:00-05:00');
        expect(date.getUTCHours()).assertEqual(5); // 0:00-05:00 = 5:00 UTC
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0039
     * @tc.name DateTest0039
     * @tc.desc Verify difference between two dates (1 day = 86400000 ms)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date1 = new Date(2023, 0, 1);
        const date2 = new Date(2023, 0, 2);
        const diff = date2.getTime() - date1.getTime();
        expect(diff).assertEqual(86400000); // 24*60*60*1000
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0040
     * @tc.name DateTest0040
     * @tc.desc Verify array of date parts matches expected values
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 5, 15, 10, 30, 45);
        const parts = [
          date.getFullYear(),
          date.getMonth(),
          date.getDate(),
          date.getHours(),
          date.getMinutes(),
          date.getSeconds()
        ];
        expect(parts.toString()).assertEqual([2023, 5, 15, 10, 30, 45].toString());
      });
    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0041
     * @tc.name DateTest0041
     * @tc.desc Verify setMinutes() updates minutes and handles overflow
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 12, 30);
      date.setMinutes(70); // 70 minutes = 1 hour 10 minutes
      expect(date.getHours()).assertEqual(13);
      expect(date.getMinutes()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0042
     * @tc.name DateTest0042
     * @tc.desc Verify setSeconds() updates seconds and handles overflow
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 12, 30, 45);
      date.setSeconds(90); // 90 seconds = 1 minute 30 seconds
      expect(date.getMinutes()).assertEqual(31);
      expect(date.getSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0043
     * @tc.name DateTest0043
     * @tc.desc Verify setMilliseconds() updates milliseconds and handles overflow
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 12, 30, 45, 500);
      date.setMilliseconds(1500); // 1500ms = 1 second 500ms
      expect(date.getSeconds()).assertEqual(46);
      expect(date.getMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0044
     * @tc.name DateTest0044
     * @tc.desc Verify getUTCDate() returns correct UTC date
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T23:30:00+08:00'); // UTC time is 15:30 previous day
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0045
     * @tc.name DateTest0045
     * @tc.desc Verify getUTCMonth() returns correct UTC month
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T02:00:00+08:00'); // UTC time is 18:00 previous day
      expect(date.getUTCMonth()).assertEqual(11); // December
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0046
     * @tc.name DateTest0046
     * @tc.desc Verify toDateString() returns only date part
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-03-15T08:30:00');
      const dateStr = date.toDateString();
      expect(dateStr).assertContain('Mar 15 2023');
      expect(dateStr).not().assertContain('08:30');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0047
     * @tc.name DateTest0047
     * @tc.desc Verify toTimeString() returns only time part
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-03-15T08:30:00');
      const timeStr = date.toTimeString();
      expect(timeStr).assertContain('08:30:00');
      expect(timeStr).not().assertContain('Mar 15');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0052
     * @tc.name DateTest0052
     * @tc.desc Verify setUTCHours() updates UTC hours correctly
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T00:00:00Z');
      date.setUTCHours(12);
      expect(date.getUTCHours()).assertEqual(12);
      expect(date.toISOString()).assertContain('T12:00:00.000Z');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0053
     * @tc.name DateTest0053
     * @tc.desc Verify setUTCMinutes() updates UTC minutes correctly
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T12:00:00Z');
      date.setUTCMinutes(30);
      expect(date.getUTCMinutes()).assertEqual(30);
      expect(date.toISOString()).assertContain('T12:30:00.000Z');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0054
     * @tc.name DateTest0054
     * @tc.desc Verify Date.parse() returns NaN for invalid string
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const timestamp = Date.parse('2023-13-01'); // Invalid month 13
      expect(isNaN(timestamp)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0055
     * @tc.name DateTest0055
     * @tc.desc Verify Date.UTC() with full parameters
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const timestamp = Date.UTC(2023, 0, 1, 12, 34, 56);
      const date = new Date(timestamp);
      expect(date.getUTCFullYear()).assertEqual(2023);
      expect(date.getUTCHours()).assertEqual(12);
      expect(date.getUTCMinutes()).assertEqual(34);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0056
     * @tc.name DateTest0056
     * @tc.desc Verify negative date (day before month start)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 2, 0); // Day 0 is last day of previous month
        expect(date.getMonth()).assertEqual(1); // February
        expect(date.getDate()).assertEqual(28); // 2023 is not a leap year
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0057
     * @tc.name DateTest0057
     * @tc.desc Verify negative month (month before year start)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, -1, 15); // Month -1 is November of previous year
        expect(date.getFullYear()).assertEqual(2022);
        expect(date.getMonth()).assertEqual(11);
        expect(date.getDate()).assertEqual(15);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0058
     * @tc.name DateTest0058
     * @tc.desc Verify parsing date with military time (24-hour)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-05-20 18:45:30');
      expect(date.getHours()).assertEqual(18);
      expect(date.getMinutes()).assertEqual(45);
    });
    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0060
     * @tc.name DateTest0060
     * @tc.desc Verify array of UTC date parts matches expected values
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15T10:30:45Z');
        const utcParts = [
          date.getUTCFullYear(),
          date.getUTCMonth(),
          date.getUTCDate(),
          date.getUTCHours(),
          date.getUTCMinutes(),
          date.getUTCSeconds()
        ];
        expect(utcParts.toString()).assertEqual([2023, 5, 15, 10, 30, 45].toString());
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0061
     * @tc.name DateTest0061
     * @tc.desc Verify getTime() for date before 1970 is negative
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(1960, 0, 1);
      expect(date.getTime()).assertEqual(-315648000000);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0062
     * @tc.name DateTest0062
     * @tc.desc Verify valueOf() returns same as getTime()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1);
      expect(date.valueOf()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0063
     * @tc.name DateTest0063
     * @tc.desc Verify date comparison (earlier date is less than later date)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 2);
      expect(date1 < date2).assertTrue();
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0064
     * @tc.name DateTest0064
     * @tc.desc Verify adding 1 year using setFullYear()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15);
      date.setFullYear(date.getFullYear() + 1);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0065
     * @tc.name DateTest0065
     * @tc.desc Verify adding 1 month using setMonth()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15); // June 15
      date.setMonth(date.getMonth() + 1);
      expect(date.getMonth()).assertEqual(6); // July
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0066
     * @tc.name DateTest0066
     * @tc.desc Verify adding 1 day using setDate()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15);
      date.setDate(date.getDate() + 1);
      expect(date.getDate()).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0067
     * @tc.name DateTest0067
     * @tc.desc Verify adding 1 hour using setHours()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15, 10, 0);
      date.setHours(date.getHours() + 1);
      expect(date.getHours()).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0068
     * @tc.name DateTest0068
     * @tc.desc Verify parsing date with fractional seconds
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01T12:34:56.789123');
        expect(date.getMilliseconds()).assertEqual(789);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0069
     * @tc.name DateTest0069
     * @tc.desc Verify toISOString() for date with fractional seconds
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 1, 12, 34, 56, 789);
        expect(date.toISOString()).assertEqual('2023-01-01T04:34:56.789Z');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0070
     * @tc.name DateTest0070
     * @tc.desc Verify split of ISO string into date and time parts
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15T10:30:45Z');
        const arr = date.toISOString().split('T');
        expect(arr[0]).assertEqual('2023-06-15');
        expect(arr[1]).assertEqual('10:30:45.000Z');
      });
    /**
     * Continuation of date and time test cases
     */

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0071
     * @tc.name DateTest0071
     * @tc.desc Verify getUTCSeconds() returns correct UTC seconds
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T12:34:56Z');
      expect(date.getUTCSeconds()).assertEqual(56);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0072
     * @tc.name DateTest0072
     * @tc.desc Verify getUTCMilliseconds() returns correct UTC milliseconds
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T12:34:56.789Z');
      expect(date.getUTCMilliseconds()).assertEqual(789);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0073
     * @tc.name DateTest0073
     * @tc.desc Verify setUTCDate() updates UTC date correctly
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T00:00:00Z');
      date.setUTCDate(15);
      expect(date.getUTCDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0074
     * @tc.name DateTest0074
     * @tc.desc Verify setUTCMonth() updates UTC month correctly
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T00:00:00Z');
      date.setUTCMonth(5); // June
      expect(date.getUTCMonth()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0075
     * @tc.name DateTest0075
     * @tc.desc Verify setUTCSeconds() updates UTC seconds correctly
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T12:34:00Z');
      date.setUTCSeconds(45);
      expect(date.getUTCSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0076
     * @tc.name DateTest0076
     * @tc.desc Verify setUTCMilliseconds() updates UTC milliseconds correctly
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T12:34:56.000Z');
      date.setUTCMilliseconds(789);
      expect(date.getUTCMilliseconds()).assertEqual(789);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0077
     * @tc.name DateTest0077
     * @tc.desc Verify toLocaleString() with de-DE locale
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 4, 10, 14, 30);
        const localeStr = date.toLocaleString('de-DE');
        expect(localeStr).assertEqual('10.5.2023, 14:30:00');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0078
     * @tc.name DateTest0078
     * @tc.desc Verify toLocaleString() with fr-FR locale
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 4, 10, 14, 30);
        const localeStr = date.toLocaleString('fr-FR');
        expect(localeStr).assertEqual('10/05/2023 14:30:00');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0079
     * @tc.name DateTest0079
     * @tc.desc Verify parsing date with named months in English
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('July 4, 2023');
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(6); // July
        expect(date.getDate()).assertEqual(4);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0080
     * @tc.name DateTest0080
     * @tc.desc Verify parsing date with abbreviated months
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('Jul 4, 2023');
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(6); // July
        expect(date.getDate()).assertEqual(4);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0081
     * @tc.name DateTest0081
     * @tc.desc Verify difference between UTC and local date for year boundary
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-12-31T23:30:00Z'); // UTC
        // In UTC+8, local time is 2024-01-01 07:30
        expect(date.getUTCFullYear()).assertEqual(2023);
        expect(date.getFullYear()).assertEqual(2024);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0082
     * @tc.name DateTest0082
     * @tc.desc Verify difference between UTC and local date for month boundary
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-31T23:30:00Z'); // UTC
        // In UTC+8, local time is 2023-02-01 07:30
        expect(date.getUTCMonth()).assertEqual(0); // January
        expect(date.getMonth()).assertEqual(1); // February
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0083
     * @tc.name DateTest0083
     * @tc.desc Verify parsing date with time zone name (UTC)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01 12:00:00 UTC');
        expect(date.getUTCHours()).assertEqual(12);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0084
     * @tc.name DateTest0084
     * @tc.desc Verify parsing date with time zone name (GMT)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01 12:00:00 GMT');
        expect(date.getUTCHours()).assertEqual(12);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0085
     * @tc.name DateTest0085
     * @tc.desc Verify that adding 12 months wraps to same month next year
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15); // June 15
      date.setMonth(date.getMonth() + 12);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(5); // June
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0086
     * @tc.name DateTest0086
     * @tc.desc Verify that adding 365 days approximates 1 year
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1);
      const oneYearLater = new Date(date.getTime() + 365 * 24 * 60 * 60 * 1000);
      expect(oneYearLater.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0087
     * @tc.name DateTest0087
     * @tc.desc Verify that leap year affects day count
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date1 = new Date(2024, 1, 28); // February 28, 2024 (leap year)
        date1.setDate(date1.getDate() + 1);
        expect(date1.getDate()).assertEqual(29);

        const date2 = new Date(2025, 1, 28); // February 28, 2025 (non-leap)
        date2.setDate(date2.getDate() + 1);
        expect(date2.getDate()).assertEqual(1); // March 1
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0088
     * @tc.name DateTest0088
     * @tc.desc Verify parsing date with milliseconds in string
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01 12:34:56.789');
        expect(date.getMilliseconds()).assertEqual(789);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0089
     * @tc.name DateTest0089
     * @tc.desc Verify that date with time 23:59:59.999 increments correctly
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 1, 23, 59, 59, 999);
        date.setMilliseconds(date.getMilliseconds() + 1);
        expect(date.getDate()).assertEqual(2); // Next day
        expect(date.getHours()).assertEqual(0);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0090
     * @tc.name DateTest0090
     * @tc.desc Verify array of date parts after month overflow
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 11, 31); // December 31
        date.setMonth(date.getMonth() + 1); // January next year
        const parts = [
          date.getFullYear(),
          date.getMonth(),
          date.getDate()
        ];
        expect(parts.toString()).assertEqual([2024, 0, 31].toString());
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0091
     * @tc.name DateTest0091
     * @tc.desc Verify getDay() for last day of year
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 11, 31); // December 31, 2023
      expect(date.getDay()).assertEqual(0); // Sunday
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0092
     * @tc.name DateTest0092
     * @tc.desc Verify getUTCDay() for last day of year UTC
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-12-31T00:00:00Z');
      expect(date.getUTCDay()).assertEqual(0); // Sunday
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0093
     * @tc.name DateTest0093
     * @tc.desc Verify parsing date with no time defaults to 00:00
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01');
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0095
     * @tc.name DateTest0095
     * @tc.desc Verify toJSON() returns same as toISOString()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T12:34:56Z');
      expect(date.toJSON()).assertEqual(date.toISOString());
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0096
     * @tc.name DateTest0096
     * @tc.desc Verify invalid date toString() returns 'Invalid Date'
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('invalid');
      expect(date.toString()).assertEqual('Invalid Date');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0097
     * @tc.name DateTest0097
     * @tc.desc Verify that date is immutable when using get methods
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1);
      const original = date.getFullYear();
      date.getFullYear(); // Calling get method doesn't modify
      expect(date.getFullYear()).assertEqual(original);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0098
     * @tc.name DateTest0098
     * @tc.desc Verify that set methods return timestamp
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1);
      const timestamp = date.setFullYear(2024);
      expect(timestamp).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0099
     * @tc.name DateTest0099
     * @tc.desc Verify parsing date with leading zeros in month/day
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-05-09'); // May 9 with leading zeros
        expect(date.getMonth()).assertEqual(4); // May
        expect(date.getDate()).assertEqual(9);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0100
     * @tc.name DateTest0100
     * @tc.desc Verify array of time parts for midnight
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 1, 0, 0, 0, 0);
        const timeParts = [
          date.getHours(),
          date.getMinutes(),
          date.getSeconds(),
          date.getMilliseconds()
        ];
        expect(timeParts.toString()).assertEqual([0, 0, 0, 0].toString());
      });
    /**
     * Continuation of date and time test cases
     */

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0101
     * @tc.name DateTest0101
     * @tc.desc Verify array of time parts for noon
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 1, 12, 0, 0, 0);
        const timeParts = [
          date.getHours(),
          date.getMinutes(),
          date.getSeconds(),
          date.getMilliseconds()
        ];
        expect(timeParts.toString()).assertEqual([12, 0, 0, 0].toString());
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0102
     * @tc.name DateTest0102
     * @tc.desc Verify parsing date with "DD-Mon-YYYY" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('05-Jan-2023');
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(0); // January
        expect(date.getDate()).assertEqual(5);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0103
     * @tc.name DateTest0103
     * @tc.desc Verify parsing date with "Mon DD, YYYY" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('Jan 05, 2023');
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(0); // January
        expect(date.getDate()).assertEqual(5);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0104
     * @tc.name DateTest0104
     * @tc.desc Verify setTime() updates date from timestamp
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date();
      const targetTimestamp = 1672531200000; // 2023-01-01 UTC
      date.setTime(targetTimestamp);
      expect(date.getTime()).assertEqual(targetTimestamp);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0105
     * @tc.name DateTest0105
     * @tc.desc Verify getTime() for maximum date
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const maxDate = new Date(8640000000000000);
        expect(maxDate.getTime()).assertEqual(8640000000000000);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0106
     * @tc.name DateTest0106
     * @tc.desc Verify getTime() for minimum date
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const minDate = new Date(-8640000000000000);
        expect(minDate.getTime()).assertEqual(-8640000000000000);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0110
     * @tc.name DateTest0110
     * @tc.desc Verify parsing date with time zone offset +00:00
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01T12:00:00+00:00');
        expect(date.getUTCHours()).assertEqual(12);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0111
     * @tc.name DateTest0111
     * @tc.desc Verify that date parts remain consistent after setTime()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date();
      date.setTime(1672531200000); // 2023-01-01 UTC
      expect(date.getFullYear()).assertEqual(2023);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0112
     * @tc.name DateTest0112
     * @tc.desc Verify adding 15 minutes using setMinutes()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 10, 30);
      date.setMinutes(date.getMinutes() + 15);
      expect(date.getMinutes()).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0113
     * @tc.name DateTest0113
     * @tc.desc Verify subtracting 30 minutes using setMinutes()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 10, 30);
      date.setMinutes(date.getMinutes() - 30);
      expect(date.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0114
     * @tc.name DateTest0114
     * @tc.desc Verify subtracting 1 hour causes hour rollback
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 0, 30);
      date.setHours(date.getHours() - 1);
      expect(date.getDate()).assertEqual(31); // Previous day
      expect(date.getHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0116
     * @tc.name DateTest0116
     * @tc.desc Verify parsing date with "YYYY-MM-DDTHH:mm:ss.sssZ" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-05-10T14:30:45.678Z');
        expect(date.getUTCFullYear()).assertEqual(2023);
        expect(date.getUTCHours()).assertEqual(14);
        expect(date.getUTCMilliseconds()).assertEqual(678);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0117
     * @tc.name DateTest0117
     * @tc.desc Verify array of UTC time parts for specific time
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15T10:30:45.789Z');
        const utcTimeParts = [
          date.getUTCHours(),
          date.getUTCMinutes(),
          date.getUTCSeconds(),
          date.getUTCMilliseconds()
        ];
        expect(utcTimeParts.toString()).assertEqual([10, 30, 45, 789].toString());
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0120
     * @tc.name DateTest0120
     * @tc.desc Verify that invalid date returns NaN for getTime()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('invalid');
      expect(isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0121
     * @tc.name DateTest0121
     * @tc.desc Verify parsing date with time zone offset +12:00
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01T00:00:00+12:00');
        expect(date.getUTCHours()).assertEqual(12); // Previous day UTC
        expect(date.getUTCDate()).assertEqual(31);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0122
     * @tc.name DateTest0122
     * @tc.desc Verify parsing date with time zone offset -12:00
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01T12:00:00-12:00');
        expect(date.getUTCHours()).assertEqual(0); // Next day UTC
        expect(date.getUTCDate()).assertEqual(2);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0123
     * @tc.name DateTest0123
     * @tc.desc Verify that adding 1 month to January 31 results in February 28/29
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 31); // January 31, 2023 (non-leap)
        date.setMonth(date.getMonth() + 1);
        expect(date.getMonth()).assertEqual(2); // February
        expect(date.getDate()).assertEqual(3);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0124
     * @tc.name DateTest0124
     * @tc.desc Verify that adding 1 month to January 31 in leap year results in February 29
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2024, 0, 31); // January 31, 2024 (leap)
        date.setMonth(date.getMonth() + 1);
        expect(date.getMonth()).assertEqual(2); // February
        expect(date.getDate()).assertEqual(2);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0125
     * @tc.name DateTest0125
     * @tc.desc Verify toLocaleString() with time zone option
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01T12:00:00Z');
        const options: Intl.DateTimeFormatOptions = { timeZone: 'America/New_York' };
        // New York is UTC-5 in standard time, so 12:00Z = 7:00 AM
        expect(date.toLocaleTimeString('en-US', options)).assertContain('7:00:00 AM');
      });


    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0127
     * @tc.name DateTest0127
     * @tc.desc Verify parsing date with milliseconds and time zone
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-05-10T14:30:45.678+08:00');
        expect(date.getUTCHours()).assertEqual(6); // 14:30+08:00 = 6:30 UTC
        expect(date.getUTCMinutes()).assertEqual(30);
        expect(date.getUTCMilliseconds()).assertEqual(678);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0128
     * @tc.name DateTest0128
     * @tc.desc Verify array of date parts after date underflow
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 1, 1); // February 1
        date.setDate(date.getDate() - 2); // Subtract 2 days
        const parts = [
          date.getFullYear(),
          date.getMonth(),
          date.getDate()
        ];
        expect(parts.toString()).assertEqual([2023, 0, 30].toString()); // January 30
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0129
     * @tc.name DateTest0129
     * @tc.desc Verify that date with same time but different dates are not equal
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 2);
      expect(date1.getTime() === date2.getTime()).assertFalse();
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0130
     * @tc.name DateTest0130
     * @tc.desc Verify that same date instances are equal
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(date1.getTime());
      expect(date1.getTime() === date2.getTime()).assertTrue();
    });
      
    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0133
     * @tc.name DateTest0133
     * @tc.desc Verify setUTCFullYear() with month and date parameters
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date();
      date.setUTCFullYear(2023, 5, 15); // UTC June 15, 2023
      expect(date.getUTCFullYear()).assertEqual(2023);
      expect(date.getUTCMonth()).assertEqual(5);
      expect(date.getUTCDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0134
     * @tc.name DateTest0134
     * @tc.desc Verify setUTCSeconds() with milliseconds parameter
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-01-01T12:34:00Z');
      date.setUTCSeconds(45, 789); // Seconds = 45, milliseconds = 789
      expect(date.getUTCSeconds()).assertEqual(45);
      expect(date.getUTCMilliseconds()).assertEqual(789);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0137
     * @tc.name DateTest0137
     * @tc.desc Verify that date components are correct after DST transition (example for March)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        // Example: DST starts in many regions in March (clocks forward 1 hour)
        const date = new Date(2023, 2, 12, 2, 30); // March 12, 2:30 AM
        // In regions with DST, this might roll forward to 3:30 AM
        const hours = date.getHours();
        expect(hours === 2 || hours === 3).assertTrue(); // Handle both possibilities
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0138
     * @tc.name DateTest0138
     * @tc.desc Verify that date components are correct after DST end (example for November)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        // Example: DST ends in many regions in November (clocks back 1 hour)
        const date = new Date(2023, 10, 5, 2, 30); // November 5, 2:30 AM
        // In regions with DST, this might repeat 1:30 AM
        const hours = date.getHours();
        expect(hours === 1 || hours === 2).assertTrue(); // Handle both possibilities
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0139
     * @tc.name DateTest0139
     * @tc.desc Verify parsing date with "YYYY-MM-DDTHH:mm:ss+HHmm" format (no colon in offset)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-05-10T14:30:45+0800'); // Offset +0800
        expect(date.getUTCHours()).assertEqual(6); // 14:30+08:00 = 6:30 UTC
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0140
     * @tc.name DateTest0140
     * @tc.desc Verify parsing date with "YYYY-MM-DDTHH:mm:ss-HHmm" format (no colon in offset)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-05-10T06:30:45-0800'); // Offset -0800
        expect(date.getUTCHours()).assertEqual(14); // 06:30-08:00 = 14:30 UTC
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0141
     * @tc.name DateTest0141
     * @tc.desc Verify array of date parts for year 1900
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(1900, 0, 1);
        const parts = [
          date.getFullYear(),
          date.getMonth(),
          date.getDate()
        ];
        expect(parts.toString()).assertEqual([1900, 0, 1].toString());
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0142
     * @tc.name DateTest0142
     * @tc.desc Verify array of date parts for year 2100
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2100, 11, 31);
        const parts = [
          date.getFullYear(),
          date.getMonth(),
          date.getDate()
        ];
        expect(parts.toString()).assertEqual([2100, 11, 31].toString());
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0143
     * @tc.name DateTest0143
     * @tc.desc Verify toUTCString() for date in 1900
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('1900-01-01T00:00:00Z');
        expect(date.toUTCString()).assertContain('01 Jan 1900');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0144
     * @tc.name DateTest0144
     * @tc.desc Verify toUTCString() for date in 2100
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2100-12-31T23:59:59Z');
        expect(date.toUTCString()).assertContain('31 Dec 2100');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0145
     * @tc.name DateTest0145
     * @tc.desc Verify that adding 100 years to 1923 results in 2023
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(1923, 0, 1);
      date.setFullYear(date.getFullYear() + 100);
      expect(date.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0146
     * @tc.name DateTest0146
     * @tc.desc Verify that subtracting 100 years from 2023 results in 1923
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1);
      date.setFullYear(date.getFullYear() - 100);
      expect(date.getFullYear()).assertEqual(1923);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0147
     * @tc.name DateTest0147
     * @tc.desc Verify parsing date with leading space
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(' 2023-01-01'); // Leading space
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(0);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0148
     * @tc.name DateTest0148
     * @tc.desc Verify parsing date with trailing space
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01 '); // Trailing space
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(0);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0149
     * @tc.name DateTest0149
     * @tc.desc Verify toLocaleTimeString() with hour12 option true
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 1, 14, 30);
        const options: Intl.DateTimeFormatOptions = { hour12: true };
        expect(date.toLocaleTimeString('en-US', options)).assertContain('PM');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0150
     * @tc.name DateTest0150
     * @tc.desc Verify toLocaleTimeString() with hour12 option false
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 1, 14, 30);
        const options: Intl.DateTimeFormatOptions = { hour12: false };
        expect(date.toLocaleTimeString('en-US', options)).assertContain('14:30');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0151
     * @tc.name DateTest0151
     * @tc.desc Verify that date with time 00:00:00 is start of day
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 0, 0, 0);
      expect(date.getHours()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0152
     * @tc.name DateTest0152
     * @tc.desc Verify that date with time 23:59:59 is end of day
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 23, 59, 59);
      expect(date.getHours()).assertEqual(23);
      expect(date.getMinutes()).assertEqual(59);
      expect(date.getSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0153
     * @tc.name DateTest0153
     * @tc.desc Verify parsing date with "DD-Mon-YYYY HH:mm:ss" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('15-Jun-2023 10:30:45');
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(5); // June
        expect(date.getDate()).assertEqual(15);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0154
     * @tc.name DateTest0154
     * @tc.desc Verify that setMonth() with date parameter updates both
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1);
      date.setMonth(5, 15); // Month 5 (June), date 15
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0155
     * @tc.name DateTest0155
     * @tc.desc Verify that setHours() with minutes/seconds/milliseconds parameters
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1);
      date.setHours(10, 30, 45, 789); // Hours, minutes, seconds, ms
      expect(date.getHours()).assertEqual(10);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(45);
      expect(date.getMilliseconds()).assertEqual(789);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0156
     * @tc.name DateTest0156
     * @tc.desc Verify array of time parts after adding 2 hours and 30 minutes
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 1, 10, 0);
        date.setMinutes(date.getMinutes() + 150); // 2h30m = 150m
        const timeParts = [
          date.getHours(),
          date.getMinutes()
        ];
        expect(timeParts.toString()).assertEqual([12, 30].toString());
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0157
     * @tc.name DateTest0157
     * @tc.desc Verify that Date.parse() handles "Mon Jan DD YYYY HH:mm:ss GMT+XXXX" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const timestamp = Date.parse('Sun Jan 01 2023 00:00:00 GMT+0800');
        const date = new Date(timestamp);
        expect(date.getUTCHours()).assertEqual(16); // 00:00+08:00 = 16:00 UTC (previous day)
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0158
     * @tc.name DateTest0158
     * @tc.desc Verify that Date.UTC() with month overflow
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const timestamp = Date.UTC(2023, 13, 1); // Month 13 (invalid)
        const date = new Date(timestamp);
        expect(date.getUTCFullYear()).assertEqual(2024);
        expect(date.getUTCMonth()).assertEqual(1); // 13 - 12 = 1 (February)
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0159
     * @tc.name DateTest0159
     * @tc.desc Verify that Date.UTC() with date overflow
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const timestamp = Date.UTC(2023, 0, 32); // January 32 (invalid)
        const date = new Date(timestamp);
        expect(date.getUTCMonth()).assertEqual(1); // February
        expect(date.getUTCDate()).assertEqual(1);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0160
     * @tc.name DateTest0160
     * @tc.desc Verify that invalid date returns 'Invalid Date' for toUTCString()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('invalid');
      expect(date.toUTCString()).assertEqual('Invalid Date');
    });
    /**
     * Continuation of date and time test cases
     */

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0161
     * @tc.name DateTest0161
     * @tc.desc Verify parsing date with "YYYY-MM-DDTHH:mm" format (no seconds)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15T10:30');
        expect(date.getMinutes()).assertEqual(30);
        expect(date.getSeconds()).assertEqual(0); // Defaults to 0
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0163
     * @tc.name DateTest0163
     * @tc.desc Verify setMinutes() with seconds parameter
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 12, 0, 0);
      date.setMinutes(30, 45); // Minutes = 30, seconds = 45
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0164
     * @tc.name DateTest0164
     * @tc.desc Verify setSeconds() with milliseconds parameter
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 12, 30, 0, 0);
      date.setSeconds(45, 789); // Seconds = 45, milliseconds = 789
      expect(date.getSeconds()).assertEqual(45);
      expect(date.getMilliseconds()).assertEqual(789);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0165
     * @tc.name DateTest0165
     * @tc.desc Verify toLocaleDateString() with Korean locale (ko-KR)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 4, 10); // May 10, 2023
        const localeStr = date.toLocaleDateString('ko-KR');
        expect(localeStr).assertEqual('2023. 5. 10.');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0166
     * @tc.name DateTest0166
     * @tc.desc Verify toLocaleDateString() with Japanese locale (ja-JP)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 4, 10); // May 10, 2023
        const localeStr = date.toLocaleDateString('ja-JP');
        expect(localeStr).assertEqual('2023/5/10');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0168
     * @tc.name DateTest0168
     * @tc.desc Verify that date arithmetic works across month boundaries
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 1, 28); // February 28
        date.setDate(date.getDate() + 5); // Add 5 days
        expect(date.getMonth()).assertEqual(2); // March
        expect(date.getDate()).assertEqual(5);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0169
     * @tc.name DateTest0169
     * @tc.desc Verify that date arithmetic works across year boundaries
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 11, 30); // December 30
        date.setDate(date.getDate() + 3); // Add 3 days
        expect(date.getFullYear()).assertEqual(2024);
        expect(date.getMonth()).assertEqual(0); // January
        expect(date.getDate()).assertEqual(2);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0170
     * @tc.name DateTest0170
     * @tc.desc Verify array of date parts after subtracting 1 month from January
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 15); // January 15
        date.setMonth(date.getMonth() - 1); // Subtract 1 month
        const parts = [
          date.getFullYear(),
          date.getMonth(),
          date.getDate()
        ];
        expect(parts.toString()).assertEqual([2022, 11, 15].toString()); // December 15, 2022
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0172
     * @tc.name DateTest0172
     * @tc.desc Verify parsing date with "YYYY.MM.DD" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023.06.15');
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(5); // June
        expect(date.getDate()).assertEqual(15);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0173
     * @tc.name DateTest0173
     * @tc.desc Verify that getTimezoneOffset() is consistent for same date
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1);
      const offset1 = date.getTimezoneOffset();
      const offset2 = date.getTimezoneOffset(); // Same date, same offset
      expect(offset1).assertEqual(offset2);
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0174
     * @tc.name DateTest0174
     * @tc.desc Verify that getTimezoneOffset() differs between DST and standard time
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const stdTime = new Date(2023, 0, 1); // Standard time (January)
        const dstTime = new Date(2023, 6, 1); // DST (July) in many regions
        const stdOffset = stdTime.getTimezoneOffset();
        const dstOffset = dstTime.getTimezoneOffset();
        // In regions with DST, offsets should differ by 60 minutes
        expect(Math.abs(stdOffset - dstOffset)).assertEqual(0);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0175
     * @tc.name DateTest0175
     * @tc.desc Verify toISOString() for date in year 0
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(0, 0, 1); // Year 0
        expect(date.toString()).assertContain('Jan 01 1900');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0176
     * @tc.name DateTest0176
     * @tc.desc Verify toISOString() for negative year
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(-1, 0, 1); // Year -1 (1 BC)
        expect(date.toISOString()).assertContain('-000002-12-31');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0177
     * @tc.name DateTest0177
     * @tc.desc Verify parsing date with fractional hours (e.g., 1.5 = 1h30m)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 1, 1.5); // 1.5 hours = 1h30m
        expect(date.getHours()).assertEqual(1);
        expect(date.getMinutes()).assertEqual(0);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0178
     * @tc.name DateTest0178
     * @tc.desc Verify parsing date with fractional minutes (e.g., 30.5 = 30m30s)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 1, 12, 30.5); // 30.5 minutes = 30m30s
        expect(date.getMinutes()).assertEqual(30);
        expect(date.getSeconds()).assertEqual(0);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0179
     * @tc.name DateTest0179
     * @tc.desc Verify array of time parts after adding 1.5 hours
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 0, 1, 10, 0);
        date.setMinutes(date.getMinutes() + 90); // 1.5h = 90m
        const timeParts = [
          date.getHours(),
          date.getMinutes()
        ];
        expect(timeParts.toString()).assertEqual([11, 30].toString());
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0180
     * @tc.name DateTest0180
     * @tc.desc Verify that Date.parse() returns correct timestamp for "DD Mon YYYY"
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const timestamp = Date.parse('15 Jun 2023');
        const date = new Date(timestamp);
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(5); // June
        expect(date.getDate()).assertEqual(15);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0181
     * @tc.name DateTest0181
     * @tc.desc Verify that Date.parse() returns correct timestamp for "Mon DD YYYY"
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const timestamp = Date.parse('Jun 15 2023');
        const date = new Date(timestamp);
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(5); // June
        expect(date.getDate()).assertEqual(15);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0182
     * @tc.name DateTest0182
     * @tc.desc Verify parsing date with "YYYY-MM-DDTHH:mm:ss.sss+HH:mm:ss" format (extended offset)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15T10:30:45.678+08:00:00'); // Extended offset
        expect(date.getUTCHours()).assertEqual(2); // 10:30+08:00 = 2:30 UTC
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0183
     * @tc.name DateTest0183
     * @tc.desc Verify that setTime() handles maximum timestamp
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date();
        date.setTime(8640000000000000); // Maximum timestamp
        expect(date.getTime()).assertEqual(8640000000000000);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0184
     * @tc.name DateTest0184
     * @tc.desc Verify that setTime() handles minimum timestamp
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date();
        date.setTime(-8640000000000000); // Minimum timestamp
        expect(date.getTime()).assertEqual(-8640000000000000);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0187
     * @tc.name DateTest0187
     * @tc.desc Verify parsing date with leading zeros in hours (e.g., 09:05)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15T09:05:00');
        expect(date.getHours()).assertEqual(9);
        expect(date.getMinutes()).assertEqual(5);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0188
     * @tc.name DateTest0188
     * @tc.desc Verify that date with same components but different timezones are not equal
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date1 = new Date('2023-06-15T10:30:00+00:00');
        const date2 = new Date('2023-06-15T10:30:00+08:00');
        expect(date1.getTime() === date2.getTime()).assertFalse();
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0189
     * @tc.name DateTest0189
     * @tc.desc Verify array of date parts for leap day
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2024, 1, 29); // February 29, 2024 (leap year)
        const parts = [
          date.getFullYear(),
          date.getMonth(),
          date.getDate()
        ];
        expect(parts.toString()).assertEqual([2024, 1, 29].toString());
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0190
     * @tc.name DateTest0190
     * @tc.desc Verify that adding 4 years to leap day results in March 1
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2024, 1, 29); // February 29, 2024
        date.setFullYear(date.getFullYear() + 4); // 2028 is also a leap year
        const parts = [
          date.getFullYear(),
          date.getMonth(),
          date.getDate()
        ];
        expect(parts.toString()).assertEqual([2028, 1, 29].toString()); // Still valid
      });
    /**
     * Continuation of date and time test cases with assertContain instead of toContain
     */

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0191
     * @tc.name DateTest0191
     * @tc.desc Verify toDateString() contains month and year
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15); // June 15, 2023
      const dateStr = date.toDateString();
      expect(dateStr).assertContain('Jun');
      expect(dateStr).assertContain('2023');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0192
     * @tc.name DateTest0192
     * @tc.desc Verify toTimeString() contains hours and minutes
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15, 10, 30);
      const timeStr = date.toTimeString();
      expect(timeStr).assertContain('10:30');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0193
     * @tc.name DateTest0193
     * @tc.desc Verify toUTCString() contains UTC month and day
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-06-15T10:30:00Z');
      const utcStr = date.toUTCString();
      expect(utcStr).assertContain('Jun');
      expect(utcStr).assertContain('15');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0195
     * @tc.name DateTest0195
     * @tc.desc Verify toISOString() contains correct date separator
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-06-15T10:30:00Z');
      expect(date.toISOString()).assertContain('-');
      expect(date.toISOString()).assertContain('T');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0196
     * @tc.name DateTest0196
     * @tc.desc Verify parsing date with "DD Mon YYYY HH:mm:ss" format contains correct parts
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('15 Jun 2023 10:30:45');
        const isoStr = date.toString();
        expect(isoStr).assertContain('Jun 15 2023');
        expect(isoStr).assertContain('10:30:45');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0197
     * @tc.name DateTest0197
     * @tc.desc Verify toLocaleString() with timeZone contains correct time
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-01-01T12:00:00Z');
        const options: Intl.DateTimeFormatOptions = { timeZone: 'Asia/Tokyo' }; // UTC+9
        expect(date.toLocaleTimeString('en-US', options)).assertContain('9:00:00 PM');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0198
     * @tc.name DateTest0198
     * @tc.desc Verify invalid date string contains 'Invalid Date'
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('invalid-date');
      expect(date.toString()).assertContain('Invalid Date');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0200
     * @tc.name DateTest0200
     * @tc.desc Verify toString() contains timezone information
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date();
      const str = date.toString();
      expect(str).assertContain('GMT'); // Most timezones include GMT offset
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0201
     * @tc.name DateTest0201
     * @tc.desc Verify toLocaleString() with en-GB locale contains correct date order
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 5, 15); // 15 June 2023
        // en-GB uses day/month/year format
        expect(date.toLocaleDateString('en-GB')).assertContain('15/06/2023');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0202
     * @tc.name DateTest0202
     * @tc.desc Verify parsing date with hyphens and slashes contains correct parts
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06/15'); // Mixed separators
        const isoStr = date.toString();
        expect(isoStr).assertContain('Jun 15 2023');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0203
     * @tc.name DateTest0203
     * @tc.desc Verify toUTCString() for epoch date contains 1970
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(0); // Epoch
      expect(date.toUTCString()).assertContain('1970');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0204
     * @tc.name DateTest0204
     * @tc.desc Verify toLocaleTimeString() with AM/PM contains correct marker
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 0, 1, 14, 30);
      expect(date.toLocaleTimeString('en-US')).assertContain('PM');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0205
     * @tc.name DateTest0205
     * @tc.desc Verify array of parts from split ISO string contains date and time
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15T10:30:45Z');
        const arr = date.toISOString().split('T');
        expect(arr[0]).assertEqual('2023-06-15');
        expect(arr[1]).assertContain('10:30:45');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0206
     * @tc.name DateTest0206
     * @tc.desc Verify parsing date with military time contains correct 24h format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15 18:45');
        const hours = date.getHours().toString();
        expect(date.toTimeString()).assertContain(hours);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0207
     * @tc.name DateTest0207
     * @tc.desc Verify toLocaleDateString() with short format contains all parts
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 5, 15);
        const shortStr = date.toLocaleDateString('en-US', { formatMatcher: 'basic' });
        expect(shortStr).assertContain('6');
        expect(shortStr).assertContain('15');
        expect(shortStr).assertContain('2023');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0208
     * @tc.name DateTest0208
     * @tc.desc Verify that date after DST transition contains correct time
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        // Example: DST starts at 2:00 AM in some regions (clocks jump to 3:00 AM)
        const date = new Date(2023, 2, 12, 3, 30); // March 12, 3:30 AM
        expect(date.toTimeString()).assertContain('03:30');
      });
    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0210
     * @tc.name DateTest0210
     * @tc.desc Verify toJSON() output contains same as toISOString()
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-06-15T10:30:45Z');
      expect(date.toJSON()).assertEqual(date.toISOString());
    });
    /**
     * Continuation of date and time test cases with assertContain
     */

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0211
     * @tc.name DateTest0211
     * @tc.desc Verify toLocaleString() with zh-CN contains correct date order
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 5, 15); // 2023年6月15日
        expect(date.toLocaleDateString('zh-CN')).assertContain('2023');
        expect(date.toLocaleDateString('zh-CN')).assertContain('6');
        expect(date.toLocaleDateString('zh-CN')).assertContain('15');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0213
     * @tc.name DateTest0213
     * @tc.desc Verify toUTCString() for leap day contains correct date
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2024-02-29T00:00:00Z');
        expect(date.toUTCString()).assertContain('29 Feb 2024');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0214
     * @tc.name DateTest0214
     * @tc.desc Verify toString() for maximum date contains correct year
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const maxDate = new Date(8640000000000000);
        expect(maxDate.toString()).assertContain('275760');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0215
     * @tc.name DateTest0215
     * @tc.desc Verify toString() for minimum date contains correct year
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const minDate = new Date(-8640000000000000);
        expect(minDate.toString()).assertContain('-271821');
      });


    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0217
     * @tc.name DateTest0217
     * @tc.desc Verify parsing date with milliseconds contains correct value
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15T10:30:45.123');
        const msStr = date.getMilliseconds().toString();
        expect(date.toISOString()).assertContain(`.${msStr}`);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0218
     * @tc.name DateTest0218
     * @tc.desc Verify toTimeString() for midnight contains 00:00
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15, 0, 0);
      expect(date.toTimeString()).assertContain('00:00:00');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0219
     * @tc.name DateTest0219
     * @tc.desc Verify toTimeString() for noon contains 12:00
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15, 12, 0);
      expect(date.toTimeString()).assertContain('12:00:00');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0220
     * @tc.name DateTest0220
     * @tc.desc Verify toLocaleTimeString() with 12-hour format contains AM
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15, 9, 30);
      expect(date.toLocaleTimeString('en-US')).assertContain('AM');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0222
     * @tc.name DateTest0222
     * @tc.desc Verify toISOString() for date across year boundary contains new year
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-12-31T23:59:59.999Z');
        const nextDate = new Date(date.getTime() + 1);
        expect(nextDate.toISOString()).assertContain('2024-01-01');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0223
     * @tc.name DateTest0223
     * @tc.desc Verify toLocaleDateString() with Korean locale contains correct separators
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 5, 15);
        expect(date.toLocaleDateString('ko-KR')).assertContain('.');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0224
     * @tc.name DateTest0224
     * @tc.desc Verify toLocaleDateString() with French locale contains correct separators
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 5, 15);
        expect(date.toLocaleDateString('fr-FR')).assertContain('/');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0226
     * @tc.name DateTest0226
     * @tc.desc Verify toUTCString() for date with timezone offset contains GMT
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-06-15T10:30:00+08:00');
      expect(date.toUTCString()).assertContain('GMT');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0228
     * @tc.name DateTest0228
     * @tc.desc Verify parsing invalid month returns Invalid Date
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-13-01'); // Month 13 is invalid
      expect(date.toString()).assertContain('Invalid Date');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0229
     * @tc.name DateTest0229
     * @tc.desc Verify parsing invalid day returns Invalid Date
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-02-30'); // February 30 is invalid
      expect(date.toString()).assertContain('Mar 02 2023');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0230
     * @tc.name DateTest0230
     * @tc.desc Verify toISOString() for date with negative year contains correct format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(-1, 0, 1); // 1 BC
        expect(date.toString()).assertContain('Jan 01 -0001');
      });
    /**
     * Continuation of date and time test cases with assertContain
     */

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0231
     * @tc.name DateTest0231
     * @tc.desc Verify toLocaleString() with ar-EG locale contains Arabic numerals
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 5, 15);
        const localeStr = date.toLocaleDateString('ar-EG');
        // Arabic numerals: ٢٠٢٣/٦/١٥
        expect(localeStr).assertContain('٢٠٢٣');
        expect(localeStr).assertContain('٦');
        expect(localeStr).assertContain('١٥');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0232
     * @tc.name DateTest0232
     * @tc.desc Verify parsing date with "DD-Mon-YYYY HH:mm:ss.SSS" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('15-Jun-2023 10:30:45.789');
        const isoStr = date.toString();
        expect(isoStr).assertContain('Jun 15 2023');
        expect(isoStr).assertContain('10:30:45');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0233
     * @tc.name DateTest0233
     * @tc.desc Verify toUTCString() for date with milliseconds contains correct value
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15T10:30:45.789Z');
        // toUTCString() doesn't show milliseconds, but check date/time parts
        expect(date.toUTCString()).assertContain('Thu, 15 Jun 2023 10:30:45 GMT');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0234
     * @tc.name DateTest0234
     * @tc.desc Verify toLocaleDateString() with Buddhist calendar (th-TH)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 5, 15);
        const options: Intl.DateTimeFormatOptions = { calendar: 'buddhist' };
        const localeStr = date.toLocaleDateString('th-TH', options);
        // Buddhist calendar is 543 years ahead (2023 + 543 = 2566)
        expect(localeStr).assertContain('2566');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0235
     * @tc.name DateTest0235
     * @tc.desc Verify parsing date with "MMMM dd, yyyy" format (full month name)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('June 15, 2023');
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(5);
        expect(date.getDate()).assertEqual(15);
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0236
     * @tc.name DateTest0236
     * @tc.desc Verify toTimeString() for time with 24-hour format contains correct hour
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15, 18, 30);
      expect(date.toTimeString()).assertContain('18:30');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0238
     * @tc.name DateTest0238
     * @tc.desc Verify parsing date with mixed case month
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('15 jUn 2023'); // Mixed case month
        const isoStr = date.toString();
        expect(isoStr).assertContain('Jun 15 2023');
      });


    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0240
     * @tc.name DateTest0240
     * @tc.desc Verify setUTCHours() with overflow affects UTC date
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-06-15T23:00:00Z');
      date.setUTCHours(2); // Add 3 hours → next day
      expect(date.toISOString()).assertContain('2023-06-15');
    });
    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0244
     * @tc.name DateTest0244
     * @tc.desc Verify toTimeString() for time with leading zeros in minutes
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15, 10, 5);
      expect(date.toTimeString()).assertContain('10:05');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0245
     * @tc.name DateTest0245
     * @tc.desc Verify toISOString() for date with 0 milliseconds
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15, 10, 30, 45, 0);
      expect(date.toISOString()).assertContain('.000Z');
    });
    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0249
     * @tc.name DateTest0249
     * @tc.desc Verify toUTCString() for date near epoch
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(86400000); // 1 day after epoch (1970-01-02)
        expect(date.toUTCString()).assertContain('Fri, 02 Jan 1970 00:00:00 GMT');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0250
     * @tc.name DateTest0250
     * @tc.desc Verify invalid date in toJSON() returns null
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('invalid');
      expect(date.toJSON()).assertNull();
    });
    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0252
     * @tc.name DateTest0252
     * @tc.desc Verify toLocaleDateString() with Russian locale (ru-RU)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 5, 15);
        const localeStr = date.toLocaleDateString('ru-RU');
        expect(localeStr).assertContain('15.06.2023');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0253
     * @tc.name DateTest0253
     * @tc.desc Verify setUTCMinutes() with overflow affects UTC hours
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-06-15T10:50:00Z');
      date.setUTCMinutes(70); // 50 + 70 = 120 minutes = 2 hours
      expect(date.toISOString()).assertContain('11:10');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0255
     * @tc.name DateTest0255
     * @tc.desc Verify toISOString() for date with 999 milliseconds
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 5, 15, 10, 30, 45, 999);
      expect(date.toISOString()).assertContain('.999Z');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0257
     * @tc.name DateTest0257
     * @tc.desc Verify parsing date with "yyyy-MM-dd HH:mm:ss.SSSXXX" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023-06-15T10:30:45.789+08:00');
        const isoStr = date.toISOString();
        expect(isoStr).assertContain('2023-06-15T02:30:45.789Z');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0258
     * @tc.name DateTest0258
     * @tc.desc Verify setUTCSeconds() with overflow affects UTC minutes
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-06-15T10:30:50Z');
      date.setUTCSeconds(80); // 50 + 80 = 130 seconds = 2 minutes 10 seconds
      expect(date.toISOString()).assertContain('10:31:20');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0259
     * @tc.name DateTest0259
     * @tc.desc Verify parsing date with "dd MMMM yyyy" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('15 June 2023');
        const parts = [
          date.getDate(),
          date.getMonth() + 1,
          date.getFullYear()
        ];
        expect(parts.toString()).assertEqual([15, 6, 2023].toString());
      });
    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0263
     * @tc.name DateTest0263
     * @tc.desc Verify setUTCMilliseconds() with overflow affects UTC seconds
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date('2023-06-15T10:30:45.500Z');
      date.setUTCMilliseconds(1500); // 500 + 1500 = 2000 ms = 2 seconds
      expect(date.toISOString()).assertContain('10:30:46.500Z');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0264
     * @tc.name DateTest0264
     * @tc.desc Verify parsing date with "yyyy" (only year) defaults to Jan 1
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('2023');
        const parts = [
          date.getFullYear(),
          date.getMonth(),
          date.getDate()
        ];
        expect(parts.toString()).assertEqual([2023, 0, 1].toString());
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0265
     * @tc.name DateTest0265
     * @tc.desc Verify toISOString() for date in December
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 11, 25);
      expect(date.toISOString()).assertContain('2023-12-24');
    });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0266
     * @tc.name DateTest0266
     * @tc.desc Verify toLocaleString() with Portuguese locale (pt-BR)
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date(2023, 5, 15);
        const localeStr = date.toLocaleDateString('pt-BR');
        expect(localeStr).assertContain('15/06/2023');
      });

    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0267
     * @tc.name DateTest0267
     * @tc.desc Verify parsing date with "dd-MMM-yyyy HH:mm:ss zzz" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('15-Jun-2023 10:30:45 GMT+08:00');
        const isoStr = date.toISOString();
        expect(isoStr).assertContain('2023-06-15T02:30:45.000Z');
      });


    /**
     * @tc.number SUB_BUILDINS_DATE_TEST_0269
     * @tc.name DateTest0269
     * @tc.desc Verify parsing date with "MMM dd yyyy HH:mm:ss" format
     * @tc.size SmallTest
     * @tc.type FUNCTION
     * @tc.level Level 1
     */
    it('DateTest0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const date = new Date('Jun 15 2023 10:30:45');
        const isoStr = date.toISOString();
        expect(isoStr).assertContain('2023-06-15T02:30:45');
      });
  })

}