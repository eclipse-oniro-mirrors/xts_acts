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

export default function NumberFormatInIntlTest() {
describe('NumberFormatInIntlTest', function () {
    console.log('*************start NumberFormatInIntlTest*************');

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
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0100
    * @tc.name    format the number in zh
    * @tc.desc    check the number in zh
    */
    it('formatNumber_test_0100', 0, function () {
        let numfmt = new Intl.NumberFormat('zh');
        console.log('formatNumber_test_0100 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0120
    * @tc.name    format the number with default locale
    * @tc.desc    check the number with default locale
    */
    it('formatNumber_test_0120', 0, function () {
        let numfmt = new Intl.NumberFormat();
        expect(numfmt !== null).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0140
    * @tc.name    format the number in zh and undefined options
    * @tc.desc    check the number in zh
    */
    it('formatNumber_test_0140', 0, function () {
        let numfmt = new Intl.NumberFormat('zh', undefined);
        console.log('formatNumber_test_0140 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0160
    * @tc.name    format the number in zh and null options
    * @tc.desc    check the number in zh
    */
    it('formatNumber_test_0160', 0, function () {
        let numfmt = new Intl.NumberFormat('zh', null);
        console.log('formatNumber_test_0160 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0200
    * @tc.name    format the number in zh-u-nu-latn
    * @tc.desc    check the number in zh-u-nu-latn
    */
    it('formatNumber_test_0200', 0, function () {
        let numfmt = new Intl.NumberFormat('zh-u-nu-latn');
        console.log('formatNumber_test_0200 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0300
    * @tc.name    format the number in zh-u-nu-arab
    * @tc.desc    check the number in zh-u-nu-arab
    */
    it('formatNumber_test_0300', 0, function () {
        let numfmt = new Intl.NumberFormat('zh-u-nu-arab');
        console.log('formatNumber_test_0300 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('١٢٣٬٤٥٦٫٧٨٩');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0400
    * @tc.name    format the number in en
    * @tc.desc    check the number in en
    */
    it('formatNumber_test_0400', 0, function () {
        let numfmt = new Intl.NumberFormat('en');
        console.log('formatNumber_test_0400 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0500
    * @tc.name    format the number in en-u-nu-thai
    * @tc.desc    check the number in en-u-nu-thai
    */
    it('formatNumber_test_0500', 0, function () {
        let numfmt = new Intl.NumberFormat('en-u-nu-thai');
        console.log('formatNumber_test_0500 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('๑๒๓,๔๕๖.๗๘๙');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0600
    * @tc.name    format the number in en-GB
    * @tc.desc    check the number in en-GB
    */
    it('formatNumber_test_0600', 0, function () {
        let numfmt = new Intl.NumberFormat('en-GB');
        console.log('formatNumber_test_0600 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0700
    * @tc.name    format the number in en-US
    * @tc.desc    check the number in en-US
    */
    it('formatNumber_test_0700', 0, function () {
        let numfmt = new Intl.NumberFormat('en-US');
        console.log('formatNumber_test_0700 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0800
    * @tc.name    format the number in aa
    * @tc.desc    check the number in aa
    */
    it('formatNumber_test_0800', 0, function () {
        let numfmt = new Intl.NumberFormat('aa');
        console.log('formatNumber_test_0800 ' + numfmt.format(123456.789));
        let lang = I18n.getSystemLanguage();
        if (lang === 'zh') {
            expect(numfmt.format(123456.789)).assertEqual('123,456.789');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_0900
    * @tc.name    format the number in zh and en list
    * @tc.desc    check the number in zh and en list
    */
    it('formatNumber_test_0900', 0, function () {
        let numfmt = new Intl.NumberFormat(['zh','en']);
        console.log('formatNumber_test_0900 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_1000
    * @tc.name    format the number in en and zh list
    * @tc.desc    check the number in en and zh list
    */
    it('formatNumber_test_1000', 0, function () {
        let numfmt = new Intl.NumberFormat(['en','zh']);
        console.log('formatNumber_test_1000 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_1100
    * @tc.name    format the number in en and aa list
    * @tc.desc    check the number in en and aa list
    */
    it('formatNumber_test_1100', 0, function () {
        let numfmt = new Intl.NumberFormat(['en','aa']);
        console.log('formatNumber_test_1100 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_1200
    * @tc.name    format the number in aa and zh list
    * @tc.desc    check the number in aa and zh list
    */
    it('formatNumber_test_1200', 0, function () {
        let numfmt = new Intl.NumberFormat(['aa','zh']);
        console.log('formatNumber_test_1200 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_1300
    * @tc.name    format the number in aa and bb list
    * @tc.desc    check the number in aa and bb list
    */
    it('formatNumber_test_1300', 0, function () {
        let numfmt = new Intl.NumberFormat(['aa','bb']);
        console.log('formatNumber_test_1300 ' + numfmt.format(123456.789));
        let lang = I18n.getSystemLanguage();
        if (lang === 'zh') {
            expect(numfmt.format(123456.789)).assertEqual('123,456.789');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_1400
    * @tc.name    format the number in aa bb and es list
    * @tc.desc    check the number in aa  bb and es list
    */
    it('formatNumber_test_1400', 0, function () {
        let numfmt = new Intl.NumberFormat(['aa','bb','es']);
        console.log('formatNumber_test_1400 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123.456,789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_1500
    * @tc.name    format the number in aa it and bb list
    * @tc.desc    check the number in aa it and bb list
    */
    it('formatNumber_test_1500', 0, function () {
        let numfmt = new Intl.NumberFormat(['aa','it','bb']);
        console.log('formatNumber_test_1500 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123.456,789');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_1600
    * @tc.name    format the number with scientific
    * @tc.desc    check the number with scientific
    */
    it('formatNumber_test_1600', 0, function () {
        let numfmt = new Intl.NumberFormat('en-GB', { style: 'decimal', notation: 'scientific' });
        console.log('formatNumber_test_1600 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('1.234568E5');
        expect(numfmt.resolvedOptions().style).assertEqual('decimal');
        expect(numfmt.resolvedOptions().notation).assertEqual('scientific');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_1700
    * @tc.name    format the number with currency EUR
    * @tc.desc    check the number with currency EUR
    */
    it('formatNumber_test_1700', 0, function () {
        let numfmt = new Intl.NumberFormat('en-GB', { style: 'currency', currency: 'EUR',
            currencyDisplay: 'name', currencySign: 'accounting', signDisplay: 'always' });
        console.log('formatNumber_test_1700 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('+123,456.79 euros');
        expect(numfmt.resolvedOptions().locale).assertEqual('en-GB');
        expect(numfmt.resolvedOptions().style).assertEqual('currency');
        expect(numfmt.resolvedOptions().currency).assertEqual('EUR');
        expect(numfmt.resolvedOptions().currencyDisplay).assertEqual('name');
        expect(numfmt.resolvedOptions().currencySign).assertEqual('accounting');
        expect(numfmt.resolvedOptions().signDisplay).assertEqual('always');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_1800
    * @tc.name    format the number with currency USD
    * @tc.desc    check the number with currency USD
    */
    it('formatNumber_test_1800', 0, function () {
        let numfmt = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD',
            currencyDisplay: 'code', currencySign: 'accounting', signDisplay: 'always' });
        console.log('formatNumber_test_1800 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertContain('+USD');
        expect(numfmt.format(123456.789)).assertContain('123,456.79');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_1900
    * @tc.name    format the number with currency CNY
    * @tc.desc    check the number with currency CNY
    */
    it('formatNumber_test_1900', 0, function () {
        let numfmt = new Intl.NumberFormat('zh-CN', { style: 'currency', currency: 'CNY',
            currencyDisplay: 'symbol', currencySign: 'accounting', signDisplay: 'always' });
        console.log('formatNumber_test_1900 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('+¥123,456.79');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2000
    * @tc.name    format the number with currency JPY
    * @tc.desc    check the number with currency JPY
    */
    it('formatNumber_test_2000', 0, function () {
        let numfmt = new Intl.NumberFormat('ja-JP', { style: 'currency', currency: 'JPY',
            currencyDisplay: 'narrowSymbol', currencySign: 'accounting', signDisplay: 'always' });
        console.log('formatNumber_test_2000 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('+￥123,457');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2100
    * @tc.name    format the number with signDisplay
    * @tc.desc    check the number with signDisplay
    */
    it('formatNumber_test_2100', 0, function () {
        let numfmt = new Intl.NumberFormat('en-GB', { style: 'currency', currency: 'EUR',
            currencyDisplay: 'name', currencySign: 'accounting', signDisplay: 'always',
            notation: 'compact', compactDisplay: 'long', localeMatcher: 'lookup' });
        console.log('formatNumber_test_2100 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('+123 thousand euros');
        expect(numfmt.resolvedOptions().locale).assertEqual('en-GB');
        expect(numfmt.resolvedOptions().style).assertEqual('currency');
        expect(numfmt.resolvedOptions().currency).assertEqual('EUR');
        expect(numfmt.resolvedOptions().currencyDisplay).assertEqual('name');
        expect(numfmt.resolvedOptions().currencySign).assertEqual('accounting');
        expect(numfmt.resolvedOptions().compactDisplay).assertEqual('long');
        expect(numfmt.resolvedOptions().localeMatcher).assertEqual('lookup');
        expect(numfmt.resolvedOptions().signDisplay).assertEqual('always');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2200
    * @tc.name    format the number with  meter unit
    * @tc.desc    check the number with meter unit
    */
    it('formatNumber_test_2200', 0, function () {
        let numfmt = new Intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
            unitDisplay: 'long', maximumFractionDigits: 2, minimumIntegerDigits: 7 });
        console.log('formatNumber_test_2200 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('0,123,456.79米');
        expect(numfmt.resolvedOptions().style).assertEqual('unit');
        expect(numfmt.resolvedOptions().unit).assertEqual('meter');
        expect(numfmt.resolvedOptions().unitDisplay).assertEqual('long');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2250
    * @tc.name    format the number with unitUsage
    * @tc.desc    check the number with unitUsage
    */
    it('formatNumber_test_2250', 0, function () {
        let numfmt = new Intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
            unitDisplay: 'long', unitUsage: 'length-road' });
        console.log('formatNumber_test_2250 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789米');
        expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2260
    * @tc.name    format the number with narrow value in unitUsage param
    * @tc.desc    check the number with unitUsage
    */
    it('formatNumber_test_2260', 0, function () {
        let numfmt = new Intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
            unitDisplay: 'narrow', unitUsage: 'length-road' });
        console.log('formatNumber_test_2260 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789米');
        expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2270
    * @tc.name    format the number with short value in unitUsage param
    * @tc.desc    check the number with unitUsage
    */
    it('formatNumber_test_2270', 0, function () {
        let numfmt = new Intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
            unitDisplay: 'short', unitUsage: 'length-road' });
        console.log('formatNumber_test_2270 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789米');
        expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2280
    * @tc.name    format the number with narrow value in unitUsage param
    * @tc.desc    check the number with unitUsage
    */
    it('formatNumber_test_2280', 0, function () {
        let numfmt = new Intl.NumberFormat('en-US', { style: 'unit', unit: 'meter',
            unitDisplay: 'narrow', unitUsage: 'length-road' });
        console.log('formatNumber_test_2280 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('76.712mi');
        expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2290
    * @tc.name    format the number with short value in unitUsage param
    * @tc.desc    check the number with unitUsage
    */
    it('formatNumber_test_2290', 0, function () {
        let numfmt = new Intl.NumberFormat('en-US', { style: 'unit', unit: 'meter',
            unitDisplay: 'short', unitUsage: 'length-road' });
        console.log('formatNumber_test_2290 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('76.712 mi');
        expect(numfmt.resolvedOptions().unitUsage).assertEqual('length-road');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2300
    * @tc.name    format the number with percetn style
    * @tc.desc    check the number with percetn style
    */
    it('formatNumber_test_2300', 0, function () {
        let numfmt = new Intl.NumberFormat('en-CN', { style: 'percent', maximumFractionDigits: 2,
            minimumIntegerDigits: 7 });
        console.log('formatNumber_test_2300 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('12,345,678.9%');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2400
    * @tc.name    format the number with numberingSystem
    * @tc.desc    check the number with numberingSystem
    */
    it('formatNumber_test_2400', 0, function () {
        let numfmt = new Intl.NumberFormat('ar-EG', { numberingSystem: 'arab' });
        console.log('formatNumber_test_2400 ' + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('١٢٣٬٤٥٦٫٧٨٩');
        expect(numfmt.resolvedOptions().numberingSystem).assertEqual('arab');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_NUMBER_2500
    * @tc.name    format the number with style
    * @tc.desc    check the number with style
    */
    it('formatNumber_test_2500', 0, function () {
        let numfmt = new Intl.NumberFormat('ar', { style: 'percent', minimumFractionDigits: 1, maximumFractionDigits: 2,
            minimumIntegerDigits: 7, minimumSignificantDigits: 5, maximumSignificantDigits: 10, useGrouping: true  });
        console.log('formatNumber_test_2500 ' + numfmt.resolvedOptions().style);
        expect(numfmt.resolvedOptions().style).assertEqual('percent');
        expect(numfmt.resolvedOptions().minimumFractionDigits).assertEqual(1);
        expect(numfmt.resolvedOptions().maximumFractionDigits).assertEqual(2);
        expect(numfmt.resolvedOptions().minimumIntegerDigits).assertEqual(7);
        expect(numfmt.resolvedOptions().minimumSignificantDigits).assertEqual(5);
        expect(numfmt.resolvedOptions().maximumSignificantDigits).assertEqual(10);
        expect(numfmt.resolvedOptions().useGrouping).assertTrue();
    })

    console.log('*************end NumberFormatInIntlTest*************');
})}
