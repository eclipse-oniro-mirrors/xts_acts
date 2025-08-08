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

export default function RelativeTimeFormatInIntlTest() {
describe('RelativeTimeFormatInIntlTest', function () {
    console.log('*************start RelativeTimeFormatInIntlTest*************');

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
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0100
    * @tc.name    format the relativetime with 100 second
    * @tc.desc    check the relativetime
    */
    it('i18n_test_relativetimeformat_0100', 0, function () {
        console.log('i18n_test_relativetimeformat_0100 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat();
        let value = relativetimefmt.format(100,'second');
        console.log('i18n_test_relativetimeformat_0100 ' + value);
        expect(value).assertContain('100');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0200
    * @tc.name    format the relativetime with 100 second in en
    * @tc.desc    check the relativetime
    */
    it('i18n_test_relativetimeformat_0200', 0, function () {
        console.log('i18n_test_relativetimeformat_0200 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat('en');
        let value = relativetimefmt.format(100,'second');
        console.log('i18n_test_relativetimeformat_0200 ' + value);
        expect(value !== null).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0220
    * @tc.name    format the relativetime with 100 second in en and undefined options
    * @tc.desc    check the relativetime
    */
    it('i18n_test_relativetimeformat_0220', 0, function () {
        console.log('i18n_test_relativetimeformat_0220 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat('en', undefined);
        let value = relativetimefmt.format(100,'second');
        console.log('i18n_test_relativetimeformat_0220 ' + value);
        expect(value !== null).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0240
    * @tc.name    format the relativetime with 100 second in en and null options
    * @tc.desc    check the relativetime
    */
    it('i18n_test_relativetimeformat_0240', 0, function () {
        console.log('i18n_test_relativetimeformat_0240 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat('en', null);
        let value = relativetimefmt.format(100,'second');
        console.log('i18n_test_relativetimeformat_0240 ' + value);
        expect(value !== null).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0300
    * @tc.name    format the relativetime with 100 second in narrow style
    * @tc.desc    check the relativetime
    */
    it('i18n_test_relativetimeformat_0300', 0, function () {
        console.log('i18n_test_relativetimeformat_0300 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat('en', { style: 'narrow' });
        let value = relativetimefmt.format(100,'second');
        console.log('i18n_test_relativetimeformat_0300 ' + value);
        expect(value).assertEqual('in 100 sec.');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0400
    * @tc.name    format the relativetime with 100 second, get the formatToParts value
    * @tc.desc    check the formatToParts value
    */
    it('i18n_test_relativetimeformat_0400', 0, function () {
        console.log('i18n_test_relativetimeformat_0400 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat('en');
        let value = relativetimefmt.formatToParts(100,'second');
        console.log('i18n_test_relativetimeformat_0400 ' + value[0].value + 'value');
        expect(value[0].value).assertEqual('in ');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0500
    * @tc.name    format the relativetime, get the locale options
    * @tc.desc    check the relativetime
    */
    it('i18n_test_relativetimeformat_0500', 0, function () {
        console.log('i18n_test_relativetimeformat_0500 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat('en');
        let value = relativetimefmt.resolvedOptions();
        console.log('i18n_test_relativetimeformat_0500 ' + value);
        expect(value.locale).assertEqual('en');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0600
    * @tc.name    format the relativetime, get the style options
    * @tc.desc    check the relativetime
    */
    it('i18n_test_relativetimeformat_0600', 0, function () {
        console.log('i18n_test_relativetimeformat_0600 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat('en');
        let value = relativetimefmt.resolvedOptions();
        console.log('i18n_test_relativetimeformat_0600 ' + value);
        expect(value !== null).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0700
    * @tc.name    format the relativetime, get the numeric options
    * @tc.desc    check the relativetime
    */
    it('i18n_test_relativetimeformat_0700', 0, function () {
        console.log('i18n_test_relativetimeformat_0700 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat('en');
        let value = relativetimefmt.resolvedOptions();
        console.log('i18n_test_relativetimeformat_0700 ' + value);
        expect(value.numeric).assertEqual('always');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0800
    * @tc.name    format the relativetime, get the numberingSystem options
    * @tc.desc    check the relativetime
    */
    it('i18n_test_relativetimeformat_0800', 0, function () {
        console.log('i18n_test_relativetimeformat_0800 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat('en');
        let value = relativetimefmt.resolvedOptions();
        console.log('i18n_test_relativetimeformat_0800 ' + value.numberingSystem);
        expect(value.numberingSystem).assertEqual('latn');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_RELATIVETIMEFORMAT_0900
    * @tc.name    format the relativetime with localeMatcher options
    * @tc.desc    check the relativetime
    */
    it('i18n_test_relativetimeformat_0900', 0, function () {
        console.log('i18n_test_relativetimeformat_0900 ' + 'start');
        let relativetimefmt = new Intl.RelativeTimeFormat('en', { localeMatcher: 'best fit', numeric: 'auto', style: 'narrow' });
        let value = relativetimefmt.resolvedOptions();
        console.log('i18n_test_relativetimeformat_0900 ' + value);
        expect(value.numeric).assertEqual('auto');
        expect(value.style).assertEqual('narrow');
    })

    console.log('*************end RelativeTimeFormatInIntlTest*************');
})}
