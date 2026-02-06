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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

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

    /**
     * @tc.name   i18n_test_clock_0100
     * @tc.number SUB_GLOBAL_I18N_JS_CLOCK_0100
     * @tc.desc   check the value of is24HourClock method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_test_clock_0100', Level.LEVEL2, function () {
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

    /**
     * @tc.name   i18n_test_clock_0120
     * @tc.number SUB_GLOBAL_I18N_JS_CLOCK_0120
     * @tc.desc   check the value of set24HourClock method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_test_clock_0120', Level.LEVEL2, function () {
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

    /**
     * @tc.name   i18n_test_preferredlanguage_0100
     * @tc.number SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_0100
     * @tc.desc   check the value of getPreferredLanguageList method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('i18n_test_preferredlanguage_0100', Level.LEVEL0, function () {
        console.log('i18n_test_preferredlanguage_0100 ' + 'start');
        let value = I18n.getPreferredLanguageList();
        console.log('i18n_test_preferredlanguage_0100 ' + value);
        expect(value.length).assertLarger(0);
    })

    /**
     * @tc.name   i18n_test_preferredlanguage_0120
     * @tc.number SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_0120
     * @tc.desc   check the value of addPreferredLanguage method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_test_preferredlanguage_0120', Level.LEVEL2, function () {
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

    /**
     * @tc.name   i18n_test_preferredlanguage_0140
     * @tc.number SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_0140
     * @tc.desc   check the value of removePreferredLanguage method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_test_preferredlanguage_0140', Level.LEVEL2, function () {
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

    /**
     * @tc.name   i18n_test_preferredlanguage_1000
     * @tc.number SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_1000
     * @tc.desc   check the value of getFirstPreferredLanguage method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('i18n_test_preferredlanguage_1000', Level.LEVEL2, function () {
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

    /**
     * @tc.name   transfer_test_0100
     * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_0100
     * @tc.desc   check the transfer result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('transfer_test_0100', Level.LEVEL0, function () {
        let date = 'hello';
        let value = date.toLocaleUpperCase('zh-CN');
        console.log('transfer_test_0100 ' + value);
        expect(value).assertEqual('HELLO');
    })

    /**
     * @tc.name   transfer_test_0200
     * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_0200
     * @tc.desc   check the transfer result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('transfer_test_0200', Level.LEVEL0, function () {
        let date = 'WORLD';
        let value = date.toLocaleLowerCase('zh-CN');
        console.log('transfer_test_0200 ' + value);
        expect(value).assertEqual('world');
    })

    /**
     * @tc.name   transfer_test_0300
     * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_0300
     * @tc.desc   check the transfer result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transfer_test_0300', Level.LEVEL2, function () {
        let date = 'My name is Jack.';
        let value = date.toLocaleUpperCase('en-US');
        console.log('transfer_test_0300 ' + value);
        expect(value).assertEqual('MY NAME IS JACK.');
    })

    /**
     * @tc.name   transfer_test_0400
     * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_0400
     * @tc.desc   check the transfer result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('transfer_test_0400', Level.LEVEL2, function () {
        let date = 'The sky is in BLUE-STYLE!';
        let value = date.toLocaleLowerCase('en-US');
        console.log('transfer_test_0400 ' + value);
        expect(value).assertEqual('the sky is in blue-style!');
    })

    console.log('*************end LangTest*************');
})}
