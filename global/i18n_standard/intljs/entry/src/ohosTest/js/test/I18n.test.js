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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

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
    it('i18n_test_0100', Level.LEVEL0, function () {
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_0100 ' + lang);
        expect(lang).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0200
    * @tc.name    getSystemRegion
    * @tc.desc    check the getSystemRegion
    */
    it('i18n_test_0200', Level.LEVEL0, function () {
        let region = I18n.getSystemRegion();
        console.log('i18n_test_0200 ' + region);
        expect(region).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0300
    * @tc.name    getSystemLocale
    * @tc.desc    check the getSystemLocale
    */
    it('i18n_test_0300', Level.LEVEL0, function () {
        let locale = I18n.getSystemLocale();
        console.log('i18n_test_0300 ' + locale);
        expect(locale).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_3800
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_3800', Level.LEVEL0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', true);
        console.log('i18n_test_3800 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_3820
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and undefined param
    * @tc.desc    check the display country
    */
    it('i18n_test_3820', Level.LEVEL2, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', undefined);
        console.log('i18n_test_3820 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_3840
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and null param
    * @tc.desc    check the display country
    */
    it('i18n_test_3840', Level.LEVEL2, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', null);
        console.log('i18n_test_3840 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_3900
    * @tc.name    getDisplayCountry with zh and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_3900', Level.LEVEL2, function () {
        let value = I18n.getDisplayCountry('zh', 'en-US', true);
        console.log('i18n_test_3900 ' + value);
        expect(value).assertEqual('');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4000
    * @tc.name    getDisplayCountry with zh-CN and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_4000', Level.LEVEL2, function () {
        let value = I18n.getDisplayCountry('zh-CN', 'en-US', true);
        console.log('i18n_test_4000 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4100
    * @tc.name    getDisplayCountry with zh-Hans and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_4100', Level.LEVEL2, function () {
        let value = I18n.getDisplayCountry('zh-Hans', 'en-US', true);
        console.log('i18n_test_4100 ' + value);
        expect(value).assertEqual('');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4200
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    */
    it('i18n_test_4200', Level.LEVEL2, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', false);
        console.log('i18n_test_4200 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4300
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_4300', Level.LEVEL2, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US');
        console.log('i18n_test_4300 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4400
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4400', Level.LEVEL2, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', true);
        console.log('i18n_test_4400 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4420
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and undefined param
    * @tc.desc    check the language
    */
    it('i18n_test_4420', Level.LEVEL2, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', undefined);
        console.log('i18n_test_4420 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4440
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and null param
    * @tc.desc    check the language
    */
    it('i18n_test_4440', Level.LEVEL2, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', null);
        console.log('i18n_test_4440 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4500
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-GB and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4500', Level.LEVEL2, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-GB', true);
        console.log('i18n_test_4500 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4600
    * @tc.name    getDisplayLanguage with zh and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4600', Level.LEVEL2, function () {
        let value = I18n.getDisplayLanguage('zh', 'en-US', true);
        console.log('i18n_test_4600 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4700
    * @tc.name    getDisplayLanguage with zh-CN and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4700', Level.LEVEL2, function () {
        let value = I18n.getDisplayLanguage('zh-CN', 'en-US', true);
        console.log('i18n_test_4700 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4800
    * @tc.name    getDisplayLanguage with zh-Hans and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4800', Level.LEVEL2, function () {
        let value = I18n.getDisplayLanguage('zh-Hans', 'en-US', true);
        console.log('i18n_test_4800 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4900
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    */
    it('i18n_test_4900', Level.LEVEL2, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', false);
        console.log('i18n_test_4900 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5000
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_5000', Level.LEVEL2, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US');
        console.log('i18n_test_5000 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8800
    * @tc.name    test isRTL interface with zh-CN param
    * @tc.desc    get the isRTL value
    */
    it('i18n_test_8800', Level.LEVEL0, function () {
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
    it('i18n_test_8900', Level.LEVEL2, function () {
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
    it('i18n_test_9000', Level.LEVEL2, function () {
        console.log('i18n_test_9000 ' + 'start');
        let value = I18n.isRTL('ar');
        console.log('i18n_test_9000 ' + value);
        expect(value).assertTrue();
    })

    /**
    *@tc.number   :SUB_GLOBAL_I18N_EntityRecognizer_0100
    *@tc.name     :findEntityInfo - Identifying Entity Information in Text
    *@tc.desc     :findEntityInfo
    *@tc.size     :MEDIUM
    *@tc.type     :Function
    *@tc.level    :Level 0
    */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0100', Level.LEVEL0, function(done){
        try{
          let entityRecognizer = new I18n.EntityRecognizer("zh-CN");
          let text = "如有疑问，请联系13801048417";
          // @ts-ignore
          let result = entityRecognizer.findEntityInfo(text);
          expect(result[0].type == "phone_number").assertTrue();
          expect(result[0].begin == 8).assertTrue();
          expect(result[0].end == 19).assertTrue();
          console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100' + result[0].type);
          console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100' + result[0].begin);
          console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100' + result[0].end);
        }catch(e){
          console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100_errorCode'+e.code);
          console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100_errorMessage'+e.message);
        }
        done();
    })

    console.log('*************end I18NTest*************');
})}
