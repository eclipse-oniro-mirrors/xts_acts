/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import Ability from '@ohos.app.ability.UIAbility'
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterEach,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import deviceInfo from '@ohos.deviceInfo'
import intl from '@ohos.intl'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function CalendarIni18nTest() {

  describe("CalendarIni18nTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start i18nStageTest*************');

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.name   i18n_calendar_test_static_0100
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_0100
     * @tc.desc   test isWeekend interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_0100 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      let value = calendar.isWeekend(new Date(2021, 10, 1, 10, 0, 0, 0));
      console.log('i18n_calendar_test_static_0100 ' + value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name   i18n_calendar_test_static_0200
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_0200
     * @tc.desc   test getCalendar interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_0200', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_0200 ' + 'start');
      let calendar = i18n.getCalendar('ja', 'japanese');
      let name = calendar.getDisplayName('ja');
      console.log('i18n_calendar_test_static_0200 ' + name);
      expect(name).assertEqual('和暦');
      let timezone = calendar.getTimeZone();
      console.log('i18n_calendar_test_static_0200 ' + timezone);
      expect(timezone.length > 0).assertTrue();
      let firstday = calendar.getFirstDayOfWeek();
      console.log('i18n_calendar_test_static_0200 ' + firstday);
      expect(firstday).assertEqual(1);
      let miniday = calendar.getMinimalDaysInFirstWeek();
      console.log('i18n_calendar_test_static_0200 ' + miniday);
      expect(miniday).assertEqual(1);
      let value = calendar.isWeekend(new Date(2022, 10, 1, 10, 0, 0, 0));
      console.log('i18n_calendar_test_static_0200 ' + value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name   i18n_calendar_test_static_0300
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_0300
     * @tc.desc   test getCalendar interface with zh param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_0300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_0300 ' + 'start');
      let calendar = i18n.getCalendar('zh', 'chinese');
      let name = calendar.getDisplayName('zh');
      console.log('i18n_calendar_test_static_0300 ' + name);
      expect(name).assertEqual('农历');
    })

    /**
     * @tc.name   i18n_calendar_test_static_0400
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_0400
     * @tc.desc   test getCalendar interface with zh param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_0400', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_0400 ' + 'start');
      let calendar = i18n.getCalendar('zh', 'japanese');
      let name = calendar.getDisplayName('zh');
      console.log('i18n_calendar_test_static_0400 ' + name);
      expect(name).assertEqual('和历');
    })

    /**
     * @tc.name   i18n_calendar_test_static_0500
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_0500
     * @tc.desc   get the getDisplayName value, test getDisplayName interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_0500', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_0500 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      let value = calendar.getDisplayName('zh');
      console.log('i18n_calendar_test_static_0500 ' + value);
      expect(value).assertEqual('公历');
    })

    /**
     * @tc.name   i18n_calendar_test_static_0600
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_0600
     * @tc.desc   get the getDisplayName value, test getDisplayName interface with en param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_0600', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_0600 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      let value = calendar.getDisplayName('en');
      console.log('i18n_calendar_test_static_0600 ' + value);
      expect(value).assertEqual('Gregorian Calendar');
    })

    /**
     * @tc.name   i18n_calendar_test_static_0700
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_0700
     * @tc.desc   test get interface, get the get value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_0700', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_0700 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      let value = calendar.get('year');
      console.log('i18n_calendar_test_static_0700 ' + value);
      expect(value).assertLarger(0);
    })

    /**
     * @tc.name   i18n_calendar_test_static_0800
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_0800
     * @tc.desc   test get interface with month param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_0800', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_0800 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      let date1 = new Date(2021, 8, 8, 8, 8, 8, 8);
      calendar.setTime(date1);
      let value = calendar.get('month');
      console.log('i18n_calendar_test_static_0800 ' + value);
      expect(value).assertEqual(8);
    })

    /**
     * @tc.name   i18n_calendar_test_static_0900
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_0900
     * @tc.desc   get the get value, test get interface with day_of_year param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_0900', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_0900 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      let value = calendar.get('day_of_year');
      console.log('i18n_calendar_test_static_0900 ' + value);
      expect(value).assertLarger(0);
    })

    /**
     * @tc.name   i18n_calendar_test_static_1000
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_1000
     * @tc.desc   gtest setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_1000', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_1000 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.setMinimalDaysInFirstWeek(1);
      let value = calendar.getMinimalDaysInFirstWeek();
      console.log('i18n_calendar_test_static_1000 ' + value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name   i18n_calendar_test_static_1100
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_1100
     * @tc.desc   test setMinimalDaysInFirstWeek with 0 param and getMinimalDaysInFirstWeek interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_1100', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_1100 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.setMinimalDaysInFirstWeek(0);
      let value = calendar.getMinimalDaysInFirstWeek();
      console.log('i18n_calendar_test_static_1100 ' + value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name   i18n_calendar_test_static_1200
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_1200
     * @tc.desc   test setMinimalDaysInFirstWeek with 8 param and getMinimalDaysInFirstWeek interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_1200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_1200 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.setMinimalDaysInFirstWeek(8);
      let value = calendar.getMinimalDaysInFirstWeek();
      console.log('i18n_calendar_test_static_1200 ' + value);
      expect(value).assertEqual(7);
    })

    /**
     * @tc.name   i18n_calendar_test_static_1300
     * @tc.number i18n_calendar_test_static_1300
     * @tc.desc   setMinimalDaysInFirstWeek with 7 param and getMinimalDaysInFirstWeek interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_1300', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_1300 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.setMinimalDaysInFirstWeek(7);
      let value = calendar.getMinimalDaysInFirstWeek();
      console.log('i18n_calendar_test_static_1300 ' + value);
      expect(value).assertEqual(7);
    })

    /**
     * @tc.name   i18n_calendar_test_static_1400
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_1400
     * @tc.desc   setFirstDayOfWeek and getFirstDayOfWeek interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_1400', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_1400 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.setFirstDayOfWeek(1);
      let value = calendar.getFirstDayOfWeek();
      console.log('i18n_calendar_test_static_1400 ' + value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name   i18n_calendar_test_static_1500
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_1500
     * @tc.desc   test setFirstDayOfWeek with 0 param and getFirstDayOfWeek interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_1500', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_1500 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.setFirstDayOfWeek(0);
      let value = calendar.getFirstDayOfWeek();
      console.log('i18n_calendar_test_static_1500 ' + value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name   i18n_calendar_test_static_1600
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_1600
     * @tc.desc   test setFirstDayOfWeek with 7 param and getFirstDayOfWeek interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_1600', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_1600 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.setFirstDayOfWeek(7);
      let value = calendar.getFirstDayOfWeek();
      console.log('i18n_calendar_test_static_1600 ' + value);
      expect(value).assertEqual(7);
    })

    /**
     * @tc.name   i18n_calendar_test_static_1700
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_1700
     * @tc.desc   test setFirstDayOfWeek with 8 param and getFirstDayOfWeek interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_1700', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_1700 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.setFirstDayOfWeek(8);
      let value = calendar.getFirstDayOfWeek();
      console.log('i18n_calendar_test_static_1700 ' + value);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.name   i18n_calendar_test_static_1800
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_1800
     * @tc.desc   test setTimeZone and getTimeZone interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_1800', Level.LEVEL0, (): void => {
      hilog.info(domain, tag, '%{public}s', 'i18n_calendar_test_static_1800 start');
      let calendar: i18n.Calendar = i18n.getCalendar('zh');
      calendar.setTimeZone('Asia/Shanghai');
      let value: string = calendar.getTimeZone();
      hilog.info(domain, tag, '%{public}s', 'i18n_calendar_test_static_1800 ' + value);
      expect(value).assertEqual('Asia/Shanghai');
    })

    /**
     * @tc.name   i18n_calendar_test_static_1900
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_1900
     * @tc.desc   test setTimeZone with AAA param and getTimeZone interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_1900', Level.LEVEL2, (): void => {
      hilog.info(domain, tag, '%{public}s', 'i18n_calendar_test_static_1900 start');
      let calendar: i18n.Calendar = i18n.getCalendar('zh');
      calendar.setTimeZone('AAA');
      let value: string = calendar.getTimeZone();
      hilog.info(domain, tag, '%{public}s', 'i18n_calendar_test_static_1900 ' + value);
      expect(value).assertEqual('Etc/Unknown');
    })

    /**
     * @tc.name   i18n_calendar_test_static_2000
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_2000
     * @tc.desc   0test set interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_2000', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_2000 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.set(2021, 11, 11);
      let value = calendar.isWeekend();
      console.log('i18n_calendar_test_static_2000 ' + value);
      expect(value).assertTrue();
    })

    /**
     * @tc.name   i18n_calendar_test_static_2100
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_2100
     * @tc.desc   test set interface with hour,minute,second param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_2100', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_2100 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.set(2021, 11, 11, 10, 10, 10);
      let value = calendar.isWeekend();
      console.log('i18n_calendar_test_static_2100 ' + value);
      expect(value).assertTrue();
    })

    /**
     * @tc.name   i18n_calendar_test_static_2200
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_2200
     * @tc.desc   test set interface with hour,minute param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_2200', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_2200 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.set(2021, 11, 11, 10, 10);
      let value = calendar.isWeekend();
      console.log('i18n_calendar_test_static_2200 ' + value);
      expect(value).assertTrue();
    })

    /**
     * @tc.name   i18n_calendar_test_static_2300
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_2300
     * @tc.desc   test setTime interface with date param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_calendar_test_static_2300', Level.LEVEL0, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_2300 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      let date1 = new Date(2021, 8, 8, 8, 8, 8, 8);
      calendar.setTime(date1);
      let value = calendar.isWeekend();
      console.log('i18n_calendar_test_static_2300 ' + value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name   i18n_calendar_test_static_2400
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_2400
     * @tc.desc   test setTime interface with wrong month param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_2400', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_2400 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      let date1 = new Date(2021, 18, 8, 8, 8, 8, 8);
      calendar.setTime(date1);
      let value = calendar.isWeekend();
      console.log('i18n_calendar_test_static_2400 ' + value);
      expect(value).assertFalse();
    })

    /**
     * @tc.name   i18n_calendar_test_static_2500
     * @tc.number SUB_GLOBAL_I18N_CALENDAR_JS_static_2500
     * @tc.desc   test setTime interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_calendar_test_static_2500', Level.LEVEL2, async (): Promise<void> => {
      console.log('i18n_calendar_test_static_2500 ' + 'start');
      let calendar = i18n.getCalendar('zh');
      calendar.setTime(10540800000);
      let value = calendar.isWeekend();
      console.log('i18n_calendar_test_static_2500 ' + value);
      expect(value).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_I18N_SR000IFGNH_static_0010
     * @tc.number SUB_GLOBAL_I18N_SR000IFGNH_static_0010
     * @tc.desc   HolidayManager-input.ics file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let holidayManager = new i18n.HolidayManager("/system/lib/TR.ics");
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_static_0010' + holidayManager);
      } catch (e: BusinessError) {
        expect(e.code==null).assertTrue();
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_static_0010_errorCode'+e.code);
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_static_0010_errorMessage'+e.message);
      }
      done();
    })
    console.log('*************end CalendarIni18nTest*************');
  })
}