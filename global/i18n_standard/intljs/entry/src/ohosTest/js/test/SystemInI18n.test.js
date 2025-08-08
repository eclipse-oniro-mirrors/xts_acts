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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

export default function SystemInI18nTest() {
describe('SystemInI18nTest', function () {
    console.log('*************start SystemInI18nTest*************');

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
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_0100
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_system_test_0100', Level.LEVEL0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', true);
        console.log('i18n_system_test_0100 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_0200
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and undefined param
    * @tc.desc    check the display country
    */
    it('i18n_system_test_0200', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', undefined);
        console.log('i18n_system_test_0200 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_0300
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and null param
    * @tc.desc    check the display country
    */
    it('i18n_system_test_0300', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', null);
        console.log('i18n_system_test_0300 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_0400
    * @tc.name    getDisplayCountry with zh and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_system_test_0400', Level.LEVEL2, function () {
        try{
            let value = I18n.System.getDisplayCountry('zh', 'en-US', true);
            console.log('i18n_system_test_0400 ' + value);
            expect(value).assertEqual('');
        }catch(e){
            console.log('i18n_system_test_0400 ' + e.code);
            console.log('i18n_system_test_0400 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Invalid parameter, the country must be a valid region.');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_0500
    * @tc.name    getDisplayCountry with zh-CN and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_system_test_0500', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayCountry('zh-CN', 'en-US', true);
        console.log('i18n_system_test_0500 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_0600
    * @tc.name    getDisplayCountry with zh-Hans and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_system_test_0600', Level.LEVEL2, function () {
        try{
            let value = I18n.System.getDisplayCountry('zh-Hans', 'en-US', true);
            console.log('i18n_system_test_0600 ' + value);
            expect(value).assertEqual('');
        }catch(e){
            console.log('i18n_system_test_0600 ' + e.code);
            console.log('i18n_system_test_0600 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Invalid parameter, the country must be a valid region.');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_0700
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    */
    it('i18n_system_test_0700', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', false);
        console.log('i18n_system_test_0700 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_0800
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_system_test_0800', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US');
        console.log('i18n_system_test_0800 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_0900
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_system_test_0900', Level.LEVEL2, function () {
        try{
            let value = I18n.System.getDisplayCountry('zh-Hans-CN');
            console.log('i18n_system_test_0900 ' + value);
            expect(value).assertEqual('China');
        }catch(e){
            console.log('i18n_system_test_0900 ' + e.code);
            console.log('i18n_system_test_0900 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Parameter error, the country or locale cannot be empty.');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_1000
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_system_test_1000', Level.LEVEL2, function () {
        try{
            let value = I18n.System.getDisplayCountry('zh-Hans-CN', 12345);
            console.log('i18n_system_test_1000 ' + value);
            expect(value).assertEqual('China');
        }catch(e){
            console.log('i18n_system_test_1000 ' + e.code);
            console.log('i18n_system_test_1000 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Parameter error, the type of locale must be string.');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_1100
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_system_test_1100', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', true);
        console.log('i18n_system_test_1100 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_1200
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and undefined param
    * @tc.desc    check the language
    */
    it('i18n_system_test_1200', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', undefined);
        console.log('i18n_system_test_1200 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_1300
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and null param
    * @tc.desc    check the language
    */
    it('i18n_system_test_1300', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', null);
        console.log('i18n_system_test_1300 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_1400
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-GB and true param
    * @tc.desc    check the language
    */
    it('i18n_system_test_1400', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-GB', true);
        console.log('i18n_system_test_1400 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_1500
    * @tc.name    getDisplayLanguage with zh and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_system_test_1500', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayLanguage('zh', 'en-US', true);
        console.log('i18n_system_test_1500 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_1600
    * @tc.name    getDisplayLanguage with zh-CN and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_system_test_1600', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayLanguage('zh-CN', 'en-US', true);
        console.log('i18n_system_test_1600 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_1700
    * @tc.name    getDisplayLanguage with zh-Hans and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_system_test_1700', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans', 'en-US', true);
        console.log('i18n_system_test_1700 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_1800
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    */
    it('i18n_system_test_1800', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', false);
        console.log('i18n_system_test_1800 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_1900
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_system_test_1900', Level.LEVEL2, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US');
        console.log('i18n_system_test_1900 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_2000
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_system_test_2000', Level.LEVEL2, function () {
        try{
            let value = I18n.System.getDisplayLanguage('zh-Hans-CN');
            console.log('i18n_system_test_2000 ' + value);
            expect(value).assertEqual('Simplified Chinese');
        }catch(e){
            console.log('i18n_system_test_2000 ' + e.code);
            console.log('i18n_system_test_2000 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Parameter error, the language or locale cannot be empty.');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_2100
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_system_test_2100', Level.LEVEL2, function () {
        try{
            let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 12345);
            console.log('i18n_system_test_2100 ' + value);
            expect(value).assertEqual('Simplified Chinese');
        }catch(e){
            console.log('i18n_system_test_2100 ' + e.code);
            console.log('i18n_system_test_2100 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Parameter error, the type of locale must be string.');
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_2200
    * @tc.name getSystemLanguages test
    * @tc.desc check the getSystemLanguages
    */
    it('i18n_system_test_2200', Level.LEVEL2, function () {
        let value = I18n.System.getSystemLanguages();
        let len = value.length;
        console.log('i18n_system_test_2200 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_2300
    * @tc.name getSystemCountries with en param
    * @tc.desc check the getSystemCountries
    */
    it('i18n_system_test_2300', Level.LEVEL2, function () {
        let value = I18n.System.getSystemCountries('en');
        let len = value.length;
        console.log('i18n_system_test_2300 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_2400
    * @tc.name getSystemCountries with en param
    * @tc.desc check the getSystemCountries
    */
    it('i18n_system_test_2400', Level.LEVEL2, function () {
        try{
            let value = I18n.System.getSystemCountries();
            let len = value.length;
            console.log('i18n_system_test_2400 ' + len);
            expect(len).assertLarger(0);
        }catch(e){
            console.log('i18n_system_test_2400 ' + e.code);
            console.log('i18n_system_test_2400 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Parameter error, the language cannot be empty.');
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_2500
    * @tc.name getSystemCountries with en param
    * @tc.desc check the getSystemCountries
    */
    it('i18n_system_test_2500', Level.LEVEL2, function () {
        try{
            let value = I18n.System.getSystemCountries(12345);
            let len = value.length;
            console.log('i18n_system_test_2500 ' + len);
            expect(len).assertLarger(0);
        }catch(e){
            console.log('i18n_system_test_2500 ' + e.code);
            console.log('i18n_system_test_2500 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Parameter error, the type of language must be string.');
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_2600
    * @tc.name isSuggested with zh param
    * @tc.desc check the isSuggested
    */
    it('i18n_system_test_2600', Level.LEVEL0, function () {
        let value = I18n.System.isSuggested('zh');
        console.log('i18n_system_test_2600 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_2700
    * @tc.name isSuggested with en param
    * @tc.desc check the isSuggested
    */
    it('i18n_system_test_2700', Level.LEVEL2, function () {
        let value = I18n.System.isSuggested('en');
        console.log('i18n_system_test_2700 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_2800
    * @tc.name isSuggested with zh-CN param
    * @tc.desc check the isSuggested
    */
    it('i18n_system_test_2800', Level.LEVEL2, function () {
        let value = I18n.System.isSuggested('zh', 'CN');
        console.log('i18n_system_test_2800 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_2900
    * @tc.name isSuggested with en-US param
    * @tc.desc check the isSuggested
    */
    it('i18n_system_test_2900', Level.LEVEL2, function () {
        let value = I18n.System.isSuggested('en' , 'US');
        console.log('i18n_system_test_2900 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_3000
    * @tc.name isSuggested with en-US param
    * @tc.desc check the isSuggested
    */
    it('i18n_system_test_3000', Level.LEVEL2, function () {
        try{
            let value = I18n.System.isSuggested();
            console.log('i18n_system_test_3000 ' + value);
            expect(value).assertTrue();
        }catch(e){
            console.log('i18n_system_test_3000 ' + e.code);
            console.log('i18n_system_test_3000 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Parameter error, the language cannot be empty.');
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_3100
    * @tc.name isSuggested with en-US param
    * @tc.desc check the isSuggested
    */
    it('i18n_system_test_3100', Level.LEVEL2, function () {
        try{
            let value = I18n.System.isSuggested(12345);
            console.log('i18n_system_test_3100 ' + value);
            expect(value).assertTrue();
        }catch(e){
            console.log('i18n_system_test_3100 ' + e.code);
            console.log('i18n_system_test_3100 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Parameter error, the type of language must be string.');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_3200
    * @tc.name    getSystemLanguage
    * @tc.desc    check the getSystemLanguage
    */
    it('i18n_system_test_3200', Level.LEVEL2, function () {
        let lang = I18n.System.getSystemLanguage();
        console.log('i18n_system_test_3200 ' + lang);
        expect(lang).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_3300
    * @tc.name    getSystemRegion
    * @tc.desc    check the getSystemRegion
    */
    it('i18n_system_test_3300', Level.LEVEL0, function () {
        let region = I18n.System.getSystemRegion();
        console.log('i18n_system_test_3300 ' + region);
        expect(region).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_3400
    * @tc.name    getSystemLocale
    * @tc.desc    check the getSystemLocale
    */
    it('i18n_system_test_3400', Level.LEVEL0, function () {
        let locale = I18n.System.getSystemLocale();
        console.log('i18n_system_test_3400 ' + locale);
        expect(locale).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_3500
    * @tc.name    is24HourClock
    * @tc.desc    check the is24HourClock
    */
    it('i18n_system_test_3500', Level.LEVEL2, function () {
        let value = I18n.System.is24HourClock();
        console.log('i18n_system_test_3500 ' + value);
        expect(['true', 'false']).assertContain(String(value));
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_3600
    * @tc.name    test the getPreferredLanguageList interface with default value
    * @tc.desc    check the value of getPreferredLanguageList method
    */
    it('i18n_system_test_3600', Level.LEVEL0, function () {
        console.log('i18n_system_test_3600 ' + 'start');
        let value = I18n.System.getPreferredLanguageList();
        console.log('i18n_system_test_3600 ' + value);
        expect(value.length).assertLarger(0);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_SYSTEM_JS_3700
    * @tc.name    test the getFirstPreferredLanguage interface
    * @tc.desc    check the value of getFirstPreferredLanguage method
    */
    it('i18n_system_test_3700', Level.LEVEL0, function () {
        console.log('i18n_system_test_3700 ' + 'start');
        let value = I18n.System.getFirstPreferredLanguage();
        console.log('i18n_system_test_3700 ' + value);
        let list = I18n.System.getPreferredLanguageList();
        console.log('i18n_system_test_3700 ' + list);
        expect(list.length).assertLarger(0);
        if(list[0] == 'zh-Hans'){
            expect(value).assertEqual('zh-Hans');
        }
        else if(list[0] == 'en'){
            expect(value).assertEqual('en');
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_3800
    * @tc.name test the getAppPreferredLanguage interface
    * @tc.desc check the value of getAppPreferredLanguage method
    */
    it('i18n_system_test_3800', Level.LEVEL2, function () {
        console.log('i18n_system_test_3800 ' + 'start');
        let value = I18n.System.getAppPreferredLanguage();
        console.log('i18n_system_test_3800 ' + value);
        expect(value).assertContain('zh');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_SYSTEM_JS_3900
    * @tc.name test getUsingLocalDigit method
    * @tc.desc get the getUsingLocalDigit value
    */
    it('i18n_system_test_3900', Level.LEVEL0, function () {
        let value = I18n.System.getUsingLocalDigit();
        console.log('i18n_system_test_3900 ' + value);
        expect(value).assertFalse();
    })

    /**
    *@tc.number   :SUB_GLOBAL_I18N_AppPreferredLanguage_0400
    *@tc.name     :setAppPreferredLanguage - Set App Preferred Language
    *@tc.desc     :setAppPreferredLanguage
    *@tc.size     :MEDIUM
    *@tc.type     :Function
    *@tc.level    :Level 0
    */
    it('SUB_GLOBAL_I18N_AppPreferredLanguage_0400',Level.LEVEL0,function(done){
        try{
          I18n.System.setAppPreferredLanguage('zh-CN');//设置应用偏好语言为"zh-CN"
          let appPreferredLanguage = I18n.System.getAppPreferredLanguage();
          console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_0400' + appPreferredLanguage);
          expect(appPreferredLanguage == "zh-CN").assertTrue();
        }catch(e){
          console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_0400_errorCode'+e.code);
          console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_0400_errorMessage'+e.message);
        }
        done();
    })

    console.log('*************end SystemInI18nTest*************');
})}
