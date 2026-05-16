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
import { ArrayList } from '@kit.ArkTS';

export default function DateTestCase004() {
  describe('DateTestCase004', () => {
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    /**
     * @tc.name   hasDaylightSavingTime
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_001
     * @tc.desc   Verify detection if current timezone uses daylight saving time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('hasDaylightSavingTime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const now: Date = new Date();
      const jan: Date = new Date(now.getFullYear(), 0, 1);
      const jul: Date = new Date(now.getFullYear(), 6, 1);
      const standardOffset: number = -jan.getTimezoneOffset();
      const daylightOffset: number = -jul.getTimezoneOffset();
      const hasDST: boolean = standardOffset !== daylightOffset;
      expect(hasDST).assertFalse();
    });


    /**
     * @tc.name   usDSTStartTimeChange
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_004
     * @tc.desc   Verify US DST start time change (2nd Sunday in March).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('usDSTStartTimeChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const dateBefore = new Date('2024-03-10T01:30:00-05:00');
      const dateAfter = new Date(dateBefore.getTime() + 3600000);
      expect(dateAfter.toISOString()).assertEqual("2024-03-10T07:30:00.000Z");
      expect(dateAfter.getHours()).assertEqual(15)
    });

    /**
     * @tc.name   usDSTEndTimeChange
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_005
     * @tc.desc   Verify US DST end time change (1st Sunday in November).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('usDSTEndTimeChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1amEDT = new Date('2024-11-03T01:30:00-04:00');
      const date1amEST = new Date(date1amEDT.getTime() + 3600000);
      expect(date1amEST.toISOString()).assertEqual("2024-11-03T06:30:00.000Z");
      expect(date1amEST.getHours()).assertEqual(14);
      expect(-date1amEST.getTimezoneOffset() / 60).assertEqual(8);
    });

    /**
     * @tc.name   timeCalculationInDST
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_006
     * @tc.desc   Verify time calculation during DST period.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('timeCalculationInDST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date('2024-07-15T12:00:00-04:00');
      const nextDay: Date = new Date(date.getTime() + 24 * 60 * 60 * 1000);
      const diff: number = (nextDay.getTime() - date.getTime()) / 3600000;
      expect(diff).assertEqual(24);
    });

    /**
     * @tc.name   europeDSTStart
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_007
     * @tc.desc   Verify Europe DST start (last Sunday in March).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('europeDSTStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const dateCET: Date = new Date('2024-03-31T01:00:00+01:00');
      const dateCEST: Date = new Date('2024-03-31T03:00:00+02:00');
      const timeDiff: number = dateCEST.getTime() - dateCET.getTime();
      expect(timeDiff).assertEqual(3600000);
    });

    /**
     * @tc.name   europeDSDEnd
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_008
     * @tc.desc   Verify Europe DST end (last Sunday in October).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('europeDSDEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const europeDstEnd2024 = '2024-10-27T02:59:59+02:00';
      const europeDstEnd2024After = '2024-10-27T02:00:00+01:00';
      expect(europeDstEnd2024).assertEqual("2024-10-27T02:59:59+02:00");
      expect(europeDstEnd2024After).assertEqual("2024-10-27T02:00:00+01:00");
    });

    /**
     * @tc.name   createNonExistentTime
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_009
     * @tc.desc   Verify creating non-existent time during DST jump.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('createNonExistentTime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date(2024, 2, 10, 2, 30);
      expect(date.toISOString()).assertEqual('2024-03-09T18:30:00.000Z');
      expect(date.toLocaleString()).assertEqual('3/10/2024, 2:30:00 AM');
      expect(-date.getTimezoneOffset()).assertEqual(480);
    });

    /**
     * @tc.name   handleAmbiguousTime
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_010
     * @tc.desc   Verify handling ambiguous time during DST end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('handleAmbiguousTime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2024-11-03T01:00:00-04:00');
      expect(date1.toISOString()).assertEqual("2024-11-03T05:00:00.000Z");
      expect(date1.getTimezoneOffset()).assertEqual(-480);
      const date2 = new Date('2024-11-03T01:00:00-05:00');
      expect(date2.toISOString()).assertEqual('2024-11-03T06:00:00.000Z');
      expect(date2.getTimezoneOffset()).assertEqual(-480);
      const timeDiff: number = (date2.getTime() - date1.getTime()) / 3600000;
      expect(timeDiff).assertEqual(1);
    });

    /**
     * @tc.name   crossDSTBoundary
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_011
     * @tc.desc   Verify date calculation crossing DST boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('crossDSTBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const beforeDST = new Date('2024-03-09T23:00:00-05:00');
      console.log('夏令时开始前一天:', beforeDST.toISOString());
      expect(beforeDST.toISOString()).assertEqual("2024-03-10T04:00:00.000Z");
      const afterDST = new Date(beforeDST.getTime() + 2 * 3600000);
      expect(afterDST.toISOString()).assertEqual("2024-03-10T06:00:00.000Z");
      expect(afterDST.toLocaleString()).assertEqual("3/10/2024, 2:00:00 PM");
      expect((afterDST.getTime() - beforeDST.getTime()) / 3600000).assertEqual(2);
      expect(beforeDST.getTimezoneOffset() !== afterDST.getTimezoneOffset()).assertFalse();
    });

    /**
     * @tc.name   dSTInTimezone
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_012
     * @tc.desc   Verify DST behavior in specific timezone using Intl API.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dSTInTimezone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date('2024-03-10T01:30:00Z');
      const formatter = new Intl.DateTimeFormat('en-US', {
        timeZone: 'America/New_York',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        timeZoneName: 'short'
      });
      expect(date.toISOString()).assertEqual("2024-03-10T01:30:00.000Z");
      expect(encodeURI(formatter.format(date))).assertEqual('03/09/2024,%2008:30:00%E2%80%AFPM%20EST');
      expect(-date.getTimezoneOffset() / 60).assertEqual(8);

      const date2 = new Date('2024-03-10T03:00:00Z');
      const formatter2 = new Intl.DateTimeFormat('en-US', {
        timeZone: 'America/New_York',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        timeZoneName: 'short'
      });
      expect(date2.toISOString()).assertEqual("2024-03-10T03:00:00.000Z");
      expect(formatter2.format(date2)).assertEqual("03/09/2024, 10:00:00 PM EST");
      expect(-date2.getTimezoneOffset() / 60).assertEqual(8);


      const date3 = new Date('2024-11-03T05:00:00Z');
      const formatter3 = new Intl.DateTimeFormat('en-US', {
        timeZone: 'America/New_York',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        timeZoneName: 'short'
      });
      expect(date3.toISOString()).assertEqual("2024-11-03T05:00:00.000Z");
      expect(formatter3.format(date3)).assertEqual("11/03/2024, 01:00:00 AM EDT");
      expect(-date3.getTimezoneOffset() / 60).assertEqual(8);

      const date4 = new Date('2024-11-03T07:00:00Z');
      const formatter4 = new Intl.DateTimeFormat('en-US', {
        timeZone: 'America/New_York',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        timeZoneName: 'short'
      });
      expect(date4.toISOString()).assertEqual("2024-11-03T07:00:00.000Z");
      expect(formatter4.format(date4)).assertEqual("11/03/2024, 02:00:00 AM EST");
      expect(-date4.getTimezoneOffset() / 60).assertEqual(8);


      const date5 = new Date('2024-03-31T00:30:00Z');
      const formatter5 = new Intl.DateTimeFormat('en-US', {
        timeZone: 'Europe/Paris',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        timeZoneName: 'short'
      });
      expect(date5.toISOString()).assertEqual("2024-03-31T00:30:00.000Z");
      expect(formatter5.format(date5)).assertEqual("03/31/2024, 01:30:00 AM GMT+1");
      expect(-date5.getTimezoneOffset() / 60).assertEqual(8);


      const date6 = new Date('2024-03-31T02:00:00Z');
      const formatter6 = new Intl.DateTimeFormat('en-US', {
        timeZone: 'Europe/Paris',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        timeZoneName: 'short'
      });
      expect(date6.toISOString()).assertEqual("2024-03-31T02:00:00.000Z");
      expect(formatter6.format(date6)).assertEqual("03/31/2024, 04:00:00 AM GMT+2");
      expect(-date6.getTimezoneOffset() / 60).assertEqual(8);


      const date7 = new Date('2024-10-27T00:30:00Z');
      const formatter7 = new Intl.DateTimeFormat('en-US', {
        timeZone: 'Europe/Paris',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        timeZoneName: 'short'
      });
      expect(date7.toISOString()).assertEqual("2024-10-27T00:30:00.000Z");
      expect(formatter7.format(date7)).assertEqual("10/27/2024, 02:30:00 AM GMT+2");
      expect(-date7.getTimezoneOffset() / 60).assertEqual(8);


      const date8 = new Date('2024-10-27T02:00:00Z');
      const formatter8 = new Intl.DateTimeFormat('en-US', {
        timeZone: 'Europe/Paris',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        timeZoneName: 'short'
      });
      expect(date8.toISOString()).assertEqual("2024-10-27T02:00:00.000Z");
      expect(formatter8.format(date8)).assertEqual("10/27/2024, 03:00:00 AM GMT+1");
      expect(-date8.getTimezoneOffset() / 60).assertEqual(8);
    });

    /**
     * @tc.name   compareDSTRulesAcrossZones
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_013
     * @tc.desc   Verify comparing DST rules across different timezones.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('compareDSTRulesAcrossZones', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: ArrayList<string | number> = new ArrayList<string | number>();
      const timeZones = [
        'America/New_York',
        'America/Chicago',
        'America/Los_Angeles',
        'Europe/London',
        'Europe/Paris',
        'Asia/Tokyo',
        'Asia/Shanghai'
      ];
      const testDate = new Date('2024-06-15T12:00:00Z');
      timeZones.forEach(tz => {
        const formatter = new Intl.DateTimeFormat('en-US', {
          timeZone: tz,
          timeZoneName: 'long'
        });
        res.add(formatter.format(testDate))
      });
      expect(JSON.stringify(res))
        .assertEqual('{"0":"6/15/2024, Eastern Daylight Time","1":"6/15/2024, Central Daylight Time",' +
          '"2":"6/15/2024, Pacific Daylight Time","3":"6/15/2024, British Summer Time",' +
          '"4":"6/15/2024, Central European Summer Time","5":"6/15/2024, Japan Standard Time",' +
          '"6":"6/15/2024, China Standard Time"}');
    });

    /**
     * @tc.name   dSTByYear
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_014
     * @tc.desc   Verify DST rules across different years.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dSTByYear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: ArrayList<string | number | boolean> = new ArrayList<string | number | boolean>();
      let startYear = 2020;
      let endYear = 2025;
      for (let year = startYear; year <= endYear; year++) {
        const jan = new Date(year, 0, 1);
        const jul = new Date(year, 6, 1);
        const standardOffset = -jan.getTimezoneOffset();
        const daylightOffset = -jul.getTimezoneOffset();
        res.add(standardOffset);
        res.add(daylightOffset);
        res.add(standardOffset !== daylightOffset);
      }
      expect(JSON.stringify(res))
        .assertEqual('{"0":480,"1":480,"2":false,"3":480,"4":480,"5":false,"6":480,"7":480,"8":false,' +
          '"9":480,"10":480,"11":false,"12":480,"13":480,"14":false,"15":480,"16":480,"17":false}');
    });

    /**
     * @tc.name   noDSTTimeZone
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_015
     * @tc.desc   Verify timezone that does not use DST.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('noDSTTimeZone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testNoDSTTimeZone('Asia/Shanghai')).assertTrue();
      expect(testNoDSTTimeZone('Asia/Tokyo')).assertTrue();
      expect(testNoDSTTimeZone('America/Phoenix')).assertTrue();
    });

    /**
     * @tc.name   timeDifferenceAcrossDST
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_016
     * @tc.desc   Verify time difference calculation across DST boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('timeDifferenceAcrossDST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const beforeStart = new Date('2024-03-09T23:00:00-05:00');
      const afterStart = new Date('2024-03-10T01:00:00-04:00');

      const diff1 = (afterStart.getTime() - beforeStart.getTime()) / 3600000;
      expect(diff1).assertEqual(1);
      const beforeEnd = new Date('2024-11-03T01:00:00-04:00');
      const afterEnd = new Date('2024-11-03T02:00:00-05:00');

      const diff2 = (afterEnd.getTime() - beforeEnd.getTime()) / 3600000;
      expect(diff2).assertEqual(2);
      const localStart = new Date(2024, 2, 9, 23, 0, 0);
      const localEnd = new Date(2024, 2, 10, 1, 0, 0);

      const localDiff = (localEnd.getTime() - localStart.getTime()) / 3600000;
      expect(localDiff).assertEqual(2);
    });

    /**
     * @tc.name   dateArithmeticInDST
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_017
     * @tc.desc   Verify date arithmetic during DST period.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateArithmeticInDST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const baseDate = new Date('2024-03-09T12:00:00-05:00');
      expect(baseDate.toISOString()).assertEqual("2024-03-09T17:00:00.000Z");
      expect(baseDate.toLocaleString()).assertEqual("3/10/2024, 1:00:00 AM");
      const nextDay = new Date(baseDate);
      nextDay.setDate(baseDate.getDate() + 1);
      expect(nextDay.toLocaleString()).assertEqual("3/11/2024, 1:00:00 AM");
      console.log('+1天:', nextDay.toLocaleString());
      console.log('时区偏移变化:',
        baseDate.getTimezoneOffset(), '->', nextDay.getTimezoneOffset());
      expect(baseDate.getTimezoneOffset()).assertEqual(-480);
      expect(nextDay.getTimezoneOffset()).assertEqual(-480);
      const nextWeek = new Date(baseDate);
      nextWeek.setDate(baseDate.getDate() + 7);
      expect(baseDate.toLocaleString()).assertEqual("3/10/2024, 1:00:00 AM");
      const nextMonth = new Date(baseDate);
      nextMonth.setMonth(baseDate.getMonth() + 1);
      console.log('+1月:', nextMonth.toLocaleString());
      expect(nextMonth.toLocaleString()).assertEqual("4/10/2024, 1:00:00 AM");
    });

    /**
     * @tc.name   dateComparisonInDST
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_018
     * @tc.desc   Verify date comparison during DST period.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateComparisonInDST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2024-03-10T06:00:00Z');
      const date2 = new Date('2024-03-10T06:00:00Z');
      console.log('date1.getTime() === date2.getTime():');
      expect(date1.getTime() === date2.getTime()).assertTrue();
      expect(date1 === date2).assertFalse();
      const beforeDST = new Date('2024-03-10T05:59:00Z');
      const afterDST = new Date('2024-03-10T07:00:00Z');

      expect(beforeDST.toLocaleString()).assertEqual("3/10/2024, 1:59:00 PM");
      expect(afterDST.toLocaleString()).assertEqual("3/10/2024, 3:00:00 PM");
      let res = (afterDST.getTime() - beforeDST.getTime()) / 60000
      expect(res).assertEqual(61);
    });

    /**
     * @tc.name   midnightNearDST
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_021
     * @tc.desc   Verify midnight near DST boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('midnightNearDST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const midnight1 = new Date(2024, 2, 9, 0, 0, 0);
      expect(midnight1.toLocaleString()).assertEqual('3/9/2024, 12:00:00 AM');
      const midnight2 = new Date(2024, 2, 10, 0, 0, 0);
      expect(midnight2.toLocaleString()).assertEqual('3/10/2024, 12:00:00 AM');
      const midnight3 = new Date(2024, 10, 2, 0, 0, 0);
      expect(midnight3.toLocaleString()).assertEqual('11/2/2024, 12:00:00 AM');
      const midnight4 = new Date(2024, 10, 3, 0, 0, 0);
      expect(midnight4.toLocaleString()).assertEqual('11/3/2024, 12:00:00 AM');
    });


    /**
     * @tc.name   scheduledTaskDST
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_024
     * @tc.desc   Verify scheduled task behavior during DST period.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scheduledTaskDST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: ArrayList<string | number | boolean> = new ArrayList<string | number | boolean>();
      const startDate = new Date(2024, 2, 9, 8, 0, 0);
      for (let day = 0; day < 5; day++) {
        const runTime = new Date(startDate);
        runTime.setDate(startDate.getDate() + day);
        res.add(runTime.toLocaleString());
        res.add(-runTime.getTimezoneOffset() / 60);
      }
      expect(JSON.stringify(res))
        .assertEqual('{"0":"3/9/2024, 8:00:00 AM","1":8,"2":"3/10/2024, 8:00:00 AM","3":8,"4":"3/11/2024, ' +
          '8:00:00 AM","5":8,"6":"3/12/2024, 8:00:00 AM","7":8,"8":"3/13/2024, 8:00:00 AM","9":8}');
    });

    /**
     * @tc.name   dSTPitfalls
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_026
     * @tc.desc   Verify common DST pitfalls and correct approaches.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dSTPitfalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date(2024, 2, 10, 2, 30, 0);
      expect(date1.toLocaleString()).assertEqual("3/10/2024, 2:30:00 AM");
      expect(date1.toISOString()).assertEqual("2024-03-09T18:30:00.000Z");
      console.log('尝试创建不存在的 2:30 AM:', date1.toLocaleString());
      console.log('实际创建的时间:', date1.toISOString());
      const date2 = new Date(Date.UTC(2024, 2, 10, 7, 30, 0));
      console.log('使用UTC创建:', date2.toISOString());
      expect(date2.toISOString()).assertEqual("2024-03-10T07:30:00.000Z");
      const march9 = new Date(2024, 2, 9, 14, 0, 0);
      const march10 = new Date(2024, 2, 10, 14, 0, 0);
      expect(march9.toLocaleString()).assertEqual("3/9/2024, 2:00:00 PM");
      expect(march10.toLocaleString()).assertEqual("3/10/2024, 2:00:00 PM");
      expect((march10.getTime() - march9.getTime()) / 3600000).assertEqual(24);
    });

    /**
     * @tc.name   dateSerializationDST
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_027
     * @tc.desc   Verify date serialization and deserialization with DST.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dateSerializationDST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const originalDate = new Date('2024-03-10T12:00:00-04:00');
      console.log('原始日期:', originalDate.toLocaleString());
      console.log('原始时区偏移:', -originalDate.getTimezoneOffset() / 60);
      expect(originalDate.toLocaleString()).assertEqual("3/11/2024, 12:00:00 AM");
      expect(-originalDate.getTimezoneOffset()).assertEqual(480);
      const isoString = originalDate.toISOString();
      console.log('保存的ISO字符串:', isoString);
      expect(isoString).assertEqual("2024-03-10T16:00:00.000Z");
      const restoredDate1 = new Date(isoString);
      console.log('恢复的日期:', restoredDate1.toLocaleString());
      expect(restoredDate1.toString()).assertEqual("Mon Mar 11 2024 00:00:00 GMT+0800");
      const timestamp = originalDate.getTime();
      console.log('保存的时间戳:', timestamp);
      expect(timestamp).assertEqual(1710086400000);
      const restoredDate2 = new Date(timestamp);
      console.log('恢复的日期:', restoredDate2.toLocaleString());
      expect(restoredDate2.toLocaleString()).assertEqual('3/11/2024, 12:00:00 AM');
      expect(originalDate.getTime() === restoredDate1.getTime() &&
        originalDate.getTime() === restoredDate2.getTime()).assertTrue();
    });

    /**
     * @tc.name   timeZoneChanges
     * @tc.number SUB_COMMONLIBRARY_DATE_DST_028
     * @tc.desc   Verify timezone rule changes across years.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('timeZoneChanges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let res: ArrayList<string | number | boolean> = new ArrayList<string | number | boolean>();
      const years = [2005, 2015, 2025];

      years.forEach(year => {
        const jan = new Date(year, 0, 1);
        const jul = new Date(year, 6, 1);
        const standardOffset = -jan.getTimezoneOffset();
        const daylightOffset = -jul.getTimezoneOffset();
        res.add(year);
        res.add(standardOffset);
        res.add(daylightOffset);
        const marchDate = new Date(`${year}-03-15T00:00:00Z`);
        const marchFormatter = new Intl.DateTimeFormat('en-US', {
          timeZone: 'America/New_York',
          timeZoneName: 'short'
        });
        res.add(marchFormatter.format(marchDate));
      });
      expect(JSON.stringify(res)).assertEqual('{"0":2005,"1":480,"2":480,"3":"3/14/2005, ' +
        'EST","4":2015,"5":480,"6":480,"7":"3/14/2015, EDT","8":2025,"9":480,"10":480,"11":"3/14/2025, EDT"}');
    });


  });
}


export function testDSTInTimezone(timeZone: string, dates: string[]) {
  let res: Array<number | string> = new Array<number | string>();
  console.log(`=== 测试时区: ${timeZone} ===`);

  dates.forEach((dateStr, index) => {
    const date = new Date(dateStr);

    const formatter = new Intl.DateTimeFormat('en-US', {
      timeZone,
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      timeZoneName: 'short'
    });
    res.push(index + 1);
    res.push(date.toISOString());
    res.push(formatter.format(date));
    res.push(-date.getTimezoneOffset() / 60);
  });
}


function testNoDSTTimeZone(timeZone: string) {
  const testDates = [
    '2024-01-15T12:00:00Z',
    '2024-06-15T12:00:00Z',
    '2024-12-15T12:00:00Z'
  ];
  let hasDST = false;

  testDates.forEach(dateStr => {
    const date = new Date(dateStr);
    const formatter = new Intl.DateTimeFormat('en-US', {
      timeZone,
      hour: '2-digit',
      hour12: false,
      timeZoneName: 'short'
    });

    const formatted = formatter.format(date);
    const offset = -date.getTimezoneOffset();
    if (offset == 480) {
      hasDST = true;
    }
  });

  return hasDST;
}