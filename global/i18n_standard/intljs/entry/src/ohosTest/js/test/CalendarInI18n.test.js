/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import I18n from '@ohos.i18n'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function CalendarInI18nTest() {
describe('CalendarInI18nTest', function () {
    console.log('*************start CalendarInI18nTest*************');

    let hour = I18n.System.is24HourClock();
    console.log('init 24 hour clock value ' + hour);

    /* *
    * execute this step before all testcases
    */
    beforeAll(function(){
        console.log('step before all cases in I18n.'
        + ' 24hour: ' + I18n.System.is24HourClock()
        + ' prelang: ' + I18n.System.getPreferredLanguageList()
        + ' syslocale: ' + I18n.System.getSystemLocale());
    })

    /* *
    * execute this step before every testcase
    */
    beforeEach(function(){
        console.log('step before every case in I18n.');
    })

    /* *
    * execute this step after every testcase
    */
    afterEach(function(){
        console.log('step after every case in I18n.');
    })

    /* *
    * execute this step after all testcases
    */
    afterAll(function(){
        console.log('step after all cases in I18n.'
        + ' 24hour: ' + I18n.System.is24HourClock()
        + ' prelang: ' + I18n.System.getPreferredLanguageList()
        + ' syslocale: ' + I18n.System.getSystemLocale());
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_0100
    * @tc.name    test isWeekend interface
    * @tc.desc    get the isWeekend value
    */
     it('i18n_calendar_test_0100', 0, function () {
        console.log('i18n_calendar_test_0100 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.isWeekend(new Date(2021, 10, 1, 10, 0, 0, 0));
        console.log('i18n_calendar_test_0100 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_0200
    * @tc.name    test getCalendar interface
    * @tc.desc    get the getCalendar value
    */
     it('i18n_calendar_test_0200', 0, function () {
        console.log('i18n_calendar_test_0200 ' + 'start');
        let calendar = I18n.getCalendar('ja', 'japanese');
        let name = calendar.getDisplayName('ja');
        console.log('i18n_calendar_test_0200 ' + name);
        expect(name).assertEqual('和暦');
        let timezone = calendar.getTimeZone();
        console.log('i18n_calendar_test_0200 ' + timezone);
        expect(timezone.length > 0).assertTrue();
        let firstday = calendar.getFirstDayOfWeek();
        console.log('i18n_calendar_test_0200 ' + firstday);
        expect(firstday).assertEqual(1);
        let miniday = calendar.getMinimalDaysInFirstWeek();
        console.log('i18n_calendar_test_0200 ' + miniday);
        expect(miniday).assertEqual(1);
        let value = calendar.isWeekend(new Date(2022, 10, 1, 10, 0, 0, 0));
        console.log('i18n_calendar_test_0200 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_0300
    * @tc.name    test getCalendar interface with zh param
    * @tc.desc    get the getCalendar value
    */
    it('i18n_calendar_test_0300', 0, function () {
        console.log('i18n_calendar_test_0300 ' + 'start');
        let calendar = I18n.getCalendar('zh', 'chinese');
        let name = calendar.getDisplayName('zh');
        console.log('i18n_calendar_test_0300 ' + name);
        expect(name).assertEqual('农历');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_0400
    * @tc.name    test getCalendar interface with zh param
    * @tc.desc    get the getCalendar value
    */
    it('i18n_calendar_test_0400', 0, function () {
        console.log('i18n_calendar_test_0400 ' + 'start');
        let calendar = I18n.getCalendar('zh', 'japanese');
        let name = calendar.getDisplayName('zh');
        console.log('i18n_calendar_test_0400 ' + name);
        expect(name).assertEqual('和历');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_0500
    * @tc.name    test getDisplayName interface
    * @tc.desc    get the getDisplayName value
    */
    it('i18n_calendar_test_0500', 0, function () {
        console.log('i18n_calendar_test_0500 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.getDisplayName('zh');
        console.log('i18n_calendar_test_0500 ' + value);
        expect(value).assertEqual('公历');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_0600
    * @tc.name    test getDisplayName interface with en param
    * @tc.desc    get the getDisplayName value
    */
    it('i18n_calendar_test_0600', 0, function () {
        console.log('i18n_calendar_test_0600 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.getDisplayName('en');
        console.log('i18n_calendar_test_0600 ' + value);
        expect(value).assertEqual('Gregorian Calendar');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_0700
    * @tc.name    test get interface
    * @tc.desc    get the get value
    */
    it('i18n_calendar_test_0700', 0, function () {
        console.log('i18n_calendar_test_0700 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.get('year');
        console.log('i18n_calendar_test_0700 ' + value);
        expect(value).assertLarger(0);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_0800
    * @tc.name    test get interface with month param
    * @tc.desc    get the get value
    */
     it('i18n_calendar_test_0800', 0, function () {
        console.log('i18n_calendar_test_0800 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let date1 = new Date(2021, 8, 8, 8, 8, 8, 8);
        calendar.setTime(date1);
        let value = calendar.get('month');
        console.log('i18n_calendar_test_0800 ' + value);
        expect(value).assertEqual(8);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_0900
    * @tc.name    test get interface with day_of_year param
    * @tc.desc    get the get value
    */
    it('i18n_calendar_test_0900', 0, function () {
        console.log('i18n_calendar_test_0900 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.get('day_of_year');
        console.log('i18n_calendar_test_0900 ' + value);
        expect(value).assertLarger(0);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_1000
    * @tc.name    test setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    */
    it('i18n_calendar_test_1000', 0, function () {
        console.log('i18n_calendar_test_1000 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(1);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('i18n_calendar_test_1000 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_1100
    * @tc.name    test setMinimalDaysInFirstWeek with 0 param and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    */
    it('i18n_calendar_test_1100', 0, function () {
        console.log('i18n_calendar_test_1100 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(0);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('i18n_calendar_test_1100 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_1200
    * @tc.name    test setMinimalDaysInFirstWeek with 8 param and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    */
    it('i18n_calendar_test_1200', 0, function () {
        console.log('i18n_calendar_test_1200 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(8);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('i18n_calendar_test_1200 ' + value);
        expect(value).assertEqual(7);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_1300
    * @tc.name    test setMinimalDaysInFirstWeek with 7 param and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    */
    it('i18n_calendar_test_1300', 0, function () {
        console.log('i18n_calendar_test_1300 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(7);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('i18n_calendar_test_1300 ' + value);
        expect(value).assertEqual(7);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_1400
    * @tc.name    test setFirstDayOfWeek and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    */
    it('i18n_calendar_test_1400', 0, function () {
        console.log('i18n_calendar_test_1400 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(1);
        let value = calendar.getFirstDayOfWeek();
        console.log('i18n_calendar_test_1400 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_1500
    * @tc.name    test setFirstDayOfWeek with 0 param and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    */
    it('i18n_calendar_test_1500', 0, function () {
        console.log('i18n_calendar_test_1500 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(0);
        let value = calendar.getFirstDayOfWeek();
        console.log('i18n_calendar_test_1500 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_1600
    * @tc.name    test setFirstDayOfWeek with 7 param and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    */
    it('i18n_calendar_test_1600', 0, function () {
        console.log('i18n_calendar_test_1600 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(7);
        let value = calendar.getFirstDayOfWeek();
        console.log('i18n_calendar_test_1600 ' + value);
        expect(value).assertEqual(7);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_1700
    * @tc.name    test setFirstDayOfWeek with 8 param and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    */
    it('i18n_calendar_test_1700', 0, function () {
        console.log('i18n_calendar_test_1700 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(8);
        let value = calendar.getFirstDayOfWeek();
        console.log('i18n_calendar_test_1700 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_1800
    * @tc.name    test setTimeZone and getTimeZone interface
    * @tc.desc    get the setTimeZone and getTimeZone value
    */
    it('i18n_calendar_test_1800', 0, function () {
        console.log('i18n_calendar_test_1800 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTimeZone('Asia/Shanghai');
        let value = calendar.getTimeZone();
        console.log('i18n_calendar_test_1800 ' + value);
        expect(value).assertEqual('Asia/Shanghai');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_1900
    * @tc.name    test setTimeZone with AAA param and getTimeZone interface
    * @tc.desc    get the setTimeZone and getTimeZone value
    */
    it('i18n_calendar_test_1900', 0, function () {
        console.log('i18n_calendar_test_1900 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTimeZone('AAA');
        let value = calendar.getTimeZone();
        console.log('i18n_calendar_test_1900 ' + value);
        expect(value).assertEqual('Etc/Unknown');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_2000
    * @tc.name    test set interface
    * @tc.desc    get the set value
    */
    it('i18n_calendar_test_2000', 0, function () {
        console.log('i18n_calendar_test_2000 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.set(2021, 11, 11);
        let value = calendar.isWeekend();
        console.log('i18n_calendar_test_2000 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_2100
    * @tc.name    test set interface with hour,minute,second param
    * @tc.desc    get the set value
    */
    it('i18n_calendar_test_2100', 0, function () {
        console.log('i18n_calendar_test_2100 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.set(2021, 11, 11, 10, 10, 10);
        let value = calendar.isWeekend();
        console.log('i18n_calendar_test_2100 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_2200
    * @tc.name    test set interface with hour,minute param
    * @tc.desc    get the set value
    */
    it('i18n_calendar_test_2200', 0, function () {
        console.log('i18n_calendar_test_2200 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.set(2021, 11, 11, 10, 10);
        let value = calendar.isWeekend();
        console.log('i18n_calendar_test_2200 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_2300
    * @tc.name    test setTime interface with date param
    * @tc.desc    get the setTime value
    */
    it('i18n_calendar_test_2300', 0, function () {
        console.log('i18n_calendar_test_2300 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        //actuall month is 9
        let date1 = new Date(2021, 8, 8, 8, 8, 8, 8);
        calendar.setTime(date1);
        let value = calendar.isWeekend();
        console.log('i18n_calendar_test_2300 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_2400
    * @tc.name    test setTime interface with wrong month param
    * @tc.desc    get the setTime value
    */
    it('i18n_calendar_test_2400', 0, function () {
        console.log('i18n_calendar_test_2400 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let date1 = new Date(2021, 18, 8, 8, 8, 8, 8);
        calendar.setTime(date1);
        let value = calendar.isWeekend();
        console.log('i18n_calendar_test_2400 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_CALENDAR_JS_2500
    * @tc.name    test setTime interface
    * @tc.desc    get the setTime value
    */
    it('i18n_calendar_test_2500', 0, function () {
        console.log('i18n_calendar_test_2500 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTime(10540800000);
        let value = calendar.isWeekend();
        console.log('i18n_calendar_test_2500 ' + value);
        expect(value).assertTrue();
    })

    /**
    *@tc.number   :SUB_GLOBAL_I18N_SR000IFGNH_0010
    *@tc.name     :HolidayManager-input.ics file
    *@tc.desc     :HolidayManager
    *@tc.size     :MEDIUM
    *@tc.type     :Function
    *@tc.level    :Level 0
    */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0010', 0, function(done){
        try{
          let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
          console.log('SUB_GLOBAL_I18N_SR000IFGNH_0010' + holidayManager);
        }catch(e){
          expect(e.code==null).assertTrue();
          console.log('SUB_GLOBAL_I18N_SR000IFGNH_0010_errorCode'+e.code);
          console.log('SUB_GLOBAL_I18N_SR000IFGNH_0010_errorMessage'+e.message);
        }
        done();
    })

    console.log('*************end CalendarInI18nTest*************');
})}
