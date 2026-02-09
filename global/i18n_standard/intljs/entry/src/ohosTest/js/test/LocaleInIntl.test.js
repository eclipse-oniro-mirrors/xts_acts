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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

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

    /**
     * @tc.name   locale_test_0100
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0100
     * @tc.desc   check the language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('locale_test_0100', Level.LEVEL0, function () {
        let locale = new Intl.Locale('en-Latn-GB');
        console.log('locale_test_0100 ' + locale.language);
        expect(locale.language).assertEqual('en');
    })

    /**
     * @tc.name   locale_test_0120
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0120
     * @tc.desc   check the language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0120', Level.LEVEL2, function () {
        let locale = new Intl.Locale('en-Latn-GB', undefined);
        console.log('locale_test_0120 ' + locale.language);
        console.log('locale_test_0120 ' + locale.numeric);
        expect(locale.language).assertEqual('en');
        expect(locale.numeric).assertFalse();
    })

    /**
     * @tc.name   locale_test_0130
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0130
     * @tc.desc   check the language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0130', Level.LEVEL2, function () {
        let locale = new Intl.Locale('en-Latn-GB', null);
        console.log('locale_test_0130 ' + locale.language);
        console.log('locale_test_0130 ' + locale.numeric);
        expect(locale.language).assertEqual('en');
        expect(locale.numeric).assertFalse();
    })

    /**
     * @tc.name   locale_test_0140
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0140
     * @tc.desc   check the language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0140', Level.LEVEL2, function () {
        let locale = new Intl.Locale();
        console.log('locale_test_0140 ' + locale.language);
        console.log('locale_test_0140 ' + locale.numeric);
        expect(locale.numeric).assertFalse();
    })

    /**
     * @tc.name   locale_test_0200
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0200
     * @tc.desc   check the language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0200', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12-co-emoji');
        console.log('locale_test_0200 ' + locale.language);
        expect(locale.language).assertEqual('ja');
    })

    /**
     * @tc.name   locale_test_0300
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0300
     * @tc.desc   check the script
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0300', Level.LEVEL2, function () {
        let locale = new Intl.Locale('en-Latn-GB');
        console.log('locale_test_0300 ' + locale.script);
        expect(locale.script).assertEqual('Latn');
    })

    /**
     * @tc.name   locale_test_0400
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0400
     * @tc.desc   check the region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0400', Level.LEVEL2, function () {
        let locale = new Intl.Locale('en-Latn-GB');
        console.log('locale_test_0400 ' + locale.region);
        expect(locale.region).assertEqual('GB');
    })

    /**
     * @tc.name   locale_test_0500
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0500
     * @tc.desc   check the basename
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0500', Level.LEVEL2, function () {
        let locale = new Intl.Locale('en-Latn-GB');
        console.log('locale_test_0500 ' + locale.baseName);
        expect(locale.baseName).assertEqual('en-Latn-GB');
    })

    /**
     * @tc.name   locale_test_0600
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0600
     * @tc.desc   check the ja-Jpan-JP-u-ca-japanese-hc-h12 basename
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0600', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
        console.log('locale_test_0600 ' + locale.baseName);
        expect(locale.baseName).assertEqual('ja-Jpan-JP');
    })

    /**
     * @tc.name   locale_test_0700
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0700
     * @tc.desc   check the hourCycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0700', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-CN', {hourCycle: 'h24', calendar: 'gregory'});
        console.log('locale_test_0700 ' + locale.hourCycle);
        expect(locale.hourCycle).assertEqual('h24');
    })

    /**
     * @tc.name   locale_test_0800
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0800
     * @tc.desc   check the calendar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0800', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-CN', {hourCycle: 'h24', calendar: 'gregory'});
        console.log('locale_test_0800 ' + locale.calendar);
        expect(locale.calendar).assertEqual('gregory');
    })

    /**
     * @tc.name   locale_test_0900
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_0900
     * @tc.desc   check the japanese calendar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_0900', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
        console.log('locale_test_0900 ' + locale.calendar);
        expect(locale.calendar).assertEqual('japanese');
    })

    /**
     * @tc.name   locale_test_1000
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1000
     * @tc.desc   check the h12 hourCycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1000', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
        console.log('locale_test_1000 ' + locale.hourCycle);
        expect(locale.hourCycle).assertEqual('h12');
    })

    /**
     * @tc.name   locale_test_1100
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1100
     * @tc.desc   check the caseFirst
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1100', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {caseFirst: 'upper'});
        console.log('locale_test_1100 ' + locale.caseFirst);
        expect(locale.caseFirst).assertEqual('upper');
    })

    /**
     * @tc.name   locale_test_1120
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1120
     * @tc.desc   check the caseFirst
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1120', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {caseFirst: 'lower'});
        console.log('locale_test_1120 ' + locale.caseFirst);
        expect(locale.caseFirst).assertEqual('lower');
    })

    /**
     * @tc.name   locale_test_1140
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1140
     * @tc.desc   check the caseFirst
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1140', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {caseFirst: 'false'});
        console.log('locale_test_1140 ' + locale.caseFirst);
        expect(locale.caseFirst).assertEqual('false');
    })

    /**
     * @tc.name   locale_test_1200
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1200
     * @tc.desc   check the collation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1200', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {collation: 'big5han'});
        console.log('locale_test_1200 ' + locale.collation);
        expect(locale.collation).assertEqual('big5han');
    })

    /**
     * @tc.name   locale_test_1300
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1300
     * @tc.desc   check the numeric
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1300', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {numeric: true});
        console.log('locale_test_1300 ' + locale.numeric);
        expect(locale.numeric).assertTrue();
    })

    /**
     * @tc.name   locale_test_1350
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1350
     * @tc.desc   check the numeric
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1350', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {numeric: false});
        console.log('locale_test_1350 ' + locale.numeric);
        expect(locale.numeric).assertFalse();
    })

    /**
     * @tc.name   locale_test_1400
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1400
     * @tc.desc   check the numberingSystem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1400', Level.LEVEL2, function () {
        let locale = new Intl.Locale('ja-Jpan-JP', {numberingSystem: 'arab'});
        console.log('locale_test_1400 ' + locale.numberingSystem);
        expect(locale.numberingSystem).assertEqual('arab');
    })

    /**
     * @tc.name   locale_test_1500
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1500
     * @tc.desc   check the toString method with zh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1500', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh');
        console.log('locale_test_1500 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh');
    })

    /**
     * @tc.name   locale_test_1600
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1600
     * @tc.desc   check the toString method with zh-CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1600', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-CN');
        console.log('locale_test_1600 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-CN');
    })

    /**
     * @tc.name   locale_test_1700
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1700
     * @tc.desc   check the toString method with zh-Hans-CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1700', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-Hans-CN');
        console.log('locale_test_1700 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-Hans-CN');
    })

    /**
     * @tc.name   locale_test_1800
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1800
     * @tc.desc   check the toString method with zh-Hans-CN-u-hc-h12-ca-japanese
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1800', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-Hans-CN-u-ca-japanese-hc-h12');
        console.log('locale_test_1800 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-Hans-CN-u-hc-h12-ca-japanese');
    })

    /**
     * @tc.name   locale_test_1900
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_1900
     * @tc.desc   check the maximize method with zh-u-ca-gregory-co-compact param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_1900', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_1900 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /**
     * @tc.name   locale_test_2000
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2000
     * @tc.desc   check the toString method with zh-CN-u-ca-gregory-co-compact param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2000', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2000 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-CN-u-ca-gregory-co-compact');
    })

    /**
     * @tc.name   locale_test_2100
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2100
     * @tc.desc   check the toString method with zh-hans-CN-u-ca-gregory-co-compact param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2100', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-hans-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2100 ' + locale.toString());
        expect(locale.toString()).assertEqual('zh-hans-CN-u-ca-gregory-co-compact');
    })

    /**
     * @tc.name   locale_test_2200
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2200
     * @tc.desc   check the minimize method with one param zh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2200', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh');
        console.log('locale_test_2200 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh');
    })

    /**
     * @tc.name   locale_test_2201
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2201
     * @tc.desc   check the minimize method with one param zh-CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2201', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-CN');
        console.log('locale_test_2201 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh');
    })

    /**
     * @tc.name   locale_test_2202
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2202
     * @tc.desc   check the minimize method with one param zh-Hans-CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2202', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-Hans-CN');
        console.log('locale_test_2202 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh');
    })

    /**
     * @tc.name   locale_test_2203
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2203
     * @tc.desc   check the minimize method with one param zh-Hans-CN-u-ca-gregory-co-compact
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2203', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-Hans-CN-u-ca-gregory-co-compact');
        console.log('locale_test_2203 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /**
     * @tc.name   locale_test_2204
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2204
     * @tc.desc   check the minimize method with zh lcoale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2204', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2204 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /**
     * @tc.name   locale_test_2205
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2205
     * @tc.desc   check the minimize method with zh-CN lcoale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2205', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2205 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /**
     * @tc.name   locale_test_2206
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2206
     * @tc.desc   check the minimize method with zh-Hans-CN lcoale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2206', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-hans-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2206 ' + locale.minimize().toString());
        expect(locale.minimize().toString()).assertEqual('zh-u-ca-gregory-co-compact');
    })

    /**
     * @tc.name   locale_test_2300
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2300
     * @tc.desc   check the maximize method with one param zh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2300', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh');
        console.log('locale_test_2300 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN');
    })

    /**
     * @tc.name   locale_test_2301
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2301
     * @tc.desc   check the maximize method with one param zh-CN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2301', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-CN');
        console.log('locale_test_2301 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN');
    })

    /**
     * @tc.name   locale_test_2302
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2302
     * @tc.desc   check the maximize method with one param zh-Hans-CN-u-ca-gregory-co-compact
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2302', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-Hans-CN');
        console.log('locale_test_2302 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN');
    })

    /**
     * @tc.name   locale_test_2303
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2303
     * @tc.desc   check the maximize method with zh-Hans-CN-u-ca-gregory-co-compact locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2303', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-Hans-CN-u-ca-gregory-co-compact');
        console.log('locale_test_2303 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    /**
     * @tc.name   locale_test_2304
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2304
     * @tc.desc   check the maximize method with zh locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2304', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2304 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    /**
     * @tc.name   locale_test_2305
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2305
     * @tc.desc   check the maximize method with zh-CN locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2305', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2305 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    /**
     * @tc.name   locale_test_2306
     * @tc.number SUB_GLOBAL_INTL_JS_LOCALE_2306
     * @tc.desc   check the maximize method with zh-Hans-CN locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('locale_test_2306', Level.LEVEL2, function () {
        let locale = new Intl.Locale('zh-Hans-CN', {calendar: 'gregory', collation: 'compact'});
        console.log('locale_test_2306 ' + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual('zh-Hans-CN-u-ca-gregory-co-compact');
    })

    console.log('*************end LocaleInIntlTest*************');
})}
