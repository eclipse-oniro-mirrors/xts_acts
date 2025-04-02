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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function IndexUtilInI18nTest() {
describe('IndexUtilInI18nTest', function () {
    console.log('*************start IndexUtilInI18nTest*************');

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

    console.log('*************end IndexUtilInI18nTest*************');
})}
