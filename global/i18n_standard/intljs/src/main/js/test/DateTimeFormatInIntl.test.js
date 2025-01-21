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
import Intl from '@ohos.intl'
import deviceInfo from '@ohos.deviceInfo'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function DateTimeFormatInIntlTest() {
describe('DateTimeFormatInIntlTest', function () {
    console.log('*************start DateTimeFormatInIntlTest*************');

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

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0100
    * @tc.name    format the datetime with en-GB locale
    * @tc.desc    check the datetime is not null
    */
    it('dateTimeFormat_test_0100', 0, function () {
        let datefmt = new Intl.DateTimeFormat('en-GB');
        expect(datefmt !== null).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0120
    * @tc.name    format the datetime with en-GB locale
    * @tc.desc    check the datetime is not null
    */
    it('dateTimeFormat_test_0120', 0, function () {
        let datefmt = new Intl.DateTimeFormat();
        expect(datefmt !== null).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0200
    * @tc.name    format the date with zh locale
    * @tc.desc    check the date
    */
    it('dateTimeFormat_test_0200', 0, function () {
        let date = new Date(2021, 11, 17, 3, 24, 0);
        let datefmt = new Intl.DateTimeFormat('zh');
        console.log('dateTimeFormat_test_0200 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertContain('2021');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0220
    * @tc.name    format the date with zh locale and undefined options
    * @tc.desc    check the date
    */
    it('dateTimeFormat_test_0220', 0, function () {
        let date = new Date(2021, 11, 17, 3, 24, 0);
        let datefmt = new Intl.DateTimeFormat('zh', undefined);
        console.log('dateTimeFormat_test_0220 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertContain('2021');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0240
    * @tc.name    format the date with zh locale and null options
    * @tc.desc    check the date
    */
    it('dateTimeFormat_test_0240', 0, function () {
        let date = new Date(2021, 11, 17, 3, 24, 0);
        let datefmt = new Intl.DateTimeFormat('zh', null);
        console.log('dateTimeFormat_test_0240 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertContain('2021');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0300
    * @tc.name    format the date with en locale
    * @tc.desc    check the date
    */
    it('dateTimeFormat_test_0300', 0, function () {
        let date = new Date(2021, 11, 17, 3, 24, 0);
        let datefmt = new Intl.DateTimeFormat('en');
        console.log('dateTimeFormat_test_0300 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertContain('21');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0310
    * @tc.name    format the date with en-US locale
    * @tc.desc    check the date
    */
    it('dateTimeFormat_test_0310', 0, function () {
        let date = new Date(2021, 11, 17, 3, 24, 0);
        let datefmt = new Intl.DateTimeFormat('en-US');
        console.log('dateTimeFormat_test_0310 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertContain('21');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0320
    * @tc.name    format the date with en-GB locale
    * @tc.desc    check the date
    */
    it('dateTimeFormat_test_0320', 0, function () {
        let date = new Date(2021, 11, 17, 3, 24, 0);
        let datefmt = new Intl.DateTimeFormat('en-GB');
        console.log('dateTimeFormat_test_0320 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertContain('2021');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0400
    * @tc.name    format the date with aa locale
    * @tc.desc    check the date
    */
    it('dateTimeFormat_test_0400', 0, function () {
        let date = new Date(2021, 11, 17, 3, 24, 0);
        let datefmt = new Intl.DateTimeFormat('aa');
        let value = datefmt.format(date);
        console.log('dateTimeFormat_test_0400 ' + value);
        expect(value).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0500
    * @tc.name    format the hour with ban and zh locale
    * @tc.desc    check the hour with ban and zh locale
    */
    it('dateTimeFormat_test_0500', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { dateStyle: 'full' };
        let datefmt = new Intl.DateTimeFormat(['ban', 'zh'], option);
        console.log('dateTimeFormat_test_0500 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertEqual('2020年12月20日星期日');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0600
    * @tc.name    format the hour with en and zh locale
    * @tc.desc    check the hour with en and zh locale
    */
    it('dateTimeFormat_test_0600', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { dateStyle: 'full' };
        let datefmt = new Intl.DateTimeFormat(['en', 'zh'], option);
        console.log('dateTimeFormat_test_0600 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertEqual('Sunday, December 20, 2020');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0700
    * @tc.name    format the hour with en and ban locale
    * @tc.desc    check the hour with en and ban locale
    */
    it('dateTimeFormat_test_0700', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { dateStyle: 'full' };
        let datefmt = new Intl.DateTimeFormat(['en', 'ban'], option);
        console.log('dateTimeFormat_test_0700 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertEqual('Sunday, December 20, 2020');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0800
    * @tc.name    format the hour without correct locale
    * @tc.desc    check the hour without correct locale
    */
    it('dateTimeFormat_test_0800', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { dateStyle: 'full' };
        let datefmt = new Intl.DateTimeFormat(['abc', 'ban'], option);
        console.log('dateTimeFormat_test_0800 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertContain('2020');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_0900
    * @tc.name    format the date with full datestyle and mediu timestyle
    * @tc.desc    check the date with full datestyle and mediu timestyle
    */
    it('dateTimeFormat_test_0900', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { dateStyle: 'full', timeStyle: 'full' };
        let datefmt = new Intl.DateTimeFormat('zh-Hans-CN', option);
        console.log('dateTimeFormat_test_0900 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertContain('2020年12月20日星期日');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_1000
    * @tc.name    format the date dateStyle with long style
    * @tc.desc    check the dateStyle with long style
    */
    it('dateTimeFormat_test_1000', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { dateStyle: 'long', timeStyle: 'long' };
        let datefmt = new Intl.DateTimeFormat('zh-CN', option);
        console.log('dateTimeFormat_test_1000 ' + datefmt.resolvedOptions().dateStyle);
        expect(datefmt.resolvedOptions().dateStyle).assertEqual('long');
        expect(datefmt.format(date)).assertContain('2020年12月20日');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_1100
    * @tc.name    format the date dateStyle with medium style
    * @tc.desc    check the dateStyle with medium style
    */
    it('dateTimeFormat_test_1100', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { dateStyle: 'medium', timeStyle: 'medium' };
        let datefmt = new Intl.DateTimeFormat('zh-CN', option);
        console.log('dateTimeFormat_test_1100 ' + datefmt.resolvedOptions().dateStyle);
        expect(datefmt.resolvedOptions().dateStyle).assertEqual('medium');
        expect(datefmt.format(date)).assertContain('2020年12月20日');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_1200
    * @tc.name    format the date dateStyle with short style
    * @tc.desc    check the dateStyle with short style
    */
    it('dateTimeFormat_test_1200', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { dateStyle: 'short', timeStyle: 'short' };
        let datefmt = new Intl.DateTimeFormat('zh-CN', option);
        console.log('dateTimeFormat_test_1200 ' + datefmt.resolvedOptions().dateStyle);
        expect(datefmt.resolvedOptions().dateStyle).assertEqual('short');
        expect(datefmt.format(date)).assertContain('2020/12/20');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_1300
    * @tc.name    format the date with daterange
    * @tc.desc    check the daterange
    */
    it('dateTimeFormat_test_1300', 0, function () {
        let startdate = new Date(2020, 11, 20, 14, 23, 16);
        let enddate = new Date(2020, 11, 21, 14, 23, 16);
        let datefmt = new Intl.DateTimeFormat('en-GB');
        console.log('dateTimeFormat_test_1300 ' + datefmt.formatRange(startdate, enddate));
        let devType = deviceInfo.devicType;
        if (devType == '2in1'){
            expect(datefmt.formatRange(startdate, enddate)).assertEqual('20-21 Dec 2020');
        }else if (devType == 'phone'){
            expect(datefmt.formatRange(startdate, enddate)).assertEqual('20/12/2020 – 21/12/2020');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_1400
    * @tc.name    format the date with daterange when the start and end date is equal
    * @tc.desc    check the daterange when the start and end date is equal
    */
    it('dateTimeFormat_test_1400', 0, function () {
        let startdate = new Date(2020, 11, 20, 14, 23, 16);
        let enddate = new Date(2020, 11, 20, 14, 23, 16);
        let datefmt = new Intl.DateTimeFormat('en-GB');
        console.log('dateTimeFormat_test_1400 ' + datefmt.formatRange(startdate, enddate));
        let devType = deviceInfo.devicType;
        if (devType == '2in1'){
            expect(datefmt.formatRange(startdate, enddate)).assertEqual('20 Dec 2020');
        }else if (devType == 'phone'){
            expect(datefmt.formatRange(startdate, enddate)).assertEqual('20/12/2020');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_1500
    * @tc.name    format the year、month、day、weekday
    * @tc.desc    check the year、month、day、weekday
    */
    it('dateTimeFormat_test_1500', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
        let datefmt = new Intl.DateTimeFormat('ja', option);
        console.log('dateTimeFormat_test_1500 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertEqual('2020年12月20日日曜日');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_1600
    * @tc.name    format the timerange with year、month、day、weekday
    * @tc.desc    check the timerange with year、month、day、weekday
    */
    it('dateTimeFormat_test_1600', 0, function () {
        let startdate = new Date(2020, 11, 20, 14, 23, 16);
        let enddate = new Date(2021, 4, 5, 10, 5, 3);
        let option = { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
        let datefmt = new Intl.DateTimeFormat('en', option);
        console.log('dateTimeFormat_test_1600 ' + datefmt.formatRange(startdate, enddate));
        expect(datefmt.formatRange(startdate, enddate)).assertEqual('Sunday, December 20, 2020 – Wednesday, May 5, 2021');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_1700
    * @tc.name    format the hour&minute&second
    * @tc.desc    check the hour&minute&second
    */
    it('dateTimeFormat_test_1700', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
        let datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        console.log('dateTimeFormat_test_1700 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertContain('公元2020年12月20日星期日');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_1800
    * @tc.name    format the timeZone
    * @tc.desc    check the timeZone
    */
    it('dateTimeFormat_test_1800', 0, function () {
        let date = new Date(2020, 3, 14, 15, 5, 3);
        let option = { timeZone: 'America/Los_Angeles', timeZoneName: 'long' };
        let datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        console.log('dateTimeFormat_test_1800 ' + datefmt.format(date));
        expect(datefmt.format(date).indexOf('北美太平洋夏令时间') !== -1).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_1900
    * @tc.name    format the America/Los_Angeles timeZone
    * @tc.desc    check the America/Los_Angeles timeZone
    */
    it('dateTimeFormat_test_1900', 0, function () {
        let option = { timeZone: 'America/Los_Angeles', timeZoneName: 'long' };
        let datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        console.log('dateTimeFormat_test_1900 ' + datefmt.resolvedOptions().timeZone);
        expect(datefmt.resolvedOptions().timeZone).assertEqual('America/Los_Angeles');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_2000
    * @tc.name    format the America/Los_Angeles timeZoneName
    * @tc.desc    check the America/Los_Angeles timeZoneName
    */
    it('dateTimeFormat_test_2000', 0, function () {
        let option = { timeZone: 'America/Los_Angeles', timeZoneName: 'long' };
        let datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        console.log('dateTimeFormat_test_2000 ' + datefmt.resolvedOptions().timeZoneName);
        expect(datefmt.resolvedOptions().timeZoneName).assertEqual('long');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_2100
    * @tc.name    format the year
    * @tc.desc    check the year
    */
    it('dateTimeFormat_test_2100', 0, function () {
        let option = { year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
        let datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        console.log('dateTimeFormat_test_2100 ' + datefmt.resolvedOptions().year);
        expect(datefmt.resolvedOptions().year).assertEqual('numeric');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_2200
    * @tc.name    format the weekday
    * @tc.desc    check the weekday
    */
    it('dateTimeFormat_test_2200', 0, function () {
        let option = { year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
        let datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        console.log('dateTimeFormat_test_2200 ' + datefmt.resolvedOptions().weekday);
        expect(datefmt.resolvedOptions().weekday).assertEqual('long');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_2300
    * @tc.name    format the hour in zh-CN-u-hc-h12
    * @tc.desc    check the hour in zh-CN-u-hc-h12
    */
    it('dateTimeFormat_test_2300', 0, function () {
        let option = { year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
        let datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        console.log('dateTimeFormat_test_2300 ' + datefmt.resolvedOptions().hour);
        expect(datefmt.resolvedOptions().hour).assertEqual('numeric');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_2400
    * @tc.name    format the hour in fr-Latn-FR-u-nu-mong
    * @tc.desc    check the hour in fr-Latn-FR-u-nu-mong
    */
    it('dateTimeFormat_test_2400', 0, function () {
        let date = new Date(2020, 11, 20, 14, 23, 16);
        let option = { dateStyle: 'full' };
        let datefmt = new Intl.DateTimeFormat('fr-Latn-FR-u-nu-mong', option);
        console.log('dateTimeFormat_test_2400 ' + datefmt.format(date));
        expect(datefmt.format(date)).assertEqual('dimanche ᠒᠐ décembre ᠒᠐᠒᠐');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_DATETIME_2500
    * @tc.name    format the hour in zh-CN-u-hc-h12 with matcher
    * @tc.desc    check the hour in zh-CN-u-hc-h12 with matcher
    */
    it('dateTimeFormat_test_2500', 0, function () {
        let option = { year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short',
            hourCycle: 'h24',numberingSystem: 'arab', hour12: true, dayPeriod: 'short',
            formatMatcher: 'basic', localeMatcher: 'lookup' };
        let datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        expect(datefmt.resolvedOptions().locale).assertEqual('zh-CN');
        expect(datefmt.resolvedOptions().hourCycle).assertEqual('h24');
        expect(datefmt.resolvedOptions().numberingSystem).assertEqual('arab');
        expect(datefmt.resolvedOptions().hour12).assertTrue();
        expect(datefmt.resolvedOptions().era).assertEqual('short');
        expect(datefmt.resolvedOptions().month).assertEqual('long');
        expect(datefmt.resolvedOptions().day).assertEqual('numeric');
        expect(datefmt.resolvedOptions().minute).assertEqual('2-digit');
        expect(datefmt.resolvedOptions().second).assertEqual('numeric');
        expect(datefmt.resolvedOptions().dayPeriod).assertEqual('short');
        expect(datefmt.resolvedOptions().formatMatcher).assertEqual('basic');
        expect(datefmt.resolvedOptions().localeMatcher).assertEqual('lookup');
    })

    console.log('*************end DateTimeFormatInIntlTest*************');
})}
