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

export default function CollatorInIntlTest() {
describe('CollatorInIntlTest', function () {
    console.log('*************start CollatorInIntlTest*************');

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
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_3500
    * @tc.name    compare two different strings
    * @tc.desc    check the compare result
    */
    it('collator_test_3500', 0, function () {
        let coll = new Intl.Collator();
        let value = coll.compare('a', 'b');
        console.log('collator_test_3500 ' + value);
        expect(value).assertEqual(-1);
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_3510
    * @tc.name    compare the same strings
    * @tc.desc    check the compare result
    */
    it('collator_test_3510', 0, function () {
        let coll = new Intl.Collator();
        let value = coll.compare('a', 'a');
        console.log('collator_test_3100 ' + value);
        expect(value).assertEqual(0);
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_3520
    * @tc.name    compare two different strings and return positive value
    * @tc.desc    check the compare result
    */
    it('collator_test_3520', 0, function () {
        let coll = new Intl.Collator();
        let value = coll.compare('b', 'a');
        console.log('collator_test_3200 ' + value);
        expect(value).assertEqual(1);
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_3600
    * @tc.name    compare two different strings with zh locale
    * @tc.desc    check the compare result
    */
    it('collator_test_3600', 0, function () {
        let coll = new Intl.Collator('zh');
        let value = coll.compare('a', 'b');
        console.log('collator_test_3600 ' + value);
        expect(value).assertEqual(-1);
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_3620
    * @tc.name    compare two different strings with zh locale and undefined options
    * @tc.desc    check the compare result
    */
    it('collator_test_3620', 0, function () {
        let coll = new Intl.Collator('zh', undefined);
        let value = coll.compare('a', 'b');
        console.log('collator_test_3620 ' + value);
        expect(value).assertEqual(-1);
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_3640
    * @tc.name    compare two different strings with zh locale and null options
    * @tc.desc    check the compare result
    */
    it('collator_test_3640', 0, function () {
        let coll = new Intl.Collator('zh', null);
        let value = coll.compare('a', 'b');
        console.log('collator_test_3640 ' + value);
        expect(value).assertEqual(-1);
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_3700
    * @tc.name    compare two different strings with zh locale and eor collation
    * @tc.desc    check the compare result
    */
    it('collator_test_3700', 0, function () {
        let coll = new Intl.Collator('zh', {'collation': 'eor'});
        let value = coll.compare('a', 'b');
        console.log('collator_test_3700 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().collation).assertEqual('eor');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_3800
    * @tc.name    compare two different strings with zh locale and base sensitivity
    * @tc.desc    check the compare result
    */
    it('collator_test_3800', 0, function () {
        let coll = new Intl.Collator('zh', {'sensitivity': 'base'});
        let value = coll.compare('a', 'b');
        console.log('collator_test_3800 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().sensitivity).assertEqual('base');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_3900
    * @tc.name    compare two different strings with zh locale and upper caseFirst
    * @tc.desc    check the compare result
    */
    it('collator_test_3900', 0, function () {
        let coll = new Intl.Collator('zh', {'caseFirst': 'upper'});
        let value = coll.compare('a', 'b');
        console.log('collator_test_3900 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().caseFirst).assertEqual('upper');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_4000
    * @tc.name    compare two different strings with zh locale and true numeric
    * @tc.desc    check the compare result
    */
    it('collator_test_4000', 0, function () {
        let coll = new Intl.Collator('zh', {'numeric': true});
        let value = coll.compare('a', 'b');
        console.log('collator_test_4000 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().numeric).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_4100
    * @tc.name    compare two different strings with zh locale and true ignorePunctuation
    * @tc.desc    check the compare result
    */
    it('collator_test_4100', 0, function () {
        let coll = new Intl.Collator('zh', {'ignorePunctuation': true});
        let value = coll.compare('a', 'b');
        console.log('collator_test_4100 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().ignorePunctuation).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_4200
    * @tc.name    compare two different strings with zh locale and sort usage
    * @tc.desc    check the compare result
    */
    it('collator_test_4200', 0, function () {
        let coll = new Intl.Collator('zh', {'usage': 'sort'});
        let value = coll.compare('a', 'b');
        console.log('collator_test_4200 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().usage).assertEqual('sort');
    })

    /* *
    * @tc.number  SUB_GLOBAL_INTL_JS_COLLATOR_4300
    * @tc.name    compare the string with localeMatcher options
    * @tc.desc    check the compare result
    */
    it('collator_test_4300', 0, function () {
        let coll = new Intl.Collator('zh', {'localeMatcher': 'lookup'});
        let value = coll.compare('a', 'b');
        console.log('collator_test_4300 ' + value);
        expect(value).assertEqual(-1);
        expect(coll.resolvedOptions().localeMatcher).assertEqual('lookup');
    })

    console.log('*************end CollatorInIntlTest*************');
})}
