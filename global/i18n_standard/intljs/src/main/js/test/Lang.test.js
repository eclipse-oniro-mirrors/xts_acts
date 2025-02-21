/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function LangTest() {
describe('LangTest', function () {
    console.log('*************start LangTest*************');

    let initPreferredLang = I18n.getPreferredLanguageList();
    let initLen = initPreferredLang.length;
    let hour = I18n.is24HourClock();

    /* *
    * get the current preferred language list
    */
    function getCurrentPreferredLang(){
        let value = I18n.getPreferredLanguageList();
        return value;
    }

    /* *
    * judge if the lang is in the preferred language list or not
    */
    function isContainLang(langList, lang){
        let len = langList.length;
        for (let i = 0; i < len; i++){
            if(langList[i] == lang){
                return true
            }
        }
        return false
    }

    /* *
    * execute this step before all testcases
    */
    beforeAll(function(){
        console.log('step before all cases in lang.'
        + ' 24hour: ' + I18n.is24HourClock()
        + ' prelang: ' + I18n.getPreferredLanguageList()
        + ' syslocale: ' + I18n.getSystemLocale());
    })

    /* *
    * execute this step before every testcase
    */
    beforeEach(function(){
        console.log('i18n_test_preferredlanguage_beforeEach ' + getCurrentPreferredLang());
    })

    /* *
    * execute this step after every testcase
    */
    afterEach(function(){
        let currLang = getCurrentPreferredLang();
        console.log('i18n_test_preferredlanguage_afterEach ' + currLang);
    })

    /* *
    * execute this step after all testcases
    */
    afterAll(function(){
        console.log('step after all cases.'
        + ' 24hour: ' + I18n.is24HourClock()
        + ' prelang: ' + I18n.getPreferredLanguageList()
        + ' syslocale: ' + I18n.getSystemLocale());
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CLOCK_0100
    * @tc.name    test the is24HourClock interface
    * @tc.desc    check the value of is24HourClock method
    */
    it('i18n_test_clock_0100', 0, function () {
        console.log('i18n_test_clock_0100 ' + 'start');
        let value = I18n.is24HourClock();
        console.log('i18n_test_clock_0100 ' + value);
        if(value)
        {
            expect(value).assertTrue();
        }
        else
        {
            expect(value).assertFalse();
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CLOCK_0120
    * @tc.name    test the set24HourClock interface
    * @tc.desc    check the value of set24HourClock method
    */
    it('i18n_test_clock_0120', 0, function () {
        console.log('i18n_test_clock_0120 ' + 'start');
        let value = I18n.is24HourClock();
        console.log('i18n_test_clock_0120 ' + value);
        if(value)
        {
            let hourclock = I18n.set24HourClock(false);
            console.log('i18n_test_clock_0120 ' + hourclock);
            hourclock = I18n.set24HourClock(true);
            console.log('i18n_test_clock_0120 ' + hourclock);
            expect(value).assertTrue();
        }
        else
        {
            let hourclock = I18n.set24HourClock(true);
            console.log('i18n_test_clock_0120 ' + hourclock);
            hourclock = I18n.set24HourClock(false);
            console.log('i18n_test_clock_0120 ' + hourclock);
            expect(value).assertFalse();
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_0100
    * @tc.name    test the getPreferredLanguageList interface with default value
    * @tc.desc    check the value of getPreferredLanguageList method
    */
    it('i18n_test_preferredlanguage_0100', 0, function () {
        console.log('i18n_test_preferredlanguage_0100 ' + 'start');
        let value = I18n.getPreferredLanguageList();
        console.log('i18n_test_preferredlanguage_0100 ' + value);
        expect(value.length).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_0120
    * @tc.name test the addPreferredLanguage interface
    * @tc.desc check the value of addPreferredLanguage method
    */
    it('i18n_test_preferredlanguage_0120', 0, function () {
        console.log('i18n_test_preferredlanguage_0120 ' + 'start');
        let list = I18n.getPreferredLanguageList();
        console.log('i18n_test_preferredlanguage_0120 ' + list);
        expect(list.length).assertLarger(0);
        if(list[0] != 'zh-Hans-CN' && list[0] != 'zh-Hans'){
            let value = I18n.addPreferredLanguage('zh-Hans-CN');
            console.log('i18n_test_preferredlanguage_0120 ' + value);
            expect(list.length > 0).assertTrue();
        }
        else{
            let value = I18n.addPreferredLanguage('en-Latn-US');
            console.log('i18n_test_preferredlanguage_0120 ' + value);
            expect(list.length > 0).assertTrue();
        }
        console.log('i18n_test_preferredlanguage_0120 ' + I18n.getPreferredLanguageList());
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_0140
    * @tc.name test the removePreferredLanguage interface
    * @tc.desc check the value of removePreferredLanguage method
    */
    it('i18n_test_preferredlanguage_0140', 0, function () {
        console.log('i18n_test_preferredlanguage_0140 ' + 'start');
        let list = I18n.getPreferredLanguageList();
        console.log('i18n_test_preferredlanguage_0140 ' + list);
        expect(list.length).assertLarger(0);
        if(list[1] == 'zh-Hans-CN'){
            let value = I18n.removePreferredLanguage(1);
            console.log('i18n_test_preferredlanguage_0140 ' + value);
            expect(value).assertTrue();
        }
        console.log('i18n_test_preferredlanguage_0140 ' + I18n.getPreferredLanguageList());
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_1000
    * @tc.name    test the getFirstPreferredLanguage interface
    * @tc.desc    check the value of getFirstPreferredLanguage method
    */
    it('i18n_test_preferredlanguage_1000', 0, function () {
        console.log('i18n_test_preferredlanguage_1000 ' + 'start');
        let value = I18n.getFirstPreferredLanguage();
        console.log('i18n_test_preferredlanguage_1000 ' + value);
        let list = I18n.getPreferredLanguageList();
        console.log('i18n_test_preferredlanguage_1000 ' + list);
        expect(list.length).assertLarger(0);
        if(list[0] == 'zh-Hans'){
            expect(value).assertEqual('zh-Hans');
        }
        else if(list[0] == 'en'){
            expect(value).assertEqual('en');
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_1100
    * @tc.name test the getAppPreferredLanguage interface
    * @tc.desc check the value of getAppPreferredLanguage method
    */
    it('i18n_test_preferredlanguage_1100', 0, function () {
        console.log('i18n_test_preferredlanguage_1100 ' + 'start');
        let value = I18n.getAppPreferredLanguage();
        console.log('i18n_test_preferredlanguage_1100 ' + value);
        expect(value).assertContain('zh');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_TRANSFER_0100
    * @tc.name    transfer from lower to upper
    * @tc.desc    check the transfer result
    */
    it('transfer_test_0100', 0, function () {
        let date = 'hello';
        let value = date.toLocaleUpperCase('zh-CN');
        console.log('transfer_test_0100 ' + value);
        expect(value).assertEqual('HELLO');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_TRANSFER_0200
    * @tc.name    transfer from upper to lower
    * @tc.desc    check the transfer result
    */
    it('transfer_test_0200', 0, function () {
        let date = 'WORLD';
        let value = date.toLocaleLowerCase('zh-CN');
        console.log('transfer_test_0200 ' + value);
        expect(value).assertEqual('world');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_TRANSFER_0300
    * @tc.name    transfer to upper
    * @tc.desc    check the transfer result
    */
    it('transfer_test_0300', 0, function () {
        let date = 'My name is Jack.';
        let value = date.toLocaleUpperCase('en-US');
        console.log('transfer_test_0300 ' + value);
        expect(value).assertEqual('MY NAME IS JACK.');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_TRANSFER_0400
    * @tc.name    transfer to lower
    * @tc.desc    check the transfer result
    */
    it('transfer_test_0400', 0, function () {
        let date = 'The sky is in BLUE-STYLE!';
        let value = date.toLocaleLowerCase('en-US');
        console.log('transfer_test_0400 ' + value);
        expect(value).assertEqual('the sky is in blue-style!');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0100
    * @tc.name    test getTimeZone method
    * @tc.desc    get the getTimeZone value
    */
    it('timezone_test_0100', 0, function () {
        console.log('timezone_test_0100 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getID();
        console.log('timezone_test_0100 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0200
    * @tc.name    test getDisplayName method
    * @tc.desc    get the getDisplayName value
    */
    it('timezone_test_0200', 0, function () {
        console.log('timezone_test_0200 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName();
        console.log('timezone_test_0200 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0300
    * @tc.name    test getDisplayName method with zh-CN param
    * @tc.desc    get the getDisplayName value
    */
    it('timezone_test_0300', 0, function () {
        console.log('timezone_test_0300 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName('zh-CN');
        console.log('timezone_test_0300 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0400
    * @tc.name    test getDisplayName method with true param
    * @tc.desc    get the getDisplayName value
    */
    it('timezone_test_0400', 0, function () {
        console.log('timezone_test_0400 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName(true);
        console.log('timezone_test_0400 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0500
    * @tc.name    test getDisplayName method with false param
    * @tc.desc    get the getDisplayName value
    */
    it('timezone_test_0500', 0, function () {
        console.log('timezone_test_0500 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName(false);
        console.log('timezone_test_0500 ' + value);
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0600
    * @tc.name    test getRawOffset method
    * @tc.desc    get the getRawOffset value
    */
    it('timezone_test_0600', 0, function () {
        console.log('timezone_test_0600 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getRawOffset();
        console.log('timezone_test_0600 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0700
    * @tc.name    test getOffset method
    * @tc.desc    get the getOffset value
    */
    it('timezone_test_0700', 0, function () {
        console.log('timezone_test_0700 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getOffset();
        console.log('timezone_test_0700 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0800
    * @tc.name    test getOffset method with date param
    * @tc.desc    get the getOffset value
    */
    it('timezone_test_0800', 0, function () {
        console.log('timezone_test_0800 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getOffset(10540800000);
        console.log('timezone_test_0800 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_0900
    * @tc.name    test getID
    * @tc.desc    get the getID value
    */
    it('timezone_test_0900', 0, function () {
        console.log('timezone_test_0900 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getID();
        console.log('timezone_test_0900 ' + value);
        expect(value).assertEqual('ACT');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1000
    * @tc.name    test getDisplayName with timezone id
    * @tc.desc    get the getID value
    */
    it('timezone_test_1000', 0, function () {
        console.log('timezone_test_1000 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getDisplayName();
        console.log('timezone_test_1000 ' + value);
        expect(value).assertEqual('澳大利亚中部标准时间');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1100
    * @tc.name    test getDisplayName with locale
    * @tc.desc    get the getID value
    */
    it('timezone_test_1100', 0, function () {
        console.log('timezone_test_1100 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN');
        console.log('timezone_test_1100 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1200
    * @tc.name    test getDisplayName with locale
    * @tc.desc    get the getID value
    */
    it('timezone_test_1200', 0, function () {
        console.log('timezone_test_1200 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN', true);
        console.log('timezone_test_1200 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1300
    * @tc.name    test getDisplayName with en-US and true param
    * @tc.desc    get the getID value
    */
    it('timezone_test_1300', 0, function () {
        console.log('timezone_test_1300 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('en-US', true);
        console.log('timezone_test_1300 ' + value);
        expect(value).assertEqual('China Standard Time');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1400
    * @tc.name    test getDisplayName with zh-CN and false param
    * @tc.desc    get the getID value
    */
    it('timezone_test_1400', 0, function () {
        console.log('timezone_test_1400 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN', false);
        console.log('timezone_test_1400 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1500
    * @tc.name    test getRawOffset method with timezone id
    * @tc.desc    get the getRawOffset value
    */
    it('timezone_test_1500', 0, function () {
        console.log('timezone_test_1500 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getRawOffset();
        console.log('timezone_test_1500 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1600
    * @tc.name    test getOffset method with timezone id
    * @tc.desc    get the getOffset value
    */
    it('timezone_test_1600', 0, function () {
        console.log('timezone_test_1600 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getOffset();
        console.log('timezone_test_1600 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TIMEZONE_1700
    * @tc.name    test getOffset method with date and timezone id param
    * @tc.desc    get the getOffset value
    */
    it('timezone_test_1700', 0, function () {
        console.log('timezone_test_1700 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getOffset(10540800000);
        console.log('timezone_test_1700 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1800
    * @tc.name test getAvailableIDs method
    * @tc.desc get the getAvailableIDs value
    */
    it('timezone_test_1800', 0, function () {
        console.log('timezone_test_1800 ' + 'start');
        let value = I18n.TimeZone.getAvailableIDs();
        console.log('timezone_test_1800 ' + value);
        expect(value.length > 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1900
    * @tc.name test getAvailableZoneCityIDs method
    * @tc.desc get the getAvailableZoneCityIDs value
    */
    it('timezone_test_1900', 0, function () {
        console.log('timezone_test_1900 ' + 'start');
        let value = I18n.TimeZone.getAvailableZoneCityIDs();
        console.log('timezone_test_1900 ' + value);
        expect(value.length > 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2000
    * @tc.name test getCityDisplayName method with zh locale
    * @tc.desc get the getCityDisplayName value
    */
    it('timezone_test_2000', 0, function () {
        console.log('timezone_test_2000 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('Auckland', 'zh');
        console.log('timezone_test_2000 ' + value);
        expect(value).assertEqual('奥克兰 (新西兰)');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2020
    * @tc.name test getCityDisplayName method with en loacle
    * @tc.desc get the getCityDisplayName value
    */
    it('timezone_test_2020', 0, function () {
        console.log('timezone_test_2020 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('Auckland', 'en');
        console.log('timezone_test_2020 ' + value);
        expect(value).assertEqual('Auckland (New Zealand)');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2040
    * @tc.name test getCityDisplayName method with not exist cityid
    * @tc.desc get the getCityDisplayName value
    */
    it('timezone_test_2040', 0, function () {
        console.log('timezone_test_2040 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('abcd', 'en');
        console.log('timezone_test_2040 ' + value);
        expect(value).assertEqual('');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2060
    * @tc.name test getCityDisplayName method with not exist locale
    * @tc.desc get the getCityDisplayName value
    */
    it('timezone_test_2060', 0, function () {
        console.log('timezone_test_2060 ' + 'start');
        let value = I18n.TimeZone.getCityDisplayName('Auckland', 'abc');
        console.log('timezone_test_2060 ' + value);
        expect(value).assertEqual('Auckland (New Zealand)');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2100
    * @tc.name test getTimezoneFromCity method
    * @tc.desc get the getTimezoneFromCity value
    */
    it('timezone_test_2100', 0, function () {
        console.log('timezone_test_2100 ' + 'start');
        let value = I18n.TimeZone.getTimezoneFromCity('Auckland');
        console.log('timezone_test_2100 ' + value);
        expect(value != null).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_2120
    * @tc.name test getTimezoneFromCity method with not exist cityid
    * @tc.desc get the getTimezoneFromCity value
    */
    it('timezone_test_2120', 0, function () {
        console.log('timezone_test_2120 ' + 'start');
        let value = I18n.TimeZone.getTimezoneFromCity('abc');
        console.log('timezone_test_2120 ' + value);
        expect(value != null).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_LOCALDIGIT_0100
    * @tc.name test getUsingLocalDigit method
    * @tc.desc get the getUsingLocalDigit value
    */
    it('localdigit_test_0100', 0, function () {
        let value = I18n.getUsingLocalDigit();
        console.log('localdigit_test_0100 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_DATEORDER_0100
    * @tc.name    test getDateOrder method with zh param
    * @tc.desc    get the DateOrder value
    */
    it('dateorder_test_0100', 0, function () {
        console.log('dateorder_test_0100 ' + 'start');
        let value = I18n.I18NUtil.getDateOrder('zh');
        console.log('dateorder_test_0100 ' + value);
        expect(value).assertEqual('y-L-d');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_DATEORDER_0200
    * @tc.name    test getDateOrder method with en param
    * @tc.desc    get the DateOrder value
    */
    it('dateorder_test_0200', 0, function () {
        console.log('dateorder_test_0200 ' + 'start');
        let value = I18n.I18NUtil.getDateOrder('en');
        console.log('dateorder_test_0200 ' + value);
        expect(value).assertEqual('LLL-d-y');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_DATEORDER_0300
    * @tc.name    test getDateOrder method with th param
    * @tc.desc    get the DateOrder value
    */
    it('dateorder_test_0300', 0, function () {
        console.log('dateorder_test_0300 ' + 'start');
        let value = I18n.I18NUtil.getDateOrder('th');
        console.log('dateorder_test_0300 ' + value);
        expect(value).assertEqual('d-LLL-y');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_DATEORDER_0400
    * @tc.name    test getDateOrder method with jp param
    * @tc.desc    get the DateOrder value
    */
    it('dateorder_test_0400', 0, function () {
        console.log('dateorder_test_0400 ' + 'start');
        let value = I18n.I18NUtil.getDateOrder('jp');
        console.log('dateorder_test_0400 ' + value);
        expect(value).assertEqual('LLL-d-y');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0100
    * @tc.name    test getAvailableIDs
    * @tc.desc    get the ID value
    */
    it('transliterator_test_0100', 0, function () {
        console.log('transliterator_test_0100 ' + 'start');
        let value = I18n.Transliterator.getAvailableIDs();
        let len = value.length;
        console.log('transliterator_test_0100 ' + value);
        console.log('transliterator_test_0100 ' + len);
        expect(value !== null).assertTrue();
        expect(len).assertEqual(671);
        while (len > 0)
        {
            console.log('transliterator_test_0100 ' + value[len-1]);
            len--;
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0200
    * @tc.name    test getInstance with a param
    * @tc.desc    get the instance value
    */
    it('transliterator_test_0200', 0, function () {
        console.log('transliterator_test_0200 ' + 'start');
        let value = I18n.Transliterator.getInstance('a');
        console.log('transliterator_test_0200 ' + value);
        expect(value !== null).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0300
    * @tc.name    test transform with 中国 param
    * @tc.desc    get the transform value
    */
    it('transliterator_test_0300', 0, function () {
        console.log('transliterator_test_0300 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-Accents');
        let value = trans.transform('中国');
        console.log('transliterator_test_0300 ' + value);
        expect(value).assertEqual('中国');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0400
    * @tc.name    test transform with Any-Latn param
    * @tc.desc    get the transform value
    */
    it('transliterator_test_0400', 0, function () {
        console.log('transliterator_test_0400 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-Latn');
        let value = trans.transform('中国');
        console.log('transliterator_test_0400 ' + value);
        expect(value).assertEqual('zhōng guó');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0500
    * @tc.name    test transform with Any-Thai param
    * @tc.desc    get the transform value
    */
    it('transliterator_test_0500', 0, function () {
        console.log('transliterator_test_0500 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-Thai');
        let value = trans.transform('中国');
        console.log('transliterator_test_0500 ' + value);
        expect(value).assertEqual('中国');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0600
    * @tc.name    test transform with Any-zh param
    * @tc.desc    get the transform value
    */
    it('transliterator_test_0600', 0, function () {
        console.log('transliterator_test_0600 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-zh');
        let value = trans.transform('nihao');
        console.log('transliterator_test_0600 ' + value);
        expect(value).assertEqual('nihao');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0700
    * @tc.name    test transform with Any-Hant param
    * @tc.desc    get the transform value
    */
    it('transliterator_test_0700', 0, function () {
        console.log('transliterator_test_0700 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-Hant');
        let value = trans.transform('hello');
        console.log('transliterator_test_0700 ' + value);
        expect(value).assertEqual('hello');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_TRANSLITERATOR_0800
    * @tc.name    test transform with Any-Kannada param
    * @tc.desc    get the transform value
    */
    it('transliterator_test_0800', 0, function () {
        console.log('transliterator_test_0800 ' + 'start');
        let trans = I18n.Transliterator.getInstance('Any-Kannada');
        let value = trans.transform('hello');
        console.log('transliterator_test_0800 ' + value);
        expect(value).assertEqual('ಹೆಲ್ಲೊ');
    })

    console.log('*************end LangTest*************');
})}
