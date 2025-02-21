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
import intl from '@ohos.intl'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function I18nTest() {
describe('I18nTest', function () {
    console.log('*************start I18NTest*************');

    let hour = I18n.is24HourClock();
    console.log('init 24 hour clock value ' + hour);

    /* *
    * execute this step before all testcases
    */
    beforeAll(function(){
        console.log('step before all cases in I18n.'
        + ' 24hour: ' + I18n.is24HourClock()
        + ' syslocale: ' + I18n.getSystemLocale());
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
        + ' 24hour: ' + I18n.is24HourClock()
        + ' syslocale: ' + I18n.getSystemLocale());
    })
    
    /* *
    * @tc.number  TEST_GETDISPLAYCOUNTRY_001
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and true param
    * @tc.desc    check the display country
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayCountry001', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', true);
        console.log('testGetDisplayCountry001 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  TEST_GETDISPLAYCOUNTRY_002
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and undefined param
    * @tc.desc    check the display country
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayCountry002', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', undefined);
        console.log('testGetDisplayCountry002 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  TEST_GETDISPLAYCOUNTRY_003
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and null param
    * @tc.desc    check the display country
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayCountry003', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', null);
        console.log('testGetDisplayCountry003 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  TEST_GETDISPLAYCOUNTRY_004
    * @tc.name    getDisplayCountry with zh and en-US and true param
    * @tc.desc    check the display country
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayCountry004', 0, function () {
        try{
            //@ts-ignore
            let value = I18n.System.getDisplayCountry('zh', 'en-US', true);
            console.log('testGetDisplayCountry004 ' + value);
            expect(value).assertEqual('');
        }catch(e){
            console.log('testGetDisplayCountry004 ' + e.code);
            console.log('testGetDisplayCountry004 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Param value not valid');
        }
    })

    /* *
    * @tc.number  TEST_GETDISPLAYCOUNTRY_005
    * @tc.name    getDisplayCountry with zh-CN and en-US and true param
    * @tc.desc    check the display country
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayCountry005', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-CN', 'en-US', true);
        console.log('testGetDisplayCountry005 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  TEST_GETDISPLAYCOUNTRY_006
    * @tc.name    getDisplayCountry with zh-Hans and en-US and true param
    * @tc.desc    check the display country
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayCountry006', 0, function () {
        try{
            //@ts-ignore
            let value = I18n.System.getDisplayCountry('zh-Hans', 'en-US', true);
            console.log('testGetDisplayCountry006 ' + value);
            expect(value).assertEqual('');
        }catch(e){
            console.log('testGetDisplayCountry006 ' + e.code);
            console.log('testGetDisplayCountry006 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Param value not valid');
        }
    })

    /* *
    * @tc.number  TEST_GETDISPLAYCOUNTRY_007
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and false param
    * @tc.desc    check the display country
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayCountry007', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', false);
        console.log('testGetDisplayCountry007 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  TEST_GETDISPLAYCOUNTRY_008
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayCountry008', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US');
        console.log('testGetDisplayCountry008 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  TEST_GETDISPLAYCOUNTRY_009
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayCountry009', 0, function () {
        try{
            //@ts-ignore
            let value = I18n.System.getDisplayCountry('zh-Hans-CN');
            console.log('testGetDisplayCountry009 ' + value);
            expect(value).assertEqual('China');
        }catch(e){
            console.log('testGetDisplayCountry009 ' + e.code);
            console.log('testGetDisplayCountry009 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Check param failed');
        }
    })

    /* *
    * @tc.number  TEST_GETDISPLAYCOUNTRY_010
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayCountry010', 0, function () {
        try{
            //@ts-ignore
            let value = I18n.System.getDisplayCountry('zh-Hans-CN', 12345);
            console.log('testGetDisplayCountry010 ' + value);
            expect(value).assertEqual('China');
        }catch(e){
            console.log('testGetDisplayCountry010 ' + e.code);
            console.log('testGetDisplayCountry010 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Param value not valid');
        }
    })

     /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_001
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and true param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage001', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', true);
        console.log('testGetDisplayLanguage001 ' + value);
        expect(['Chinese', 'Simplified Chinese'].indexOf(value) != -1).assertTrue();
    })

    /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_002
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and undefined param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage002', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', undefined);
        console.log('testGetDisplayLanguage002 ' + value);
        expect(['Chinese', 'Simplified Chinese'].indexOf(value) != -1).assertTrue();
    })

    /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_003
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and null param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage003', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', null);
        console.log('testGetDisplayLanguage003 ' + value);
        expect(['Chinese', 'Simplified Chinese'].indexOf(value) != -1).assertTrue();
    })

    /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_004
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-GB and true param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage004', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-GB', true);
        console.log('testGetDisplayLanguage004 ' + value);
        expect(['Chinese', 'Simplified Chinese'].indexOf(value) != -1).assertTrue();
    })

    /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_005
    * @tc.name    getDisplayLanguage with zh and en-US and true param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage005', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh', 'en-US', true);
        console.log('testGetDisplayLanguage005 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_006
    * @tc.name    getDisplayLanguage with zh-CN and en-US and true param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage006', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-CN', 'en-US', true);
        console.log('testGetDisplayLanguage006 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_007
    * @tc.name    getDisplayLanguage with zh-Hans and en-US and true param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage007', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans', 'en-US', true);
        console.log('testGetDisplayLanguage007 ' + value);
        expect(['Chinese', 'Simplified Chinese'].indexOf(value) != -1).assertTrue();
    })

    /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_008
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage008', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', false);
        console.log('testGetDisplayLanguage008 ' + value);
        expect(['Chinese', 'Simplified Chinese'].indexOf(value) != -1).assertTrue();
    })

    /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_009
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage009', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US');
        console.log('testGetDisplayLanguage009 ' + value);
        expect(['Chinese', 'Simplified Chinese'].indexOf(value) != -1).assertTrue();
    })

    /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_010
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage010', 0, function () {
        try{
            //@ts-ignore
            let value = I18n.System.getDisplayLanguage('zh-Hans-CN');
            console.log('testGetDisplayLanguage010 ' + value);
            expect(value).assertEqual('Simplified Chinese');
        }catch(e){
            console.log('testGetDisplayLanguage010 ' + e.code);
            console.log('testGetDisplayLanguage010 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Check param failed');
        }
    })

    /* *
    * @tc.number  TEST_GETDISPLAYLANGUAGE_011
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDisplayLanguage011', 0, function () {
        try{
            //@ts-ignore
            let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 12345);
            console.log('testGetDisplayLanguage011 ' + value);
            expect(value).assertEqual('Simplified Chinese');
        }catch(e){
            console.log('testGetDisplayLanguage011 ' + e.code);
            console.log('testGetDisplayLanguage011 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Param value not valid');
        }
    })


     /* *
    * @tc.number  TEST_SYSTEMLANGUAGE_001
    * @tc.name    getSystemLanguage
    * @tc.desc    check the getSystemLanguage
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSystemLanguage001', 0, function () {
        let lang = I18n.System.getSystemLanguage();
        console.log('testSystemLanguage001 ' + lang);
        expect(lang).assertInstanceOf('String');
    })

    
    /* *
    * @tc.number  TEST_GETSYSTEMREGION_001
    * @tc.name    getSystemRegion
    * @tc.desc    check the getSystemRegion
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetSystemRegion001', 0, function () {
        let region = I18n.System.getSystemRegion();
        console.log(' testGetSystemRegion001 ' + region);
        expect(region).assertInstanceOf('String');
    })


    /* *
    * @tc.number  TEST_GETSYSTEMLOCALE_001
    * @tc.name    getSystemLocale
    * @tc.desc    check the getSystemLocale
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it(' testGetSystemLocale001', 0, function () {
        let locale = I18n.System.getSystemLocale();
        console.log(' testGetSystemLocale001 ' + locale);
        expect(locale).assertInstanceOf('String');
    })


    /* *
    * @tc.number  TEST_IS24HOURCLOCK_001
    * @tc.name    is24HourClock
    * @tc.desc    check the value of is24HourClock method
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIs24HourClock001', 0, function () {
        let value = I18n.System.is24HourClock();
        console.log('testIs24HourClock001 ' + value);
        expect(value != null).assertTrue
    })


     /* *
    * @tc.number  TEST_GETDATEORDER_001
    * @tc.name    test getDateOrder method with en param
    * @tc.desc    get the DateOrder value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDateOrder001', 0, function () {
        console.log('testGetDateOrder001 ' + 'start');
        let value = I18n.I18NUtil.getDateOrder('en');
        console.log('testGetDateOrder001 ' + value);
        expect(value).assertEqual('LLL-d-y');
    })

    /* *
    * @tc.number  TEST_GETDATEORDER_002
    * @tc.name    test getDateOrder method with th param
    * @tc.desc    get the DateOrder value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDateOrder002', 0, function () {
        console.log('testGetDateOrder002 ' + 'start');
        let value = I18n.I18NUtil.getDateOrder('th');
        console.log('testGetDateOrder002 ' + value);
        expect(['d-LLL-y', 'LLL-d-y','y-L-d'].indexOf(value) != -1).assertTrue();
    })

    /* *
    * @tc.number  TEST_GETDATEORDER_003
    * @tc.name    test getDateOrder method with jp param
    * @tc.desc    get the DateOrder value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetDateOrder003', 0, function () {
        console.log('testGetDateOrder003 ' + 'start');
        let value = I18n.I18NUtil.getDateOrder('jp');
        console.log('testGetDateOrder003 ' + value);
        expect(['LLL-d-y', 'y-L-d'].indexOf(value) != -1).assertTrue();
    })

    /**
    * @tc.number  TEST_GETCALENDAR_001
    * @tc.name    test getCalendar interface
    * @tc.desc    get the getCalendar value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
     it(' testGetCalendar001', 0, function () {
        console.log(' testGetCalendar001 ' + 'start');
        let calendar = I18n.getCalendar('ja', 'japanese');
        expect(calendar != null).assertTrue();
    })

   /**
    * @tc.number  TEST_SETTIME_001
    * @tc.name    test setTime interface with date param
    * @tc.desc    get the setTime value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSetTime001', 0, function () {
        console.log('testSetTime001 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        //actuall month is 9
        let date1 = new Date(2021, 8, 8, 8, 8, 8, 8);
        calendar.setTime(date1);
        let value = calendar.isWeekend();
        console.log('testSetTime001 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  TEST_SETTIME_002
    * @tc.name    test setTime interface with wrong month param
    * @tc.desc    get the setTime value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSetTime002', 0, function () {
        console.log('testSetTime002 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let date1 = new Date(2021, 18, 8, 8, 8, 8, 8);
        calendar.setTime(date1);
        let value = calendar.isWeekend();
        console.log('testSetTime002 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  TEST_SETTIME_003
    * @tc.name    test setTime interface
    * @tc.desc    get the setTime value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSetTime003', 0, function () {
        console.log('testSetTime003 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTime(10540800000);
        let value = calendar.isWeekend();
        console.log('testSetTime003 ' + value);
        expect(value).assertTrue();
    })

   
    /**
    * @tc.number  TEST_SET_001
    * @tc.name    test set interface
    * @tc.desc    get the set value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSet001', 0, function () {
        console.log('testSet001 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.set(2021, 11, 11);
        let value = calendar.isWeekend();
        console.log('testSet001 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  TEST_SET_002
    * @tc.name    test set interface with hour,minute,second param
    * @tc.desc    get the set value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSet002', 0, function () {
        console.log('testSet002 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.set(2021, 11, 11, 10, 10, 10);
        let value = calendar.isWeekend();
        console.log('testSet002 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  TEST_SET_003
    * @tc.name    test set interface with hour,minute param
    * @tc.desc    get the set value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSet003', 0, function () {
        console.log('testSet003 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.set(2021, 11, 11, 10, 10);
        let value = calendar.isWeekend();
        console.log('testSet003 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  TEST_SETTIMEZONEANDGETTIMEZONE_001
    * @tc.name    test setTimeZone and getTimeZone interface
    * @tc.desc    get the setTimeZone and getTimeZone value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSetTimeZoneAndGetTimeZone001', 0, function () {
        console.log('testSetTimeZoneAndGetTimeZone001 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTimeZone('Asia/Shanghai');
        let value = calendar.getTimeZone();
        console.log('testSetTimeZoneAndGetTimeZone001 ' + value);
        expect(value).assertEqual('Asia/Shanghai')
    })

    /**
    * @tc.number  TEST_SETTIMEZONEANDGETTIMEZONE_002
    * @tc.name    test setTimeZone with AAA param and getTimeZone interface
    * @tc.desc    get the setTimeZone and getTimeZone value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSetTimeZoneAndGetTimeZone002', 0, function () {
        console.log('testSetTimeZoneAndGetTimeZone002 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTimeZone('AAA');
        let value = calendar.getTimeZone();
        console.log('testSetTimeZoneAndGetTimeZone002 ' + value);
        expect(value).assertEqual('Etc/Unknown')
    })


    /**
    * @tc.number  TEST_GETFIRSTDAYOFWEEKANDSETFIRSTDAYOFWEEK_001
    * @tc.name    test setFirstDayOfWeek and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetFirstDayOfWeekAndSetFirstDayOfWeek001', 0, function () {
        console.log('testGetFirstDayOfWeekAndSetFirstDayOfWeek001 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(1);
        let value = calendar.getFirstDayOfWeek();
        console.log('testGetFirstDayOfWeekAndSetFirstDayOfWeek001 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  TEST_GETFIRSTDAYOFWEEKANDSETFIRSTDAYOFWEEK_002
    * @tc.name    test setFirstDayOfWeek with 0 param and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetFirstDayOfWeekAndSetFirstDayOfWeek002', 0, function () {
        console.log('testGetFirstDayOfWeekAndSetFirstDayOfWeek002 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(0);
        let value = calendar.getFirstDayOfWeek();
        console.log('testGetFirstDayOfWeekAndSetFirstDayOfWeek002 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  TEST_GETFIRSTDAYOFWEEKANDSETFIRSTDAYOFWEEK_003
    * @tc.name    test setFirstDayOfWeek with 7 param and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetFirstDayOfWeekAndSetFirstDayOfWeek003', 0, function () {
        console.log('testGetFirstDayOfWeekAndSetFirstDayOfWeek003 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(7);
        let value = calendar.getFirstDayOfWeek();
        console.log('testGetFirstDayOfWeekAndSetFirstDayOfWeek003 ' + value);
        expect(value).assertEqual(7);
    })

    /**
    * @tc.number  TEST_GETFIRSTDAYOFWEEKANDSETFIRSTDAYOFWEEK_004
    * @tc.name    test setFirstDayOfWeek with 8 param and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetFirstDayOfWeekAndSetFirstDayOfWeek004', 0, function () {
        console.log('testGetFirstDayOfWeekAndSetFirstDayOfWeek004 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(8);
        let value = calendar.getFirstDayOfWeek();
        console.log('testGetFirstDayOfWeekAndSetFirstDayOfWeek004 ' + value);
        expect(value).assertEqual(1);
    })

     /**
    * @tc.number  TEST_SET_MINIMALDAYS_IN_FIRST_WEEK_AND_GET_MINIMALDAYS_IN_FIRST_WEEK_001
    * @tc.name    test setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek001', 0, function () {
        console.log('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek001 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(1);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek001 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  TEST_SET_MINIMALDAYS_IN_FIRST_WEEK_AND_GET_MINIMALDAYS_IN_FIRST_WEEK_002
    * @tc.name    test setMinimalDaysInFirstWeek with 0 param and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek002', 0, function () {
        console.log('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek002 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(0);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek002 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  TEST_SET_MINIMALDAYS_IN_FIRST_WEEK_AND_GET_MINIMALDAYS_IN_FIRST_WEEK_003
    * @tc.name    test setMinimalDaysInFirstWeek with 8 param and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek003', 0, function () {
        console.log('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek003 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(8);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek003 ' + value);
        expect(value).assertEqual(7);
    })

    /**
    * @tc.number  TEST_SET_MINIMALDAYS_IN_FIRST_WEEK_AND_GET_MINIMALDAYS_IN_FIRST_WEEK_004
    * @tc.name    test setMinimalDaysInFirstWeek with 7 param and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek004', 0, function () {
        console.log('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek004 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(7);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('testSetMinimalDaysInFirstWeekAndGetMinimalDaysInFirstWeek004 ' + value);
        expect(value).assertEqual(7);
    })


     /**
    * @tc.number  TEST_GET_001
    * @tc.name    test get interface
    * @tc.desc    get the get value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGet001', 0, function () {
        console.log('testGet001 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.get('year');
        console.log('testGet001 ' + value);
        expect(value).assertLarger(0);
    })

    /**
    * @tc.number  TEST_GET_002
    * @tc.name    test get interface with month param
    * @tc.desc    get the get value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
     it('testGet002', 0, function () {
        console.log('testGet002 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let date1 = new Date(2021, 8, 8, 8, 8, 8, 8);
        calendar.setTime(date1);
        let value = calendar.get('month');
        console.log('testGet002 ' + value);
        expect(value).assertEqual(8);
    })

    /**
    * @tc.number  TEST_GET_003
    * @tc.name    test get interface with day_of_year param
    * @tc.desc    get the get value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGet003', 0, function () {
        console.log('testGet003 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.get('day_of_year');
        console.log('testGet003 ' + value);
        expect(value).assertLarger(0);
    })

    /**
    * @tc.number  TEST_IS_WEEKEND_001
    * @tc.name    test isWeekend interface
    * @tc.desc    get the isWeekend value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsWeekend001', 0, function () {
        console.log('testIsWeekend001 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.isWeekend(new Date(2021, 10, 1, 10, 0, 0, 0));
        console.log('testIsWeekend001 ' + value);
        expect(value).assertFalse();
    })


     /**
    * @tc.number  TEST_I18N.ISRTL_001
    * @tc.name    test isRTL interface with zh-CN param
    * @tc.desc    get the isRTL value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testI18n.IsRTL001', 0, function () {
        console.log('testI18n.IsRTL001 ' + 'start');
        let value = I18n.isRTL('zh-CN');
        console.log('testI18n.IsRTL001 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  TEST_I18N.ISRTL_002
    * @tc.name    test isRTL interface with en-US param
    * @tc.desc    get the isRTL value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testI18n.IsRTL002', 0, function () {
        console.log('testI18n.IsRTL002 ' + 'start');
        let value = I18n.isRTL('en-US');
        console.log('testI18n.IsRTL002 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  TEST_I18N.ISRTL_003
    * @tc.name    test isRTL interface with ar param
    * @tc.desc    get the isRTL value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testI18n.IsRTL003', 0, function () {
        console.log('testI18n.IsRTL003 ' + 'start');
        let value = I18n.isRTL('ar');
        console.log('testI18n.IsRTL003 ' + value);
        expect(value).assertTrue();
    })

      /* *
    * @tc.number  TEST_IS_DIGIT_001
    * @tc.name    test isDigit interface
    * @tc.desc    check the isDigit interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsDigit001', 0, function () {
        console.log('testIsDigit001 ' + 'start');
        let value = I18n.Unicode.isDigit('abc');
        console.log('testIsDigit001 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_IS_DIGIT_002
    * @tc.name    test isDigit interface with 123 param
    * @tc.desc    check the isDigit interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsDigit002', 0, function () {
        console.log('testIsDigit002 ' + 'start');
        let value = I18n.Unicode.isDigit('123');
        console.log('testIsDigit002 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  TEST_IS_DIGIT_003
    * @tc.name    test isDigit interface with 123abc param
    * @tc.desc    check the isDigit interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsDigit003', 0, function () {
        console.log('testIsDigit003 ' + 'start');
        let value = I18n.Unicode.isDigit('123abc');
        console.log('testIsDigit003 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  TEST_IS_DIGIT_004
    * @tc.name    test isDigit interface with abc123 param
    * @tc.desc    check the isDigit interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsDigit004', 0, function () {
        console.log('testIsDigit004 ' + 'start');
        let value = I18n.Unicode.isDigit('abc123');
        console.log('testIsDigit004 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_IS_DIGIT_005
    * @tc.name    test isDigit interface with null param
    * @tc.desc    check the isDigit interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsDigit005', 0, function () {
        console.log('testIsDigit005 ' + 'start');
        let value = I18n.Unicode.isDigit('');
        console.log('testIsDigit005 ' + value);
        expect(value).assertFalse();
    })


    /* *
    * @tc.number  TEST_IS_SPACE_CHAR_001
    * @tc.name    test isSpaceChar interface with abc param
    * @tc.desc    check the isSpaceChar interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsSpaceChar001', 0, function () {
        console.log('testIsSpaceChar001 ' + 'start');
        let value = I18n.Unicode.isSpaceChar('abc');
        console.log('testIsSpaceChar001 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_IS_SPACE_CHAR_002
    * @tc.name    test isSpaceChar interface with one space param
    * @tc.desc    check the isSpaceChar interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsSpaceChar002', 0, function () {
        console.log('testIsSpaceChar002 ' + 'start');
        let value = I18n.Unicode.isSpaceChar(' ');
        console.log('testIsSpaceChar002 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  TEST_IS_SPACE_CHAR_003
    * @tc.name    test isSpaceChar interface with multi space param
    * @tc.desc    check the isSpaceChar interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsSpaceChar003', 0, function () {
        console.log('testIsSpaceChar003 ' + 'start');
        let value = I18n.Unicode.isSpaceChar('   ');
        console.log('testIsSpaceChar003--' + value + '--');
        expect(value).assertTrue();
    })


    /* *
    * @tc.number  TEST_IS_WHITESPACE_001
    * @tc.name    test isWhitespace interface with abc param
    * @tc.desc    check the isWhitespace interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsWhitespace001', 0, function () {
        console.log('testIsWhitespace001 ' + 'start');
        let value = I18n.Unicode.isWhitespace('abc');
        console.log('testIsWhitespace001 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_IS_WHITESPACE_002
    * @tc.name    test isWhitespace interface with \u0009 param
    * @tc.desc    check the isWhitespace interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsWhitespace002', 0, function () {
        console.log('testIsWhitespace002 ' + 'start');
        let value = I18n.Unicode.isWhitespace('\u0009');
        console.log('testIsWhitespace002--' + value + '--');
        expect(value).assertTrue();
    })


    /* *
    * @tc.number  TEST_I18N.UNICODE.ISRTL_001
    * @tc.name    test isRTL interface with abc param
    * @tc.desc    check the isRTL interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testI18n.Unicode.IsRTL001', 0, function () {
        console.log('testI18n.Unicode.IsRTL001 ' + 'start');
        let value = I18n.Unicode.isRTL('abc');
        console.log('testI18n.Unicode.IsRTL001 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_I18N.UNICODE.ISRTL_002
    * @tc.name    test isRTL interface with ١٢٣٤٥٦٧ param
    * @tc.desc    check the isRTL interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testI18n.Unicode.IsRTL002', 0, function () {
        console.log('testI18n.Unicode.IsRTL002 ' + 'start');
        let value = I18n.Unicode.isRTL('١٢٣٤٥٦٧');
        console.log('testI18n.Unicode.IsRTL002 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_I18N.UNICODE.ISRTL_003
    * @tc.name    test isRTL interface with 我是小明 param
    * @tc.desc    check the isRTL interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testI18n.Unicode.IsRTL003', 0, function () {
        console.log('testI18n.Unicode.IsRTL003 ' + 'start');
        let value = I18n.Unicode.isRTL('我是小明');
        console.log('testI18n.Unicode.IsRTL003 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_I18N.UNICODE.ISRTL_004
    * @tc.name    test isRTL interface with نحن param
    * @tc.desc    check the isRTL interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testI18n.Unicode.IsRTL004', 0, function () {
        console.log('testI18n.Unicode.IsRTL004 ' + 'start');
        let value = I18n.Unicode.isRTL('نحن');
        console.log('testI18n.Unicode.IsRTL004 ' + value);
        expect(value).assertTrue();
    })

      /* *
    * @tc.number  TEST_IS_IDEOGRAPH_001
    * @tc.name    test isIdeograph interface with abc param
    * @tc.desc    check the isIdeograph interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsIdeograph001', 0, function () {
        console.log('testIsIdeograph001 ' + 'start');
        let value = I18n.Unicode.isIdeograph('abc');
        console.log('testIsIdeograph001 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_IS_IDEOGRAPH_002
    * @tc.name    test isIdeograph interface with '我' param
    * @tc.desc    check the isIdeograph interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsIdeograph002', 0, function () {
        console.log('testIsIdeograph002 ' + 'start');
        let value = I18n.Unicode.isIdeograph('我');
        console.log('testIsIdeograph002 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  TEST_IS_IDEOGRAPH_003
    * @tc.name    test isIdeograph interface with '우리' param
    * @tc.desc    check the isIdeograph interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsIdeograph003', 0, function () {
        console.log('testIsIdeograph003 ' + 'start');
        let value = I18n.Unicode.isIdeograph('우리');
        console.log('testIsIdeograph003 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_IS_IDEOGRAPH_004
    * @tc.name    test isIdeograph interface with '私た' param
    * @tc.desc    check the isIdeograph interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsIdeograph004', 0, function () {
        console.log('testIsIdeograph004 ' + 'start');
        let value = I18n.Unicode.isIdeograph('私たち');
        console.log('testIsIdeograph004 ' + value);
        expect(value).assertTrue();
    })

     /* *
    * @tc.number  TEST_IS_LETTER_001
    * @tc.name    test isLetter interface with abc param
    * @tc.desc    check the isLetter interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsLetter001', 0, function () {
        console.log('testIsLetter001 ' + 'start');
        let value = I18n.Unicode.isLetter('abc');
        console.log('testIsLetter001 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  TEST_IS_LETTER_002
    * @tc.name    test isLetter interface with 123 param
    * @tc.desc    check the isLetter interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsLetter002', 0, function () {
        console.log('testIsLetter002 ' + 'start');
        let value = I18n.Unicode.isLetter('123');
        console.log('testIsLetter002 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_IS_LETTER_003
    * @tc.name   test isLetter interface with abc123 param
    * @tc.desc    check the isLetter interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsLetter003', 0, function () {
        console.log('testIsLetter003 ' + 'start');
        let value = I18n.Unicode.isLetter('abc123');
        console.log('testIsLetter003 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  TEST_IS_LETTER_004
    * @tc.name    test isLetter interface with 123abc param
    * @tc.desc    check the isLetter interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsLetter004', 0, function () {
        console.log('testIsLetter004 ' + 'start');
        let value = I18n.Unicode.isLetter('123abc');
        console.log('testIsLetter004 ' + value);
        expect(value).assertFalse();
    })


     /* *
    * @tc.number  TEST_IS_LOWER_CASE_001
    * @tc.name    test isLowerCase interface with abc param
    * @tc.desc    check the isLowerCase interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsLowerCase001', 0, function () {
        console.log('testIsLowerCase001 ' + 'start');
        let value = I18n.Unicode.isLowerCase('abc');
        console.log('testIsLowerCase001 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  TEST_IS_LOWER_CASE_002
    * @tc.name    ftest isLowerCase interface with ABC param
    * @tc.desc    check the isLowerCase interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsLowerCase002', 0, function () {
        console.log('testIsLowerCase002 ' + 'start');
        let value = I18n.Unicode.isLowerCase('ABC');
        console.log('testIsLowerCase002 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_IS_LOWER_CASE_003
    * @tc.name    test isLowerCase interface with abcDEF param
    * @tc.desc    check the isLowerCase interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsLowerCase003', 0, function () {
        console.log('testIsLowerCase003 ' + 'start');
        let value = I18n.Unicode.isLowerCase('abcDEF');
        console.log('testIsLowerCase003 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  TEST_IS_LOWER_CASE_004
    * @tc.name    test isLowerCase interface with ABCdef param
    * @tc.desc    check the isLowerCase interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsLowerCase004', 0, function () {
        console.log('testIsLowerCase004 ' + 'start');
        let value = I18n.Unicode.isLowerCase('ABCdef');
        console.log('testIsLowerCase004 ' + value);
        expect(value).assertFalse();
    })


    /* *
    * @tc.number  TEST_IS_UPPER_CASE_001
    * @tc.name    test isUpperCase interface with ABC param
    * @tc.desc    check the isUpperCase interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsUpperCase001', 0, function () {
        console.log('testIsUpperCase001 ' + 'start');
        let value = I18n.Unicode.isUpperCase('ABC');
        console.log('testIsUpperCase001 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  TEST_IS_UPPER_CASE_002
    * @tc.name    test isUpperCase interface with abc param
    * @tc.desc    check the isUpperCase interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsUpperCase002', 0, function () {
        console.log('testIsUpperCase002 ' + 'start');
        let value = I18n.Unicode.isUpperCase('abc');
        console.log('testIsUpperCase002 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  TEST_IS_UPPER_CASE_003
    * @tc.name    test isUpperCase interface with ABCdef param
    * @tc.desc    check the isUpperCase interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsUpperCase003', 0, function () {
        console.log('testIsUpperCase003 ' + 'start');
        let value = I18n.Unicode.isUpperCase('ABCdef');
        console.log('testIsUpperCase003 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  TEST_IS_UPPER_CASE_004
    * @tc.name    test isUpperCase interface with abcDEF param
    * @tc.desc    check the isUpperCase interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testIsUpperCase004', 0, function () {
        console.log('testIsUpperCase004 ' + 'start');
        let value = I18n.Unicode.isUpperCase('abcDEF');
        console.log('testIsUpperCase004 ' + value);
        expect(value).assertFalse();
    })

     /* *
    * @tc.number  TEST_GET_TYPE_001
    * @tc.name    test getType interface with a param
    * @tc.desc    check the getType interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetType001', 0, function () {
        console.log('testGetType001 ' + 'start');
        let value = I18n.Unicode.getType('a');
        console.log('testGetType001 ' + value);
        expect(value).assertEqual('U_LOWERCASE_LETTER');
    })

    /* *
    * @tc.number  TEST_GET_TYPE_002
    * @tc.name    ftest getType interface with ABC param
    * @tc.desc    check the getType interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetType002', 0, function () {
        console.log('testGetType002 ' + 'start');
        let value = I18n.Unicode.getType('ABC');
        console.log('testGetType002 ' + value);
        expect(value).assertEqual('U_UPPERCASE_LETTER');
    })

    /* *
    * @tc.number  TEST_GET_TYPE_003
    * @tc.name    test getType interface with ABCdef param
    * @tc.desc    check the getType interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetType003', 0, function () {
        console.log('testGetType003 ' + 'start');
        let value = I18n.Unicode.getType('ABCdef');
        console.log('testGetType003 ' + value);
        expect(value).assertEqual('U_UPPERCASE_LETTER');
    })

    /* *
    * @tc.number  TEST_GET_TYPE_004
    * @tc.name    test getType interface with 123 param
    * @tc.desc    check the getType interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetType004', 0, function () {
        console.log('testGetType004 ' + 'start');
        let value = I18n.Unicode.getType('123');
        console.log('testGetType004 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  TEST_GET_TYPE_005
    * @tc.name    test getType interface with 123abc param
    * @tc.desc    check the getType interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetType005', 0, function () {
        console.log('testGetType005 ' + 'start');
        let value = I18n.Unicode.getType('123abc');
        console.log('testGetType005 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  TEST_GET_TYPE_006
    * @tc.name    test getType interface with ١٢٣٤٥٦٧ param
    * @tc.desc    check the getType interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetType006', 0, function () {
        console.log('testGetType006 ' + 'start');
        let value = I18n.Unicode.getType('١٢٣٤٥٦٧');
        console.log('testGetType006 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  TEST_GET_TYPE_007
    * @tc.name    test getType interface with multi space param
    * @tc.desc    check the getType interface
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetType007', 0, function () {
        console.log('testGetType007 ' + 'start');
        let value = I18n.Unicode.getType('   ');
        console.log('testGetType007 ' + value);
        expect(value).assertEqual('U_SPACE_SEPARATOR');
    })


    /* *
    * @tc.number  TEST_GET_TIME_ZONE_001
    * @tc.name    test getTimeZone method
    * @tc.desc    get the getTimeZone value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetTimeZone001', 0, function () {
        console.log('testGetTimeZone001 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getID();
        console.log('testGetTimeZone001 ' + value);
        expect(value.length > 0).assertTrue();
    })


    /* *
    * @tc.number  TEST_GET_ID_001
    * @tc.name    test getID
    * @tc.desc    get the getID value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetID001', 0, function () {
        console.log('testGetID001 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getID();
        console.log('testGetID001 ' + value);
        expect(value).assertEqual('ACT');
    })


    /* *
    * @tc.number  TEST_GET_RAW_OFF_SET_001
    * @tc.name    test getRawOffset method
    * @tc.desc    get the getRawOffset value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetRawOffSet001', 0, function () {
        console.log('testGetRawOffSet001 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getRawOffset();
        console.log('testGetRawOffSet001 ' + value);
        expect(value >= 0).assertEqual(true);
    })


    /* *
    * @tc.number  TEST_GET_OFF_SET_001
    * @tc.name    test getOffset method
    * @tc.desc    get the getOffset value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetOffSet001', 0, function () {
        console.log('testGetOffSet001 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getOffset();
        console.log('testGetOffSet001 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /* *
    * @tc.number  TEST_GET_OFF_SET_002
    * @tc.name    test getOffset method with date param
    * @tc.desc    get the getOffset value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetOffSet002', 0, function () {
        console.log('testGetOffSet002 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getOffset(10540800000);
        console.log('testGetOffSet002 ' + value);
        expect(value >= 0).assertEqual(true);
    })


    /* *
    * @tc.number  TEST_GET_OFF_SET_003
    * @tc.name    test getOffset method with timezone id
    * @tc.desc    get the getOffset value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetOffSet003', 0, function () {
        console.log('testGetOffSet003 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getOffset();
        console.log('testGetOffSet003 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /* *
    * @tc.number  TEST_GET_OFF_SET_004
    * @tc.name    test getOffset method with date and timezone id param
    * @tc.desc    get the getOffset value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetOffSet004', 0, function () {
        console.log('testGetOffSet004 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getOffset(10540800000);
        console.log('testGetOffSet004 ' + value);
        expect(value > 0).assertEqual(true);
    })


    /* *
    * @tc.number TEST_GET_AVAILABLE_IDS_001
    * @tc.name   test getAvailableIDs method
    * @tc.desc   get the getAvailableIDs value
    * @tc.size    MediumTest
    * @tc.type    Method
    * @tc.level   Level 2
    */
    it('testGetAvailableIDs001', 0, function () {
        console.log('testGetAvailableIDs001 ' + 'start');
        let value = I18n.TimeZone.getAvailableIDs();
        console.log('testGetAvailableIDs001 ' + value);
        expect(value.length != null).assertEqual(true);
    })
    })
    }










