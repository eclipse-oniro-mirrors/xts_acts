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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function LocaleInIntlTest() {
describe('LocaleInIntlTest', function () {
    console.log('*************start LocaleInIntlTest*************');

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
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0100
    * @tc.name    test the language in en-Latn-GB locale
    * @tc.desc    check the language
    */
    it('locale_test_0100', 0, function () {
        let locale = new Intl.Locale('en-Latn-GB');
        console.log('locale_test_0100 ' + locale.language);
        expect(locale.language).assertEqual('en');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0120
    * @tc.name    test the language in en-Latn-GB locale
    * @tc.desc    check the language
    */
    it('locale_test_0120', 0, function () {
        let locale = new Intl.Locale('en-Latn-GB', undefined);
        console.log('locale_test_0120 ' + locale.language);
        console.log('locale_test_0120 ' + locale.numeric);
        expect(locale.language).assertEqual('en');
        expect(locale.numeric).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0130
    * @tc.name    test the language in en-Latn-GB locale
    * @tc.desc    check the language
    */
    it('locale_test_0130', 0, function () {
        let locale = new Intl.Locale('en-Latn-GB', null);
        console.log('locale_test_0130 ' + locale.language);
        console.log('locale_test_0130 ' + locale.numeric);
        expect(locale.language).assertEqual('en');
        expect(locale.numeric).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0140
    * @tc.name    test the language in locale
    * @tc.desc    check the language
    */
    it('locale_test_0140', 0, function () {
        let locale = new Intl.Locale();
        console.log('locale_test_0140 ' + locale.language);
        console.log('locale_test_0140 ' + locale.numeric);
        expect(locale.numeric).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0200
    * @tc.name    test the language in ja-Jpan-JP-u-ca-japanese-hc-h12-co-emoji locale
    * @tc.desc    check the language
    */
    it('locale_test_0200', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12-co-emoji');
        console.log('locale_test_0200 ' + locale.language);
        expect(locale.language).assertEqual('ja');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0300
    * @tc.name    test the script in locale
    * @tc.desc    check the script
    */
    it('locale_test_0300', 0, function () {
        let locale = new Intl.Locale('en-Latn-GB');
        console.log('locale_test_0300 ' + locale.script);
        expect(locale.script).assertEqual('Latn');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0400
    * @tc.name    test the region in locale
    * @tc.desc    check the region
    */
    it('locale_test_0400', 0, function () {
        let locale = new Intl.Locale('en-Latn-GB');
        console.log('locale_test_0400 ' + locale.region);
        expect(locale.region).assertEqual('GB');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0500
    * @tc.name    test the basename in locale
    * @tc.desc    check the basename
    */
    it('locale_test_0500', 0, function () {
        let locale = new Intl.Locale('en-Latn-GB');
        console.log('locale_test_0500 ' + locale.baseName);
        expect(locale.baseName).assertEqual('en-Latn-GB');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0600
    * @tc.name    test the basename in ja-Jpan-JP-u-ca-japanese-hc-h12
    * @tc.desc    check the ja-Jpan-JP-u-ca-japanese-hc-h12 basename
    */
    it('locale_test_0600', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
        console.log('locale_test_0600 ' + locale.baseName);
        expect(locale.baseName).assertEqual('ja-Jpan-JP');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0700
    * @tc.name    test the hourCycle
    * @tc.desc    check the hourCycle
    */
    it('locale_test_0700', 0, function () {
        let locale = new Intl.Locale('zh-CN', {hourCycle: 'h24', calendar: 'gregory'});
        console.log('locale_test_0700 ' + locale.hourCycle);
        expect(locale.hourCycle).assertEqual('h24');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0800
    * @tc.name    test the calendar
    * @tc.desc    check the calendar
    */
    it('locale_test_0800', 0, function () {
        let locale = new Intl.Locale('zh-CN', {hourCycle: 'h24', calendar: 'gregory'});
        console.log('locale_test_0800 ' + locale.calendar);
        expect(locale.calendar).assertEqual('gregory');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_0900
    * @tc.name    test the japanese calendar
    * @tc.desc    check the japanese calendar
    */
    it('locale_test_0900', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
        console.log('locale_test_0900 ' + locale.calendar);
        expect(locale.calendar).assertEqual('japanese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1000
    * @tc.name    test the h12 hourCycle
    * @tc.desc    check the h12 hourCycle
    */
    it('locale_test_1000', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
        console.log('locale_test_1000 ' + locale.hourCycle);
        expect(locale.hourCycle).assertEqual('h12');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1100
    * @tc.name    test the caseFirst with upper
    * @tc.desc    check the caseFirst
    */
    it('locale_test_1100', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {caseFirst: 'upper'});
        console.log('locale_test_1100 ' + locale.caseFirst);
        expect(locale.caseFirst).assertEqual('upper');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1120
    * @tc.name    test the caseFirst with lower
    * @tc.desc    check the caseFirst
    */
    it('locale_test_1120', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {caseFirst: 'lower'});
        console.log('locale_test_1120 ' + locale.caseFirst);
        expect(locale.caseFirst).assertEqual('lower');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1140
    * @tc.name    test the caseFirst with false
    * @tc.desc    check the caseFirst
    */
    it('locale_test_1140', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {caseFirst: 'false'});
        console.log('locale_test_1140 ' + locale.caseFirst);
        expect(locale.caseFirst).assertEqual('false');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1200
    * @tc.name    test the collation
    * @tc.desc    check the collation
    */
    it('locale_test_1200', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {collation: 'big5han'});
        console.log('locale_test_1200 ' + locale.collation);
        expect(locale.collation).assertEqual('big5han');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1300
    * @tc.name    test the numeric with true value
    * @tc.desc    check the numeric
    */
    it('locale_test_1300', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {numeric: true});
        console.log('locale_test_1300 ' + locale.numeric);
        expect(locale.numeric).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1350
    * @tc.name    test the numeric with false value
    * @tc.desc    check the numeric
    */
    it('locale_test_1350', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {numeric: false});
        console.log('locale_test_1350 ' + locale.numeric);
        expect(locale.numeric).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1400
    * @tc.name    test the numberingSystem
    * @tc.desc    check the numberingSystem
    */
    it('locale_test_1400', 0, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {numberingSystem: 'arab'});
        console.log('locale_test_1400 ' + locale.numberingSystem);
        expect(locale.numberingSystem).assertEqual('arab');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1500
    * @tc.name    test the toString interface with zh
    * @tc.desc    check the toString method with zh
    */
    it('locale_test_1500', 0, function () {
        let locale = new Intl.Locale('zh');
        console.log('locale_test_1500 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1600
    * @tc.name    test the toString interface with zh-CN
    * @tc.desc    check the toString method with zh-CN
    */
    it('locale_test_1600', 0, function () {
        let locale = new Intl.Locale('zh-CN');
        console.log('locale_test_1600 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-CN');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1700
    * @tc.name    test the toString interface with zh-Hans-CN
    * @tc.desc    check the toString method with zh-Hans-CN
    */
    it('locale_test_1700', 0, function () {
        let locale = new Intl.Locale('zh-Hans-CN');
        console.log('locale_test_1700 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-Hans-CN');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1800
    * @tc.name    test the toString interface with zh-Hans-CN-u-hc-h12-ca-japanese
    * @tc.desc    check the toString method with zh-Hans-CN-u-hc-h12-ca-japanese
    */
    it('locale_test_1800', 0, function () {
        let locale = new Intl.Locale('zh-Hans-CN-u-ca-japanese-hc-h12');
        console.log('locale_test_1800 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-Hans-CN-u-hc-h12-ca-japanese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_1900
    * @tc.name    test the maximize interface with zh-u-ca-gregory-co-compact param
    * @tc.desc    check the maximize method with zh-u-ca-gregory-co-compact param
    */
    it('locale_test_1900', 0, function () {
        let locale = new Intl.Locale('zh', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_1900 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2000
    * @tc.name    test the toString interface with zh-CN-u-ca-gregory-co-compact param
    * @tc.desc    check the toString method with zh-CN-u-ca-gregory-co-compact param
    */
    it('locale_test_2000', 0, function () {
        let locale = new Intl.Locale('zh-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2000 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-CN-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2100
    * @tc.name    test the toString interface with zh-hans-CN-u-ca-gregory-co-compact param
    * @tc.desc    check the toString method with zh-hans-CN-u-ca-gregory-co-compact param
    */
    it('locale_test_2100', 0, function () {
        let locale = new Intl.Locale('zh-hans-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2100 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-hans-CN-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2200
    * @tc.name    test the minimize interface with one param zh
    * @tc.desc    check the minimize method with one param zh
    */
    it('locale_test_2200', 0, function () {
        let locale = new Intl.Locale('zh');
        console.log('locale_test_2200 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2201
    * @tc.name    test the minimize interface with one param zh-CN
    * @tc.desc    check the minimize method with one param zh-CN
    */
    it('locale_test_2201', 0, function () {
        let locale = new Intl.Locale('zh-CN');
        console.log('locale_test_2201 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2202
    * @tc.name    test the minimize interface with one param zh-Hans-CN
    * @tc.desc    check the minimize method with one param zh-Hans-CN
    */
    it('locale_test_2202', 0, function () {
        let locale = new Intl.Locale('zh-Hans-CN');
        console.log('locale_test_2202 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2203
    * @tc.name    test the minimize interface with one param zh-Hans-CN-u-ca-gregory-co-compact
    * @tc.desc    check the minimize method with one param zh-Hans-CN-u-ca-gregory-co-compact
    */
    it('locale_test_2203', 0, function () {
        let locale = new Intl.Locale('zh-Hans-CN-u-ca-gregory-co-compact');
        console.log('locale_test_2203 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2204
    * @tc.name    test the minimize interface with zh lcoale
    * @tc.desc    check the minimize method with zh lcoale
    */
    it('locale_test_2204', 0, function () {
        let locale = new Intl.Locale('zh', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2204 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2205
    * @tc.name    test the minimize interface with zh-CN lcoale
    * @tc.desc    check the minimize method with zh-CN lcoale
    */
    it('locale_test_2205', 0, function () {
        let locale = new Intl.Locale('zh-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2205 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2206
    * @tc.name    test the minimize interface with zh-Hans-CN lcoale
    * @tc.desc    check the minimize method with zh-Hans-CN lcoale
    */
    it('locale_test_2206', 0, function () {
        let locale = new Intl.Locale('zh-hans-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2206 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2300
    * @tc.name    test the maximize interface with one param zh
    * @tc.desc    check the maximize method with one param zh
    */
    it('locale_test_2300', 0, function () {
        let locale = new Intl.Locale('zh');
        console.log('locale_test_2300 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2301
    * @tc.name    test the maximize interface with one param zh-CN
    * @tc.desc    check the maximize method with one param zh-CN
    */
    it('locale_test_2301', 0, function () {
        let locale = new Intl.Locale('zh-CN');
        console.log('locale_test_2301 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2302
    * @tc.name    test the maximize interface with one param zh-Hans-CN-u-ca-gregory-co-compact
    * @tc.desc    check the maximize method with one param zh-Hans-CN-u-ca-gregory-co-compact
    */
    it('locale_test_2302', 0, function () {
        let locale = new Intl.Locale('zh-Hans-CN');
        console.log('locale_test_2302 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2303
    * @tc.name    test the maximize interface with zh-Hans-CN-u-ca-gregory-co-compact locale
    * @tc.desc    check the maximize method with zh-Hans-CN-u-ca-gregory-co-compact locale
    */
    it('locale_test_2303', 0, function () {
        let locale = new Intl.Locale('zh-Hans-CN-u-ca-gregory-co-compact');
        console.log('locale_test_2303 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2304
    * @tc.name    test the maximize interface with zh locale
    * @tc.desc    check the maximize method with zh locale
    */
    it('locale_test_2304', 0, function () {
        let locale = new Intl.Locale('zh', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2304 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2305
    * @tc.name    test the maximize interface with zh-CN locale
    * @tc.desc    check the maximize method with zh-CN locale
    */
    it('locale_test_2305', 0, function () {
        let locale = new Intl.Locale('zh-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2305 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_LOCALE_2306
    * @tc.name    test the maximize interface with zh-Hans-CN locale
    * @tc.desc    check the maximize method with zh-Hans-CN locale
    */
    it('locale_test_2306', 0, function () {
        let locale = new Intl.Locale('zh-Hans-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2306 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    console.log('*************end LocaleInIntlTest*************');
})}
