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

export default function PluralRulesInIntlTest() {
describe('PluralRulesInIntlTest', function () {
    console.log('*************start PluralRulesInIntlTest*************');

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
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_2600
    * @tc.name    get PluralRules
    * @tc.desc    check the select result
    */
    it('pluralrules_test_2600', 0, function () {
        let pl = new Intl.PluralRules();
        let value = pl.select(0);
        console.log('pluralrules_test_2600 ' + value);
        expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_2700
    * @tc.name    get PluralRules with zh locale
    * @tc.desc    check the select result
    */
    it('pluralrules_test_2700', 0, function () {
        let pl = new Intl.PluralRules('zh');
        let value = pl.select(0);
        console.log('pluralrules_test_2700 ' + value);
        expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_2720
    * @tc.name    get PluralRules with zh locale and undefined options
    * @tc.desc    check the select result
    */
    it('pluralrules_test_2720', 0, function () {
        let pl = new Intl.PluralRules('zh', undefined);
        let value = pl.select(0);
        console.log('pluralrules_test_2720 ' + value);
        expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_2740
    * @tc.name    get PluralRules with zh locale and null options
    * @tc.desc    check the select result
    */
    it('pluralrules_test_2740', 0, function () {
        let pl = new Intl.PluralRules('zh', null);
        let value = pl.select(0);
        console.log('pluralrules_test_2740 ' + value);
        expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_2800
    * @tc.name    get PluralRules with zh locale and ordinal type
    * @tc.desc    check the select result
    */
    it('pluralrules_test_2800', 0, function () {
        let pl = new Intl.PluralRules('zh', {'type': 'ordinal'});
        let value = pl.select(0);
        console.log('pluralrules_test_2800 ' + value);
        expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_2900
    * @tc.name    get PluralRules with zh locale and loolup localeMatcher
    * @tc.desc    check the select result
    */
    it('pluralrules_test_2900', 0, function () {
        let pl = new Intl.PluralRules('zh', {'localeMatcher': 'lookup'});
        let value = pl.select(0);
        console.log('pluralrules_test_2900 ' + value);
        expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_3000
    * @tc.name    get PluralRules with zh locale and minimumIntegerDigits options
    * @tc.desc    check the select result
    */
    it('pluralrules_test_3000', 0, function () {
        let pl = new Intl.PluralRules('zh', {'minimumIntegerDigits': 10});
        let value = pl.select(0);
        console.log('pluralrules_test_3000 ' + value);
        expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_3100
    * @tc.name    get PluralRules with zh locale and minimumFractionDigits options
    * @tc.desc    check the select result
    */
    it('pluralrules_test_3100', 0, function () {
        let pl = new Intl.PluralRules('zh', {'minimumFractionDigits': 11});
        let value = pl.select(0);
        console.log('pluralrules_test_3100 ' + value);
        expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_3200
    * @tc.name    get PluralRules with zh locale and maximumFractionDigits options
    * @tc.desc    check the select result
    */
    it('pluralrules_test_3200', 0, function () {
        let pl = new Intl.PluralRules('zh', {'maximumFractionDigits': 'lookup'});
        let value = pl.select(0);
        console.log('pluralrules_test_3200 ' + value);
        expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_3300
    * @tc.name    get PluralRules with zh locale and minimumSignificantDigits options
    * @tc.desc    check the select result
    */
    it('pluralrules_test_3300', 0, function () {
        let pl = new Intl.PluralRules('zh', {'minimumSignificantDigits': 10});
        let value = pl.select(0);
        console.log('pluralrules_test_3300 ' + value);
        expect(value).assertEqual('other');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_PLURAL_3400
    * @tc.name    get PluralRules with zh locale and maximumSignificantDigits options
    * @tc.desc    check the select result
    */
    it('pluralrules_test_3400', 0, function () {
        let pl = new Intl.PluralRules('zh', {'maximumSignificantDigits': 11});
        let value = pl.select(0);
        console.log('pluralrules_test_3400 ' + value);
        expect(value).assertEqual('other');
    })

    console.log('*************end PluralRulesInIntlTest*************');
})}
