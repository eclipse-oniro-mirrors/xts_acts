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
        + ' prelang: ' + I18n.getPreferredLanguageList()
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
        + ' prelang: ' + I18n.getPreferredLanguageList()
        + ' syslocale: ' + I18n.getSystemLocale());
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0100
    * @tc.name    getSystemLanguage
    * @tc.desc    check the getSystemLanguage
    */
    it('i18n_test_0100', 0, function () {
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_0100 ' + lang);
        expect(lang).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0200
    * @tc.name    getSystemRegion
    * @tc.desc    check the getSystemRegion
    */
    it('i18n_test_0200', 0, function () {
        let region = I18n.getSystemRegion();
        console.log('i18n_test_0200 ' + region);
        expect(region).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0300
    * @tc.name    getSystemLocale
    * @tc.desc    check the getSystemLocale
    */
    it('i18n_test_0300', 0, function () {
        let locale = I18n.getSystemLocale();
        console.log('i18n_test_0300 ' + locale);
        expect(locale).assertInstanceOf('String');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2110
    * @tc.name getSystemLanguages test
    * @tc.desc check the getSystemLanguages
    */
    it('i18n_test_2110', 0, function () {
        let value = I18n.System.getSystemLanguages();
        let len = value.length;
        console.log('i18n_test_2110 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2120
    * @tc.name getSystemCountries with en param
    * @tc.desc check the getSystemCountries
    */
    it('i18n_test_2120', 0, function () {
        let value = I18n.System.getSystemCountries('en');
        let len = value.length;
        console.log('i18n_test_2120 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2310
    * @tc.name isSuggested with zh param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2310', 0, function () {
        let value = I18n.isSuggested('zh');
        console.log('i18n_test_2310 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2320
    * @tc.name isSuggested with en param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2320', 0, function () {
        let value = I18n.isSuggested('en');
        console.log('i18n_test_2320 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2330
    * @tc.name isSuggested with zh-CN param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2330', 0, function () {
        let value = I18n.isSuggested('zh', 'CN');
        console.log('i18n_test_2330 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2340
    * @tc.name isSuggested with en-US param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2340', 0, function () {
        let value = I18n.isSuggested('en' , 'US');
        console.log('i18n_test_2340 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_3800
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_3800', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', true);
        console.log('i18n_test_3800 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_3900
    * @tc.name    getDisplayCountry with zh and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_3900', 0, function () {
        let value = I18n.getDisplayCountry('zh', 'en-US', true);
        console.log('i18n_test_3900 ' + value);
        expect(value).assertEqual('');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4000
    * @tc.name    getDisplayCountry with zh-CN and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_4000', 0, function () {
        let value = I18n.getDisplayCountry('zh-CN', 'en-US', true);
        console.log('i18n_test_4000 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4100
    * @tc.name    getDisplayCountry with zh-Hans and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_4100', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans', 'en-US', true);
        console.log('i18n_test_4100 ' + value);
        expect(value).assertEqual('');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4200
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    */
    it('i18n_test_4200', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', false);
        console.log('i18n_test_4200 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4300
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_4300', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US');
        console.log('i18n_test_4300 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4400
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4400', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', true);
        console.log('i18n_test_4400 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4500
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-GB and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4500', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-GB', true);
        console.log('i18n_test_4500 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4600
    * @tc.name    getDisplayLanguage with zh and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4600', 0, function () {
        let value = I18n.getDisplayLanguage('zh', 'en-US', true);
        console.log('i18n_test_4600 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4700
    * @tc.name    getDisplayLanguage with zh-CN and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4700', 0, function () {
        let value = I18n.getDisplayLanguage('zh-CN', 'en-US', true);
        console.log('i18n_test_4700 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4800
    * @tc.name    getDisplayLanguage with zh-Hans and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4800', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans', 'en-US', true);
        console.log('i18n_test_4800 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4900
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    */
    it('i18n_test_4900', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', false);
        console.log('i18n_test_4900 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5000
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_5000', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US');
        console.log('i18n_test_5000 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5100
    * @tc.name    test isValidNumber interface with 13510574676 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_5100', 0, function () {
        console.log('i18n_test_5100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_5100 ' + ran);
        let valid = phonenumber.isValidNumber('1351057467' + ran);
        console.log('i18n_test_5100 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5120
    * @tc.name    test isValidNumber interface with 0755-6100088X param
    * @tc.desc    get the isValidNumber value
    */
     it('i18n_test_5120', 0, function () {
        console.log('i18n_test_5120 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_5120 ' + ran);
        let valid = phonenumber.isValidNumber('0755-6100088' + ran);
        console.log('i18n_test_5120 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5140
    * @tc.name    test isValidNumber interface with 110 param
    * @tc.desc    get the isValidNumber value
    */
     it('i18n_test_5140', 0, function () {
        console.log('i18n_test_5140 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('110');
        console.log('i18n_test_5140 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5200
    * @tc.name    test isValidNumber interface with 135 1057 4676 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_5200', 0, function () {
        console.log('i18n_test_5200 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_5200 ' + ran);
        let valid = phonenumber.isValidNumber('135 1057 467' + ran);
        console.log('i18n_test_5200 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5300
    * @tc.name    test isValidNumber interface with +86 135 1057 4676 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_5300', 0, function () {
        console.log('i18n_test_5300 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_5300 ' + ran);
        let valid = phonenumber.isValidNumber('+86 135 1057 467' + ran);
        console.log('i18n_test_5300 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5400
    * @tc.name    test isValidNumber interface with 135-1057-4676 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_5400', 0, function () {
        console.log('i18n_test_5400 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_5400 ' + ran);
        let valid = phonenumber.isValidNumber('135-1057-467' + ran);
        console.log('i18n_test_5400 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5500
    * @tc.name    test isValidNumber interface with tel:+86-135-1057-4676 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_5500', 0, function () {
        console.log('i18n_test_5500 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_5500 ' + ran);
        let valid = phonenumber.isValidNumber('tel:+86-135-1057-467' + ran);
        console.log('i18n_test_5500 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5600
    * @tc.name    test isValidNumber interface with 86-135-1057-4676 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_5600', 0, function () {
        console.log('i18n_test_5600 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_5600 ' + ran);
        let valid = phonenumber.isValidNumber('86-135-1057-467' + ran);
        console.log('i18n_test_5600 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5700
    * @tc.name    test isValidNumber interface with +8613510574676 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_5700', 0, function () {
        console.log('i18n_test_5700 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_5700 ' + ran);
        let valid = phonenumber.isValidNumber('+861351057467' + ran);
        console.log('i18n_test_5700 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5800
    * @tc.name    test isValidNumber interface with 8613510574676 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_5800', 0, function () {
        console.log('i18n_test_5800 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_5800 ' + ran);
        let valid = phonenumber.isValidNumber('861351057467' + ran);
        console.log('i18n_test_5800 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_5900
    * @tc.name    test isValidNumber interface with 1351057467 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_5900', 0, function () {
        console.log('i18n_test_5900 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_5900 ' + ran);
        let valid = phonenumber.isValidNumber('135105746' + ran);
        console.log('i18n_test_5900 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_6000
    * @tc.name    test isValidNumber interface with 135105746761 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_6000', 0, function () {
        console.log('i18n_test_6000 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_6000 ' + ran);
        let valid = phonenumber.isValidNumber('13510574676' + ran);
        console.log('i18n_test_6000 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_6100
    * @tc.name    test isValidNumber interface with 1351057467a param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_6100', 0, function () {
        console.log('i18n_test_6100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_6100 ' + ran);
        let valid = phonenumber.isValidNumber('135105746' + ran + 'a');
        console.log('i18n_test_6100 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_6200
    * @tc.name    test isValidNumber interface with 6262023379 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_6200', 0, function () {
        console.log('i18n_test_6200 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_6200 ' + ran);
        let valid = phonenumber.isValidNumber('626202337' + ran);
        console.log('i18n_test_6200 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_6300
    * @tc.name    test isValidNumber interface with 626202337 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_6300', 0, function () {
        console.log('i18n_test_6300 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_6300 ' + ran);
        let valid = phonenumber.isValidNumber('62620233' + ran);
        console.log('i18n_test_6300 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_6400
    * @tc.name    test isValidNumber interface with 62620233791 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_6400', 0, function () {
        console.log('i18n_test_6400 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_6400 ' + ran);
        let valid = phonenumber.isValidNumber('6262023379' + ran);
        console.log('i18n_test_6400 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_6500
    * @tc.name    test isValidNumber interface with 626202337a param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_6500', 0, function () {
        console.log('i18n_test_6500 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_6500 ' + ran);
        let valid = phonenumber.isValidNumber('62620233' + ran + 'a');
        console.log('i18n_test_6500 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_6600
    * @tc.name    test format interface with 13510574676 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_6600', 0, function () {
        console.log('i18n_test_6600 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_6600 ' + ran);
        let value = phonenumber.format('1351057467' + ran);
        console.log('i18n_test_6600 ' + value);
        expect(value).assertEqual('135 1057 467' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_6700
    * @tc.name    test format interface with 6262023379 param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_6700', 0, function () {
        console.log('i18n_test_6700 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_6700 ' + ran);
        let value = phonenumber.format('626202337' + ran);
        console.log('i18n_test_6700 ' + value);
        expect(value).assertEqual('(626) 202-337' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_6800
    * @tc.name    test format interface with 13510574676 and NATIONAL type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_6800', 0, function () {
        console.log('i18n_test_6800 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_6800 ' + ran);
        let value = phonenumber.format('1351057467' + ran);
        console.log('i18n_test_6800 ' + value);
        expect(value).assertEqual('135 1057 467' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_6900
    * @tc.name    test format interface with 1351057467 and NATIONAL type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_6900', 0, function () {
        console.log('i18n_test_6900 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_6900 ' + ran);
        let value = phonenumber.format('135105746' + ran);
        console.log('i18n_test_6900 ' + value);
        expect(value).assertEqual('135105746' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7000
    * @tc.name    test format interface with 135105746761 and NATIONAL type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_7000', 0, function () {
        console.log('i18n_test_7000 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7000 ' + ran);
        let value = phonenumber.format('13510574676' + ran);
        console.log('i18n_test_7000 ' + value);
        expect(value).assertEqual('013 510 574 676' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7100
    * @tc.name    test format interface with 135 1057 4676 and NATIONAL type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_7100', 0, function () {
        console.log('i18n_test_7100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7100 ' + ran);
        let value = phonenumber.format('135 1057 467' + ran);
        console.log('i18n_test_7100 ' + value);
        expect(value).assertEqual('135 1057 467' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7200
    * @tc.name    test format interface with 13510574676 and INTERNATIONAL type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_7200', 0, function () {
        console.log('i18n_test_7200 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'INTERNATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7200 ' + ran);
        let value = phonenumber.format('1351057467' + ran);
        console.log('i18n_test_7200 ' + value);
        expect(value).assertEqual('+86 135 1057 467' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7300
    * @tc.name    test format interface with 13510574676 and RFC3966 type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_7300', 0, function () {
        console.log('i18n_test_7300 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'RFC3966'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7300 ' + ran);
        let value = phonenumber.format('1351057467' + ran);
        console.log('i18n_test_7300 ' + value);
        expect(value).assertEqual('tel:+86-135-1057-467' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7400
    * @tc.name    test format interface with 13510574676 and E164 type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_7400', 0, function () {
        console.log('i18n_test_7400 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'E164'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7400 ' + ran);
        let value = phonenumber.format('1351057467' + ran);
        console.log('i18n_test_7400 ' + value);
        expect(value).assertEqual('+861351057467' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7500
    * @tc.name    test format interface with 6262023379 and NATIONAL type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_7500', 0, function () {
        console.log('i18n_test_7500 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'NATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7500 ' + ran);
        let value = phonenumber.format('626202337' + ran);
        console.log('i18n_test_7500 ' + value);
        expect(value).assertEqual('(626) 202-337' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7600
    * @tc.name    test format interface with 6262023379 and INTERNATIONAL type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_7600', 0, function () {
        console.log('i18n_test_7600 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'INTERNATIONAL'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7600 ' + ran);
        let value = phonenumber.format('626202337' + ran);
        console.log('i18n_test_7600 ' + value);
        expect(value).assertEqual('+1 626-202-337' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7700
    * @tc.name    test format interface with 6262023379 and RFC3966 type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_7700', 0, function () {
        console.log('i18n_test_7700 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'RFC3966'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7700 ' + ran);
        let value = phonenumber.format('626202337' + ran);
        console.log('i18n_test_7700 ' + value);
        expect(value).assertEqual('tel:+1-626-202-337' + ran);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7800
    * @tc.name    test format interface with 6262023379 and E164 type param
    * @tc.desc    get the isValidNumber value
    */
    it('i18n_test_7800', 0, function () {
        console.log('i18n_test_7800 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'E164'});
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7800 ' + ran);
        let value = phonenumber.format('626202337' + ran);
        console.log('i18n_test_7800 ' + value);
        expect(value).assertEqual('+1626202337' + ran);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7810
    * @tc.name test getLocationName method with 135... num in zh-CN locale
    * @tc.desc get the getLocationName value
    */
    it('i18n_test_7810', 0, function () {
        console.log('i18n_test_7810 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7810 ' + ran);
        let value = phonenumber.getLocationName('1351057467' + ran, 'zh-CN');
        console.log('i18n_test_7810 ' + value);
        expect(value == '中国' || value == '广东省深圳市').assertTrue();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7820
    * @tc.name test getLocationName method with 135... num in en-US locale
    * @tc.desc get the getLocationName value
    */
    it('i18n_test_7820', 0, function () {
        console.log('i18n_test_7820 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7820 ' + ran);
        let value = phonenumber.getLocationName('+861351057467' + ran, 'en-US');
        console.log('i18n_test_7820 ' + value);
        expect(value == 'China' || value == 'Shenzhen, Guangdong').assertTrue();
        let value2 = phonenumber.getLocationName('+86 1351057467' + ran, 'en-US');
        console.log('i18n_test_7820 ' + value2);
        expect(value2 == 'China' || value2 == 'Shenzhen, Guangdong').assertTrue();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7830
    * @tc.name test getLocationName method with 158... num in en-US locale
    * @tc.desc get the getLocationName value
    */
    it('i18n_test_7830', 0, function () {
        console.log('i18n_test_7830 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7830 ' + ran);
        let value1 = phonenumber.getLocationName('+861586661737' + ran, 'en-US');
        console.log('i18n_test_7830 ' + value1);
        expect(value1 == 'China' || value1 == 'Jinan, Shandong').assertTrue();
        let value2 = phonenumber.getLocationName('+86 1586661737' + ran, 'en-US');
        console.log('i18n_test_7830 ' + value2);
        expect(value2 == 'China' || value2 == 'Jinan, Shandong').assertTrue();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7840
    * @tc.name test getLocationName method with 027... num in zh-CN locale
    * @tc.desc get the getLocationName value
    */
    it('i18n_test_7840', 0, function () {
        console.log('i18n_test_7840 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7840 ' + ran);
        let value = phonenumber.getLocationName('027-5937411' + ran, 'zh-CN');
        console.log('i18n_test_7840 ' + value);
        expect(value == '中国' || value == '湖北省武汉市').assertTrue();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7850
    * @tc.name test getLocationName method with 0728... num in zh-CN locale
    * @tc.desc get the getLocationName value
    */
    it('i18n_test_7850', 0, function () {
        console.log('i18n_test_7850 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7850 ' + ran);
        let value = phonenumber.getLocationName('0728-623797' + ran, 'zh-CN');
        console.log('i18n_test_7850 ' + value);
        expect(value == '中国' || value == '湖北省仙桃市').assertTrue();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7860
    * @tc.name test getLocationName method with +34... num in en-US locale
    * @tc.desc get the getLocationName value
    */
    it('i18n_test_7860', 0, function () {
        console.log('i18n_test_7860 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7860 ' + ran);
        let value1 = phonenumber.getLocationName('+3460724205' + ran, 'en-US');
        console.log('i18n_test_7860 ' + value1);
        expect(value1).assertEqual('Spain');
        let value2 = phonenumber.getLocationName('+34 60724205' + ran, 'en-US');
        console.log('i18n_test_7860 ' + value2);
        expect(value2).assertEqual('Spain');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7870
    * @tc.name test getLocationName method with +39... num in en-US locale
    * @tc.desc get the getLocationName value
    */
    it('i18n_test_7870', 0, function () {
        console.log('i18n_test_7870 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7870 ' + ran);
        let value = phonenumber.getLocationName('+39342652441' + ran, 'en-US');
        console.log('i18n_test_7870 ' + value);
        expect(value).assertEqual('Italy');
        let value2 = phonenumber.getLocationName('+39 342652441' + ran, 'en-US');
        console.log('i18n_test_7870 ' + value2);
        expect(value2).assertEqual('Italy');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7880
    * @tc.name test getLocationName method with +39... num in zh-CN locale
    * @tc.desc get the getLocationName value
    */
    it('i18n_test_7880', 0, function () {
        console.log('i18n_test_7880 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7880 ' + ran);
        let value = phonenumber.getLocationName('+39342652441' + ran, 'zh-CN');
        console.log('i18n_test_7880 ' + value);
        expect(value).assertEqual('意大利');
        let value2 = phonenumber.getLocationName('+39 342652441' + ran, 'zh-CN');
        console.log('i18n_test_7880 ' + value2);
        expect(value2).assertEqual('意大利');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7890
    * @tc.name test getLocationName method with +34... num in zh-CN locale
    * @tc.desc get the getLocationName value
    */
    it('i18n_test_7890', 0, function () {
        console.log('i18n_test_7890 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let ran = Math.ceil(Math.random(1) * 9);
        console.log('i18n_test_7890 ' + ran);
        let value1 = phonenumber.getLocationName('+3460724205' + ran, 'zh-CN');
        console.log('i18n_test_7890 ' + value1);
        expect(value1).assertEqual('西班牙');
        let value2 = phonenumber.getLocationName('+34 60724205' + ran, 'zh-CN');
        console.log('i18n_test_7890 ' + value2);
        expect(value2).assertEqual('西班牙');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7900
    * @tc.name    test isWeekend interface
    * @tc.desc    get the isWeekend value
    */
    it('i18n_test_7900', 0, function () {
        console.log('i18n_test_7900 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.isWeekend(new Date(2021, 10, 1, 10, 0, 0, 0));
        console.log('i18n_test_7900 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7920
    * @tc.name    test getCalendar interface
    * @tc.desc    get the getCalendar value
    */
     it('i18n_test_7920', 0, function () {
        console.log('i18n_test_7920 ' + 'start');
        let calendar = I18n.getCalendar('ja', 'japanese');
        let name = calendar.getDisplayName('ja');
        console.log('i18n_test_7920 ' + name);
        expect(name).assertEqual('和暦');
        let timezone = calendar.getTimeZone();
        console.log('i18n_test_7920 ' + timezone);
        expect(timezone.length > 0).assertTrue();
        let firstday = calendar.getFirstDayOfWeek();
        console.log('i18n_test_7920 ' + firstday);
        expect(firstday).assertEqual(1);
        let miniday = calendar.getMinimalDaysInFirstWeek();
        console.log('i18n_test_7920 ' + miniday);
        expect(miniday).assertEqual(1);
        let value = calendar.isWeekend(new Date(2022, 10, 1, 10, 0, 0, 0));
        console.log('i18n_test_7920 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7940
    * @tc.name    test getCalendar interface with zh param
    * @tc.desc    get the getCalendar value
    */
    it('i18n_test_7940', 0, function () {
        console.log('i18n_test_7940 ' + 'start');
        let calendar = I18n.getCalendar('zh', 'chinese');
        let name = calendar.getDisplayName('zh');
        console.log('i18n_test_7940 ' + name);
        expect(name).assertEqual('农历');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_7960
    * @tc.name    test getCalendar interface with zh param
    * @tc.desc    get the getCalendar value
    */
    it('i18n_test_7960', 0, function () {
        console.log('i18n_test_7960 ' + 'start');
        let calendar = I18n.getCalendar('zh', 'japanese');
        let name = calendar.getDisplayName('zh');
        console.log('i18n_test_7960 ' + name);
        expect(name).assertEqual('和历');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8000
    * @tc.name    test getDisplayName interface
    * @tc.desc    get the getDisplayName value
    */
    it('i18n_test_8000', 0, function () {
        console.log('i18n_test_8000 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.getDisplayName('zh');
        console.log('i18n_test_8000 ' + value);
        expect(value).assertEqual('公历');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8020
    * @tc.name    test getDisplayName interface with en param
    * @tc.desc    get the getDisplayName value
    */
    it('i18n_test_8020', 0, function () {
        console.log('i18n_test_8020 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.getDisplayName('en');
        console.log('i18n_test_8020 ' + value);
        expect(value).assertEqual('Gregorian Calendar');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8100
    * @tc.name    test get interface
    * @tc.desc    get the get value
    */
    it('i18n_test_8100', 0, function () {
        console.log('i18n_test_8100 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.get('year');
        console.log('i18n_test_8100 ' + value);
        expect(value).assertLarger(0);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8120
    * @tc.name    test get interface with month param
    * @tc.desc    get the get value
    */
     it('i18n_test_8120', 0, function () {
        console.log('i18n_test_8120 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let date1 = new Date(2021, 8, 8, 8, 8, 8, 8);
        calendar.setTime(date1);
        let value = calendar.get('month');
        console.log('i18n_test_8120 ' + value);
        expect(value).assertEqual(8);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8140
    * @tc.name    test get interface with day_of_year param
    * @tc.desc    get the get value
    */
    it('i18n_test_8140', 0, function () {
        console.log('i18n_test_8140 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.get('day_of_year');
        console.log('i18n_test_8140 ' + value);
        expect(value).assertLarger(0);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8200
    * @tc.name    test setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    */
    it('i18n_test_8200', 0, function () {
        console.log('i18n_test_8200 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(1);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('i18n_test_8200 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8220
    * @tc.name    test setMinimalDaysInFirstWeek with 0 param and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    */
    it('i18n_test_8220', 0, function () {
        console.log('i18n_test_8220 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(0);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('i18n_test_8220 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8240
    * @tc.name    test setMinimalDaysInFirstWeek with 8 param and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    */
    it('i18n_test_8240', 0, function () {
        console.log('i18n_test_8240 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(8);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('i18n_test_8240 ' + value);
        expect(value).assertEqual(7);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8260
    * @tc.name    test setMinimalDaysInFirstWeek with 7 param and getMinimalDaysInFirstWeek interface
    * @tc.desc    get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    */
    it('i18n_test_8260', 0, function () {
        console.log('i18n_test_8260 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(7);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.log('i18n_test_8260 ' + value);
        expect(value).assertEqual(7);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8300
    * @tc.name    test setFirstDayOfWeek and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    */
    it('i18n_test_8300', 0, function () {
        console.log('i18n_test_8300 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(1);
        let value = calendar.getFirstDayOfWeek();
        console.log('i18n_test_8300 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8320
    * @tc.name    test setFirstDayOfWeek with 0 param and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    */
    it('i18n_test_8320', 0, function () {
        console.log('i18n_test_8320 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(0);
        let value = calendar.getFirstDayOfWeek();
        console.log('i18n_test_8320 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8340
    * @tc.name    test setFirstDayOfWeek with 7 param and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    */
    it('i18n_test_8340', 0, function () {
        console.log('i18n_test_8340 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(7);
        let value = calendar.getFirstDayOfWeek();
        console.log('i18n_test_8340 ' + value);
        expect(value).assertEqual(7);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8360
    * @tc.name    test setFirstDayOfWeek with 8 param and getFirstDayOfWeek interface
    * @tc.desc    get the setFirstDayOfWeek and getFirstDayOfWeek value
    */
    it('i18n_test_8360', 0, function () {
        console.log('i18n_test_8360 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(8);
        let value = calendar.getFirstDayOfWeek();
        console.log('i18n_test_8360 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8400
    * @tc.name    test setTimeZone and getTimeZone interface
    * @tc.desc    get the setTimeZone and getTimeZone value
    */
    it('i18n_test_8400', 0, function () {
        console.log('i18n_test_8400 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTimeZone('Asia/Shanghai');
        let value = calendar.getTimeZone();
        console.log('i18n_test_8400 ' + value);
        expect(value).assertEqual('China Standard Time');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8420
    * @tc.name    test setTimeZone with AAA param and getTimeZone interface
    * @tc.desc    get the setTimeZone and getTimeZone value
    */
    it('i18n_test_8420', 0, function () {
        console.log('i18n_test_8420 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTimeZone('AAA');
        let value = calendar.getTimeZone();
        console.log('i18n_test_8420 ' + value);
        expect(value).assertEqual('GMT');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8500
    * @tc.name    test set interface
    * @tc.desc    get the set value
    */
    it('i18n_test_8500', 0, function () {
        console.log('i18n_test_8500 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.set(2021, 11, 11);
        let value = calendar.isWeekend();
        console.log('i18n_test_8500 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8520
    * @tc.name    test set interface with hour,minute,second param
    * @tc.desc    get the set value
    */
    it('i18n_test_8520', 0, function () {
        console.log('i18n_test_8520 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.set(2021, 11, 11, 10, 10, 10);
        let value = calendar.isWeekend();
        console.log('i18n_test_8520 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8540
    * @tc.name    test set interface with hour,minute param
    * @tc.desc    get the set value
    */
    it('i18n_test_8540', 0, function () {
        console.log('i18n_test_8540 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.set(2021, 11, 11, 10, 10);
        let value = calendar.isWeekend();
        console.log('i18n_test_8540 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8600
    * @tc.name    test setTime interface with date param
    * @tc.desc    get the setTime value
    */
    it('i18n_test_8600', 0, function () {
        console.log('i18n_test_8600 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        //actuall month is 9
        let date1 = new Date(2021, 8, 8, 8, 8, 8, 8);
        calendar.setTime(date1);
        let value = calendar.isWeekend();
        console.log('i18n_test_8600 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8620
    * @tc.name    test setTime interface with wrong month param
    * @tc.desc    get the setTime value
    */
    it('i18n_test_8620', 0, function () {
        console.log('i18n_test_8620 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let date1 = new Date(2021, 18, 8, 8, 8, 8, 8);
        calendar.setTime(date1);
        let value = calendar.isWeekend();
        console.log('i18n_test_8620 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8700
    * @tc.name    test setTime interface
    * @tc.desc    get the setTime value
    */
    it('i18n_test_8700', 0, function () {
        console.log('i18n_test_8700 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTime(10540800000);
        let value = calendar.isWeekend();
        console.log('i18n_test_8700 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8800
    * @tc.name    test isRTL interface with zh-CN param
    * @tc.desc    get the isRTL value
    */
    it('i18n_test_8800', 0, function () {
        console.log('i18n_test_8800 ' + 'start');
        let value = I18n.isRTL('zh-CN');
        console.log('i18n_test_8800 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8900
    * @tc.name    test isRTL interface with en-US param
    * @tc.desc    get the isRTL value
    */
    it('i18n_test_8900', 0, function () {
        console.log('i18n_test_8900 ' + 'start');
        let value = I18n.isRTL('en-US');
        console.log('i18n_test_8900 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9000
    * @tc.name    test isRTL interface with ar param
    * @tc.desc    get the isRTL value
    */
    it('i18n_test_9000', 0, function () {
        console.log('i18n_test_9000 ' + 'start');
        let value = I18n.isRTL('ar');
        console.log('i18n_test_9000 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9100
    * @tc.name    test unitConvert interface from cup to liter unit with long style
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9100', 0, function () {
        console.log('i18n_test_9100 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'cup', measureSystem: 'US'}, 
                                        {unit: 'liter', measureSystem: 'SI'}, 
                                        1000, 
                                        'en-US', 
                                        'long');
        console.log('i18n_test_9100 ' + value);
        expect(value).assertEqual('236.588 liters');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9200
    * @tc.name    test unitConvert interface from cup to liter unit with medium style
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9200', 0, function () {
        console.log('i18n_test_9200 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'cup', measureSystem: 'US'}, 
                                        {unit: 'liter', measureSystem: 'SI'}, 
                                        1000, 
                                        'en-US', 
                                        'medium');
        console.log('i18n_test_9200 ' + value);
        expect(value).assertEqual('236.588 L');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9250
    * @tc.name    test unitConvert interface from cup to liter unit with narrow style
    * @tc.desc    get the unitConvert value
    */
     it('i18n_test_9250', 0, function () {
        console.log('i18n_test_9250 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'cup', measureSystem: 'US'},
            {unit: 'liter', measureSystem: 'SI'},
            1000,
            'en-US',
            'narrow');
        console.log('i18n_test_9250 ' + value);
        expect(value).assertEqual('236.588L');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9300
    * @tc.name    test unitConvert interface from cup to liter unit with short style
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9300', 0, function () {
        console.log('i18n_test_9300 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'cup', measureSystem: 'US'}, 
                                        {unit: 'liter', measureSystem: 'SI'}, 
                                        1000, 
                                        'en-US', 
                                        'short');
        console.log('i18n_test_9300 ' + value);
        expect(value).assertEqual('236.588 L');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9400
    * @tc.name    test unitConvert interface from meter to mile unit
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9400', 0, function () {
        console.log('i18n_test_9400 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'}, 
                                        {unit: 'mile', measureSystem: 'SI'}, 
                                        1000, 
                                        'zh-CN', 
                                        'long');
        console.log('i18n_test_9400 ' + value);
        expect(value).assertEqual('0.621英里');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9500
    * @tc.name    test unitConvert interface from hour to second unit
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9500', 0, function () {
        console.log('i18n_test_9500 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'hour', measureSystem: 'SI'}, 
                                        {unit: 'second', measureSystem: 'SI'}, 
                                        10, 
                                        'zh-CN', 
                                        'medium');
        console.log('i18n_test_9500 ' + value);
        expect(value).assertEqual('36,000秒');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9600
    * @tc.name    test unitConvert interface from celsius to fahrenheit unit
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9600', 0, function () {
        console.log('i18n_test_9600 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'celsius', measureSystem: 'SI'}, 
                                        {unit: 'fahrenheit', measureSystem: 'SI'}, 
                                        1000, 
                                        'zh-CN', 
                                        'short');
        console.log('i18n_test_9600 ' + value);
        expect(value).assertEqual('1,832°F');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9700
    * @tc.name    test unitConvert interface from acre to hectare unit
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9700', 0, function () {
        console.log('i18n_test_9700 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'acre', measureSystem: 'SI'}, 
                                        {unit: 'hectare', measureSystem: 'SI'}, 
                                        1000, 
                                        'zh-CN', 
                                        'long');
        console.log('i18n_test_9700 ' + value);
        expect(value).assertEqual('404.686公顷');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9710
    * @tc.name    test unitConvert interface from acre to square-meter unit
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9710', 0, function () {
        console.log('i18n_test_9710 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'acre', measureSystem: 'SI'}, 
                                        {unit: 'square-meter', measureSystem: 'SI'}, 
                                        1000, 
                                        'zh-CN', 
                                        'long');
        console.log('i18n_test_9710 ' + value);
        expect(value).assertEqual('4,046,856.422平方米');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9800
    * @tc.name    test unitConvert interface from kilometer-per-hour to knot unit
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9800', 0, function () {
        console.log('i18n_test_9800 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'kilometer-per-hour', measureSystem: 'SI'}, 
                                        {unit: 'knot', measureSystem: 'SI'}, 
                                        1000, 
                                        'zh-CN', 
                                        'long');
        console.log('i18n_test_9800 ' + value);
        expect(value).assertEqual('539.957节');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9850
    * @tc.name    test unitConvert interface from kilometer-per-hour to meter-per-second unit
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9850', 0, function () {
        console.log('i18n_test_9850 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'kilometer-per-hour', measureSystem: 'SI'}, 
                                        {unit: 'meter-per-second', measureSystem: 'SI'}, 
                                        1000, 
                                        'zh-CN', 
                                        'long');
        console.log('i18n_test_9850 ' + value);
        expect(value).assertEqual('每秒277.778米');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9900
    * @tc.name    test unitConvert interface from meter to kilometer unit
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9900', 0, function () {
        console.log('i18n_test_9900 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'}, 
                                        {unit: 'kilometer', measureSystem: 'SI'}, 
                                        1000, 
                                        'zh-CN', 
                                        'long');
        console.log('i18n_test_9900 ' + value);
        expect(value).assertEqual('1公里');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9910
    * @tc.name    test unitConvert interface from meter to meter-per-second unit
    * @tc.desc    get the unitConvert value
    */
    it('i18n_test_9910', 0, function () {
        console.log('i18n_test_9910 ' + 'start');
        let value = I18n.I18NUtil.unitConvert({unit: 'meter', measureSystem: 'SI'}, 
                                        {unit: 'meter-per-second', measureSystem: 'SI'}, 
                                        1000, 
                                        'zh-CN', 
                                        'long');
        console.log('i18n_test_9910 ' + value);
        expect(value).assertEqual('1,000米');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0100
    * @tc.name    test current interface
    * @tc.desc    check the current result
    */
    it('i18n_test_iterator_0100', 0, function () {
        console.log('i18n_test_iterator_0100 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.current();
        console.log('i18n_test_iterator_0100 ' + value);
        expect(value).assertEqual(0);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0200
    * @tc.name    test first interface
    * @tc.desc    check the first
    */
    it('i18n_test_iterator_0200', 0, function () {
        console.log('i18n_test_iterator_0200 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.first();
        console.log('i18n_test_iterator_0200 ' + value);
        expect(value).assertEqual(0);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0300
    * @tc.name    test last interface
    * @tc.desc    check the last interface
    */
    it('i18n_test_iterator_0300', 0, function () {
        console.log('i18n_test_iterator_0300 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.last();
        console.log('i18n_test_iterator_0300 ' + value);
        expect(value).assertEqual(40);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0400
    * @tc.name    test next interface
    * @tc.desc    check the next interface
    */
    it('i18n_test_iterator_0400', 0, function () {
        console.log('i18n_test_iterator_0400 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.next();
        console.log('i18n_test_iterator_0400 ' + value);
        expect(value).assertEqual(3);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0500
    * @tc.name    test next interface with param
    * @tc.desc    check the next interface with param
    */
    it('i18n_test_iterator_0500', 0, function () {
        console.log('i18n_test_iterator_0500 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.next(2);
        console.log('i18n_test_iterator_0500 ' + value);
        expect(value).assertEqual(8);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0600
    * @tc.name    test previous interface
    * @tc.desc    check the previous interface
    */
    it('i18n_test_iterator_0600', 0, function () {
        console.log('i18n_test_iterator_0600 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.previous();
        console.log('i18n_test_iterator_0600 ' + value);
        expect(value).assertEqual(-1);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0700
    * @tc.name    test following interface
    * @tc.desc    check the following interface
    */
    it('i18n_test_iterator_0700', 0, function () {
        console.log('i18n_test_iterator_0700 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.following(1);
        console.log('i18n_test_iterator_0700 ' + value);
        expect(value).assertEqual(3);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0800
    * @tc.name    test getLineBreakText interface
    * @tc.desc    check the getLineBreakText interface
    */
    it('i18n_test_iterator_0800', 0, function () {
        console.log('i18n_test_iterator_0800 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.getLineBreakText();
        console.log('i18n_test_iterator_0800 ' + value);
        expect(value).assertEqual('My name is Tom.Welcome to the sky world.');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_0900
    * @tc.name    test isBoundary interface
    * @tc.desc    check the isBoundary interface
    */
    it('i18n_test_iterator_0900', 0, function () {
        console.log('i18n_test_iterator_0900 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.isBoundary(10);
        console.log('i18n_test_iterator_0900 ' + value);
        expect(value).assertFalse();
        // current
        let current = iterator.current();
        console.log('i18n_test_iterator_0900 ' + current);
        expect(current).assertEqual(11);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_BREAKITERATOR_1000
    * @tc.name    test iterator interface
    * @tc.desc    check the iterator interface
    */
    it('i18n_test_iterator_1000', 0, function () {
        console.log('i18n_test_iterator_1000 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        // current
        let current = iterator.current();
        console.log('i18n_test_iterator_1000 ' + current);
        expect(current).assertEqual(0);
        // next
        let next = iterator.next();
        console.log('i18n_test_iterator_1000 ' + next);
        expect(next).assertEqual(3);
        // current
        let current2 = iterator.current();
        console.log('i18n_test_iterator_1000 ' + current2);
        expect(current2).assertEqual(3);
        // next 5
        let next2 = iterator.next(5);
        console.log('i18n_test_iterator_1000 ' + next2);
        expect(next2).assertEqual(30);
        // previous
        let previous = iterator.previous();
        console.log('i18n_test_iterator_1000 ' + previous);
        expect(previous).assertEqual(26);
        // following 2
        let follwoing = iterator.following(3);
        console.log('i18n_test_iterator_1000 ' + follwoing);
        expect(follwoing).assertEqual(8);
        // current
        let current3 = iterator.current();
        console.log('i18n_test_iterator_1000 ' + current3);
        expect(current3).assertEqual(8);
        // isBoundary
        let value = iterator.isBoundary(3);
        console.log('i18n_test_iterator_1000 ' + value);
        expect(value).assertTrue();
        // current
        let current4 = iterator.current();
        console.log('i18n_test_iterator_1000 ' + current4);
        expect(current4).assertEqual(3);

    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_INDEXUTIL_0100
    * @tc.name    test getIndex interface
    * @tc.desc    check the getIndex interface
    */
    it('i18n_test_indexutil_0100', 0, function () {
        console.log('i18n_test_indexutil_0100 ' + 'start');
        let index = I18n.getInstance();
        let value = index.getIndex('a');
        console.log('i18n_test_indexutil_0100 ' + value);
        expect(value).assertEqual('A');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_INDEXUTIL_0200
    * @tc.name    test getIndexList interface
    * @tc.desc    check the getIndexList interface
    */
    it('i18n_test_indexutil_0200', 0, function () {
        console.log('i18n_test_indexutil_0200 ' + 'start');
        let index = I18n.getInstance();
        let value = index.getIndexList();
        let len = value.length;
        console.log('i18n_test_indexutil_0200 ' + value);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_INDEXUTIL_0300
    * @tc.name    test addLocale interface
    * @tc.desc    check the addLocale interface
    */
    it('i18n_test_indexutil_0300', 0, function () {
        console.log('i18n_test_indexutil_0300 ' + 'start');
        let index = I18n.getInstance();
        index.addLocale('en');
        let value = index.getIndex('a');
        console.log('i18n_test_indexutil_0300 ' + value);
        expect(value).assertEqual('A');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_INDEXUTIL_0400
    * @tc.name    test getInstance interface with zh locale
    * @tc.desc    check the getInstance interface with zh locale
    */
    it('i18n_test_indexutil_0400', 0, function () {
        console.log('i18n_test_indexutil_0400 ' + 'start');
        let index = I18n.getInstance('zh');
        let value = index.getIndex('z');
        console.log('i18n_test_indexutil_0400 ' + value);
        expect(value).assertEqual('Z');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0100
    * @tc.name    test isDigit interface
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_0100', 0, function () {
        console.log('i18n_test_character_0100 ' + 'start');
        let value = I18n.Unicode.isDigit('abc');
        console.log('i18n_test_character_0100 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0120
    * @tc.name    test isDigit interface with 123 param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_0120', 0, function () {
        console.log('i18n_test_character_0120 ' + 'start');
        let value = I18n.Unicode.isDigit('123');
        console.log('i18n_test_character_0120 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0140
    * @tc.name    test isDigit interface with 123abc param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_0140', 0, function () {
        console.log('i18n_test_character_0140 ' + 'start');
        let value = I18n.Unicode.isDigit('123abc');
        console.log('i18n_test_character_0140 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0150
    * @tc.name    test isDigit interface with abc123 param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_0150', 0, function () {
        console.log('i18n_test_character_0150 ' + 'start');
        let value = I18n.Unicode.isDigit('abc123');
        console.log('i18n_test_character_0150 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0160
    * @tc.name    test isDigit interface with null param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_0160', 0, function () {
        console.log('i18n_test_character_0160 ' + 'start');
        let value = I18n.Unicode.isDigit('');
        console.log('i18n_test_character_0160 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0200
    * @tc.name    test isSpaceChar interface with abc param
    * @tc.desc    check the isSpaceChar interface
    */
    it('i18n_test_character_0200', 0, function () {
        console.log('i18n_test_character_0200 ' + 'start');
        let value = I18n.Unicode.isSpaceChar('abc');
        console.log('i18n_test_character_0200 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0220
    * @tc.name    test isSpaceChar interface with one space param
    * @tc.desc    check the isSpaceChar interface
    */
    it('i18n_test_character_0220', 0, function () {
        console.log('i18n_test_character_0220 ' + 'start');
        let value = I18n.Unicode.isSpaceChar(' ');
        console.log('i18n_test_character_0220 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0240
    * @tc.name    test isSpaceChar interface with multi space param
    * @tc.desc    check the isSpaceChar interface
    */
    it('i18n_test_character_0240', 0, function () {
        console.log('i18n_test_character_0240 ' + 'start');
        let value = I18n.Unicode.isSpaceChar('   ');
        console.log('i18n_test_character_0240--' + value + '--');
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0300
    * @tc.name    test isWhitespace interface with abc param
    * @tc.desc    check the isWhitespace interface
    */
    it('i18n_test_character_0300', 0, function () {
        console.log('i18n_test_character_0300 ' + 'start');
        let value = I18n.Unicode.isWhitespace('abc');
        console.log('i18n_test_character_0300 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0320
    * @tc.name    test isWhitespace interface with \u0009 param
    * @tc.desc    check the isWhitespace interface
    */
    it('i18n_test_character_0320', 0, function () {
        console.log('i18n_test_character_0320 ' + 'start');
        let value = I18n.Unicode.isWhitespace('\u0009');
        console.log('i18n_test_character_0320--' + value + '--');
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0400
    * @tc.name    test isRTL interface with abc param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_0400', 0, function () {
        console.log('i18n_test_character_0400 ' + 'start');
        let value = I18n.Unicode.isRTL('abc');
        console.log('i18n_test_character_0400 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0420
    * @tc.name    test isRTL interface with ١٢٣٤٥٦٧ param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_0420', 0, function () {
        console.log('i18n_test_character_0420 ' + 'start');
        let value = I18n.Unicode.isRTL('١٢٣٤٥٦٧');
        console.log('i18n_test_character_0420 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0440
    * @tc.name    test isRTL interface with 我是小明 param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_0440', 0, function () {
        console.log('i18n_test_character_0440 ' + 'start');
        let value = I18n.Unicode.isRTL('我是小明');
        console.log('i18n_test_character_0440 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0460
    * @tc.name    test isRTL interface with نحن param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_0460', 0, function () {
        console.log('i18n_test_character_0460 ' + 'start');
        let value = I18n.Unicode.isRTL('نحن');
        console.log('i18n_test_character_0460 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0500
    * @tc.name    test isIdeograph interface with abc param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_0500', 0, function () {
        console.log('i18n_test_character_0500 ' + 'start');
        let value = I18n.Unicode.isIdeograph('abc');
        console.log('i18n_test_character_0500 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0520
    * @tc.name    test isIdeograph interface with '我' param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_0520', 0, function () {
        console.log('i18n_test_character_0520 ' + 'start');
        let value = I18n.Unicode.isIdeograph('我');
        console.log('i18n_test_character_0520 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0540
    * @tc.name    test isIdeograph interface with '우리' param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_0540', 0, function () {
        console.log('i18n_test_character_0540 ' + 'start');
        let value = I18n.Unicode.isIdeograph('우리');
        console.log('i18n_test_character_0540 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0560
    * @tc.name    test isIdeograph interface with '私た' param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_0560', 0, function () {
        console.log('i18n_test_character_0560 ' + 'start');
        let value = I18n.Unicode.isIdeograph('私たち');
        console.log('i18n_test_character_0560 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0600
    * @tc.name    test isLetter interface with abc param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_0600', 0, function () {
        console.log('i18n_test_character_0600 ' + 'start');
        let value = I18n.Unicode.isLetter('abc');
        console.log('i18n_test_character_0600 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0620
    * @tc.name    test isLetter interface with 123 param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_0620', 0, function () {
        console.log('i18n_test_character_0620 ' + 'start');
        let value = I18n.Unicode.isLetter('123');
        console.log('i18n_test_character_0620 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0640
    * @tc.name    test isLetter interface with abc123 param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_0640', 0, function () {
        console.log('i18n_test_character_0640 ' + 'start');
        let value = I18n.Unicode.isLetter('abc123');
        console.log('i18n_test_character_0640 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0660
    * @tc.name    test isLetter interface with 123abc param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_0660', 0, function () {
        console.log('i18n_test_character_0660 ' + 'start');
        let value = I18n.Unicode.isLetter('123abc');
        console.log('i18n_test_character_0660 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0700
    * @tc.name    test isLowerCase interface with abc param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_0700', 0, function () {
        console.log('i18n_test_character_0700 ' + 'start');
        let value = I18n.Unicode.isLowerCase('abc');
        console.log('i18n_test_character_0700 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0720
    * @tc.name    ftest isLowerCase interface with ABC param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_0720', 0, function () {
        console.log('i18n_test_character_0720 ' + 'start');
        let value = I18n.Unicode.isLowerCase('ABC');
        console.log('i18n_test_character_0720 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0740
    * @tc.name    test isLowerCase interface with abcDEF param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_0740', 0, function () {
        console.log('i18n_test_character_0740 ' + 'start');
        let value = I18n.Unicode.isLowerCase('abcDEF');
        console.log('i18n_test_character_0740 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0760
    * @tc.name    test isLowerCase interface with ABCdef param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_0760', 0, function () {
        console.log('i18n_test_character_0760 ' + 'start');
        let value = I18n.Unicode.isLowerCase('ABCdef');
        console.log('i18n_test_character_0760 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0800
    * @tc.name    test isUpperCase interface with ABC param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_0800', 0, function () {
        console.log('i18n_test_character_0800 ' + 'start');
        let value = I18n.Unicode.isUpperCase('ABC');
        console.log('i18n_test_character_0800 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0820
    * @tc.name    test isUpperCase interface with abc param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_0820', 0, function () {
        console.log('i18n_test_character_0820 ' + 'start');
        let value = I18n.Unicode.isUpperCase('abc');
        console.log('i18n_test_character_0820 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0840
    * @tc.name    test isUpperCase interface with ABCdef param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_0840', 0, function () {
        console.log('i18n_test_character_0840 ' + 'start');
        let value = I18n.Unicode.isUpperCase('ABCdef');
        console.log('i18n_test_character_0840 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0860
    * @tc.name    test isUpperCase interface with abcDEF param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_0860', 0, function () {
        console.log('i18n_test_character_0860 ' + 'start');
        let value = I18n.Unicode.isUpperCase('abcDEF');
        console.log('i18n_test_character_0860 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0900
    * @tc.name    test getType interface with a param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0900', 0, function () {
        console.log('i18n_test_character_0900 ' + 'start');
        let value = I18n.Unicode.getType('a');
        console.log('i18n_test_character_0900 ' + value);
        expect(value).assertEqual('U_LOWERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0920
    * @tc.name    ftest getType interface with ABC param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0920', 0, function () {
        console.log('i18n_test_character_0920 ' + 'start');
        let value = I18n.Unicode.getType('ABC');
        console.log('i18n_test_character_0920 ' + value);
        expect(value).assertEqual('U_UPPERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0940
    * @tc.name    test getType interface with ABCdef param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0940', 0, function () {
        console.log('i18n_test_character_0940 ' + 'start');
        let value = I18n.Unicode.getType('ABCdef');
        console.log('i18n_test_character_0940 ' + value);
        expect(value).assertEqual('U_UPPERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0960
    * @tc.name    test getType interface with 123 param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0960', 0, function () {
        console.log('i18n_test_character_0960 ' + 'start');
        let value = I18n.Unicode.getType('123');
        console.log('i18n_test_character_0960 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0970
    * @tc.name    test getType interface with 123abc param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0970', 0, function () {
        console.log('i18n_test_character_0970 ' + 'start');
        let value = I18n.Unicode.getType('123abc');
        console.log('i18n_test_character_0970 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0980
    * @tc.name    test getType interface with ١٢٣٤٥٦٧ param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0980', 0, function () {
        console.log('i18n_test_character_0980 ' + 'start');
        let value = I18n.Unicode.getType('١٢٣٤٥٦٧');
        console.log('i18n_test_character_0980 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0990
    * @tc.name    test getType interface with multi space param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0990', 0, function () {
        console.log('i18n_test_character_0990 ' + 'start');
        let value = I18n.Unicode.getType('   ');
        console.log('i18n_test_character_0990 ' + value);
        expect(value).assertEqual('U_SPACE_SEPARATOR');
    })

    console.log('*************end I18NTest*************');
})}
